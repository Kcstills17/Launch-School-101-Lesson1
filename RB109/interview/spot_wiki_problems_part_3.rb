
=begin

27. Exponent method
(https://www.codewars.com/kata/5251f63bdc71af49250002d8)
5 kyu
Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second.
 Return nil if the second argument is negative.

Note: The ** operator has been disabled.

P. Understand the Problem
  Explicit Requirements:
  - input is  two integers
  - output is an integer
  - goal is to take the first integer and then multiply itself by the power of the second integer
  - you cannot use the ** operator
  - if the second argument is negative then return nil

  Implicit Requirements:
  - return 1 if the second argument is 1

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p power(2, 3) == 8
  p power(10, 0) == 1
  p power(-5, 3) == -125
  p power(-4, 2) == 16

D: Data Structures
  - input: integer
  - output: integer
  - possible intermediary structure: an array to store the first integer  as many times as the second integer


A: Algorithm
    - return nil if int2  is < 0
    - return 1 if int2 == 0
    - initialize square_amount to an empty array
    - as many times as int2 append int1 to empty array
    - take the total of multiplying all digits together and return that value

C: Code with intent
=end

def power(int1, int2)
  return nil if int2 < 0
  return 1 if int2 == 0
  square_amount = []
  1.upto(int2) {|n| square_amount << int1 }
  square_amount.reduce(:*)
end

 power(2, 3) == 8
 power(10, 0) == 1
 power(-5, 3) == -125
 power(-4, 2) == 16
 power(10, 0) == 1
 power(2, 3) == 8
 power(3, 2) == 9
 power(-5, 3) == -125
 power(-4, 2) == 16
 power(8, -2) == nil






=begin
28. Where my anagrams at?
(https://www.codewars.com/kata/523a86aa4230ebb5420001e1)
5 kyu
What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false

'abba' & 'abca' == false
Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:
P. Understand the Problem
  Explicit Requirements:
  - input is a str and an array
  - output is each word within the array that is an anagram of the input str
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - an anagram are two words that share the exact same letters or content

E: Examples/ Edge Cases
p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []


D: Data Structures
  - input: string and an array
  - output: array containing the string that are anagrams of the input str
  - possible intermediary structure: array to check each word of the array to the input str


A: Algorithm
 goal is to get all anagrams of str from the array
-  iterate through the array
- and compare each word sorted is equal to the input str sorted
- if so select those words onto a new array. if not leave alone

C: Code with intent






=end

def anagrams(str, arr)
  arr.select {|word| word if word.chars.sort == str.chars.sort }
 end

  anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
  anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
  anagrams('laser', ['lazing', 'lazy',  'lacer']) == []



=begin


29. Split Strings
(https://www.codewars.com/kata/515de9ae9dcfc28eb6000001)
6 kyu
Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace
the missing second character of the final pair with an underscore ('_').
P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is an array  with all characters from the input string broken up into groups of two
  - if the input str is odd in size then add a '_' to the last character in the str
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: array
  - possible intermediary structure: a new array to split the specific characters into groups of two


A: Algorithm
- check if the input str size is even or odd
- if odd append a '_' to the end of the word
- if even leave alone
- convert the input str into an array of individual characters
- then iterate through that array and slice them apart by each two characters.
- initialize paired_arr as a result of the array containing sub_arrays of split pair of characters
- iterate through paired_arr and join each array together so that each character is together within each array
- return this result

C: Code with intent




=end
def solution(str)
   str.size.even? ?  str : str << '_'
  paired_arr = str.chars.each_slice(2).map {|a| a}
  paired_arr.map {|arr|  arr.join}
end


 solution('abc') == ['ab', 'c_']
 solution('abcdef') == ['ab', 'cd', 'ef']
 solution("abcdef") == ["ab", "cd", "ef"]
 solution("abcdefg") == ["ab", "cd", "ef", "g_"]
 solution("") == []







=begin
  30. Anagram difference

 Given two words, how many letters do you have to remove from them to make them anagrams?

   Example
 First word : c od e w ar s (4 letters removed)
 Second word : ha c k er r a nk (6 letters removed)
 Result : 10

 Hints
 A word is an anagram of another word if they have the same letters (usually in a different order).
 Do not worry about case. All inputs will be lowercase.
 P. Understand the Problem
   Explicit Requirements:
   - two strings
   - output is an integer that represents how many characters must be removed from the larger str for both to be anagrams of another

   Implicit Requirements:
   - if they are already anagrams then the output shall be 0
   - if neither str share any of the same characters then remove all characters until both are empty str

   Clarifications/ Questions:
   -

 E: Examples/ Edge Cases


 D: Data Structures
   - input: two string
   - output: integer
   - possible intermediary structure: possible arrays


 A: Algorithm
  - initialize total_str_size as the result of str1 + str2
  - if it is 1 then return 1 and if it is 0 return 0
  - if the size of str1 is the same as str2 then sort both return 0 if they are the same
  - else if they are the same size is not equal sorted then
   - then select from each str the characters that the other str does not have. then add the size of the result of both new str and return that value
   - if both str contain letters but are not of the same size then
     - sort both str by their sizes. and get the largest str
     -  iterate through the larger string and select all str that does not occur in the smaller str. return the size of this new array
   - else if both str sizes are different but both greater than 1
   - iterate through both str and check if the opposite string contains each character. add together the sizes of each new array and return that value
 C: Code with intent




=end

 def when_str_are_not_the_same_sorted(str1, str2)
   neither_contain_str_one = str1.chars.select {|l| !str2.include?(l)}
   neither_contain_str_two = str2.chars.select {|l| !str1.include?(l)}
   neither_contain_str_one.zip(neither_contain_str_two).flatten.size
 end

 def when_both_have_str_and_one_is_size_one(str1, str2)
   contain_arr = []
   contain_arr << str1 && contain_arr << str2
   largest_str = contain_arr.max {|a, b| a.size <=> b.size}
   smallest_str = contain_arr.min {|a, b| a.size <=> b.size}
   largest_str.size - smallest_str.size
 end

 def both_have_str_and_over_size_one(str1, str2)
  modified_str_one = str1.chars.select {|l| str2.include?(l)}
  modified_str_two = str2.chars.select{|l| str1.include?(l)}
  modified_str_one.size + modified_str_two.size
 end


 def anagram_difference(str1, str2)
 total_str = str1 + str2
 if total_str.size == 0
    0
 elsif total_str.size == 1
    1
 elsif str1.size == str2.size  && str1.chars.sort == str2.chars.sort
    0
 elsif str1.size == str2.size
  when_str_are_not_the_same_sorted(str1, str2)
 elsif  str1.size == 1 || str2.size ==  1
 when_both_have_str_and_one_is_size_one(str1, str2)
 else
   both_have_str_and_over_size_one(str1, str2)
   end
 end




   anagram_difference('', '') == 0  #1
   anagram_difference('a', '') == 1 #1
   anagram_difference('', 'a') == 1 #1
   anagram_difference('ab', 'a') == 1 #2
   anagram_difference('ab', 'ba') == 0 #2
   anagram_difference('ab', 'cd') == 4 # 3
   anagram_difference('aab', 'a') == 2 # 2
   anagram_difference('a', 'aab')  == 2 # 2
   anagram_difference('codewars', 'hackerrank') == 10 # 4




=begin

31. Anagram Detection
(https://www.codewars.com/kata/529eef7a9194e0cbc1000255)
7 kyu
An anagram is the result of rearranging the letters of a word to produce a new word (see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.

Examples
"foefet" is an anagram of "toffee"


P. Understand the Problem
  Explicit Requirements:
  - input is two string
  - outout is a boolean
  - goal is to return true if the two areguments are anagrams of each other and return false otherwise
  - this problem is case insensitive

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram('Creative', 'Reactive') == true




D: Data Structures
  - input: string
  - output: boolean
  - possible intermediary structure: array to sort both input str and compare


A: Algorithm
    - downcase both str and get convert each str into an array containing each letter. sort both arrays and return true if both are the same and false otherwise.
C: Code with intent




"Buckethead" is an anagram of "DeathCubeK"
=end

def is_anagram(str1, str2)
   str1.downcase.chars.sort ==  str2.downcase.chars.sort ? true : false
end

 is_anagram('Creative', 'Reactive') == true
 is_anagram("foefet", "toffee") == true
 is_anagram("Buckethead", "DeathCubeK") == true
 is_anagram("Twoo", "WooT") == true
 is_anagram("dumble", "bumble") == false



=begin
 32. Highest Scoring Word
(https://www.codewars.com/kata/57eb8fcdf670e99d9b000272)
6 kyu
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

P. Understand the Problem
  Explicit Requirements:
  - input is  string
  - output is a string
  - each letter in the string is scored based off of it's position in the alphabet. e.g. (a == 1, b == 2, c == 3, etc )
  - our goal is to get a score from each word in the alphabet from each letter that it has.
  - all letters are lowercase and all inputs are valid
  - if two words score the same return the earliest word in the input string

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
p high('man i need a taxi up to ubud') == 'taxi'



D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: hash to contain the scores of each letter


A: Algorithm
- iniitalize a hash that will have all letters as a key and it's position in the alphabet as it's value
-  convert the input str into an array of words and iterate through that (we need to keep them as word's so we have the number of total numbers to add together correctly later)
- iterate through each word and get each specific character
- check the character with the it's posiiton in the hash and then set the character to be the value of that hash pairing. e.g. ('c' would become 3 )
- once we have our array containing the array of integers add these integers together and initiailze to word_score
- combine the words_array and the words_score into one array  called words_and_scores
- iterate through the words_and_scores array and choose the array that contains the largest integer value. Now within that return the string in the first position index

 break up into chunks
 1st : create letter_and_position hash
 2nd:  execute iterations to get our word_and_scores array
 3rd: choose from words_and_scores array the string that has the largest score
C: Code with intent


=end

def initialize_letter_and_position_hash
  hash = {}
('a'..'z').each_with_index {|l, i| hash[l] = i + 1 }
 hash
end

def get_letter_scores(str)
  letter_position_hash = initialize_letter_and_position_hash
  word_arr = str.split
  word_scores = word_arr.map {|word| word.chars.map {|l| letter_position_hash[l]}}
  words_and_scores = word_arr.zip(word_scores.map {|array|  array.reduce(:+)})
end



def high(str)
 current_score = 0
 all_words_and_scores = get_letter_scores(str)
 all_words_and_scores.max_by {|arr|  arr[1]}[0]
end

 high('what time are we climbing up the volcano') == 'volcano'
 high('take me to semynak') == 'semynak'
 high('aaa b') #== 'aaa'
 high('man i need a taxi up to ubud') == 'taxi'


=begin
 33. Replace With Alphabet Position
(https://www.codewars.com/kata/546f922b54af40e1e90001da)
6 kyu
In this kata you are required to, given a string, replace every letter with its position in the alphabet.

If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)


P. Understand the Problem
  Explicit Requirements:
  - input is  string
  - output is string were each letter of the input is replaced with the digit position of the letter in the alphabet e.g. 'a' -> '1', 'z' -> '26'
  - ignore everthing in the string that is not a number

  Implicit Requirements:
  - space between each string digit character

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
  p alphabet_position("-.-'") == ""



D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: a hash to store each letter as keys and it's position as a value



A: Algorithm
- initialize letter_hash and set its keys to each letter of the alphabet and each value to a string digit that represents it's position
- initialize filtered_str to the result of iterating through each character from the input str and removing all non letters
- iterate through filtered_str and when a letter matches the key of a hash pairing then transform that key into the string digit
- separate each string digit and return the value

C: Code with intent

=end


def initialize_letter_hash
hash = {}
('a'..'z').each_with_index {|l, i | hash[l] = (i + 1).to_s}
 hash
end

def alphabet_position(str)
 letter_hash = initialize_letter_hash
 filtered_arr = str.downcase.chars.select  {|l| l.match(/[a-z]/)  }
 converted_str =  filtered_arr.map {|l| l = letter_hash[l]}.join(" ")
end


  alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
  alphabet_position("-.-'") == ""


=begin
  34. Sherlock on pockets
(https://www.codewars.com/kata/53bb1201392478fefc000746)
6 kyu
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty),
 example:

pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

Write a method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.

P. Understand the Problem
  Explicit Requirements:
  - input which is the object that pockets points to and an array which is the range of values we are checking for suspects
  - pockets is  a hash which contains keys (each possible suspect) and values (the items that each person is allowed )
  -  the second input is used to check our pocket hash


  Implicit Requirements:
  - if the 2nd input is [7] then we check all pairing to see what each key (possible suspect) has.  the value of jane: is [7] she has the exact amount of value in her pocket
    as allowed. Therefore she is not a suspect
  - if we check tom: he has [2, 5] which does not matched the allowed value [7] he is a suspect. same with :bob as he has [1]
  - if the 2nd input is empty  then all keys are suspects as they all have an item
  - if the 2nd input contains all values in the pockets hash then retirn nil as their are no suspects

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]
p find_suspects(pockets, [1, 2]) == [:tom, :jane]



D: Data Structures
  - input: pockets(is a hash) and an array
  - output: array if there are any suspects and nil if there are no suspects
  - possible intermediary structure: an array to check if any values from pockets include the values from the input arr


A: Algorithm
- initialize suspects to an empty array
- rules
- return key if the value of the key
    - does not include any of the values in  the input arr or it includes any values that are not apart of the input arr
- return nil if
    - the value of each key is has at least 1 value from the input arr and each value does not include any non input arr values

- how to check these conditions
    - initialize suspect_index to an empty array
    - iterate through pockets and get each key and array
    - iterate through each array and get the specific value of our value arrays
    - check each specific value to see if all are included in the input array.
    - the result of this should be an array that will have true as an element if each of it's values were apart of the input arr and false otherwise
    - initialize this result as figured_suspects_bool
    - select the indexes from figured_suspects in which the values are all false and append to suspect_index
    - iterate through the keys of pockets and their index. select the keys in which their index are included in suspect_indexed  and initialize as suspect
    - if figured_suspects_bool is all true then return nil otherwise return suspects
    -
      - then select the arrays

C: Code with intent

=end

pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

def find_suspects(pockets, arr)
  suspect_index = []
  figured_suspects_bool =  pockets.map {|k, array|  array.all? {|v|  arr.include?(v)}}
  figured_suspects_bool.each.with_index {|bool, i| suspect_index <<  i if bool == false }
  suspects =  pockets.keys.select.with_index {|name, i| name if suspect_index.include?(i)}
  figured_suspects_bool.all?{|bool| bool == true } ? nil : suspects
end

 #p find_suspects(pockets, [1, 2]) == [:tom, :jane]
 #p  find_suspects(pockets, [1, 7, 5, 2]) == nil
 #p find_suspects(pockets, []) == [:bob, :tom, :jane]
 #p find_suspects(pockets, [7]) == [:bob, :tom]


=begin
 35. Mexican Wave
(https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby)
6 kyu

In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string
in an array where an uppercase letter is a person standing up.
Rules
 	1.  The input string will always be lower case but maybe empty.
2.  If the character in the string is whitespace then pass over it as if it was an empty seat.

P. Understand the Problem
  Explicit Requirements:
  - input is string.
  - output is an array which each element of the array will be the same input string but will be capitalized at the index position in the string as it's position in the array
  - if there is a space pass it over as if it was not there
  Implicit Requirements:


  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
wave("") == []
wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
wave(" gap ") == [" Gap ", " gAp ", " gaP "]
wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]



D: Data Structures
  - input: string
  - output: array
  - possible intermediary structure:


A: Algorithm
 - initialize an empty array mexican_wave
 - iterate through the input str and get each char  and the index
 - to account for whitespace we will skip if char is == to ' '
 - initialize current_wave to first be the characters from the starting index to the last index. Add this to an uppercased version of the character at the current index
 - now we will have an extra lowercase letter that we do not want so we will add what we have to a range from the next character at the current index + 1 to the last character
   in the str
  - append these values to mexican_wave until the iteration has finished.
  - rid mexican_wave of any nil values
  - return mexican_wave
 - append

C: Code with intent




=end

def wave(str)
  mexican_wave = []
  str.chars.each_with_index do |char, i|
    current_wave = str[0...i] + char.upcase + str[i+1..-1] if char != ' '
    mexican_wave << current_wave
  end
   mexican_wave.compact
end

 wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
  wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
  wave("") == []
  wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
  wave(" gap ") == [" Gap ", " gAp ", " gaP "]




=begin

  36. Delete a Digit
(https://www.codewars.com/kata/5894318275f2c75695000146/train/ruby)
6 kyu
Task
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

Example
For n = 152, the output should be 52;

For n = 1001, the output should be 101.

Input/Output
[input] integer n

Constraints: 10 ≤ n ≤ 1000000.

P. Understand the Problem
  Explicit Requirements:
  - input is an integer
  - output is an integer
  - goal is to find the maximum possible number when deleting only one exact digit
  - constraints is n must be less than or equal to 10 and n must be less than or  equal to 0ne hundred thousand

  Implicit Requirements:
  - no rearranging of digits necessary

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: integer
  - output: integer
  - possible intermediary structure: an array to compare all possible digit combinations with 1 digit removed


A: Algorithm
- initialize array_digits to  contain the result of converting the input int into str and then breaking them apart individually
- iterate through these digits and get every possible combination that is the size of array_digits - 1
- join the results together and convert each back into integer.
- append each to an array and then get the maximum value out of these integer values
- return that value

C: Code with intent




[output] an integer
=end

def delete_digit(int)
  array_digits = int.to_s.chars
  all_combinations = []
  array_digits.combination(array_digits.size - 1) {|digit| all_combinations <<  digit.join.to_i}
  all_combinations.max
end


 delete_digit(152) == 52
 delete_digit(1001) == 101
 delete_digit(10) == 1


=begin
 37. Multiples of 3 or 5
(https://www.codewars.com/kata/514b92a657cdc65150000006/train/ruby)
6 kyu
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once.

P. Understand the Problem
  Explicit Requirements:
  - input is an integer
  - output is an integer
  - goal is to take the input integer and check all the natural numbers upto but not including the input integer and get all numbers that are multiples of 3 and 5
  - then we add all of those values together
  - if a number is a multiple of both 3 and 5 count it only once

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: integer
  - output: integer
  - possible intermediary structure: an array to check a range of all values from 1 to the input int to see if a multiple of 3 or 5


A: Algorithm
- create an array that consists of a range from 1 to number before the input integer inclusive
-
- iterate through the range array and select all values that are evenly divisible by either 3 or 5
- select the unique values from the chosen integer values and then get the sum of all remaining values.
- return this value

C: Code with intent




=end

def solution(int)
 working_numbers = (1...int)
 working_numbers.select {|num|   num if num % 3 == 0 || num % 5 == 0  }.uniq.reduce(:+)
end

 solution(10) == 23
 solution(20) == 78
 solution(200) == 9168


=begin
 38. String transformer
(https://www.codewars.com/kata/5878520d52628a092f0002d0/train/ruby)
6 kyu
Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.

For example:

"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.


P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is string
  - goal is to transform the input string based on these specifications
    - if it is lower case change to uppercase
    - if it is uppercase change to lowercase
    - reverse the order the words in the str
    - take into account multiple spaces and leading/trail places

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: array to reverse the words placement in the str


A: Algorithm
- initialize reverse_str which is the result of creating an array that contains all elements of the input str reversed and then joining it together by each element
- initialize result_str to this result
      - iterate throuugh  reverse_str and upcase the char if it is lowercase
      - downcase the char if it is uppercase
      - and leave as is if it is anything
C: Code with intent



=end



def transform(str)
  str_arr = str.split
   str
    reverse_str =  str_arr.reverse.join(' ')
  result_str =reverse_str.chars.map  do |char|
  if ('a'..'z').include?(char)
    char.upcase
  elsif ('A'.."Z").include?(char)
    char.downcase
  else
    char
  end
end.join("")
   result_str
end


 #transform('Example string') ==  'STRING eXAMPLE'

=begin

 39. Largest product in a series
 (https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby)
 6 kyu
 Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

 P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is an integer
  - goal is to get the largest product of 5 consecutive integers in the input string
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: integer
  - possible intermediary structure: array to go through each digit from the input str


A: Algorithm
  - get every substring from the input str
  - filter out every substring that is not 5 in size
  - take every specific substring and split into digits
  - convert into integers
  - get the product of every group of digits
  - return the largest diit
C: Code with intent




 For example:

 greatestProduct("123834539327238239583") // should return 3240
 The input string always has more than five digits.
=end


def substring_that_is_five_in_size(str)
  five_size_substring = []
 (0...str.size).each do |elem|
  (elem..str.size).each do |inner_elem|
  five_size_substring << str[elem..inner_elem]
  end
 end
 five_size_substring.select {|digits| digits.size == 5 }
end


def greatest_product(str)
five_substring =  substring_that_is_five_in_size(str)
digit_substring =   five_substring.map {|char|  char.chars.map {|digit| digit.to_i}}
digit_substring.map {|group| group.reduce(:*)}.max
end




  greatest_product("123834539327238239583") == 3240
  greatest_product("395831238345393272382") == 3240
  greatest_product("92494737828244222221111111532909999") == 5292
  greatest_product("92494737828244222221111111532909999") == 5292
  greatest_product("02494037820244202221011110532909999") == 0



=begin

40. Duplicate Encoder
(https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/ruby)
6 kyu
The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string,
 or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

 P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is string
  - goal is to convert each character in the input str that only appears once to '(' and every character that appears more than once to ')'
  - case insensitive for counting each character
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("
p duplicate_encode("din") == "((("




D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: two arrays. one to transform into an integer. and another to turn those integers into the specific character we want


A: Algorithm
- initialize filtered_str which will be the result of downcasing all str in the input str
- iterate through filtered_str and transform each character based on the count of each char in the input str
- initialize that result to character_count
- once we have character_count iterate through that and transform each character that's count is 1 to ')' and each character that their count is > 1 to ')'
- join this array of the results into string and return

C: Code with intent




Examples
"din"      =>  "((("
"recede"   =>  "()()()"
"Success"  =>  ")())())"
"(( @"     =>  "))(("

=end

def duplicate_encode(str)
  filtered_arr = str.each_char.map {|char| char.downcase}
  character_count = filtered_arr.map {|char| filtered_arr.count(char)}
  character_count.map {|count| count > 1 ? count = ')' : count = '('}.join
end

 duplicate_encode("din") == "((("
 duplicate_encode("recede") == "()()()"
 duplicate_encode("Success") == ")())())"
 duplicate_encode("(( @") == "))(("
 duplicate_encode("GRwzFQaeFIwl SQRuwGPm")

=begin
 41. Backspaces in string
(https://www.codewars.com/kata/5727bb0fe81185ae62000ae3/train/ruby)
6 kyu
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

Examples
"abc#d##c"      ==>  "ac"
'abd##c
'ab#c'
'ac'
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""
=end
=begin
P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is a string
  - treat every '#' from the input str as a backspace. Which means to delete the previous character
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
   clean_string('abc#d##c') #== "ac"
p clean_string('abc####d##c#') == ""




D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure:


A: Algorithm
- if the first index of the input str is '#' then delete that str  otherwise leave as be.
- until the input str contains no '#' characters
 - get each index that is the index of str that contains a '#'
 - initialize this as backspace_indexes
 - initalize current_backspace_index as the first value of the backspace_indexes array
 - initialize deleter_value as the result of subtracting 1 from backspace_index
 - set the value of str at the index of backspace_index to a space so that it will essentially remove it from the input str
 - do the same from delete_value
 - repeat until condition is fulfilled and return str





=end


def clean_string!(str)
   str.include?(',')
  str[0] == '#' ? str.delete(str[0]) : str

  until str.count('#') == 0
  backspace_indexes = str.chars.map.with_index {|char, i| i if char == '#'}.compact
  current_backspace_index = backspace_indexes.first
 delete_value = backspace_indexes.first - 1
  str[current_backspace_index] = ''
 str[delete_value] = ''
  end

 str
end

 #'abd##c

  clean_string!('abc#d##c') == "ac"
  clean_string!('abc####d##c#') == ""

=begin
42. Sort Arrays (Ignoring Case)
(https://www.codewars.com/kata/51f41fe7e8f176e70d0002b9/train/ruby)
6 kyu
Sort the given strings in alphabetical order, case insensitive. For example:

["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]

P. Understand the Problem
  Explicit Requirements:
  - input is an array of string words
  - outout is the same array but each word is sorted in alphabetical order and is case insensitive
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
#p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
#p sortme(["CodeWars"]) == ["CodeWars"]
p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]




D: Data Structures
  - input: array
  - output: array
  - possible intermediary structure: array to sort each character


A: Algorithm

- iterate through the input array and compare each value downcase to one another
- once they are in the correct alphabetical order return the new sorted array
C: Code with intent




=end

def sortme(arr)
    arr.sort {|a, b| a.downcase <=> b.downcase}
end
 sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
 sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
 sortme(["CodeWars"]) == ["CodeWars"]


=begin
 43. Transform To Prime
(https://www.codewars.com/kata/5a946d9fba1bb5135100007c/train/ruby)
6 kyu
Task :
Given a List [] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list should equal the closest prime number .

Notes
List size is at least 2 .

List's numbers will only have positives (n > 0) .

Repetition of numbers in the list could occur .

The newer list's sum should equal the closest prime number .

Input >> Output Examples
1- minimumNumber ({3,1,2}) ==> return (1)
Explanation:
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , which will make *the sum of the List** equal the closest prime number (7)* .
2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make *the sum of the List** equal the closest prime number (37)* .
3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , which will make *the sum of the List** equal the closest prime number (191)* .

P. Understand the Problem
  Explicit Requirements:
  - input is an array
  - output is an integer
  - goal is to to get the minimum number of the distance between the sum of the integers within the input array and the next closest prime number

  Implicit Requirements:
  - if the sum is a prime number then return 1

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: integer
  - possible intermediary structure: array to add the values together and then compare to closest


A: Algorithm
- initialize until_prime_number to 0
- get the sum of all integer values in the input
- check to see if the input is a prime number. if so return until_prime_number
- else increment the total by and prime_number by 1 until the total is a prime number
- when it is return until_prime_number

- separate into main method and method to check if it is a prime number

 check_if_prime_number
    - use an input integer
    - create a range from number 2 to 1000000 (to fit range of numbers in test cases )
    - iterate through this range and get the remainder of dividing the input arr by each number from the range.
    - if the result array of this has only one value that is equal to 0 then it is a prime number. therefore return true. else return false

C: Code with intent




=end

def check_if_prime_number(int)
 (2..100000).map {|num|  int % num}.count(0) == 1
end

def minimum_number(arr)
  until_prime_number = 0
  total_value = arr.reduce(:+)
  total_value
 check_for_prime  = check_if_prime_number(total_value)
 until check_for_prime
  total_value += 1
   until_prime_number += 1
 check_for_prime = check_if_prime_number(total_value)
 end
   until_prime_number
end


minimum_number([3,1,2]) #== 1
minimum_number([5,2]) == 0
minimum_number([1,1,1]) == 0
minimum_number([2,12,8,4,6]) == 5
minimum_number([50,39,49,6,17,28]) == 2













