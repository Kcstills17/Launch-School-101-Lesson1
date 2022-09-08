# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# numbers.uniq is not a destructive method. if you were to print numbers.uniq it should
# show => [1,2,3]
#but numbers is unaffected by this method.
#should show  => [1,2,2,3]


# Question 2
# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

=begin
1. what is != and where should you use it?
2. put ! before something, like !user_name
3. put ! after something, like words.uniq!
4. put ? before something
5. put ? after something
6. put !! before something, like !!user_name
=end

=begin
answers
1. != refers to not being equal to another value. e.g. 5 != 6
2. !my_namme
3.  array.reverse!
4. 2 + 2 = 4 ? true : false
5. is_num?
6. !!7   (would be true)
=end


# Question 3
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."


advice.gsub!('important', 'urgent') # used gsub! to mutate the caller due to the wording replace. gsub replaces the first argument with the second.
p advice


#Question 4
# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?


numbers.delete_at(1)
numbers.delete(1)

#numbers.delete_at(1) should delete the element at index 1. in this case that would be the integer 2 . output => [1, 3 ,4 ,5]
# numbers.delete(1) should delete the first element with the corresponding value. output => [2, 3, 4, 5 ]
# both methods are destructive so test each separately


#Question 5
# Programmatically determine if 42 lies between 10 and 100.
# hint: Use Ruby's range object in your solution.

p (10..100).cover?(42)

#Question 6
# starting with the string    famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."
#p famous_words.prepend("Four score and ") # simple method that does the trick of adding the given text to the front

#p famous_words.insert(0, "Four score and ") # method that can insert at any given index of the string. Inserted at index 0 and finished with a space


#p "Four score and " +  famous_words # #+ method to add the given text to the beginning of the variable.

#p "Four score and" << famous_words # another way to prepend to beginning

#Question 7
# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into a unnested array.
flintstones.flatten! # used flatten! to mutate the array to be unnested.
p flintstones

# Question 8
# Given the hash below

flintstones_hash = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

# flintstones_hash.to_a[2] #covert to an array using the #to_a method. then access Barney's name and number by their index. In thtis case [2]

p flintstones_hash.assoc("Barney") # An easy way is to use the #assoc method which returns a 2 element array if the given key is found. <


]



