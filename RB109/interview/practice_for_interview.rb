# test question from study session
=begin
Given two arrays of strings a1 and a2 return a sorted array r in alphabetical order of the strings of a1 which are substrings of strings of a2.

rrays are written in "general" notation. See "Your Test Cases" for examples in your language.

In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.

Beware: r must be without duplicates.
Don't mutate the inputs.


P. Understand the Problem
  Explicit Requirements:
  - input is two arrays of strings. the first array is desginated a1. the second string is designated a2.
  - output is a sorted array in alphabetical order of the strings of a1 that are substrings of a2.


  Implicit Requirements:
  - if there are no string from a1 that are substring of a2 then return an empty array

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  #Example 1: a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

#Example 2: a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []



D: Data Structures
  - input: two arrays of string
  - output: array that contains the string from a1 that are apart of the substring from a2.
  - possible intermediary structure:


A: Algorithm
 def substrings(a1, a2)

  -  initialize a2_substring to get_substr(a2)
  - iterate through a1 and assign local parameter element
    - if a2_substring contains element  then return a new array that is sorted alphabetically
end

def a_2 substring(arr)
  - iniitalize substr_arr to an empty arr
  - iterate through a range from 0 to the size of the string that the counter is set to  non inclusive and assign parameter elem
  -   iteerate through a range from elem to the size of the string the counter is set to  inclusive and assign parmater inner_elem
      - append to substr_arr each value from a range of elem to inner_elem inclusive
      - end inner block
    - end outer block
    - end times method
  - return substr_arr
end

C: Code with intent


=end

def a_2_substring(arr)
  substr_arr = []
  counter = 0
  arr.size.times do
 (0...arr[counter].size).each do |elem|
  (elem..arr[counter].size).each do |inner_elem|
    substr_arr << arr[counter][elem..inner_elem]
  end
 end
 counter += 1
end
   substr_arr
end

def substrings(a1, a2)
    a2_substring = a_2_substring(a2)
  a1.select {|word|  a2_substring.include?(word)}.sort
end


