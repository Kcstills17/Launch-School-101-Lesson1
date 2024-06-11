=begin

1. Searching 101

Write a program that solicits 6 numbers from the user, then prints a message that describes
whether or not the 6th number appears amongst the first 5 numbers.

P. Understand the Problem
  Explicit Requirements:
  - Prompt the user for 6 numbers
  - Print a message that shows whether or not the 6th number is amongst the first 5 numbers

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 -==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23]

-==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

D: Data Structures
  - Output is interpolated string with an array

A: Algorithm
  Def search_number(number)
    - create array named loop_sequence and set to ['1st', '2nd', '3rd, '4th', '5th, 'last']
    - create empty array named number_list]
    - create counter and set to 6

    -  until counter >= loop_sequence.size
      - puts "=> Enter the (element of loop sequence) number:"
      - save the answer in variable chosen_number and convert to integer
      - append chosen_number to number_list
      - increment counter by 1
    - end loop
      - set variable first_five_num to the first five numbers of number_list
      - set variable last_num to the last number of number_list
      - if last_num is included with the first_five_num
        - print last_num is in  first_five_num
      - else
        - print last_num is not in first_five_num
end

C: Code with intent

=end
def search_number
  loop_sequence = ['1st', '2nd', '3rd', '4th', '5th', 'last']
  number_list = []
  counter = 0

  until counter >= loop_sequence.size
    puts "Enter the #{loop_sequence[counter]} number"
    chosen_number = gets.chomp.to_i
    number_list << chosen_number
    counter += 1
  end
  first_five_num = number_list[0..4]
  last_num = number_list[-1]
  if first_five_num.include?(last_num)
    puts " => the number #{last_num} does appear in #{first_five_num}"
  else
    puts "=> the number #{last_num} does not appear in #{first_five_num}"
  end
end

# search_number

=begin
2. Arithmetic Integer
Write a program that prompts the user for two positive integers, and then prints the results
of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power.
Do not worry about validating the input.

P. Understand the Problem
  Explicit Requirements:
  -  Ask the user for two positive integers
  - print the result of all of each of these operations
  - addition, subtraction, product, quotient, remainder, and power.

  Implicit Requirements:
  - ask the user for each integer separately

  Clarifications/ Questions:
  - are floats meant to be taken into case

E: Examples/ Edge Cases
 -==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

D: Data Structures
  -  output: integer

A: Algorithm
  def arithmetic_numbers()
    - ask user to enter the first number
    - store answer in variable first_num converted to an integer

    - ask user to enter the second number
    - store answer in variable second_num converted to an integer

    -  print interpolate first_num + second_num equals their sum
    -  print interpolate first_num - second_num equals their expression
    -  print interpolate first_num * second_num equals their product
    - if a ZeroDivisionError occurs
        - print  "cannot divide numbers by zero or perform modulus on zero"
        - print interpolate first_num ** second_num equals their square
    else
    -  print interpolate first_num / second_num equals their quotient
    -  print interpolate first_num % second_num equals their modulus
    -  print interpolate first_num ** second_num equals their square
    end
  end

C: Code with intent

=end

def arithmetic_numbers
  puts "==> Enter the first number"
  first_num = gets.chomp.to_i

  puts "==> Enter the second number"
  second_num = gets.chomp.to_i
  puts "==>  #{first_num} + #{second_num} =  #{first_num + second_num} "
  puts "==>  #{first_num} - #{second_num} =  #{first_num - second_num} "
  puts "==>  #{first_num} * #{second_num} =  #{first_num * second_num} "
  if ZeroDivisionError
    puts "cannot divide numbers by zero or perform modulus on zero"
  else
    puts "==>  #{first_num} / #{second_num} =  #{first_num / second_num} "
    puts "==>  #{first_num} % #{second_num} =  #{first_num % second_num} "
  end
  puts "==>  #{first_num} ** #{second_num} =  #{first_num**second_num}"
end

# arithmetic_numbers

=begin

