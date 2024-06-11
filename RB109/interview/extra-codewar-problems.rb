# Selective Array Reversing
=begin
Given an array, return the reversed version of the array (a different kind of reverse though), you reverse portions of the array, you'll be given a length argument which represents the length of each portion you are to reverse.

E.g

selReverse([1,2,3,4,5,6], 2)
 //=> [2,1, 4,3, 6,5]
if after reversing some portions of the array and the length of the remaining portion in the array is not up to the length argument, just reverse them.

selReverse([2,4,6,8,10,12,14,16], 3)
 //=> [6,4,2, 12,10,8, 16,14]
selReverse(array, length)

array - array to reverse
length - length of each portion to reverse
Note : if the length argument exceeds the array length, reverse all of them, if the length argument is zero do not reverse at all.


  P. Understand the Problem
  Explicit Requirements:
  - we are given an array and an integer as our inputs
  - our goal is to split the array into portions based on our input integer. e.g if arr = [1,3,4,5,6,2] and the int is 3  then we will split the array into portions of 3
   (1,3,5, 5,6,2) and then reverse (5,3,2, 2,6,5)


  Implicit Requirements:
  - if the integer is smaller then 1 then return the oriinal array
  - if the integer is larger than the size of the arr then return the arr reversed

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array and integer
  - output: array
  - possible intermediary structure:


A: Algorithm
- return the input arr if input int  is < 1
- return the input arr reversed if input int > arr.size
- otherwise get every portion of the array that is the size of the input arr
- reverse each portion
- add to new array and join each array together

C: Code with intent



=end
def selreverse(arr, int)
  if int < 1
    return arr
  elsif  int > arr.size
  return arr.reverse
  else
   reverse_pairs = []
   arr.each_slice(int) {|pair| reverse_pairs << pair.reverse}
    reverse_pairs.flatten
  end
end

  selreverse([2,4,6,8,10,12,14,16], 3) == [6,4,2, 12,10,8, 16,14]
  selreverse([2,4,6,8,10,12,14,16], 2) == [4,2, 8,6, 12,10, 16,14]
  selreverse([1,2,3,4,5,6], 2) == [2,1, 4,3, 6,5]
  selreverse([1,2,3,4,5,6], 0) == [1,2,3,4,5,6]
  selreverse([1,2,3,4,5,6], 10) == [6,5,4,3,2,1]


=begin

=begin
ROT13
How can you tell an extrovert from an introvert at NSA?
Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.

I found this joke on USENET, but the punchline is scrambled. Maybe you can decipher it?
According to Wikipedia, ROT13 is frequently used to obfuscate jokes on USENET.

For this task you're only supposed to substitute characters. Not spaces, punctuation, numbers, etc.

Test examples:

"EBG13 rknzcyr." -> "ROT13 example."

"This is my first ROT13 excercise!" -> "Guvf vf zl svefg EBG13 rkprepvfr!"

P. Understand the Problem
  Explicit Requirements:
  - our goal is to take every alpha character from our given string and move it 13 places to right
  - do not change any non alpha characters

  Implicit Requirements:
  - if a character is uppercase rotate it only to be uppercase. Same applies for lowercase
  - if you pass the last letter of either alphabet then restart from the beginning
  - we will have to separate the alpha characters from the non to modify and then reinset back into original list or create a new list with the same other non alpha characters

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: array


A: Algorithm
- initialize alphabet to the result of joining a range of all lower case letters with a range of uppercase letters
-  we will first want to initialize an array named str_array to the result of getting each character from the input str and assign param elem
-  if alphabet includes elem
   then change the elem to it's ord value
   - if ord value is greater than or equal to 78 and less than or equal to 90 then add 13 to the ord value and then subtract 26. then convert back to a str digit
   - elsif ord value is greater than 110 and less than or equal to 122  then add 13, then subtract 26, then convert back to a str digit
   - else if ord is simply contained in alphbaet add 13 and convert to a str digit
   - else just return elem
   - return modified str
   - elsif ord value is greater than or equal to


C: Code with intent

=end


def rot13(str)
  alphabet = ('a'..'z').to_a + ("A"..'Z').to_a
  str_arr = str.chars.map do |char|
    if alphabet.include?(char)
      if char.ord >= 78 && char.ord <= 90
        (char.ord - 26 + 13).chr
      elsif char.ord >= 110 && char.ord <= 122
        (char.ord - 26 + 13).chr
      else
        (char.ord + 13).chr
      end
    else
      char
    end
  end.join
end

 rot13("EBG13 rknzcyr.") == "ROT13 example."
 rot13("This is my first ROT13 excercise!")  #== "Guvf vf zl svefg EBG13 rkprepvfr!"


=begin
Decompose a number
Decompose a number num into an array of the form [[k1,k2,k3...], r]

    each kn is more than one
    each kn is maximized (first maximizing for 2 then 3 then 4 and so on)
    and 2k1 + 3k2 + 4k3 + ... + nkn-1 + r = num

##Examples

# when there are no `k` more than 1:

3

[[], 3] =

3

# when the remainder is zero:

8330475

[[22, 13, 10, 8, 7, 6, 6, 5, 5, 5, 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2], 0] =

2 ^ 22 + 3 ^ 13 + 4 ^ 10 + 5 ^ 8 + 6 ^ 7 + 7 ^ 6 + 8 ^ 6 + 9 ^ 5 + 10 ^ 5 + 11 ^ 5 + 12 ^ 4 + 13 ^ 4 + 14 ^ 4 + 15 ^ 3 + 16 ^ 3 + 17 ^ 3 + 18 ^ 3 + 19 ^ 3 + 20 ^ 3 + 21 ^ 2 + 22 ^ 2 + 23 ^ 2 + 24 ^ 2 + 0 = 8330475

# when there is both `k` and a remainder:

26

[[4, 2], 1] =

2 ^ 4 + 3 ^ 2 + 1 = 26

# when there is neither `k` nor a remainder:

0

[[], 0] =

0

P. Understand the Problem
  Explicit Requirements:
  - we have an array of integer digits and an integer value
  - we have a few conditions to work with when deciding how to apporach this problem
  - when we have just one k then we shall just return k
  - when we have multiple k and no remainder then we want take evry k and begin by squaring by 2. for each incrementing k increase the square value by 1. e.g. (k2, k3, k4, k5, etc)
    - add all of these squared values together. these values should equal  num
  - when there is both k and a remainder then follow the same formula above but add the remainder to the the incrementing squares to equal num
  - if there is no num or remainder then return num

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: integer, and an array containing k (the values we want to square) and n (our remaining value we wish to increment )
  - output: the original integer
  - possible intermediary structure:


