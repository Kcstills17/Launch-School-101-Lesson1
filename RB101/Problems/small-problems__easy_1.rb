# 1.  Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

def repeat_string(input_string, amount_repeated)
  amount_repeated.times do
    puts input_string
  end
end
p repeat_string("I am the GOAT", 3)

# 2. Write a method that takes one integer argument, which may be positive, negative, or zero.
# This method returns true if the number's absolute value is odd.
# You may assume that the argument is a valid integer value.

# Use PEDAC on this problem!

#  Examples/Test cases
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# Understand the Problem

#   Explicit Requirements
# - method takes one integer argument.
# - the argument can be positibe, negative, or zero
# - return true if the number's absolute value is odd
# - assume argument is a valid integer

#   Implicit Requirements
# - 0 considered an even number
# - if input is even, return false

# Data Structures
# Test cases return boolean values.
# Input: Integer
# Output: Boolean

# Algorithm

# Pseudocode
# create method is_odd? with one parameter
# take the given number and set it not equal to modulus by two.
# return whether value is true or false

# Code with intent

def is_odd?(integer)
  integer.odd?
end
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# 3. LIST OF DIGITS
# Write a method that takes one argument, a positive integer, and returns
# a list of the digits in the number.

# P: Understand the problem

# Explicit Requirements
# - input is a positive integer only
# - Only one parameter
# - returns a list of digits in the number
# Implicit Requirements
# - return the list as an array
# input should be equal to it's values in a list

# E: Examples/ Edge Cases
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# D: Data Structure
# Input: Positive String
# Output: Array

# A: Algorithm
# create method  digit_list
# change input into string
# split the string into individual characters with a single space
# iterate through the characters and convert back into numbers.
# return value

# C: Code with Intent

def digit_list(number)
  number.to_s.split("").map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5] # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# 4. HOW MANY?
# Write a method that counts the number of occurrences of each element in a given array.
# The words in the array are case-sensitive: 'suv' != 'SUV'.
# Once counted, print each element alongside the number of occurrences.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

# Understand the Problem:

# Explicit Requirements
# - input is a given array
# - counts the number of occureneces of each particular element in a given array
# - The words are case sensitive.
# print each element alongside the number of occurences

# Implicit Requirements
# - element is printed once no matter how many occurences in the return value
# - output is in the form of a hash

# Clarification Questions
# The method is only pertaining to this given array?

# Examples/ Edge Cases
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# Data Structure:
# Input: given Array
# Output: Hash

# Algorithm
# create a new Hash
# iterate through the array
# assign each unique element from the array to the occurence hash
# iterate through the occurence hash and print the key and the value.

# C: Code with Intent
def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

p count_occurrences(vehicles)

# 5 REVERSE ORDER (Part 1)
# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# Understand the Problem

# Explicit Requirements
# - Input is one string
# - Output returns the string in reverse order

# Implicit Requirements
# - reverses only the sequence of the words. not the words themselves
# - empty space will result always in "" or ''

# Examples/ Edge Cases

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# Data Structure
# Input: String
# Output: String

# A: Algorithm
# Create method reverse_sentence
# create an empty array  called new_array
# create an array called word_array and set it to words being split with 1 space
# create a counter variable and set it  equal to word_array.size

# start a do loop
# create a variable called popped_word and set it to word_array having it's last element being removed
# break out of loop if  counter == 0
# append popped_word to new_array
# decrement counter by 1
# end

# join new_array and name it reverse_string
# return reverse string

# C: Code with Intent
def reverse_sentence(words)
  new_array = []
  word_array = words.split(" ")
  counter = word_array.size

  loop do
    popped_word = word_array.pop
    break if counter == 0
    counter -= 1
    new_array << popped_word
  end
  new_array.join(" ")
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# Shorter solution provided by launch school

# def reverse_sentence(string)
# string.split.reverse.join(' ')
# end

# reverse_sentence("       ")

# 6. REVERSE IT (Part 2)
# Write a method that takes one argument, a string containing one or more words, and returns the given string
# with words that contain five or more characters reversed. Each string will consist of only letters and spaces.
# Spaces should be included only when more than one word is present.

# P: Understand the Problem

# Explicit Requirments
# - contains one parameter
# - input is a string containing one or more words
# - Returns the input with words that contain five or more characters reversed
# - Each string will consist only of letters and spaces
# - Inlcude spaces only when one or more words are present

# Implicit Requirements
# - If only one word do not include spaces
# - Case Type does not matter
# - If not a string or space, prompt to re-enter

# Clarifications/ Questions
# - is the output returning String? I do not see in quotes but also does not seem to represent any other type.

# E: Example/ Edge Cases
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# D: Data Structure
# Input: String
# Output: String

=begin
A: Algorithm:
=begin
Main method
- create method reverse_word(input)
  - create an empty array named result_array
  - if input is_string?
    - create word_array variable which equals the input split at each element with 1 space between each
    - iterate through each element of word_array
    - if the size of each particular element is >= 5
      - create variable reverse_element which equals the element backwards
      - append reverse_element onto result_array
    - else
    append remaining elements to result_array
    end inner if statement
  end block
  else
  when valid string is not given ask for the user to input valid string
  end outer if statement
  covert result_array to string with a space between words and name it final_result_string
  return final_result_string
end

    -

sub method
create is_string?(input_string)
    - check if input_string is a string or not
end

=end
# C: Code with Intent
def is_string?(input_string)
  input_string.instance_of?(String)
end

