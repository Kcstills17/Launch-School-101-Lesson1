
require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"
require "yaml"

before do
  @data = YAML.load_file("users.yaml")
  @names = @data.keys.map {|n| n.to_s}

end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/:name" do
  @name_data = @data[params[:name].to_sym]
  if @name_data
    erb :name
  else
    redirect "/users"
  end
end
helpers do

  def join_and_add_commas(arr)
  # new_arr =  arr.map.with_index {|str, idx| "and" + str if idx == 2}
    arr.map.with_index do |string, i|
      i == arr.size - 1 ? "and " + string : string
    end.join(", ")
  end

  def count_users_and_interests(hsh)
    users = hsh.keys.size
    interests = hsh.values.map {|v| v[:interests].size}.sum
    "There are #{users} users with a total of #{interests} interests."
  end
end