A: Algorithm
- check if k is empty. If so return n
- initialize total to this result
- iterate through k and get each  num and each index
   - set i to itself + 2
   - convert each num to the result of i being squared by num at the current iteratoin
   - join these values
-  if  n is 0 then do this
   -  return total
- else
   set total to the result of adding n to total
   - return total
end

C: Code with intent



=end

def decompose(num, arr)
  return num if  arr[0].empty?
  total = arr[0].map.with_index do  |num, i|
    i += 2
      i ** num
  end.reduce(:+)
  total
  if  arr[-1] == 0
    total
    else
    total += arr[-1]
  end
end

 decompose(0, [[], 0] )== 0
 decompose(4, [[2], 0]) == 4
 decompose(9, [[3], 1]) == 9
 decompose(25, [[4, 2], 0]) == 25
 decompose(8330475, [[22, 13, 10, 8, 7, 6, 6, 5, 5, 5, 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2], 0]) == 8330475


=begin
Weight for Weight
My friend John and I are members of the "Fat to Fit Club (FFC)". John is worried because each month a list with the weights of members is published and each month he
is the last on the list which means he is the heaviest.

I am the one who establishes the list so I told him: "Don't worry any more, I will modify the order of the list". It was decided to attribute a "weight" to numbers.
The weight of a number will be from now on the sum of its digits.

For example 99 will have "weight" 18, 100 will have "weight" 1 so in the list 100 will come before 99.

Given a string with the weights of FFC members in normal order can you give this string ordered by "weights" of these numbers?
Example:

"56 65 74 100 99 68 86 180 90" ordered by numbers weights becomes:

"100 180 90 56 65 74 68 86 99"

When two numbers have the same "weight", let us class them as if they were strings (alphabetical ordering) and not numbers:

180 is before 90 since, having the same "weight" (9), it comes before as a string.

All numbers in the list are positive numbers and the list can be empty.
Notes

    it may happen that the input string have leading, trailing whitespaces and more than a unique whitespace between two consecutive numbers


  P. Understand the Problem
  Explicit Requirements:
  - we are given a list of str which represents the weight of each person. To make it less obvious that the last person is the heaviest we want to resort these string
  - our goal is to sort each string by them converted to seperate integers and the  the result of them added together. e.g. (99 becomes 18 as 9 + 9 == 18)
  - if we have two numbers that add to be the same digits then those numbers sould be sorted by their original string forms.
  - we are only dealing with positive numbers and the list can be empty

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure:


A: Algorithm

- initialize number_arr to the result of the str being split between spaces into an array
- initialize sorted_number arr to this result
- sort through number_arr and get each num
    - iterate through each digit of num and convert to an integer.
    return an array containing each array of integers added together as an element and num as the second element
      - this will sort elements by their integer values and sort the values of the same integer values by their string elements.
  end
  - join together the sorted arr and return
=end

def order_weight(str)
  number_arr = str.split
  sorted_number_str = number_arr.sort_by do |num|
     [num.chars.map(&:to_i).reduce(:+), num]
  end
   sorted_number_str.join(" ")

end

 #p order_weight("103 123 4444 99 2000") #==  "2000 103 123 4444 99"
 order_weight("2000 10003 1234000 44444444 9999 11 11 22 123") #==  "11 11 2000 10003 22 123 1234000 44444444 9999"

=begin
 numbers that are a power of the sum of their digits
 The number 81 has a special property, a certain power of the sum of its digits is equal to 81 (nine squared). Eighty one (81), is the first number in having this property (not considering numbers of one digit). The next one, is 512. Let's see both cases with the details

8 + 1 = 9 and 92 = 81

512 = 5 + 1 + 2 = 8 and 83 = 512

We need to make a function that receives a number as argument n and returns the n-th term of this sequence of numbers.
Examples (input --> output)

1 --> 81

2 --> 512

P. Understand the Problem
  Explicit Requirements:
  - we are given an integer that represents the nth place in a sequence  of number that are a power of the sum of their digits
  - for instance if we want the 1st place we must find the first number that added together is a power of that sum of digits. the first number would be 81
   (8 + 1 == 9, 9**2 == 81 ) the 2nd place would be 512 (5 + 1 + 2 == 8, 8 ^3 == 512 )
  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: integer
  - output: integer
  - possible intermediary structure:


A: Algorithm
- initialize  number_range to a result of numbers from 1-5000 inclusive
- iterate through number_range and split up each number into single characters.
- convert all of these characters into integers and get the reduced values of each character
- initialize this result as range_totals
- merger number_range and ranger_total and initialize to number_range_and_result
- initialize nth_term to the result of iterating through number_range_and_result and getting the base_number and the total
- check from a range of 2 to 5 inclusive and select all  arrays that fulfills the condition of total squared by the range num is == to the base_number
 - iterate through nth_term and get each arr and index.
 - set i to be incremented by 1 and select the arr that matches i when i is == to the input int
 - return the first number from that array

C: Code with intent


=end

def power_sumDigTerm(int)

    number_range = []
    (2..25000).to_a.map {|num| number_range << num}
    range_totals = []
    number_range.each {|num| range_totals <<  num.to_s.chars.map(&:to_i).reduce(:+)}
    number_range_and_result = number_range.zip(range_totals)
     nth_term = number_range_and_result.select {|base_number, total| (2..10).any? { |n| total ** n == base_number }}
     nth_term.select.with_index {|arr, i| i += 1; arr if i == int}.flatten.first
  end
 power_sumDigTerm(1) #== 81

 power_sumDigTerm(2) #== 512
 power_sumDigTerm(30)

#p power_sumDigTerm(3) == 2401

#p power_sumDigTerm(4) == 4913

#number = 17 ** 3
#p number
#num = 81
#p 5 % Math.sqrt(25) == 0


=begin
Hamming distance
Task

The hamming distance between a pair of numbers is the number of binary bits that differ in their binary notation.
Example

For a = 25, b = 87, the result should be 4

25: 00011001
87: 01010111

The hamming distance between these two would be 4 ( the 2nd, 5th, 6th, 7th bit ).
Input/Output

    [input] integer a

First Number. 1 <= a <= 2^20

    [input] integer b

Second Number. 1 <= b <= 2^20

    [output] an integer

Hamming Distance
Task

The hamming distance between a pair of numbers is the number of binary bits that differ in their binary notation.
Example

For a = 25, b = 87, the result should be 4

25: 00011001
87: 01010111

The hamming distance between these two would be 4 ( the 2nd, 5th, 6th, 7th bit ).
Input/Output

    [input] integer a

First Number. 1 <= a <= 2^20

    [input] integer b

Second Number. 1 <= b <= 2^20

    [output] an integer

Hamming Distance

