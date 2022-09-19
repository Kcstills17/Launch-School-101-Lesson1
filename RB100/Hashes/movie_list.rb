movies = {
  StarWars: 4.8,
  Divergent: 4.7
  }

puts "What would you like to do? "

choice = gets.chomp

case choice
when "add"
  puts "What movie would you like to add? "
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "What rating does the movie have? "
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
  else
    puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
  end
when "update"
  puts " what is the movie title"
  title = gets.chomp
if movies[title.to_sym].nil?
  puts "this is not in your movies"
else puts "what is the rating for this movie"
     rating = gets.chomp
     movies[title.to_sym] = rating.to_i
end
when "display"
movies.each do |movie, rating|
puts "#{movie}: #{rating}"
end
when "delete"
  puts "what movie are you deleting"
  title = gets.chomp
if movies[title.to_sym].nil?
   puts "this movie does not exist"
else
   movies.delete(title.to_sym)
end
else
   puts "Error"
end

