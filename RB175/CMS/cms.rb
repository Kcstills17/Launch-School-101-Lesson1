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




#create get method for route

def sign_in
    session[:signed_in] = true
  end

  def signed_in?
    session[:signed_in] == true
  end

  def sign_out
    session[:signed_in] = false
  end

  def require_sign_in
    unless signed_in?
      return user_not_signed_in
    end
  end



def user_not_signed_in
    session[:message] = "You are not signed in. Sign in for full access."
    redirect "/"

end


#bcrypt authentication

def hash_password(password)
  BCrypt::Password.create(password)
end

def check_password(password, hashed_password)
  BCrypt::Password.new(hashed_password) == password
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

  file_path = File.join(data_path, params[:filename])
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
  @username = params[:username].to_s
  @password = params[:password].to_s

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


post "/create" do
  require_sign_in
  filename = params[:filename].to_s

  if filename.strip.empty?
    status 422
    session[:message] = "A name is required."
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



set :session_secret, SecureRandom.hex(32)


set :public_folder, File.dirname(__FILE__) + '/public'