P. Understand the Problem
  Explicit Requirements:
  - our goal is to take our two integers and compare their binary values. We want to return an integer that represents how many places of each binary value have different values
  - aka the hamming distance

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: two integers
  - output: integer
  - possible intermediary structure: array


A: Algorithm
- initialize difference to  0
- initialize binary_one to the result of transforming the first input str into it's str values and then split each into separate chars
- initialize binary_two to the result of repeating the previous action for the second input str
- if the two share the same size
    - initialize combined_binary to the result of merging binary_one and binary_two
    - iterate through combined_binary and get b_one and b_two
    - increment counter by 1 if b_one does not equal b_two
    - retutn difference
- else
- initialize greater_size and set it to binary_one if binary_one has a greater size or set it to binary_two if that has a greater_size
- initialize smaller_size and set it to the binary array that is the smallest size
- prepend 0 to smaller_size (greater_size - smaller_size times
-  initialize combined_binary to the result of merging greater_size and smaller_size
- iterate through combined_binary and get b_one and b_two
    - increment counter by 1 if b_one does not equal b_two
    - retutn difference

C: Code with intent

=end

def hamming_distance(int1, int2)
  difference = 0
   binary_one = int1.to_s(2).chars
   binary_two = int2.to_s(2).chars
   if  binary_one.size == binary_two.size
    combined_binary = binary_one.zip(binary_two)
    combined_binary.each {|b_one, b_two| difference += 1 if b_one != b_two }
    difference
   else
     binary_one.size > binary_two.size ? greater_size = binary_one : greater_size = binary_two
     binary_one.size > binary_two.size ? smaller_size = binary_two : smaller_size = binary_one
    (greater_size.size - smaller_size.size).times {|n| smaller_size.prepend('0')}
     combined_binary = binary_one.zip(binary_two)
     combined_binary.each {|b_one, b_two| difference += 1 if b_one != b_two }
     difference
   end
end

 hamming_distance(25,87) == 4
 hamming_distance(256,302) #== 4
 hamming_distance(543,634) == 4
hamming_distance(34013,702) == 7


=begin

6 kyu
Non-even substrings
482093% of 242353 of 1,065KenKamau
 Ruby
MRI 3.0.0
VIM
EMACS
Instructions
Output
Past Solutions
Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.

Good luck!

If you like substring Katas, please try

P. Understand the Problem
  Explicit Requirements:
  - we are given a string of integers. We need to find all possible odd-numbered substrings that can be made
  - we want to return an integer that represents this total

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: integer
  - possible intermediary structure: array


A: Algorithm
- initialize substr to the result of getting all substring from the input str
- iterate through substr and select any values converted to an integer that are odd
- return the size of that arr

all substr method
- initialize substring to an empty array
- iterate through a range from 1 to the size of the str inclusive  and get n
-  iterate through the input str and get each consecutive portion from piece.  append each portion to substring
- return substring
C: Code with intent



=end

def get_substring(str)
result = []
(1..str.length).each do |n|
 str.chars.each_cons(n) {|substr| result << substr}
end
 result
end


def solve(str)
substr = get_substring(str)
substr.select {|arr|   arr.join.to_i.odd?}.size
end

 solve("1341") == 7
 solve("1357") == 10
 solve("13471") == 12
 solve("134721") == 13
 solve("1347231") == 20
 solve("13472315") == 28


=begin

Detect Pangram
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence
"The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.


P. Understand the Problem
  Explicit Requirements:
  - we are given a string. And we are to determine if the string is a pangram or not.  A pangram is a sentence that uses at least every letter in the alphabet once
  - in our case it is case insensitive
  - ignore numbers and punctuation

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: boolean
  - possible intermediary structure: hash


A: Algorithm
- create a hash alphabet_hash that contains all letters of the alphabet (lower case here) as keys and all values set to 0
  - initialize filtered_str to the result of removing all non alpha characters from the input str
  - iterate through the filtered_strand get each k (as each character is a key )
  - increment the value of each k by 1 each time it appears in the input str  (convert all uppercase letters to lowercase)
  - return true if each key of alphabet_hash is greater or equal to 1 and return false otherwise

  - getting hash
  - initialize hash to a empty hash
  - iterate through a range from 'a' to 'z' inclusive. and set param as letter
  - set each letter as the key and the value to 0 at each iteration.
  - return hash

C: Code with intent

=end

def initialize_alphabet_hash
hash = {}
('a'..'z').each {|letter| hash[letter] = 0 }
 hash
end


def pangram?(str)
  hash = initialize_alphabet_hash
  filtered_str = str.chars.select {|char| char.downcase.match(/[a-z]/)}
  filtered_str.each {|letter| hash[letter.downcase] += 1 }
  hash.values.all? {|v| v >= 1 }
end

  # "The quick brown fox jumps over the lazy dog."
   pangram?("The quick brown fox jumps over the lazy dog.") == true
  # "This is not a pangram."
   pangram?("This is not a pangram.") == false


=begin
Multiples of 3 and 5

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in. Additionally, if the number is negative, return 0 (for languages that do have them).

Note: If the number is a multiple of both 3 and 5, only count it once.

P. Understand the Problem
  Explicit Requirements:
  - we have an input number. We want to get all natural numbers below it that are a multiple of 3 and 5
  - also make sure to choose each number once if a number is shared by both 3 and 5
  - once you have all numbers you want to return the sum of all numbers
  - if the input number is negative then return 0

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: integer
  - output: integer
  - possible intermediary structure: array


A: Algorithm
- return 0 if the input integer is < 0
- initialize selected_values to the result of iterating through a range from 1 to input integer exclusive and get the param num
- select num if it is evenly divisible by 3 or if it is evenly divisible by 5
- choose only unique values to account for values that occur for both
- get the total sum from selected_values and return this value

C: Code with intent

=end

def test(int)
  return 0 if int < 0
   selected_values = (1...int).select {|num| num if num % 3 == 0 || num % 5 == 0 }.uniq
    selected_values.reduce(:+)
end

test(10) == 23
test(20) == 78
test(200) ==  9168


=begin

Count the number of Duplicates

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string.
  The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
Example

"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

P. Understand the Problem
  Explicit Requirements:
  - we are given an input str. we are to try and find all counts of distinct case insensitive alpha characters and numeric digits that occur more than once
  - meaning that all distinct counts over 1 count the same. They will represent a duplicate
  - we can assume we have only alphabets and numeric digits.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: integer
  - possible intermediary structure: array


A: Algorithm
- initialize str_arr  to the result of containing each letter of the input str in an array
- initialize duplicate_counts to the result of iterating through str_arr and selecting all chars (lowercase) that when you check the count of them in str_arr
- their count is over 1
- return the size of duplicate_counts
C: Code with intent



=end
def duplicate_count(str)
  str_arr = str.chars.map {|char| char.downcase}
  duplicate_counts = str_arr.select {|char|   char if  str_arr.count(char) > 1 }.uniq.size
end

duplicate_count("") == 0
duplicate_count("abcde") == 0
duplicate_count("abcdeaa") == 1
duplicate_count("abcdeaB") == 2
duplicate_count("Indivisibilities") == 2


=begin
Find the odd int
Given an array of integers, find the one that appears an odd number of times.

There will always be only one integer that appears an odd number of times.
Examples

[7] should return 7, because it occurs 1 time (which is odd).
[0] should return 0, because it occurs 1 time (which is odd).
[1,1,2] should return 2, because it occurs 1 time (which is odd).
[0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
[1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).


P. Understand the Problem
  Explicit Requirements:
  - we are given an array of integers
  - our goal is to find the one integer that appears an odd amount of times
  - there is always only going to be one so you should only have to account for one

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: integer
  - possible intermediary structure: array


A: Algorithm
- iterate through the input array and get each num
- select num if the count of num in the input arr is odd?
- return the first number to get integer form

C: Code with intent

=end

def find_it(arr)
    arr.select {|num| arr.count(num).odd?}.first
end

 find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
 find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
 find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
 find_it([10]) == 10
 find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10

=begin
Find the Unique number

There is an array with some numbers. All numbers are equal except for one. Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

It’s guaranteed that array contains at least 3 numbers.

The tests contain some very huge arrays, so think about performance.

This is the first kata in series:


P. Understand the Problem
  Explicit Requirements:
  - we are given an array with numbers. all numbers are equal except for one. We want to select that one number
  - the array will contain at least 3 numbers
  - keep in mind performance as big arrays will be tested
  - only one number to choose

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: integer
  - possible intermediary structure: array


A: Algorithm
- iterate  through the input arr and get each num
- select the num  that the input arrays count of num is == 1
- return the first number to get integer form

C: Code with intent

=end
def find_uniq(arr)
  arr.select {|num| arr.count(num) == 1 }.first
end

# the above solution works fine for these answers however it does not scale well with very large arrays. Here is a solution that does

#def find_uniq(arr)
#  count = Hash.new(0)
#  arr.each { |num| count[num] += 1 }
#  count.each { |num, freq| return num if freq == 1 }
#end

find_uniq([1,1,1,1,0]) == 0
find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) ==  0.55



=begin
Are they the same?

Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that checks whether the two arrays have the "same" elements,
with the same multiplicities (the multiplicity of a member is the number of times it appears). "Same" means, here, that the elements in b are the elements in a squared,
regardless of the order.
Examples
Valid arrays

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

Invalid arrays

If, for example, we change the first number to something else, comp is not returning true anymore:

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]

comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]

comp(a,b) returns false because in b 36100 is not the square of any number of a.


P. Understand the Problem
  Explicit Requirements:
  - we are given two input arrays. The first is a series of numbers. And the second is also a series of number.
  - our goal is to compare the 1st and  2nd arrays to see if the 2nd array includes every number from the 1st array squared.
  - order does not matter

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: two arrays
  - output: boolean
  - possible intermediary structure: array


A: Algorithm
- if the 1st arr is nil or just one of the arr are empty then return false
- iniitalize arr1_squared to the result of iterating through the first arr and squaring each individual num
- compare a sorted arr1_squared and arr_2. If they are the same retrun true. else return false

C: Code with intent

=end

def comp(arr1, arr2)
 return false if arr1 == nil  || arr2 == nil
 return true if arr1.empty? && arr2.empty?
 arr1_squared = arr1.map {|num| num **2}
 arr1_squared.sort == arr2.sort ? true : false
end

   comp( [121, 144, 19, 161, 19, 144, 19, 11],
        [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) #==  true



=begin

Sum of Pairs

Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)


P. Understand the Problem
  Explicit Requirements:
  - we are given an array and an integer and our output is a pair of numbers from the array
  - our goal is to return the first two values in order of appearance that add up to form the  input integer
  - if there are more than one that fits this bill then we must choose the one which has the smallest second index

  Implicit Requirements:
  - if there is a pair that equals the sum that are the same number. the first number will be represented by the first index of it's occurence and the second number will
    be represented by the second index of it's occurrence

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array and int
  - output: array
  - possible intermediary structure:


A: Algorithm
- initialize pairs to the result of iterating through the input arr and getting all pairs that added together are equal to the input integer
- return nili if pairs is an empty array
- if pairs is only 1 in size
  - return the first array
- else
  - initialise second_index to the resullt of iterating through pairs and getting each arr. get the last index of each array
  - initialize smallest_second_index to the result of iterating through the input arr and getting each num and index i
  - initialize first_i_of_second_index to the result of iterating through the input arr and getting each num and i
  - select i if smallest_second_index at index 0 is == num. Get rid of all nil values and return the last instance
  - initialize second_i_of_second_index and repeat the same process but instead select i if smallest_second_index 1 is == num
  - initialize decidiing_value to empty array
  - append to decciding_value first_i if it is smaller than second_i and vice versa if the opposite is true.
  - change deciding value to an integer
  - initialize smallest_value to the result of  iterating through the input arr and select num if i == deciding factor
  - iterate through second_index and select the arr that contains smallest_value

C: Code with intent

=end



l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

=begin
def sum_pairs(arr, int)
  pairs = []
  deciding_value = 0
  arr.combination(2) {|num| pairs << num if num.reduce(:+) == int}
  return nil if pairs.empty?
  if pairs.size == 1
    return pairs.first
  else
   smallest_second_index = pairs.map {|arr|  arr.last}
   first_i_of_second_index = arr.map.with_index {|num, i| i if num == smallest_second_index[0] }.compact.last
   second_i_of_second_index = arr.map.with_index {|num, i| i if num == smallest_second_index[1] }.compact.last
   first_i_of_second_index < second_i_of_second_index ? deciding_value == first_i_of_second_index : deciding_value = second_i_of_second_index
   smallest_value = arr.select.with_index {|num, i| num if deciding_value == i }.first
   pairs.select {|arr| arr.include?(smallest_value)}.first
  end
end
=end


def sum_pairs(arr, int)
  seen = {}
  arr.each_with_index do |num, i|
     complement = int - num
     seen[complement]
      [complement, num]
    if seen[complement]

      return [complement, num]
    end
   seen[num] = true
  end
  nil
end

 sum_pairs(l1, 8) == [1, 7] #"Basic: ["+l1.join(", ")+"] should return [1, 7] for sum = 8"
