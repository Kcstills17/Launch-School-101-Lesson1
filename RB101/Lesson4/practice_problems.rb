# 1.
# Given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the
# keys and the values are the positions in the array.

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

# 2.
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22,
         "Spot" => 237 }

total_ages = 0
ages.each { |_, age| total_ages += age }

# 3.
#  in the age hash, remove people with age 100 and greater.

ages1 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages1.select do |_key, value|
  value < 100
end

# 4.
# Pick out the minimum age from our current Munster family Hash

ages2 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22,
          "Spot" => 237 }

ages2.values.min

# 5.
# Find the index of the first name that starts with "Be"

flintstones2 = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones2.index { |name| name[0, 2] == 'Be' }

# 6.
# Amend this array so that the names are all shortened to just the first three characters:

flintstones3 = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones3.map do |num|
  num[0, 3]
end

# 7.
# Create a hash that expresses the frequency with which each letter occurs in this string:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

# 8.
# What happens when we modify an array while we are iterating over it?
# What would be output by this code?

numbers = [1, 2, 3, 4]

numbers.each do |number|
   number
  numbers.shift(1)
end
=begin
numbers.each do |number|
  p number
  numbers.pop(1)
end
=end

=begin

example 1
"0  [1, 2, 3, 4]  1"
"1  [2, 3, 4]  3"
For the first example we are first printing our iterated variable number
which will be at index[0] and will resut in 1.
We then use numbers.shift(1) which removes the first value.
Now we move forward in the iteration. Our number being printed  is at index[1],
but a key not is that we use the current array and not the original one.
our array is currently [2,3,4] and index 1 of that is 3. We print 3
now we are to p number at index[2]. With our array at [2,3] we do not have an index[2].
So since that value is not available. We exit out  with our
return values being 1 and 3
\
example 2
"0  [1, 2, 3, 4]  1"
"1  [1, 2, 3]  2"
This example uses the same logic, but substituted with pop as opposed with shift.
first index 0 = 1. p 1. numbers.pop(1) removes 4.
array = [1,2,3]. index = 1. index[1] = 2 on this array. p 2.
numbers.pop(1) removes 3array = [1,2]. index = 2. index[2] = nil.
 not availiable on this array. exit out. return 1 and 2.

From this we see that our array is being changed as we go (shortened and shifted),
and the loop counter used by #each is compared against
the current length of the array rather than its original length.

In our first example, the removal of the first item in the first pass
changes the value found for the second pass.

In our second example, we are shortening the array each pass just as in the first example...
but the items removed are beyond the point we are sampling from in the abbreviated loop.

In both cases we see that iterators DO NOT work on a copy of the
original array or from stale meta-data (length) about the array.
They operate on the original array in real time.
=end

# 9.
# As we have seen previously we can use some built-in string methods to change the case of a string.
# A notably missing method is something provided in Rails, but not in Ruby itself...titleize.
# This method in Ruby on Rails creates a string that has each word capitalized
# as it would be in a title. For example, the string:

# words = "the flintstones rock"
# would be:
# words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.

def titleize(input_string)
  spaced_array = input_string.split()
  spaced_array.map(&:capitalize!)
  spaced_array.join(" ")
end
 titleize("the flintstones rock")

# The method i used to solved involved splitting the input onto a new array.
# Then mapping the string in the array by iterating through and using capitalize! on each index.
# this mutated the caller which I then joined back once more and returned it's value.

words = "The Flintstones Rock"

words.split.map(&:capitalize).join(' ')
# this is the solution provided by Launch School. It seems they chained
#split and map on one line where as I
# chained map after splitting my parameter onto a new array.

# 10.
# given the hash below
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key
# that has one of three values describing the age group.
# the family member is in (kid, adult, or senior). Your solution should produce the hash below

=begin
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
=end
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

munsters.each_pair do |_key, value|
  if value["age"] > 0 && value["age"] < 18
    value.merge!("age_group" => "kid")
  elsif value["age"] > 18 && value["age"] < 65
    value.merge!("age_group" => "adult")
  else
    value.merge!("age_group" => "senior")
  end
  munsters
end

# munsters

# solution provided by launch school below
=begin
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
=end

mailing_campaign_leads = [
  { name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423,
    mailing_list: true },
  { name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23,
    mailing_list: false },
  { name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true },
  { name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true }
]


counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  full_name = mailing_campaign_leads[counter][:name]
  names = full_name.split
   p names

  names_counter = 0
  loop do
    break if names_counter == names.size
    name = names[names_counter]
    names[names_counter] = name.capitalize
     p names

    names_counter += 1
  end
  capitalized_full_name = names.join(' ')
   p capitalized_full_name
   mailing_campaign_leads[counter][:name] =  capitalized_full_name

  counter += 1
end
usable_leads = []
counter = 0
loop do
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login]
   last_login
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter]
  end

  counter += 1
  p usable_leads
end


=begin
mailing_campaign_leads.each do |lead|
  p names = lead[:name].split
  p lead[:name] = names.map(&:capitalize).join(' ')
end

usable_leads = mailing_campaign_leads.reject do |lead|
  last_login = lead[:days_since_login]
  p last_login
  p usable_leads
  subscribed_to_list = lead[:mailing_list]
  last_login > 59 || !subscribed_to_list
end
=end
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr1[1].upcase!

p arr1[1].object_id
p arr2[1].object_id
p arr1 # => ["a", "b", "c"]
p arr2 # => ["A", "B", "C"]
