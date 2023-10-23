require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "sinatra/content_for"

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  session[:lists] ||= []
end



def error_for_list_name(name)
  if !(1..100).cover? name.size
  "The list name must be between 1 and 100 characters."
  elsif session[:lists].any? {|list| list[:name] == name}
   "Please choose a list that has not already been created."
  end

end

def error_for_todo(todo)
  if !(1..100).cover? todo.size
    "The list name must be between 1 and 100 characters."
  end
end


get "/" do
  redirect "/lists"
end
# view all of the lists
get "/lists" do
  @lists = session[:lists]

  erb :lists, layout: :layout
end

# render new list form
get "/lists/new" do
 erb :new_list, layout: :layout
end

get "/lists/:number" do
  @list_id = params[:number].to_i
@list = session[:lists][@list_id]
erb :single_list, layout: :layout
end

#edit existing todo list

get "/lists/:number/edit" do
  id = params[:number].to_i
  @list = session[:lists][id]
erb :edit_list, layout: :layout
end

# create a new list
post "/lists" do
  list_name = params[:list_name].strip

if error = error_for_list_name(list_name)
  session[:error] = error
  erb :new_list, layout: :layout
  else
    session[:lists] << {name: list_name, todos: [] }
    session[:success] = "The list has been created"
    redirect "/lists"
  end

end

#update list
post "/lists/:number" do
  list_name = params[:list_name].strip
  id = params[:number].to_i
  @list = session[:lists][id]

if error = error_for_list_name(list_name)
  session[:error] = error
  erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = "The list has been Updated"
    redirect "/lists/#{:number}"
  end


end

post "/lists/:number/delete" do
  puts "hello world"
  id = params[:number].to_i
   session[:lists].delete_at(id)

   session[:success] = "The list has been Deleted"
   redirect "/lists"

end


# create a todo
post "/lists/:list_id/todos" do
  @list_id = params[:list_id].to_i
  @list = session[:lists][@list_id]

  text = params[:todo].strip
  error = error_for_todo(text)
  if error
    session[:error] = error
    erb :single_list, layout: :layout
  else
    @list[:todos] << {name: text, completed: false}
    session[:success] = "The todo has been added to the list"
    redirect "lists/#{@list_id}"
  end


end

#delete todos from specific lists
post "/lists/:list_id/todos/:id/delete" do
  @list_id = params[:list_id].to_i
  @list = session[:lists][@list_id]
  todo_id = params[:id].to_i
  @list[:todos].delete_at(todo_id)

  session[:success] = "The todo has succesfully been removed!"
  redirect "/lists/#{@list_id}"
end

#determine if todo is complete or not. AKA update the status of todo
post "/lists/:list_id/todos/:id" do
  @list_id = params[:list_id].to_i
  @list = session[:lists][@list_id]
  todo_id = params[:id].to_i
  is_completed = params[:completed] == "true"
  @list[:todos][todo_id][:completed] = is_completed

  session[:success] = "The todo has succesfully been Updated!"
  redirect "/lists/#{@list_id}"

end



set :session_secret, SecureRandom.hex(32)


# sequence of all http method neccessary
=begin
GET /lists  -> view all lists
GET /lists/new -> new list form
POST /lists -> create new list
GET /lists/1 -> view a specific list
GET /users -> view a list of all users
GET /users/1 -> view a specific user
=end