#p sum_pairs(l2, -6) == [0, -6] # "Negatives: ["+l2.join(", ")+"] should return [0, -6] for sum = -6"
#p sum_pairs(l3, -7) == nil # "No Match: ["+l3.join(", ")+"] should return nil for sum = -7"
#p sum_pairs(l4, 2) == [1, 1] # "First Match From Left: ["+l4.join(", ")+"] should return [1, 1] for sum = 2 "
# sum_pairs(l5, 10) == [3, 7] # "First Match From Left REDUX!: ["+l5.join(", ")+"] should return [3, 7] for sum = 10 "
#p sum_pairs(l6, 8) == [4, 4] # "Duplicates: ["+l6.join(", ")+"] should return [4, 4] for sum = 8"
#p sum_pairs(l7, 0) == [0, 0] # "Zeroes: ["+l7.join(", ")+"] should return [0, 0] for sum = 0"
#p sum_pairs(l8, 10) == [13, -3] # "Subtraction: ["+l8.join(", ")+"] should return [13, -3] for sum = 10"



=begin


Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence,
 which is the number of times you must multiply the digits in num until you reach a single digit.

For example (Input --> Output):

39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2)
4 --> 0 (because 4 is already a one-digit number)


P. Understand the Problem
  Explicit Requirements:
  - we are given an integer and our goal is to get a count of how many times we must multiply each two digits together before we only have one digit
  e.g. (39 => 3 * 9 => 27 => 2 * 7 => 14 => 1*4 = > 4 ) 39, 27, 14, 4. That is 4. that is the count we want to return

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: integer
  - output: integer
  - possible intermediary structure:


A: Algorithm

- initialize result_arr  to an empty arr
- initialize current_number to the input integer
- until current_num converted to a str has a size of 2 we wish to do this
    - convert current_num to a str and break apart into an array. initialize a current_arr
    - convert each num in current_arr to an int and get the total_value . append this value to result_arr
    - set current_num to the total value from current_arr
    - repeat until condition fulfilled

C: Code with intent



n

=end


def persistence(int)
  result_arr = []
  current_num = int
  until current_num.to_s.size == 1
       current_arr =  current_num.to_s.chars
       current_num =  current_arr.map(&:to_i).reduce(:*)
       result_arr << current_num
  end
  result_arr.size
end

 persistence(39) == 3
 persistence(4) #== 0
 persistence(25)# == 2
 persistence(999)# == 4
 persistence(444) == 3


=begin
PigLatin
 Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.
Examples

pig_it('Pig latin is cool') # igPay atinlay siay oolcay
pig_it('Hello world !')     # elloHay orldway !


P. Understand the Problem
  Explicit Requirements:
  - we are given a string sentence
  - our goal is to take the first letter of each word and move it to the end of it's word. Then add 'ay' to the end of the word.
  - if there is a punctuation mark then leave untouched


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: array


A: Algorithm
- initialize alphabet to an arrau containing all uppercase and lowercase words
- iterate through an array that contains each word. Initialize as words_arr
- initialize flipped_word  to an empty array
- as iterate through words_arr again and then once more getting each char and i
- get a range of word from the first index to the last index and then add char if i is only equal to the first index and append to flipped_words
- iterate through flipped_word and get each word. Iterate throug each character of word and get each index
-  if i  is equal to  the last index of word and each char is included in the alphabet
    - get a range from word from the first index to the last and add 'ay' and append to result
  - elsif i is not included in the alphabet append to result
-  join the resulting word

- return this word

C: Code with intent




=end

def pig_it(str)
  alphabet = ('a'..'z').to_a + ("A"..'Z').to_a
  words_arr = str.split
  flipped_words = []
  result = []
  words_arr.each {|word|  word.chars.each.with_index {|char, i| flipped_words <<  word[1..word.size - 1] + char if i == 0 }}
 flipped_words.each {|word| word.chars.each.with_index do |char, i|
if i == word.size - 1 && alphabet.include?(char)
   result <<  word[0..word.size - 1] + 'ay'
elsif !alphabet.include?(char)
  result << char
end
 end }
  result.join(' ')
end


# solution that is more concise and combined flipping step and adding 'ay' step into one
#def pig_it(str)
 # words_arr = str.split
 # result = words_arr.map do |word|
 #   if word.match?(/[[:alpha:]]/) # check if word contains a letter
 #     first_char = word.slice!(0)
 #     "#{word}#{first_char}ay"
 #   else
 #     word
 #   end
 # end
 # result.join(' ')
#end


  pig_it('Pig latin is cool') == 'igPay atinlay siay oolcay'
  pig_it('Hello world !')     == 'elloHay orldway !'



=begin
Highest Rank Number in an Array
Complete the method which returns the number which is most frequent in the given input array. If there is a tie for most frequent number, return the largest number among them.

Note: no empty arrays will be given.
Examples

[12, 10, 8, 12, 7, 6, 4, 10, 12]              -->  12
[12, 10, 8, 12, 7, 6, 4, 10, 12, 10]          -->  12
[12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10]  -->   3

P. Understand the Problem
  Explicit Requirements:
  - we are given an array with a sequence of numbers.
  - our goal is to find the number (or numbers) that occur the most time in the sequence.
  - if the max frequency is shared by more than one number then choose the largest number

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: integer
  - possible intermediary structure:array


A: Algorithm
- sort the arr from largest to smallest and initialize as greatest_to_least
- iterate throygh greatest_to_least and select the num that occurs the most times in the array.
- because it is sorted from greatest to least it will choose the first num that occurs the nost time (this will be the largest which fits our criteria )

C: Code with intent

=end

def highest_rank(arr)
  greatest_to_least = arr.sort {|a, b| b <=> a}
  greatest_to_least.max_by {|num| greatest_to_least.count(num)}
end



 highest_rank([12, 10, 8, 12, 7, 6, 4, 10, 12]) == 12
 highest_rank([12, 10, 8, 12, 7, 6, 4, 10, 12, 10]) == 12
 highest_rank([12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10]) == 3
 highest_rank([1, 2, 3])


=begin
difference of 2
 The objective is to return all pairs of integers from a given array of integers that have a difference of 2.

The result array should be sorted in ascending order of values.

Assume there are no duplicate integers in the array. The order of the integers in the input array should not matter.
Examples

[1, 2, 3, 4]  should return [[1, 3], [2, 4]]

[4, 1, 2, 3]  should also return [[1, 3], [2, 4]]

[1, 23, 3, 4, 7] should return [[1, 3]]

[4, 3, 1, 5, 6] should return [[1, 3], [3, 5], [4, 6]]


P. Understand the Problem
  Explicit Requirements:
  - we are given an array of integers
  - our goal is to get each pair of integers that has a difference of 2
  - and then take the integers and sort them from ascending order of values

  Implicit Requirements:
  - if there are no pairs that have a difference of 2 then return an empty array
  -
  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: array
  - possible intermediary structure: array