3. Counting the Number of Characters
Write a program that will ask a user for an input of a word or multiple words and give back
the number of characters. Spaces should not be counted as a character.

P. Understand the Problem
  Explicit Requirements:
  - input a word or multiple words
  - output the amount of characters in the input
  - Spaces do not count

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
    - input:  Please write word or multiple words: walk
      output: There are 4 characters in "walk".

    - input:Please write word or multiple words: walk, don't run
    - output: There are 13 characters in "walk, don't run".

D: Data Structures
    - Input is string
    - Output is interpolated string

A: Algorithm
  def count_characters(input)
    -initiallize empty array named total_characters
    - print text " Please write word or multiple words:"
    - set variable word_equal equal to the previous answer
    - set variable array_characters equal to word_equal split with spaces between each element

    - Iterate through each element of array_characters
      - append element to total_characters if element is != ""
    end block
     - print "there are (total_characters.size) in (word_equal)_"
  end

C: Code with intent

=end

def count_characters
  total_characters = []
  puts "=> Please write word or multiple words: "
  word_equal = gets.chomp
  array_characters = word_equal.split("")

  array_characters.each do |element|
    total_characters << element if element != " "
  end
  puts "There are #{total_characters.size} characters in '#{word_equal}'"
end

# count_characters

# Launch School Solution
# print 'Please write word or multiple words: '
# input = gets.chomp
# number_of_characters = input.delete(' ').size
# puts "There are #{number_of_characters} characters in \"#{input}\"."

=begin
4. Multiplying Two Numbers
Create a method that takes two arguments, multiplies them together, and returns the result.

P. Understand the Problem
  Explicit Requirements:
  - has two parameters and arguments
  - multiplies the two and returns the result

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 - multiply(5, 3) == 15

D: Data Structures
  - input are 2 integers
  - output is 1 integer

A: Algorithm
   def multiply(num1, num2)
    - num1 * num2
   end

C: Code with intent

=end
def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3)

# bonus what is happening if you switch num1 to an array
# What occurs is the array itself is multiplies by num2. so if the problem is multiply([5], 3)
# you will multiply the array [5] 3 times. so
# => [5, 5, 5]

=begin
5. Squaring an Argument

Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument
 (the square is the result of multiplying a number by itself).

 P. Understand the Problem
  Explicit Requirements:
  - use the multiply method within our problem
  - use multiply method to compute square of its argument

  Implicit Requirements:
  - the arguments for multiply will be the same

  Clarifications/ Questions:
  - square is the result of multiplying the number by itself

E: Examples/ Edge Cases
 -  square(5) == 25
 -  square(-8) == 64

D: Data Structures
  - input is one argument integer
  - output is an integer

A: Algorithm
  def square(number)
    multiply(number, number)
  end

C: Code with intent

=end

def square(number)
  multiply(number, number)
end

square(5) == 25
square(-8) == 64
# bonus
def cubed(number)
  multiply(number, number) * number
end

def fourth_power(number)
  multiply(number, number) * multiply(number, number)
end
cubed(10) == 1000
fourth_power(10) == 10000

=begin
6. Exclusive Or
The || operator returns a truthy value if either or both of its operands are truthy. If both operands are falsey,
it returns a falsey value. The && operator returns a truthy value if both of its operands are truthy,\
and a falsey value if either operand is falsey. This works great
until you need only one of two conditions to be truthy, the so-called exclusive or.

In this exercise, you will write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy,
false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

P. Understand the Problem
  Explicit Requirements:
  - problem has two arguments and parameters
  - returns true only if one of its arguments is truthy
  - false otherwise
  - want a boolean result

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - xor?(5.even?, 4.even?) == true
  - xor?(5.odd?, 4.odd?) == true
  - xor?(5.odd?, 4.even?) == false
  - xor?(5.even?, 4.odd?) == false

D: Data Structures
  -

A: Algorithm
  def xor?(arg1, arg2)
    - return true if arg1 is true and arg 2 is false or arg1 is false and arg2 is true
    - otherwise return false
  end