a_2_substring(["lively", "alive", "harp", "sharp", "armstrong"])

 substrings(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
 substrings(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []
  substrings(["delta", "gamma", "alpha", "beta"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == ["alpha", "beta", "gamma"]
   substrings(["albe", "negam"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == []


=begin

P. Understand the Problem
  Explicit Requirements:
  - has an input of two strings
  - returns a boolean value considering whether str1 can be rearranged to match str2
  - do not worry about non lower case characters.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - str1 can have more characters than str2 it simply must contain all of the characters from str2

E: Examples/ Edge Cases


D: Data Structures
  - input: is two string values
  - output: the boolean value true or false regarding whether the letters from str1 can be rearranged to match str2
  - possible intermediary structure:


A: Algorithm
  def initialize_hash
    initialize letter_hash from 'a- 'Z' as the keys and all values to 0
  end

  def scramble(str1, str2)
    - initialize str_hash to the result of invoking initialize_hash
    - iterate through each string value of str2  and assign parameter elem
      -  inrcrement each value at str_hash[elem] by 1
    - iterate through each string value of str1 and assign parameter elem
      - increment each value at str_hash[elem] by 1
    - iterate through str_2 oncemore and return true if all values are greater or equal than 2, false otherwise
  end

C: Code with intent

Complete the function scramble(str1, str2) that returns true if a
portion of str1 characters can be rearranged to match str2, otherwise
returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits
will be included.

=end

def initialize_num_hash
  hash = {}
   ('a'..'z').to_a.each {|char| hash[char] = 0}
   hash
end

def scramble(str1, str2)
 str_hash = initialize_num_hash
 str2.each_char {|elem| str_hash[elem] += 1}
 str1.each_char {|elem|str_hash[elem] += 1}
 str2.each_char.all? {|k|  str_hash[k] >= 2}
end

 scramble('rkqodlw', 'world')== true
 scramble('cedewaraaossoqqyt', 'codewars') == true
 scramble('katas', 'steak') == false



=begin
Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:

P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is a hash that groupts the number of times each character appears in the string sorted by the highest number of occurences
  -  the key will be the number of occurences and the value shall be the characters grouped by

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input:
  - output:
  - possible intermediary structure:


A: Algorithm


C: Code with intent


get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.
=end
#p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
#p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
#p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
#p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
#p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}


=begin
Create a method that takes a positive integer and returns a new integer that is the next biggest number but has the same digits as the original input. If there is no biger digit
that can be found then return -1

P. Understand the Problem
  Explicit Requirements:
  - input is a positive integer
  - output is the next  integer that is larger than the input using the same digits
  - if there is no larger number with the same digits return -1

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
    larger_digits(12) => 21
    larger digits(717) => 771
    larger digits(513) => 531
    larger digits(777) => -1

D: Data Structures
  - input: integer
  - output: integer that represents the next largest number from the input using the same digits
  - possible intermediary structure: an array to sort the digits from largest to smallest


A: Algorithm
 def larger_digits(int)
  -  initialize largest_number to the result of determine_if_largest_number_with_digits
  - initialize next_num to int + 1
  - initialize int_arr which will contain all string digits
  - initialize next_num_arr which will contain all string digits
  - if largest_number
    - until next_num_arr includes all digits of int_arr and int_arr includes all of the digits of next_num_arr
      - increment next_num by 1
      - reassign next_num_arr to contain all the string digits of the new value
  -else
    - return -1
    - end loop
  - return next_num

 end

 def determine_if_largest_number_with_digits(int)
    - initialize greatest_digit_result to the result of converting int into string within an array and then compare each digit. move all greater digits to the front.
      join these values together and convert into integers. If  greatest_digit_value does not equal int then return true. else false
 end

C: Code with intent


=end

def determine_if_largest_number_with_digits(int)
greatest_digit_value =  int.to_s.chars.sort {|less, greater| greater.to_i <=> less.to_i}.join.to_i
 greatest_digit_value != int ? true : false
end

def larger_digits(int)
  largest_digits = determine_if_largest_number_with_digits(int)
  next_num = int + 1
  int_arr = int.to_s.chars
  next_num_arr = next_num.to_s.chars

  if largest_digits
    until next_num_arr.all? {|char| int_arr.include?(char)} && int_arr.all? {|char| next_num_arr.include?(char)}
        next_num += 1
        next_num_arr = next_num.to_s.chars
    end
  else
    return -1
  end
  next_num
end

   larger_digits(12) == 21
   larger_digits(717) == 771
   larger_digits(513) == 531
   larger_digits(777) == -1
   larger_digits(123456789)  == 123456798
   larger_digits(2017)
   larger_digits(9)


=begin

the maxium sum subarray problem consists in finding the maximum sum of a contingous subsequence in an array of integers.
Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the entire array. If the array is only made up of negative numbers then
return 0 instead.
Empty array is considered to have 0 as the greatest sum. An empty array is also a valid array

Maxsequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
should be 6 : [4, -1, 2, 1]


P. Understand the Problem
  Explicit Requirements:
  - input is an array that will either contain integers or be empty
  - output is the maximum contingous subsequence (which means numbers in a row in the order given) sum. For example in the first example the contingous subsequence in
    max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) is 6 because the max sum of any contingous subsequence in this array is a result of [4, -1, 2, 1, ] which results in 6

  Implicit Requirements:
  - if an array is empty then return 0

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  max_sequence([]) == 0
  max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
  max_sequence([11]) == 11
  max_sequence([-32]) == 0
  max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

D: Data Structures
  - input: array
  - output:integer representing the highest sum of all possible contingous subsequences in the array
  - possible intermediary structure: an array can be used to get the sum of each subsequences and a range can be used to split each subsequence up from the array


A: Algorithm
def max_seqquence(arr)
  - initialize substr to the result of get_all_substr(arr)
  - if the size of the arr is empty or only contains elements under less than or equal to 0 then return 0
  - iterate through substr and get the sum of each subarray.
    - of those sums  remove all nil values and return the maximum value.
end

def get_all_substr(arr)
  -initialize substr_arr to an empty arr
  -iterate through a range starting from 0 to the size of the arr non inclusive and assign the block parameter elem
    - iterate through a range from elem to the size of the arr inclusive and assign the block parameter inner_elem
      - append to substr_arr the result of slicing between each element from elem to inner_elem
      -end inner loop
    - end outer loop
  - return substr_arr
end

C: Code with intent


=end



def max_sequence(arr)
substr = get_all_substr(arr)
 arr.empty? || arr.all? {|num| num < 0} ? 0 : substr.map {|num| num.reduce(:+)}.compact.max
end

def get_all_substr(arr)
  substr_arr = []
 (0...arr.size).each do |elem|
  (elem..arr.size).each do |inner_elem|
    substr_arr << arr[elem, inner_elem]
  end
 end
  substr_arr.each
end

 max_sequence([]) == 0
 max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
 max_sequence([11]) == 11
 max_sequence([-32]) == 0
 max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12


=begin

Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.



p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'

P. Understand the Problem
  Explicit Requirements:
  - input is an array containing string objects
  - output is a new string comprised of the index of the letter of each words at it's position in the original array.
  e.g. nth_char(['no', 'oh]) index 0 of the first word is 'n' which will be added to the new string and then index 2 of the second word is 'h' which will be appended to make 'nh'

  Implicit Requirements:
  - special characters like '-' does not start a new word.
  - if its is empty return an empty array

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p nth_char(['yoda', 'best', 'has']) == 'yes'
  p nth_char([]) == ''
  p nth_char(['X-ray']) == 'X'
  p  nth_char(['No', 'No']) == 'No'
  p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'


D: Data Structures
  - input: array
  - output: string
  - possible intermediary structure: array to get the specific index that you need


A: Algorithm
def nth_char(arr)
  - initialize sequence_amount to arr.size
  - initialize index_position to 0
  - initialize nth_word to an empty string
  - iterate sequence_amount times and assign parameter `n`
    - set n to index_position
    -  add arr[n][n] to nth word
    - increment index_position by 1
end

C: Code with intent
=end

#def nth_char(arr)
  # sequence_amount = arr.size
  # index_position = 0
  #nth_word = ''
  #arr.size.times do |n|
   #  nth_word +=  arr[n][n]
  #end
 #  nth_word
#end

   #nth_char(['yoda', 'best', 'has']) == 'yes'
   #nth_char([]) == ''
   #nth_char(['X-ray']) == 'X'
   #nth_char(['No', 'No']) == 'No'
   #nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'



=begin
   In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string
  in an array where an uppercase letter is a person standing up.

# Rules

 1.  The input string will always be lower case but maybe empty.
 2.  If the character in the string is whitespace then pass over it as if it was an empty seat


P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is the given input in an array where an uppercase letter is a person standing up

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - modify? do not modify?

E: Examples/ Edge Cases
  wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

D: Data Structures
  - input: string
  - output: is a array containing the original string but each word is capitalized at the next index starting at 0, then 1, then 2, etc
  - possible intermediary structure:


A: Algorithm
def wave(str)
  - iterate over a range from 0 to the size of str - 1  and assign local block parameter i
  - witin the iteration if the value at str being accessed with i is not equal to empty string then
  - add together the result of slicing str at index 0 all the way to the value of i, the result of str accessing the index at i being uppercased and the result of slicing str
    from the index position of i + 1 all the way to the last index position. remove all nil elements from the array and return the array

  -
end


wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

=end

def wave(str)
 (0..str.length-1).map{|i|  str[0...i] + str[i].upcase + str[i+1..-1] if str[i] != " "}.compact
end



# initialize_hash('hello')

 wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
 wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
 wave("") == []
 wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
 wave(" gap ") == [" Gap ", " gAp ", " gaP "]





#RB Advanced PEDAC!

# Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.
=begin
I: arr of n ints, int
O: length
A:
see if original array has num >= int
see if arrays of length 2 has sum >= int
  -iterate over arr and make subarrays of length 2 starting with each index
continue increasing arr length until length = arr.size
if not found, return 0
=end

 #subarrays([],2)
 #minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
 #minSubLength([1, 10, 5, 2, 7], 9) == 1
 #minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
 #minSubLength([1, 2, 4], 8) == 0



=begin
ou are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

P:
  input: array
  output: integer
E:
  [1, 2, 5, 6, 5, 2]  -->  2
  ...because there are 2 pairs: 2 and 5

  [1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
  ...because there are 4 pairs: 2, 20, 6 and 2 (again)
A:

    -
=end


def pairs(arr)
  arr.map {|num| arr.count(num)}.select {|value| value > 1}.size/2
end

 pairs([1, 2, 5, 6, 5, 2])
 pairs( [1, 2, 2, 20, 6, 20, 2, 6, 2] )
 pairs([1, 3, 4, 5, 1])




=begin
31. Anagram Detection
(https://www.codewars.com/kata/529eef7a9194e0cbc1000255)
7 kyu
An anagram is the result of rearranging the letters of a word to produce a new word (see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.

P. Understand the Problem
  Explicit Requirements:
  - input is two separate string values.
  - output is a boolean value
  - anagrams in this case are case insensitive
  - return true if the two string arguments are anagrams of one another
  - return false othwerwise.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - anagram is when one word can have its letters rearranged into another word

E: Examples/ Edge Cases
  "foefet" is an anagram of "toffee"

  "Buckethead" is an anagram of "DeathCubeK"

D: Data Structures
  - input: two string
  - output: boolean value that shows whether it is true that the two input values are anagrams of one another.
  - possible intermediary structure: Hash to create keys of each lowercase letter  and each to have a value of 0


A: Algorithm
 - create  a hash that has each lowercase letter for a key and a value of 0 for each key
 - for each key that is in each argument increment the value by 1
 - after both have been incremented then the value of argument 1 or argument 2 should all be greater or equal to the value of 2
 - if an element is not lowercase then convert it to be so

C: Code with intent

=end
def initialize_hash
  hash = {}
  ('a'..'z').each {|char| hash[char] = 0}
  hash
  end

  def is_anagram(str1, str2)
    str_hash = initialize_hash
    str1.each_char {|char| str_hash[char.downcase] += 1 }
    str2.each_char {|char| str_hash[char.downcase] += 1}
    str2.split('').all? {|k|  str_hash[k.downcase] >= 2 }
  end

   # is_anagram('Creative', 'Reactive') #== true
  #p  is_anagram("foefet", "toffee") == true
   #p is_anagram("Buckethead", "DeathCubeK") == true



=begin
(https://www.codewars.com/kata/5842df8ccbd22792a4000245)
6 kyu
Write Number in Expanded Form
You will be given a number and you will need to return it as a string in Expanded Form. For example:
expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
NOTE: All numbers will be whole numbers greater than 0.
If you liked this kata, check out part 2!!

P. Understand the Problem
  Explicit Requirements:
  - input is an integer
  - output is string that shows  at each ten place have the integer value followed by the subsequent amount of 0s (or none if not neccessary) then do  this for each place and add the integer values
  - all numbers are greater than 0

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
    expanded_form(12); # Should return '10 + 2'
    expanded_form(42); # Should return '40 + 2'

D: Data Structures
  - input: input integer
  - output: string being added together that represents each digit followed by the subsequent 0s at that place and then add them
  - possible intermediary structure:


A: Algorithm
    - convert integer into str and break up into individual characters
    - iterate through that str and assign parameter char
      -  with each char we will return that char joined together with the amount of 0s from index to index
      - end iteration
    - add the + sign between each character of the returned arr and join the elements together

C: Code with intent




=end

def expanded_form(int)
 int.to_s.chars.each_with_index do |char, i|
   int.to_s.chars[i..-1]
  end
end
 expanded_form(12) #== '10 + 2'
# expanded_form(42) == '40 + 2'
# expanded_form(70304) == '70000 + 300 + 4'


=begin
# Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.
=begin


P. Understand the Problem
  Explicit Requirements:
  - input is an array of n positive numbers and a positive integer
  - find the minimal length of a contigouos subarray for which the sum is greater or = to the integer

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - a contingous subsequence means no digits can be rearranged and are
  - in the order that is given

E: Examples/ Edge Cases


D: Data Structures
  - input: an array and an integer
  - output: an integer that represents the smallest contingous subsequence of numbers that is >= to the input integer
  - possible intermediary structure: an array to gather all subsequences, an array to select all subsequences that are greater or equal to the input integer, and an array to pick the smallest of those values.


A: Algorithm
  - get all substring from the input array
  - take that substring and then select all subarray that their sums combine to be >= to the input integer
  - if a value from that substring is empty then do not compare
  - then select the array  that is the smallest in size  that fulfills the >= condition.
  - then return the size of that arr

C: Code with intent

=end


def get_substr(arr)
  substr = []
    (0...arr.size).each do |elem|
      (elem..arr.size).each do |inner_elem|
        substr << arr[elem..inner_elem]
      end
    end
      substr
end

def minSubLength(arr, int)
  smallest_size  = []
  substr_arr = get_substr(arr)
  selected_sub_arrays =  []
  selected_arr_size = []
  selected_sub_arrays = substr_arr.select do |sub_arr|
        sub_arr.reduce(:+) >= int if !sub_arr.empty?
      end
  selected_arr_size =  selected_sub_arrays.map {|arr|   arr.size}
  selected_arr_size.empty? ? 0 : selected_arr_size.min
end



   minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
   minSubLength([1, 10, 5, 2, 7], 9) == 1
   minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
   minSubLength([1, 2, 4], 8) == 0




=begin
Write a method to find the longest common prefix string amongst an array of string
If there is no common prefix then return an empty string ' '
all given inputs are in lowercase letters

P. Understand the Problem
  Explicit Requirements:
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  common_prefix(['flower', 'flow', 'flight']) == 'fl'
  common_prefix(['dog', 'racecar', 'car']) == ''
  common_prefix(['interspecies', 'interstellar', 'interstate' ]) == 'inter'
  common_prefix(['throne', 'dungeon']) == ''
  common_prefix(['throne', 'throne']) == 'throne

D: Data Structures
  - input: array that contains string words
  - output: string that represents the prefix that each string array begin with
  - possible intermediary structure: an array to transform array elements into the str prefix that each string from the array share


A: Algorithm
def common_prefix(arr)
  create a variable for a word named first_word and initialize to the first word of the array
  create a variable prefix_letters to which you will store each letter that all words start with
  - the size of the first index within first word times iterate with the parameter n
    - compare each first character of all words to see if they each start with the same letters from the first word. Store each letter that is the same starting at each contingous
    index. Then halt when the first index is not shared between all three
    - join together prefix_letters and return that value
C: Code with intent




=end

def common_prefix(arr)
prefix_letters = []
  first_word = arr[0]
  counter = 0

    1.upto(arr[0].size) do |n|
   arr.all? {|word|  first_word.start_with?(word[0..counter])} ? prefix_letters << arr[0][counter] : arr
    prefix_letters.join
  counter += 1
    end
 prefix_letters.join
end


 common_prefix(['flower', 'flow', 'fliwt']) == 'fl'
 common_prefix(['dog', 'racecar', 'car']) == ''
 common_prefix(['interspecies', 'interstellar', 'interstate' ]) == 'inters'
 common_prefix(['throne', 'dungeon']) == ''
 common_prefix(['throne', 'throne']) == 'throne'


=begin
Given 2 strings your job is ot find out if there is a substring that appears in both strings. You will return true if
you find a substring that appaears in both strings, or false if you do not. Only worry about substrings that are larger
than one letter long

P. Understand the Problem
  Explicit Requirements:
  - input is two string
  - output is a boolean value
  - return true is there is a substring that appears in both input string
  - return false otherwise
  - discard substring less than 2 in size

  Implicit Requirements:
  - if substring is different case they are considered still true so either downcase all or upcase all

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  substring_test('Something', 'Fun') == false
  substring_test('Something', 'Home') == true
  substring_test('Something', '') == false
  substring_test('BANANA', 'banana') == true
  substring_test('1234567', '541265') == true
  substring_test('supercalifragiliscexpialidocious', SoundOfItIsAtrocuou') == true


D: Data Structures
  - input: two string
  - output: boolean that represents whether or not both string contains at least one substring that are the same or not
  - possible intermediary structure: an array to compare the substring of one str to all of the str in the other's substring.


A: Algorithm
    - initialize substr_one and substr_two that each contain all substring for the given input strings over 1 in size
    - iterate through substr_one and then check to see if substr_two contains one any string that is the same. If so return true
    - if not return false

C: Code with intent




=end
def substr_greater_than_one_in_size(str)
  substr = []
  (0...str.size).each do |elem|
    (elem..str.size).each do |inner_elem|
      inner_elem = inner_elem - elem + 1
      substr << str[elem,inner_elem].downcase
    end
  end
   substr.select {|str| str.size >= 2 }
end



def substring_test(str1, str2)
  substr_one,substr_two = substr_greater_than_one_in_size(str1), substr_greater_than_one_in_size(str2)
   substr_one.any? {|str| substr_two.include?(str) }
end

   substring_test('Something', 'Fun') == false
   substring_test('Something', 'Home') == true
   substring_test('Something', '') == false
   substring_test('BANANA', 'banana') == true
   substring_test('1234567', '541265') == true
   substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
   substring_test('', '') == false

=begin

Write a function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2
. Otherwise return false. Only lowercase letters can be used. No punctuation or digits will be included.

scramble('javaass', 'jjss'') == false
scramble('rkqodlw', 'world') == true
scramble('cedewaraaossoqqyt', 'codewars') == true
scramble('katas', 'steak') == false

P. Understand the Problem
  Explicit Requirements:
  - input is two string
  - output is a boolean
  - return true if any part of str1 can be rearranged to match str2
  - return false if any part cannot be rearranged to match str2
  - only lowercase letters are used
   - no punctuation or digits are required.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases

  scramble('javaass', 'jjss'') == false
  scramble('rkqodlw', 'world') == true
  scramble('cedewaraaossoqqyt', 'codewars') == true
  scramble('katas', 'steak') == false


D: Data Structures
  - input: two string
  - output: boolean that is dependant upon whether any part of str1 can be rearranged to be str2
  - possible intermediary structure: an array to see whether or not all elements of str2 are included in str1


A: Algorithm
  - get all values from str1 that is contained in str2
  - when those values are equal in size to that str2 split into an array
  - then compare them both using sort and return true when they are equal and false otherwise
  - when the values from str1 that are contained in str2 are >= then the values in all of str2
  - then return true and false otherwise


=end

def scramble(str1, str2)
  str2_arr = str2.chars
  contained_in_both = str1.split('').select {|char|  char if str2.split("").include?(char)}

  if  contained_in_both.size == str2_arr.size
    contained_in_both.sort == str2_arr.sort ? true : false
  else
    contained_in_both.size >= str2_arr.size ? true : false
  end
end

  #p scramble('javaass', 'jjss') == false
  #p scramble('rkqodlw', 'world') == true
  #p scramble('cedewaraaossoqqyt', 'codewars') == true
  #p scramble('katas', 'steak') == false


  # Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.
=begin
P. Understand the Problem

  Explicit Requirements:
  - input is a string of words
  - output is a single string
  - we need to find the highest scoring word.
  - the score is connected to the position of each of it's letters in the alphabet
  - e.g. 'abc' would be 1 + 2 + 3 as a total of 6. Compare each word for the maximum score
  - all letters will be lowercase and all inputs are valid.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p alphabet_score('man i need a taxi up to ubud') == 'taxi'
  p alphabet_score('what time are we climbing up the volcano') == 'volcano'
  p alphabet_score('take me to semynak') == 'semynak'
  p alphabet_score('aa b') == 'aa'

D: Data Structures
  - input: string of word
  - output: string that is a word that represents the word with the highest score
  - possible intermediary structure: possibly a hash with each key as each letter of the alphabet. and each value as the posiiton in the alphabet


A: Algorithm
  - separate each word from the string by spaces
  - each letter is worth an integer value based on its place in the alphabet
  - assign each letter that integer value based on that place in the alphabet
  - separate each letter of each word and convert each letter into its alphabet place integer value
  - combine the array containg all original words and the array that contains all intger values
  - iterate through the combination and select the word which contains the highest value
  - if two words have the same score then pick the first word
=end

def initialize_hash
  letter_arr = ("a"..'z')
  letter_hash = {}
  letter_arr.each_with_index{|l, i| letter_hash[l] = i + 1 }
  letter_hash
end

def get_all_words_with_scores(str)
  letter_hash = initialize_hash
  word_arr = str.split(" ")
  word_scores = word_arr.map {|word|word.each_char.map {|letter| letter = letter_hash[letter]}.reduce(:+)}
  word_and_scores = word_arr.zip(word_scores).to_h
end

def alphabet_score(str)
  word_and_scores = get_all_words_with_scores(str)
  max_value =  word_and_scores.values.max
  word_and_scores.select {|k| word_and_scores[k] == max_value}.keys.first
 end





  alphabet_score('man i need a taxi up to ubud') == 'taxi'
  alphabet_score('what time are we climbing up the volcano') == 'volcano'
  alphabet_score('take me to semynak') == 'semynak'
  alphabet_score('aa b') == 'aa'



=begin
find the lenght o fthe longest substring in the given string that is the same in reverse

As an example if the input was 'I like racecars that go fast' the substring (racecar) length would be 7
If the length of the input string is 0. then return 0


P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is an integer
  - find the longest possible substring that is a palindrome (same in both normal order and in reverse)
  - if the length is 0 then return 0
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  longest_palindrome('a') == 1
  longest_palindrome('aa') == 2
  longest_palindrome('baa') == 2
  longest_palindrome('aab') == 2
  longest_palindrome('baabcd') == 4
  longest_palindrome('baablkj1234532133d') == 9


D: Data Structures
  - input: string
  - output: integer that represents the longest palindrome substring from input
  - possible intermediary structure: an array for all palindromic substring, and then to choose the largest in size


A: Algorithm
    - get all substring from the input str
    - filter out all substring that are not palindromic
    - choose the size of the largest palindromic substring and return that amount
    - if the size is 0 then return 0
C: Code with intent


=end

def get_all_substr(str)
  substr = []
 (0...str.size).each do |elem|
  (elem..str.size).each do |inner_elem|
    substr << str[elem..inner_elem]
  end
 end
   substr
end

def get_palindrome_substring(str)
  substr = get_all_substr(str)
  substr.select {|char| char == char.reverse}
end

def longest_palindrome(str)

  palindrome_substr = get_palindrome_substring(str)
  str.size != 0 ? palindrome_substr.map {|char| char.size}.max : 0
end

 p longest_palindrome('a') == 1
 p longest_palindrome('aa') == 2
 p longest_palindrome('baa') == 2
 p longest_palindrome('aab') == 2
 p longest_palindrome('baabcd') == 4
 p longest_palindrome('baablkj12345432133d') == 9
 p longest_palindrome('') == 0
