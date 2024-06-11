require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"


get '/' do
  @public = Dir.glob('public/*')
  @txt_files = remove_root(@public)

  if params.key?('reverse')
    @files = reverse_sort_by_first_char(@txt_files)
  elsif params.key?('order')
    @files = sort_by_first_char(@txt_files)
  else
 @files = randomize(@txt_files)
  end

  erb :challenge
end

get '/txt1.txt' do
 @page =  File.read('public/txt1.txt')

 erb :challenge
end


  def remove_root(arr)
    arr.map {|txt|  txt.split('/').last}

  end

def sort_by_first_char(arr)
  arr.sort
end

def reverse_sort_by_first_char(arr)
  sort_by_first_char(arr).reverse
end

def randomize(arr)
  arr.shuffle
end



