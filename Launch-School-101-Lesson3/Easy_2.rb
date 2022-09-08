# Question 1
# In this hash of people and their ages

ages_1 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if Spot is present
# bonus what are 2 other methods that will work just as well.
p ages_1.include?("Spot") # returns false. Showing Spot is not included in the hash
p ages_1.key?("Spot")  # returns false. Showing Spot is not a key within the hash.
p ages_1.member?("Spot") # returns false. Showing Spot is not a member in the hash.

# Question 2
# Starting with the string

munsters_description = "The Munsters are creepy in a good way."

#Convert the string in the following ways (code will be executed on original munsters_description above):

#"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
#The munsters are creepy in a good way."
#"the munsters are creepy in a good way."
#"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
p munsters_description.swapcase!   # Key word in the question is that the code will be executed on the above munster_description
p munsters_description.capitalize! # Meaning it is asking to mutate or modify the original code.
p munsters_description.downcase!   # Each of these methods has a #case! alternative that destructively modifies the code
p munsters_description.upcase!

#Question 3
# We have most of the Munster family in our age hash:

ages_2 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

#add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages_2.merge!(additional_ages) # the #merge! method appends the argument to the method being invocated. A
p ages_2 # and in this case we want to add additional_ages to ages_s so using the destructive version of the method works for the best here.

# Question 4
# See if the name "Dino" appears in the string below:

advice_1 = "Few things in life are as important as house training your pet dinosaur."

p advice_1.include?("Dino") # returns true if included in the string. In this case no, so it returns false
p advice_1.scan("Dino")  # returns the value as part of an array. In this case, "Dino", does not appear, so it returns an empty array.
p advice_1.match("Dino") # Returns the value if it is apart of the string. In this case, it returns nil because it does not appear in the string.


# Question 5
# Show an easier way to write this array

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones_1 = %w[Fred Barnet Wilma Betty BamBam Pebbles] # %w[...] is a short hand notation to write an array separated by spaces instead of commas
# and without quotations. It makes typing out arrays containing string much quicker.

# Question 6
# How can we add the family pet "Dino" to our usual array:

  flintstones_2 = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones_2 << "Dino"  # appends "Dino" to the end of the array. This method mutates our array. Thus Dino is added to the original array.
 p flintstones_2


 # Question 7
 # In the previous practice problem we added Dino to our array like this:

 #flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
 #flintstones << "Dino"

 #We could have used either Array#concat or Array#push to add Dino to the family.

#How can we add multiple items to our array? (Dino and Hoppy)


flintstones_3 = %w(Fred Barney Wilma Betty BamBam Pebbles)
#flintstones_3.push("Dino", "Hoppy") # One difference between #<< and #push is that #push has the ability to append multiple elements. It is showcased here
p flintstones_3.concat(%w[Dino Hoppy]) #here we can use the #concat method to add multiple new elements by simply passing them as part of an array in our arguments.




#Question 8
# Shorten the following sentence:

advice_2 = "Few things in life are as important as house training your pet dinosaur."

# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ".
 # But leave the advice variable as "house training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?


p advice_2.slice!(0, advice_2.index("house")) #using #slice! we have two arguments, the first where we want to begin the slice, and the second where we cut it off.
 p advice_2 # Here we want to start from the beginning and we want to shorten the sentence to only where the return value stops after "important as"
 # We could search for the actual index. But that would be very troublesome, so instead we use the method #index to find the index of the element we want to cut off afterwards.
 # Here that is house.

 # if #slice were to be used instead a new string of the contents of advice_2 would be copied and returned. advice_2 would remained untouched and still pointing to the same
 # memory address as before. This is a good example of passing by value.

 # Question 9
 # Write a one-liner to count the number of lower-case 't' characters in the following string:

 statement = "The Flintstones Rock!"

 p statement.count("t")


 # Question 10
 # Back in the stone age (before CSS) we used spaces to align things on the screen.
# If we had a table of Flintstone family members that was forty characters in width, how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"

p title.center(40, ) # the #center method centers the string in width and if the argument is greater than the length of the string (which it is here)
# It returns a new string of length width with the string padded in the center. The other length are around the given length at either direction.