C: Code with intent

=end
def xor?(arg1, arg2)
  return true if arg1 && arg2 == false || arg1 == false && arg2
  false
end
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

# LS solutions

# def xor?(value1, value2)
# return true if value1 && !value2
# return true if value2 && !value1
# false
# end

# Shorter version

# def xor?(value1, value2)
# !!((value1 && !value2) || (value2 && !value1))
# end

=begin

7. Odd List
Write a method that returns an Array that contains every other element of an Array that is passed in as an argument.
The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

P. Understand the Problem
  Explicit Requirements:
  - output returns an array
  - the array contains every other element that is passed in as an argyment
  - the values of the returned list should be at the 1st, 3rd, 5th, and so on elements of the argument

  Implicit Requirements:
  - even indices elements of argyment array should not be returned
  - if no arguments are given return an empty array
  - if one argument is given return an array with just that element.
  - the positions are the even indices of the array
  - can be as many arguments as needed

  Clarifications/ Questions:
  - by 1st, 3rd, and 5th positions do you mean by order in which they come? Because these are not being returned
    by those indexes. they are being returned by even indices

E: Examples/ Edge Cases
  - oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
  - oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
  - oddities(['abc', 'def']) == ['abc']
  - oddities([123]) == [123]
  - oddities([]) == []

D: Data Structures
  - input is an array
  - output is an array

A: Algorithm
def odditties(*array)
  - initiallize empty array named sequence_array
  - set counter to 0
  - when counter is even
    - append array at the counter to sequence array
    - increment counter by 1
  - when counter is odd
  increment counter by 1
end

C: Code with intent

=end
def oddities(array)
  sequence_array = []
  counter = 0
  until counter >= array.size
    if counter.even?
      sequence_array << array[counter]
      counter += 2
    end
  end
  sequence_array
end
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

# Bonus: solve in 2 additional ways

def oddities2(array)
  sequence_array = []
  array.each_with_index do |element, index|
    sequence_array << element if index.even?
  end
  sequence_array
end

oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities2(['abc', 'def']) == ['abc']
oddities2([123]) == [123]
oddities2([]) == []

def oddities3(array)
  array.select.with_index { |_element, index| index.even? }
end

oddities3([2, 3, 4, 5, 6])
oddities3([1, 2, 3, 4, 5, 6])
oddities3(['abc', 'def'])
oddities3([123])
oddities3([])

=begin
8. Palindromic Strings (Part 1)
Write a method that returns true if the string passed as an argument is a palindrome, false otherwise.
A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

P. Understand the Problem
  Explicit Requirements:
  - returns a boolean
  - true if a palindrome, false if not
  - is case sensitive

  Implicit Requirements:
  - Each character from every word matter if it is a palindrome

  Clarifications/ Questions:
  - a palindrome reads the same forward and backward

E: Examples/ Edge Cases
  - palindrome?('madam') == true
  - palindrome?('Madam') == false          # (case matters)
  - palindrome?("madam i'm adam") == false # (all characters matter)
  - palindrome?('356653') == true

D: Data Structures
  - input: string
  - output: boolean

A: Algorithm
    def palindrome?(input_string)
      - initiallize variable input_array and assign to input_string split
      - set input_array reversed ==  to input_array
    end

C: Code with intent

=end

def palindrome?(input_string)
  input_string == input_string.reverse
end

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

# LS Solution (string)
# def palindrome?(string)
# string == string.reverse
# end

# bonus
# Write a method that determines whether an array is palindromic; that is, the element values appear in
# the same sequence both forwards and backwards in the array. Now write a method that determines whether
# an array or a string is palindromic; that is, write a method that can take either an array or a string
# argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.

def array_palindrome?(array)
  reverse_array = array.join.reverse.split(' ')
  array == reverse_array
end
array_palindrome?(["madam"]) == true
array_palindrome?(["Madam"]) == false
array_palindrome?(["madam i'm adam"]) == false
array_palindrome?(["356653"]) == true