A: Algorithm
  initialize all_pairs to an empty  array
  - iterate through the input arr and get each pair of two numbers. append those pairs to all_pairs
  - initilaize matching_pair to the result of this
  - sort all arrays in all_pairs  then
    - select from all_pairs all arrays that have an absolute difference of 2 when subtracting index 0 from index 1
  - sort the arrays in ascending order
C: Code with intent


=end

def twos_difference(arr)
  all_pairs = []
  arr.combination(2) {|num| all_pairs << num}
  all_pairs.map! {|arr| arr.sort  }
  all_pairs.select {|arr| (arr[0] - arr[1]).abs == 2  }.sort
end

twos_difference([1, 2, 3, 4]) ==  [[1, 3], [2, 4]]
twos_difference([1, 3, 4, 6]) ==  [[1, 3], [4, 6]]
twos_difference([0, 3, 1, 4]) ==  [[1, 3]]
twos_difference([4, 1, 2, 3]) ==  [[1, 3], [2, 4]]
twos_difference([6, 3, 4, 1, 5]) ==  [[1, 3], [3, 5], [4, 6]]
twos_difference([3, 1, 6, 4]) ==  [[1, 3], [4, 6]]
twos_difference([1, 3, 5, 6, 8, 10, 15, 32, 12, 14, 56]) ==  [[1, 3], [3, 5], [6, 8], [8, 10], [10, 12], [12, 14]]
twos_difference([1, 4, 7, 10]) ==  []
twos_difference([]) ==  []

=begin

Build Tower

Build a pyramid-shaped tower, as an array/list of strings, given a positive integer number of floors. A tower block is represented with "*" character.

For example, a tower with 3 floors looks like this:

[
  "  *  ",
  " *** ",
  "*****"
]

And a tower with 6 floors looks like this:

[
  "     *     ",
  "    ***    ",
  "   *****   ",
  "  *******  ",
  " ********* ",
  "***********"
]
P. Understand the Problem
  Explicit Requirements:
  - we are given an integer and our goal is to create a tower with as many floors as the given input


  Implicit Requirements:
  -  at each floor we want to add 2 to each stair

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input:
  - output:
  - possible intermediary structure:


A: Algorithm

C: Code with intent
- initialize stairsts to '*'
- initilaize increment to '**'
- initialize result to an array containing stairs
-  iterate from 1 up to the integer amount and get each floor.
- add together the stairs by increment and set as new amount
- append this to result.
- iterate through result and now get each floor. center each floor by the size of the floor which is the equal to the final floor of stairs
- return result

=end

def towerBuilder(int)
  stairs = '*'
  increment = '**'
  result = [stairs]
  1.upto(int - 1) {|floor|   result <<  (stairs += increment) }
  result.map {|floor|  floor.center(stairs.size)}
end

  towerBuilder(1) ==  ['*']
  towerBuilder(2) ==  [' * ', '***']
  towerBuilder(3) ==  ['  *  ', ' *** ', '*****'] # ["*", "***", "*****"]


  array = [3, 2, 6, 1, 7, 5, 4]
value_to_ignore = 6

# sort all values except the one to ignore
p sorted_array = array.reject {|x| x == value_to_ignore }.sort

# insert the ignored value back into the array
p result_array = sorted_array.insert(sorted_array.find_index {|x| x > value_to_ignore } || sorted_array.length, value_to_ignore)

result_array.insert(3, -3)



=begin

51. Reverse or rotate?
(https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991)
6 kyu
Reverse or rotate?
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.

If

sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
Examples: ('123456', '987654')
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> ""
revrot("563000655734469485", 4) --> "0365065073456944"

