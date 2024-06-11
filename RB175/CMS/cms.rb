puts $LOAD_PATH0

require "sinatra"
require "sinatra/contrib"
require "tilt/erubis"
require "redcarpet"
require "sinatra/reloader"
require "yaml"
require "bcrypt"

# setup sessions so we can have some form of state that can be used
configure do
  enable :sessions
  set :session_secret, 'secret'
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
                       File.expand_path("../test/users.yml", __FILE__)
                     else
                       File.expand_path("../users.yml", __FILE__)
                     end
  YAML.load_file(credentials_path)
end

def load_user_credentials_path #for signing up yaml files this method will come in handy for accessing the path specifically
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
end


# validate the ext name of a file
def invalid_ext_name?(filename)
  File.extname(filename) != ".md" && File.extname(filename) != ".txt"
end

# create get method for route
def sign_in
  session[:signed_in] = true
end

def signed_in?
  session[:signed_in]
end

def sign_out
  session.delete(:signed_in)
end

def user_not_signed_in
  session[:message] = "You are not signed in. Sign in for full access."
  redirect "/"
end

def require_sign_in
  unless signed_in?
    user_not_signed_in
  end
end

def user_not_signed_in
  session[:message] = "You are not signed in. Sign in for full access."
  redirect "/"
end

# bcrypt authentication
def hash_password(password)
  BCrypt::Password.create(password).to_s
end

def check_password(password, hashed_password)
  BCrypt::Password.new(hashed_password) == password
end


# Method to add a new user with a hashed password to the YAML file
def add_user_to_yaml(username, password)
  credentials = if File.exist?(load_user_credentials_path)
                  YAML.load_file(load_user_credentials_path) || {}
                else
                  {}
                end

  credentials[username] = hash_password(password)

  File.open(load_user_credentials_path, 'w') do |file|
    YAML.dump(credentials, file)
  end
end
# check for if a file has been duplicated
def duplicated?(file)
  file.include?("_duplicate")
end

# add-duplicate after text but before extension
def insert_duplicate_path(filename)
  extname = File.extname(filename)
  basename = File.basename(filename, extname)
  duplicate_filename = "#{basename}_duplicate#{extname}"
  File.join(data_path, duplicate_filename) # Returns full path
end


# read the contents of original file and then copy those contents over
def copy_file_contents(original_file_path, duplicate_file_path)
  original_content = File.read(original_file_path)
  File.write(duplicate_file_path, original_content)
end

helpers do
  def file_exist?(file)
    File.exist?(file)
  end

  def render_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(text)
  end

  def load_file_content(path)
    content = File.read(path)
    case File.extname(path)
    when ".txt"
      headers["Content-Type"] = "text/plain"
      content
    when ".md"
      erb render_markdown(content)
    end
  end
end

get "/users/signin" do

  erb :sign_in, layout: :layout
end

get "/users/signup" do

  erb :sign_up, layout: :layout
end

get "/" do
  pattern = File.join(data_path,"*")
  root = File.expand_path("..", __FILE__)
  @files = Dir.glob(pattern).map do |path|  # * will access all following directories past data
    File.basename(path)


  end

    erb :index, layout: :layout
  # list all txt files in a ul format
end

get "/new" do
  require_sign_in
  erb :new
end



get "/:filename" do
  require_sign_in

  file_path = File.join(data_path, File.basename(params[:filename]))
  unless file_exist?(file_path)
    session[:message] = "#{params[:filename]} does not exist."
    return redirect "/"
  end

  load_file_content(file_path)
end

get "/:filename/edit" do
      #root = File.expand_path("..", __FILE__)
      require_sign_in
  @filename = params[:filename]
  file_path = File.join(data_path , @filename)
  @files = Dir.glob(file_path ).join


  erb :edit, layout: :layout
end


post "/users/signin" do
  @username = params[:username]
  @password = params[:password]
  credentials = load_user_credentials

     if credentials.key?(@username) && check_password(@password, hash_password(@password))
    sign_in
    session[:username] = @username
    session[:message] = "Welcome!"
    redirect "/"
 else
    session[:message] =  "Invalid credentials"
    status 422
 end

  erb :sign_in, layout: :layout
end


post "/users/signout" do
  require_sign_in
  sign_out
  session[:message] = 'You have been signed out'
  redirect "/"

erb :index, layout: :layout
end

post "/users/signup" do
 @username = params[:username]
 @password = params[:password]

 if  @username.strip.empty? || @password.empty?
  session[:message] = "please enter a valid username and password"
  erb :sign_up
 else
  add_user_to_yaml(@username, @password)
  session[:message] = "You have successfully created your account #{@username}. You can now sign in. "
  redirect "/"
 end


erb :sign_up, layout: :layout
end




post "/create" do
  require_sign_in
  filename = params[:filename].to_s

  if filename.strip.empty?
    status 422
    session[:message] = "A name is required."
    erb :new
  elsif invalid_ext_name?(filename)
    session[:message] = "please create a valid file ending with .txt or .md"
    erb :new
  else
    file_path = File.join(data_path, filename)

      File.write(file_path, "")
    session[:message] = "#{params[:filename]} has been created."

    redirect "/"
  end
end


post "/:filename/edit" do
  require_sign_in
  @filename = params[:filename]
  content = params[:largeTextbox] # Assuming 'largeTextbox' is the name attribute of the textarea

  # Path to the file you want to write to
  file_path = File.join(data_path , @filename)

  # Write the content to the file

  File.open(file_path, "w") do |file|
    file.write(content)
  end

  session[:message] = "#{@filename} has been updated!"
  redirect "/"
end

post "/:filename/delete" do
require_sign_in
   filename = params[:filename]
   file_path = File.join(data_path,filename)

  File.delete(file_path)
  session[:message] = "The file #{filename} has been deleted."
 redirect "/"

  erb :index, layout: :layout
end

post "/:filename/duplicate" do
  require_sign_in
  filename = params[:filename]
  original_path = File.join(data_path, filename)

  if !duplicated?(filename)
    duplicate_path = insert_duplicate_path(filename)
    copy_file_contents(original_path, duplicate_path)
    session[:message] = "A duplicate of #{filename} has been created!"

  else
    session[:message] = "This file has already been duplicated. Please duplicate another file."
  end
  redirect "/"
end


set :session_secret, SecureRandom.hex(32)


set :public_folder, File.dirname(__FILE__) + '/public'
