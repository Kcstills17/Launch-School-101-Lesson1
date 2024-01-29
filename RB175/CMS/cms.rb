puts $LOAD_PATH0

require "sinatra"
require "sinatra/contrib"

require "tilt/erubis"
require "redcarpet"

require "sinatra/reloader"

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








#create get method for route

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

get "/" do
  pattern = File.join(data_path,"*")
  root = File.expand_path("..", __FILE__)
  @files = Dir.glob(pattern).map do |path|  # * will access all following directories past data
    File.basename(path)


  end

    erb :index, layout: :layout
  # list all txt files in a ul format
end


get "/:filename" do
    #root = File.expand_path("../data", __FILE__)
    file_path = File.join(data_path, params[:filename])

  if file_exist?(file_path)
   load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end


get "/:filename/edit" do
      #root = File.expand_path("..", __FILE__)
  @filename = params[:filename]
  file_path = File.join(data_path , @filename)
  @files = Dir.glob(file_path ).join


  erb :edit, layout: :layout
end




post "/:filename/edit" do
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


set :session_secret, SecureRandom.hex(32)


set :public_folder, File.dirname(__FILE__) + '/public'
