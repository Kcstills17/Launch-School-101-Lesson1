=begin
1. Welcome Stranger

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements
that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys,
:title and :occupation, and the appropriate values. Your method should return a greeting that uses
the person's full name, and mentions the person's title and occupation.

P. Understand the Problem
  Explicit Requirements:
  - input is 2 parameters, an array and a hash
  - the array will contain 2 or more elements that will combined with adjoining spaces, will produce a person's name
  - the hash has 2 keys that :title and :occupation each with appropriate values
  - return a greeting that used the person's full name and mentions the person's title and occupation

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
   - greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
     => "Hello, John Q Doe! Nice to have a Master Plumber around."

D: Data Structures
  - input: an array and a hash
  - output: string that combines the values of the array and the keys and values of the hash into a sentence


A: Algorithm
  def greetings(arr, hsh)
    - print a sentence that first accessed the arr indexes and complete the sentence
      by accessing the hsh keys and its values
  end

C: Code with intent

=end
def greetings(arr, hsh)
  arr_piece = "Incredible it is #{arr.join(" ")}! It is amazing to see a "
  hsh_piece = "#{hsh[:occupation]}with the title of #{hsh[:title]} in action."
 p  arr_piece + hsh_piece
end

# greetings(["Monkey", "D", "Luffy"], {:title =>  "Yonkou", :occupation => "Pirate "})


=begin
2. Double Doubles

A double number is a number with an even number of digits whose left-side digits are exactly the same as its
right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument
is a double number; double numbers should be returned as-is.

P. Understand the Problem
  Explicit Requirements:
  - a double number is a number with even amount of digits whose left side numbers are the same as its right side numbers
    e.g. (44, 3333, 103103, 7676)
  - input is an integer
  - output is  double the input if the input is not a double number.
  - in that case leave the output the same as input

  Implicit Requirements:
  - if input is a single number then you would want to double that number

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
    twice(37) == 74
    twice(44) == 44
    twice(334433) == 668866
    twice(444) == 888
    twice(107) == 214
    twice(103103) == 103103
    twice(3333) == 3333
    twice(7676) == 7676
    twice(123_456_789_123_456_789) == 123_456_789_123_456_789
    twice(5) == 10

D: Data Structures
    - input: integer
    - output: integer that either doubles or remains the same depending on if input is a double number


A: Algorithm
    def twice(num)
      - initiallize variable num_string and set to converting num to a string
      - iniitiallize variable split_size and set to num_string.size/2
      - if num is one digit then double the num
      - elsif the 1st half of num_string is equal to the 2nd half then return num
      - else return num + num
      -end if statement

    end

C: Code with intent

=end
def twice(num)
  num_string = num.to_s
 split_size = num_string.size/2
 if num_string.size == 1
    num + num
elsif  num_string[0..split_size - 1] == num_string[split_size..num_string.size ]
  num
 else
  num + num
 end
end

    twice(37) == 74
    twice(44) == 44
    twice(334433) == 668866
    twice(444) == 888
    twice(107) == 214
    twice(103103) == 103103
    twice(3333) == 3333
    twice(7676) == 7676
    twice(123_456_789_123_456_789) == 123_456_789_123_456_789
    twice(5) == 10


=begin
3. Always Return Negative Number

Write a method that takes a number as an argument. If the argument is a positive number,
return the negative of that number. If the number is 0 or negative, return the original number.

P. Understand the Problem
  Explicit Requirements:
  - input is an integer
  - output is always a negative integer (unless 0)
  - if input is positive return  the negative version of the number
  - if input is negative return input
  - if input is zero then return zero

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  negative(5) == -5
  negative(-3) == -3
  negative(0) == 0      # There's no such thing as -0 in ruby

D: Data Structures
    - input: integer
    - output: negative version of input/ just input unless 0



A: Algorithm
   def  negative(int)
    int greater than 0 ? then return -int. If it is less than 0 return int
    otherwise return int
   end

C: Code with intent

=end

def negative(int)
 int >= 0 ? -int : int
end


 negative(5) == -5
 negative(-3) == -3
 negative(0) == 0      # There's no such thing as -0 in ruby


=begin
4. Counting up

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

P. Understand the Problem
  Explicit Requirements:
  - input is an integer
  - output: is an array of all integers in sequence between 1 and dthe argument
  - you may assume the argument will always be a valid integer > 0

  Implicit Requirements:
  - if input is just 1 then just return an array containing 1

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  sequence(5) == [1, 2, 3, 4, 5]
  sequence(3) == [1, 2, 3]
  sequence(1) == [1]

D: Data Structures
- input: integer
- output:  array containing all integers in sequential order between 1 and input


A: Algorithm
    def sequence(int)
      if int is > 0 return 1 up to int and transform results onto new array object
      else return int up to -1 and transform results onto a new array object
      end
    end

C: Code with intent


=end

def sequence(int)
int >= 1 ? 1.upto(int).map {|i|i} : int.upto(-1).map {|i|i}
end


 sequence(5) == [1, 2, 3, 4, 5]
 sequence(3) == [1, 2, 3]
 sequence(1) == [1]
 sequence(-1) == [-1]


