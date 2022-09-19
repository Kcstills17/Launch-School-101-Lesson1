#A hash is a data structure that stores items by associated keys. This is contrasted against arrays, which store items by an ordered index.
# Entries in a hash are often referred to as key-value pairs. This creates an associative representation of data.

#Iterating over a hash
person = {name:'bob', height:'6 ft', weight:'160 lbs', hair:'brown'}

person .each do |key, value|
  puts "Bob's #{key} is #{value}"
end
# This ends up printing every key and value. For example "Bob's name is bob. " or "Bob's height is 6 ft"


#Hashes as Optional Parameters

def greeting(name,options = {}) # options pertains to a key:value hash pair
  if options.empty?
    puts "hi, my name is #{name}"
  else
puts "hi, my name is #{name} and im #{options[:age]}" + "years old and i live in #{options[:city]}."
  end
end
   greeting("Bob", {age: 62, city: "New York City"})



 # How to call a hash pair from a method

 family = { uncles:['bob', 'joe', 'steve'],
            sisters:['jane', 'jill', 'beth'],
            brothers: ['frank', 'rob', 'david'],
            aunts:['mary', 'sally', 'susan'],

 }

 immediate_family = family.select do |k, v| # two values in the select method. key and value
  k == :sisters || k == :brothers  # to isolate the immediate family we set our keys to either sister or brother.
 end


 family_arr = immediate_family.values.flatten   # we turn our immediately_family hash into an array and then combine the sub arrays into one  with flatten
  family_arr



 #merge vs merge!
z = {dog:3, cat:3, bat:7}
z1 = {pig:3, goat:2, dog:1}
z2 = {bird:5, mouse:20, pig:5}
#z.merge(z1,z2)
#puts "#{z}" # returns original array of z {dog:3, cat:3, bat:7}

z = {dog:3, cat:3, bat:7}
z1 = {pig:3, goat:2, dog:1}
z2 = {bird:5, mouse:20, pig:5}
#z.merge!(z1,z2)
#puts "#{z}" # original array is mutated by merge! and returns new merged array {:dog=>1, :cat=>3, :bat=>7, :pig=>5, :goat=>2, :bird=>5, :mouse=>20}



#hash that loops through and prints all keys, and then another hash that loops through and prints all values. FInally print both together


game_console_releases = {  playstation_5:'2020', playstation_4:'2013', Steam_Deck:'2022', Nintendo_Switch:'2016', playstation_3:'2006' }
=begin
game_console_releases.each_key {|key| puts key}

game_console_releases.each_value{|value| puts value}

game_console_releases.each_pair {|k,v| puts "here are the game consoles: #{k} and here are the release dates: #{v}"}
=end


#How would you access the name of this person below?
man = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

man[:name]


#Method to use to find if a certain value is within a hash?

aqua_team = {human:'carl', shake:'master shake', fries:'Master Frylock', meatwad:'meatwad'}

if aqua_team.value?("meatwad")
 # puts "Best character to ever exist"
else
  #puts "NOOOOOO"
end


# What is the difference bewtween the two hashes below
x = 'hi there'
my_hash = {x:"some value"}
my_hash2 = {x => "some value "}

 my_hash
#The first hash that was created used a symbol x as the key.  {:x=>"some value"}

 my_hash2
#The second hash used the string value of the x variable as the key. {"hi there"=>"some value "}



test_array = [1,2,3,4,5]

test_array.keys