def reverse_words(input)
  result_array = []
  if is_string?(input)
    word_array = input.split(" ")
    word_array.each do |element|
      if element.size >= 5
        reverse_element = element.reverse
        result_array << reverse_element
      else
        result_array << element
      end
    end
  else
    puts "please input valid string"
  end
  final_result_string = result_array.join(" ")
end

puts reverse_words('Professional') # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch school')         # => hcnuaL loohcS

# 7. STRINGY STRINGS
# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s,
# always starting with 1. The length of the string should match the given integer.

# P Understand the Problem

# Explicit Requirements
# - Input takes one parameter
# - Input is a positive string
# - Output returns a string of alternating 1s and 0s
# - the first number always starts with 1
# - length of the string should match the given integer

# Implicit Requirements
# if the input is even the final digit will be 0
# if the input is odd the final digit will be 1

# E: Examples/Edge Cases
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# D: Data Structure
#  input: Positive string
# output: string of alternating 0s and 1

# A: Algorithm
=begin
- Create method stringy(input)
  - create empty array and name it result_array
  start do loop
  - if the input is odd
      append 1  to result_array
      decrement input by 1
      break out of loop if counter is less than or equal to 0
  else
     append 0 to result_array
     decrement input by 1
     break out of loop if counter is less than or equal to 0
    end if statement
  end loop
 reverse result_array and then convert it tto string. name it one_zero_string
 return one_zero_string

=end
# C: Code with Intent
def stringy(input)
  result_array = []
  loop do
    if input.odd?
      result_array << 1
      input -= 1
    else
      result_array << 0
      input -= 1
    end
    break if input <= 0
  end
  one_zero_string = result_array.reverse.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# solution provided by Launch School
# def stringy(size)
# numbers = []

# size.times do |index|
# number = index.even? ? 1 : 0
# numbers << number
# end

# numbers.join# end

# 7. ARRAY AVERAGE
# Write a method that takes one argument, an array containing integers, and returns the average of all numbers
# in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

# P: Understand the Problem:

# Explicit Requirements
# - method has one parameter
# - argument is an array containing integers
# - output returns the average of all the numbers
# output should be an integer

# Implicit Requirements
# - your output is the mean of the argument
# -

# E: Examples/ Edge Cases

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# D: Data Structure
# Input: array containing integers
# Output: single integer

# A: Algorithm
#  create a method named average(array_input)
# create variable total and set equal to 0
# create variable counter and set equal to 0
# create while loop and set condition to break out if counter is larger than array_input's size
# set total to equal to each element of the array plus total
# increment the counter by one
# end while loop
# create variable result_number that is equal to the total divided by  array_input's size
# return result_number

# C: Code with Intent
def average(array_input)
  total = 0
  counter = 0
  while counter < array_input.size
    total += array_input[counter]
    counter += 1
  end
  result_number = total / array_input.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# launch school method to solution
# def average2(array_input)
# sum = array_input.reduce {|total, element| total += element}
#  sum /array_input.count
# end

# 8. SUM OF DIGITS
# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# P: Understand the Problem
# Explicit Requirements
# - method has one parameter
# - argument is a positive integer
# - output returns the sum of it's digits  e.g puts sum(23) returns 2 + 3 so 5

# Implicit Requirement:
# underscores are considered commas in numbers

# E: Examples/ Edge Cases
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# D: Data Structute
# Input: integer
# output: integer

# Algorithm
# create method named sum(input)
# create variable named final_number and set to 0
# convert input into a string and then split into an array.
# name that result num_array
# create variable counter and set to 0
# as many times as there are elements in the array
# convert element at counter into integer
# add element to  final_number and set it to new value
# increment counter by 1
# finish iteration
# return final_number
# end method

# C: Code with Intent
def sum(input)
  final_number = 0
  num_array = input.to_s.split("")
  counter = 0
  num_array.size.times do |_i|
    final_number += num_array[counter].to_i
    counter += 1
  end
  final_number
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# Launch School provided solution
# def sum(number)
# number.to_s.chars.map(&:to_i).reduce(:+)
# end

# broken down further
# 23.to_s        # => "23"
# .chars       # => ["2", "3"]
# .map(&:to_i) # => [2, 3]  This is shorhand for.map {|element| element.to_i}
# .reduce(:+)  # => 5

# 9. WHAT'S MY BONUS?
#  Write a method that takes two arguments, a positive integer and a boolean,
# and calculates the bonus for a given salary. If the boolean is true, the bonus
# should be half of the salary. If the boolean is false, the bonus should be 0.

# P: Understand The Problem

# Explicit Requirements
# - the method has two parameters
# - the parameters will be in orders, a positive integer and a boolean
# - the output should be the bonus for the given salary/integer
# - if the boolean is true the bonus should be half of the salary/integer
# - if the boolean is false the bonus will be 0

# Implicit Requirements
# - none. All given data explicitly shown with examples

# E: Examples/ Edge Cases
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# D: Data Structures
# Input: a positive integer, a boolean
# Output: an integer above or equal to 0

# A: Algorithm
# - Create method calculate_bonus(salary, get_bonus)
# - when get_bonus is true then set variable bonus to salary divided by 2
# - when get_bonus is false then set bonus to 0
# end scenarios
# return bonus

# C: Code with Intent
def calculate_bonus(salary, get_bonus)
  case get_bonus
  when get_bonus = true then bonus = salary / 2
  when get_bonus = false then bonus = 0
  end
  bonus
end
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
# Launch School Provided solution

# def calculate_bonus(salary, bonus)
# bonus ? (salary / 2) : 0
# end