=begin
5. Uppercase Check

Write a method that takes a string argument, and returns true if all of the alphabetic characters
inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.


P. Understand the Problem
  Explicit Requirements:
  -input is a string
  - output: is boolean that is true if all alpha characters are uppercase
  - false if any alpha characters are lowercase
  - ignore non alpha characters

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  uppercase?('t') == false
  uppercase?('T') == true
  uppercase?('Four Score') == false
  uppercase?('FOUR SCORE') == true
  uppercase?('4SCORE!') == true
  uppercase?('') == true

D: Data Structures
  - input: string
  - output: boolean based on whether all alpha characters are uppercase (true) or not (false)
  - possible intermediary structure: array to use any? method possibly

A: Algorithm
    def uppercase?(str)
      convert str into an array and then pass through a block
      - check if all array object values reference match a condition within the block
        - if each element matches a non lowercase letter than it is truthy, if one is not it is falsy.
    end

C: Code with intent

=end

def uppercase?(str)
     str.chars.all? do |element|
    element.match?(/[^a-z]/)
   end
end



   uppercase?('t') == false
   uppercase?('T') == true
   uppercase?('Four Score') == false
   uppercase?('FOUR SCORE') == true
   uppercase?('4SCORE!') == true
   uppercase?('')

=begin
6. How long are you?

Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - ouput is an array than contains every word from the string
    and an appeneded space and the word length
  - you may assume words in the string are separated by exactly one space

  Implicit Requirements:
  - empty input will return empty array

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

  word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

  word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

  word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

  word_lengths("") == []

D: Data Structures
  - input: string
  - output: array that contains each word from the original string alongside a space and word length
  - possible intermediary structure:


A: Algorithm
  def word lengths(str)
    convert str into a new array and the pass through a block alongside a new object to be returned
      - iterate through each element of our array and return onto our new object (an array)
      - append to the new array being referenced each element alongside a space and the length of the element
  end

C: Code with intent



=end

def word_lengths(str)
   str.split.each_with_object ([]) do |element, word_size_arr|
    word_size_arr <<  "#{element } #{element.size}"
  end

end

 word_lengths("baseball hot dogs and apple pie") #==
["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

=begin
7. Name swapping

Write a method that takes a first name, a space, and a last name passed as a single String argument,
and returns a string that contains the last name, a comma, a space, and the first name.

P. Understand the Problem
  Explicit Requirements:
  - input is a string that has a first name, space, and a last name
  - output is a string that contains the last name, a comma, a space, and the first name

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
    swap_name('Joe Roberts') == 'Roberts, Joe'

D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure:


A: Algorithm
  def swap_name(str)
    - split the str,  reverse the str, and then join once more but with a comma in between
  end

C: Code with intent





=end


def swap_name(str)
   str.split(' ').reverse.join(", ")
end

  swap_name('Joe Roberts') == 'Roberts, Joe'

=begin
8. Sequence Count

Create a method that takes two integers as arguments. The first argument is a count,
and the second is the first number of a sequence that your method will create.
The method should return an Array that contains the same number of elements as the count argument,
while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater,
while the starting number can be any integer value. If the count is 0, an empty list should be returned.

  P. Understand the Problem
  Explicit Requirements:
  - input is two integers
  - the first integer is a count
  - the second integer is the first number of a sequence that will be created in the method.
  - output should be an array that should contain the same number of elements as the count argument.
  - values the values of each element will be multiples of the starting numbet
  - count argument for problem will always have a value of 0 or greater
  - starting number can be any number
  - if count is 0 then return an empty array

  Implicit Requirements:
  - if sequence number is 0 then return each value of the array count times and each should be 0.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  sequence(5, 1) == [1, 2, 3, 4, 5]
  sequence(4, -7) == [-7, -14, -21, -28]
  sequence(3, 0) == [0, 0, 0]
  sequence(0, 1000000) == []

D: Data Structures
  - input: string
  - output: array containg the amount of values that = count and the multiples of sequence
  - possible intermediary structure: a new array


A: Algorithm
    def sequence(count, order)
     - initiallize variable multiples and set to 1
     - initiallize variable sequence_arr and set to an empty array
     - count times do
          - order * multiples
          - initiallize current_order to equal order * multiples
          -  append current_order to sequence_arr
          - multiples += 1
     end

    end

C: Code with intent

=end

def sequence(count, order)
  multiples = 1
  sequence_arr = []
  count.times  do
     current_order =  order * multiples
     sequence_arr << current_order
     multiples += 1
  end
   sequence_arr
end

 sequence(5, 1) == [1, 2, 3, 4, 5]
 sequence(4, -7) == [-7, -14, -21, -28]
 sequence(3, 0) == [0, 0, 0]
 sequence(0, 1000000) == []


 # more concise way of accomplishing goal
def sequence2(count, order)
  (1..count).map do |num|
     num * order
  end
end

 sequence2(4, -7)  #== [-7, -14, -21, -28]


=begin
9. Grade Book

Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60   'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.



P. Understand the Problem
  Explicit Requirements:
  -  input is 3 integers
  -   all values are between 0 and 100
  -   determine the mean of the three integers
  -   return the Letter that is associated with each mean score

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  get_grade(95, 90, 93) == "A"
  get_grade(50, 50, 95) == "D"

D: Data Structures
  - input: 3 integer
  - output: string that represents the grade associated with the mean average of the input
  - possible intermediary structure:


A: Algorithm
  def get_grade(num1, num2, num3)
    add all num together and then divide by 3
    initiallize mean and set to the average of the 3 values
    if mean is greater >= 90 and <= 100 then it is an "A"
    if mean is < 90 and <= 80 then it is a "B"
    same logic for "C" and "D" at the corresponing values
    else mean is 'F"
  end

C: Code with intent



=end
def get_grade(num1, num2, num3)
    mean =  (num1 + num2 + num3) / 3
    if mean >= 90 && mean <= 100
          'A'
    elsif mean >= 80 && mean < 90
          'B'
    elsif mean >= 70 && mean < 80
          "C"
    elsif mean >= 60 && mean < 70
          'D'
    else
          'F'
    end
end

   get_grade(95, 90, 93) == "A"
   get_grade(50, 50, 95) == "D"


=begin
10. Grocery List

Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.


P. Understand the Problem
  Explicit Requirements:
  - input is a an array that contains nested array of fruit and and an integer
  - output is to return an array listing each fruit the number of times of each specific integer within their corresponging original arrays.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]