def string_or_array_palindrome?(input)
  input.instance_of?(String) ? palindrome?(input) : array_palindrome?(input)
end

string_or_array_palindrome?('madam') == true
string_or_array_palindrome?('Madam') == false          # (case matters)
string_or_array_palindrome?("madam i'm adam") == false # (all characters matter)
string_or_array_palindrome?('356653') == true
string_or_array_palindrome?(["madam"]) == true
string_or_array_palindrome?(["Madam"]) == false
string_or_array_palindrome?(["madam i'm adam"]) == false
string_or_array_palindrome?(["356653"]) == true

=begin
9. Palindromic Strings (Part 2)
Write another method that returns true if the string passed as an argument is a palindrome,
false otherwise. This time, however, your method should be case-insensitive, and it should
ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome?
 method you wrote in the previous exercise.

 P. Understand the Problem
  Explicit Requirements:
  -  return boolean value
  - true if palindrome, false otherwise
  - case insensitive
  - ignores non- alphanumeric characters

  Implicit Requirements:
    -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - real_palindrome?('madam') == true
  - real_palindrome?('Madam') == true           # (case does not matter)
  - real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
  - real_palindrome?('356653') == true
  - real_palindrome?('356a653') == true
  - real_palindrome?('123ab321') == false

D: Data Structures
  - input: string
  - output: boolean

A: Algorithm
  def real_palindrome?(input)
    - intiallize array result_array and set empty
    - intiallize final_result and set to ''
    - initiallize array alpha_num and set it to contain all letters a-z and number 0-9 split
    - initiallize counter and set to 0

    - until counter >= input.size
      - alpha_num includes? input[counter] ? if true append  input.downcase at counter to result_array. else counter
      - increment counter by 1
    end while loop
    - set final result to result_array joined back to string
    - use palindrome? on final_result downcased to make case insensitive

  end

C: Code with intent

=end
def real_palindrome?(input)
  result_array = []
  final_result = ''
  alpha_num = ['abcdefghijklmnopqrstuvwxyz0123456789'].join("")
  counter = 0

  until counter >= input.size
    alpha_num.include?(input.downcase[counter]) ? (result_array << input[counter]) : counter
    counter += 1
  end
  final_result = result_array.join('')
  palindrome?(final_result.downcase)
end

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

# LS Solution
# def real_palindrome?(string)
# string = string.downcase.delete('^a-z0-9')
# palindrome?(string)
# end

=begin
10. Palindromic numbers
Write a method that returns true if its integer argument is palindromic, false otherwise.
A palindromic number reads the same forwards and backwards.

P. Understand the Problem
  Explicit Requirements:
  - returns boolean
  - has one integer argument
  - return true if integer is palindromic, false otherwise

  Implicit Requirements:
  - one number counts as palindromic

  Clarifications/ Questions:
  - check if valid integer?
  - false if no integers given?

E: Examples/ Edge Cases
  - palindromic_number?(34543) == true
  - palindromic_number?(123210) == false
  - palindromic_number?(22) == true
  - palindromic_number?(5) == true

D: Data Structures
  - input: integer
  - output: boolean

A: Algorithm
  def palindromic_number?(number)
    palindrome?(number to string) if valid_number?(number)
  end
  Sub-Method:
  def valid_number?(number)
    number.to_s.to_i == number
  end

C: Code with intent

=end
def valid_number?(number)
  number.to_s.to_i == number
end

def palindromic_number?(number)
  palindrome?(number.to_s) if valid_number?(number)
end

# bonus question: Suppose your number begins with one or more 0s. Will your method still work? Why or why not? Is there any way to address this?
# Answer: The reasoning is because the preceding 0s are not returned. for instance 0001 is still looked at at as 1
# I am sure there is a way to convert the leading numbers to work properly for this problem. But as I understand it correctly it seems as if
# it is more effective to just use strings as opposed to leading 0s.