P. Understand the Problem
  Explicit Requirements:
  - we are given an input str and an integer
  - we are to break up the str into chunks of sizes of the integer
  - if the str is smaller than the input integer then return the input str
  - we want to take each chunk and then the square cube of each individual digit and then add that total together. If this total is evenly divisible by 2 then rotate the chunk, else move the first digit of the chunk to the front of the next chunk (or the end if this is the last chunk


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: str and integer
  - output: str
  - possible intermediary structure: array


A: Algorithm
- return empty str if integer is less than the size of the str  or if input int is -
- initialize chunks to the result of getting each slice the size of the input int and converting to an array
- iterate through each chunk and get each word and each i (index)
  - iterate through each word and get each digit
    - convert each digit to an integer and cube by 3
- return back to word and get the total value of the word.
  - see if evenly divisible by 2. and if it is the size of chunk if so rotate the word.
  - else check if i == chunk.size - 1 if so append to end of resulting word. if not add digit to word at next index
- join the str and return

C: Code with intent


=end

def revrot(str, int)
  return '' if str.size < int  || int == 0
  chunks = str.chars.each_slice(int).to_a
  result = []
  chunks.map.with_index do |word, i|
   if   word.map{|char|  char.to_i ** 3 }.reduce(:+) % 2 == 0  && word.size == int
        result << word.reverse

  elsif word.map{|char|  char.to_i ** 3 }.reduce(:+) % 2 != 0  && word.size == int
        result << word[1..word.size - 1]
        i  == chunks.size - 1  ? result << word[0] : result << word[0]
    end

  end
   result.join
end

#p  revrot("66443875", 8) == "64438756"
#p revrot("1234", 0) == ""
#p revrot("", 0) == ""
#p revrot("1234", 5) == ""
#p revrot("733049910872815764", 5) == "330479108928157"
#p revrot("123456987654", 6) == "234561876549"
#p revrot("123456987653", 6) == "234561356789"
#p revrot("66443875", 4) == "44668753"
#p revrot("664438769", 8) == "67834466"
#p revrot("123456779", 8) == "23456771"
#p revrot("", 8) == ""
#p revrot("123456779", 0) == ""
#p revrot("563000655734469485", 4) == "0365065073456944"
#p revrot("73304991087281576455176044327690580265896", 8)







=begin

58. Triple trouble
(https://www.codewars.com/kata/55d5434f269c0c3f1b000058)
6 kyu
Write a function

triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

P. Understand the Problem
  Explicit Requirements:
  - we are given two ints. Our goal is to find if int1 has a straight triple (3 consecutives of the same number) at any place in the int1 and if int2 has a straight double of the same number (2 of the same) at any place in the int
  - if both are the case return 1. if not return 0

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - do we need to worry about multiple straight triples ?

E: Examples/ Edge Cases


D: Data Structures
  - input: two integers
  - output: arrays
  - possible intermediary structure:


A: Algorithm
  - initialize arr1 to the result of converting int1 to a str and then to a an array of each char
  - initialize arr2 and do the same for it
  - iterate through arr1 and split up by 3.  and set as arr1
  - initialize straight_triple as selecting from arr1 and choosing any that are all the same
  - set arr2 as splitting up by 2
  - initialize straight_double by selecting all arrays that have the same numbers
  - if either straight double or straight_triple or empty return 0
  - if straight double includes any digit from straight triple (we will use first in this case) return 1 else return 0

C: Code with intent


=end

def triple_double(int1, int2)
 split_by_3 = int1.to_s.chars.each_cons(3).to_a
 split_by_2 = int2.to_s.chars.each_cons(2).to_a
 straight_triple = split_by_3.select {|arr|  arr.all?{|num| num == arr[0]}}
 straight_double = split_by_2.select {|arr| arr[0] == arr[1]}
if straight_double.empty? || straight_triple.empty?
    0
else
   straight_double
   straight_double.first.any? {|num| p straight_triple.first.include?(num)} ? 1 : 0
end
end
  triple_double(12345, 12345) == 0
   triple_double(666789, 12345667) == 1




   def get_digit_substr(arr)
    result = []
    (0...arr.size).each do |elem|
      (elem + 1...arr.size).each do |inner_elem|
        result << [arr[elem], arr[inner_elem]]
      end
    end
      result
  end

  get_digit_substr([19, 25, 32, 4, 27, 16])

  def closest_numbers(arr)
     pair_substr = get_digit_substr(arr)
     pair_substr.sort_by {|arr| arr.reduce(:-).abs}.first
  end

   closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
   closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
   closest_numbers([12, 7, 17]) == [12, 7]



   def longest_repetition(s)
    max_char = ''
    max_length = 0
    current_char = ''
    current_length = 0

    s.each_char do |char|
      if char == current_char
        current_length += 1
      else
        if current_length > max_length
          max_length = current_length
          max_char = current_char
        end
        current_char = char
        current_length = 1
      end
    end

    if current_length > max_length
      max_length = current_length
      max_char = current_char
    end

    [max_char, max_length]
  end



 longest_repetition("aaaabb") == ['a', 4]
 longest_repetition("bbbaaabaaaa") == ['a', 4]
 longest_repetition("cbdeuuu900") == ['u', 3]
 longest_repetition("abbbbb") == ['b', 5]
 longest_repetition("aabb") == ['a', 2]
 longest_repetition("ba") == ['b', 1]
 longest_repetition("") == ['', 0]
 longest_repetition("aaabbcccddd") == ['a', 3]








# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.

=begin
P. Understand the Problem
  Explicit Requirements:
  -  given an input string
  - we want a score of every word. within each word each letter is scored based on it's position in the alphabet. e.g. a =  1, z = 26
  - return the string word that has the highest score not the actual score itself
  - if there are 2 or more of the highest score then return the first instance of the score

  Implicit Requirements:
  - only lower case letter to worry about

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 - -('aa, b' ) 'aa' = 1 + 1 = 2   b = 2
  they are the same so the first instance is returned 'aa

D: Data Structures
  - input: string
  - output: and string
  - possible intermediary structure: hash


A: Algorithm
 we need to be able to keep a score for each letter
 - initialize  max_score_idx  to an empty arr
 - lets create an array that contains all lowercase alpha characters  initialize as alphabet
 - initialize hsh to an empty array
 -  iterate through alphabet and set each k as the char and each v as the index + 1
 - iterate through the input str and get each word
  - iterate through each word and get each char. set each char  is a key set each char to it's value of the hsh
  - initialize word_scores to the result of these transformed arrays
  - initialize max_score to the max value of word_scores
  - iterate through word_socres and select the index where score is equal to max_score (get rid of any nil values)
  - initialize max_score_idx to this value and then choosing the first index
  - convert the input str into an array separated by spaces and then access the array aat the max_score_idx and return that result
C: Code with intent



=end

def alphabet_score(str)
   alphabet = ('a'..'z').to_a
   hsh = {}
   alphabet.each_with_index {|char, i| hsh[char] = i +1 }
   word_score = str.split.map.with_index  { |word, i| word =  word.chars.map {|char| hsh[char]}.sum}
   max_score = word_score.max
   max_score_idx =  word_score.map.with_index {|word, i| i  if word == max_score}.compact.first
  str.split[max_score_idx]
end

 p alphabet_score('man i need a taxi up to ubud') == 'taxi'
 p alphabet_score('what time are we climbing up the volcano') == 'volcano'
 p alphabet_score('take me to semynak') == 'semynak'
 p alphabet_score('aa b') == 'aa'




=begin
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"
Your task is to process a string with "#" symbols.
Examples
"abc#d##c" ==> "ac"
"abc##d######" ==> ""
"#######" ==> ""
"" ==> ""

P. Understand the Problem
  Explicit Requirements:
  - we are given a string with alpha characters and a '#' symbol. each # represents a backspace
  - we want to process the string converting each # as a backspace
  '' "abc#d##c" ==> "ac"

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  ('abc#d##c') == "ac"   f
  'abd##c'
  'ad#c'
  'ac'
  if we get all indexes where this is a # symbol. we can remove from the current list the character at the previous index of the current position

    p clean_string('abc####d##c#') == ""
    'ab###d##c#''
    'a##d##c#'
    '#d##c#' - if the first character is just '#' or the index is 0 then just skip over this index
    'd##c#'
    '#c#'
    'ch'
    ''


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: array


A: Algorithm
- initialize modified_str to str
- initialize current_first_checkered_index to an empty array
- iterate through the str and get each char and i
- if char is '#' then append i to current_first_checkered_index
- select the first element of current_first_checkered_index
- until the  count of '#' in str is empty then execute this loop
    - iniitalize index to current_first_checkered_index
    - if str from a range from 0 to index + 1 not inclusive + index + 1 is less than the str length then add the rest of the str following the first range from the next index past index to the last index in str. else return empty str
    - if first_check_idx is 0 then  include a range from index 1 to the lasst index non inclusive, else return first_check_idx
    - invoke get_first_checkered_index on str until the count of '#' in first_check is 0
    - return the resulting str

=end

def get_first_checkered_index(str)
  first_checkered_index = []
  str.chars.each_with_index {|char, i| first_checkered_index << i if char == '#'}
  first_checkered_index.first
end


def clean_string(str)
  first_check_idx = get_first_checkered_index(str)
until str.count('#') == 0
   index = first_check_idx
   str = str[0...index-1] + (index+1 < str.length ? str[index+1..-1] : '')
   first_check_idx == 0 ? str = str[1...-1] : first_check_idx
   first_check_idx =  get_first_checkered_index(str)
end

   str
end



p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
p clean_string ("bb##dee#jh#")
              #  -b#dee#jh#
              #  -dee#jh#
              #  -dejh#
              #  -dej
 # more efficient version


 def clean_string(str)
  index = str.index('#')

  while index
    if index == 0
      str = str[1..-1]
    else
      str = str[0...index-1] + str[index+1..-1]
    end

    index = str.index('#')
  end

  str
end


def swapcase(str)
  result = []
upcase = ('A'..'Z').to_a
  space_indexes = str.chars.map.with_index {|char, i | i if char == ' '}.compact
end

swapcase(' Example  string ')



=begin
The prime numbers are not regularly spaced. For example from 2 to 3 the step is
1. From 3 to 5 the step is 2. From 7 to 11 it is 4. Between 2 and 50 we have the
following pairs of 2-steps primes:

3, 5 - 5, 7, - 11, 13, - 17, 19, - 29, 31, - 41, 43

We will write a function step with parameters:

g (integer >= 2) which indicates the step we are looking for,

m (integer >= 2) which gives the start of the search (m inclusive),

n (integer >= m) which gives the end of the search (n inclusive)

In the example above step(2, 2, 50) will return [3, 5] which is the first pair
between 2 and 50 with a 2-steps.

So this function should return the first pair of the two prime numbers spaced
with a step of g between the limits m, n if these g-steps prime numbers exist
otherwise nil [] or "0, 0" or {0, 0} or 0 0 or ""
(depending on the language).

Remarks:
([193, 197] is also such a 4-steps primes between 130 and 200 but it's not the
first pair).

step(6, 100, 110) --> [101, 107] though there is a prime between 101 and 107
which is 103; the pair 101-103 is a 2-step.

Notes:
The idea of "step" is close to that of "gap" but it is not exactly the same. For
those interested they can have a look at
http://mathworld.wolfram.com/PrimeGaps.html.

A "gap" is more restrictive: there must be no primes in between (101-107 is a
"step" but not a "gap". Next kata will be about "gaps":-).

P. Understand the Problem
  Explicit Requirements:
  - we are searching for a range of prime numbers that have a certain step between them .
  - argument 'g' is the step
  - argument 'm' is the starting inclusive range (>= 2 )
  - argument 'n' is the ending inclusive range  (<= m )
  - using 'g' we want to find the first two prime numbers that have a gap of 'g' between 'm' and 'n'

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p step(4,100,110) == [103, 107]
g = 4
m = 100
n = 110
range (100..110)
 101, 103, 107, 109, = prime numbers
 -  [101, 103] difference != 'g'
 - [101, 107] difference != 'g'
 - [101, 109] difference != 'g'
 - [103, 107] difference == 'g'
 - ['103', 109] difference != 'g'
 if there more than one. return the first instance
D: Data Structures
  - input: 3 ints
  - output: array
  - possible intermediary structure: array


A: Algorithm
- be able to get all prime numbers (within a plugged in range)
- from our range ('m'..'n') get each possible pair
- select pairs only that have a difference of 'g'
- from our chosen pairs select the first pair

- select all prime numbers
-  iterate through a range from  m to n inclusive  and get each num
  - invoke is_prime? on num
  - append to prime_num if is_prime? is true
  - end

  - get_prime method
    - iterate from a range of 2  to  m non inclusive
      -  if there is any  number that is evenly divisble by 0 then return false
      - otherwise return true

  - get each possible pair
    - initialize result_arr to an empty arr
     iterate through a  range from 0 to the size of the arr  non inclusive and get each elem
      - iterate through a  range of elem + 1 to the size of the arr non inclusive and get each inner_elem
      - append to result_arr an arr
      -end
      -end
        - retrun the first value to get rid of our nested array
        - return result_arr


        - now we have all pairs
          - initialize as pairs. iterate through pair and get each pair
          - initiailize selected_pairs  as a result of selected only a pair if it's absolute value is == to 'g'
          - return the first value of selected_pairs
    -
C: Code with intent






=end


def get_prime?(m)
  !(2...m).any? {|num|  m % num == 0}
end

def choose_prime_numbers(m, n)
  prime_numbers = []
  (m..n).each do |num|
    prime_numbers << num if get_prime?(num)
  end
  prime_numbers
end

def get_pairs(prime_nums)
  result_arr = []
  (0...prime_nums.size).each do |num|
    (num + 1...prime_nums.size).each do |inner_num|
      result_arr << [prime_nums[num], prime_nums[inner_num]]
    end
  end
  result_arr
end


def step(g, m, n)
  prime_pairs = get_pairs(choose_prime_numbers(m, n))
  selected_pairs = prime_pairs.select {|pair|  pair.reduce(:-).abs == g}
  selected_pairs.first
end




  step(2,100,110) == [101, 103]
  step(4,100,110) == [103, 107]
  step(6,100,110) == [101, 107]
  step(8,300,400) == [359, 367]
  step(10,300,400) == [307, 317]





=begin
Group Anagrams: Implement a method that takes an array of strings and groups them together based on whether they are anagrams of each other. An anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once. For example, the input array ["eat", "tea", "tan", "ate", "nat", "bat"] would group into [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]].

P. Understand the Problem
  Explicit Requirements:
  - we are given an input arr
  - our goal is to group each anagram together in it's own subarray
  - and to return a final array containing each subarray

  Implicit Requirements:
  - the order of the subarrays seems to be in either order of size or order of the first occurence of anagrams. either can be utilized

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]) == [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
 - anagram array is empty initilaly []
 - select all words that include the characters from the first word 'e a t'
 - append those to anagram array
 - delete the word from the input arr if it is included in anagram_array
 - repeat then sort anagram_array by size

D: Data Structures
  - input: arr
  - output: arr
  - possible intermediary structure:


A: Algorithm
- initialize anagram_arr to an empty arr
- until input arr is empty repeat this process
  - iterate through the input_arr and get each word
    - select any word that has the char from the first index of the input_arr
  - append this selection to anagram_arr
  - access the input_arr and delete any word that is included in anagram_arr at the current sequence in the times method
  - end
  - sort anagram_arr by first sorting by it's size and then if there are equal size arrs then sort by it's initial sequence in the input arr

C: Code with intent
=end

def group_anagrams(arr)
  anagram_arr = []
  until arr.size == 0
    group = arr.select {|word| word if  word.chars.all? {|char| arr[0].include?(char)}}
    anagram_arr << group
    arr.reject! {|word| word if  group.include?(word)}
  end

  anagram_arr.sort_by { |arr| [-arr.size, arr.each_with_index.min] }
end

 group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]) == [["eat","tea","ate"],["tan","nat"],["bat"]]
 group_anagrams([""]) == [[""]]
 group_anagrams(["a"]) == [["a"]]
 group_anagrams(["abc", "def", "efg", "cba"]) == [["abc","cba"],["def"],["efg"]]
 group_anagrams(["bat","eat", "tea", "tan", "ate", "nat" ]) == [["eat","tea","ate"],["tan","nat"],["bat"]]