D: Data Structures
  - input: array containing 3 nested arrays
  - output: array with each fruit listed the amounf of time each integer specifies in the original nested arrays
  - possible intermediary structure: new array


A: Algorithm
def buy_fruit(arr)
  - iterate through arr and pass through a block and return a new object that will be returned at the end of block
  - arr object is initiallized as count_fruit_arr
    - the integers within our element times
    - append to count_fruit_arr our element fruit string
end

C: Code with intent

=end
def buy_fruit(arr)
     arr.each_with_object ([]) do |element, count_fruit_arr|
       element[1].times do
        count_fruit_arr << element[0]
       end
  end
end

  buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])  ==
["apples", "apples", "apples", "orange", "bananas","bananas"]



=begin
11. Group Anagrams

Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Write a program that prints out groups of words that are anagrams. Anagrams are words
that have the same exact letters in them but in a different order. Your output should look something like this:


["demo", "dome", "mode"]
["neon", "none"]
#(etc)

P. Understand the Problem
  Explicit Requirements:
  - input is an array containing multiple string words
  - prints out groups of anagrams


  Implicit Requirements:
  -

  Clarifications/ Questions:
  - anagrams are words that have the same letters within them but in different order

E: Examples/ Edge Cases
  ["demo", "dome", "mode"]
  ["neon", "none"]
  #(etc)

D: Data Structures
  - input: array containing multiple words
  - output: string of groups of anagrams
  - possible intermediary structure:


A: Algorithm
  def anagram_groups(arr)

     -  iterate through arr and pass into a block and create a new hash object to also be passed through
     -  name hash object being passed through anagram_hash
        - initiallize key and set to split each word apart and sort each then join back together
        - initiallize variable key to equal each word of arr being split, then sorted, and then put back together
        - check to see if anagram_hash has variable key as a key
          - if so append the value of key to anagram_hahs s
          else
            set key as a key to anagram_hash and set the value to == an array containing word
          - end if statement
           iterate through anagram_hash and print all anagram values
      end block
  end

C: Code with intent

=end

def anagram_groups(arr)
arr.each_with_object ({}) do |word, anagram_hash|
  key = word.split("").sort.join
  if anagram_hash.has_key?(key)
    anagram_hash[key] << word
  else
    anagram_hash[key] = [word]
  end
  anagram_hash.each_value do |v|
    puts '......'
    p v
  end
end

end

#anagram_groups(['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#  'flow', 'neon']
#)
 # going back on a few problems
=begin
Convert a string into a number

 The String#to_i method converts a string of numeric characters (including an optional plus or minus sign)
to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise,
you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number
as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters;
assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number,
such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the
result by analyzing the characters in the string

P. Understand the Problem
  Explicit Requirements:
  - input is string that contains digits
  - output is the integer value of the input
  - ignore + or - signs and dismiss invalid characters
  - assume all characters to be numeric
  - you cannot use standard conversion methods such as string#to_i and Integer()

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  string_to_integer('4321') == 4321
  string_to_integer('570') == 570

D: Data Structures
  - input: string
  - output: integer value of the string
  - possible intermediary structure:


A: Algorithm
def string to_integer(str)
  intiallize hash number_hash and set to include 0-9 as string for keys and the integer 0-9 as values
  - initiallize digits and set to str being converted to an array and then iterated through and passed through a block
  - initiallize number to 0
  - iterate through digits and pass through a block. set number to 10 * number + each digit
  - return number
end

C: Code with intent

=end

def string_to_integer(str)

  number_hash = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,'5' => 5,
    '6' => 6, '7' => 7, '8' => 8,'9' => 9,}
    digits =   str.chars.map {|num| number_hash[num]}
    number = 0
    digits.each {|digit| number = 10 * number + digit }
    number
end

p string_to_integer('4321')
p string_to_integer('570')


