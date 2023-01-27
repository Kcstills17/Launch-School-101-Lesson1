=begin
1. count letters in a string

Count letters in string
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'.
The key must be 'symbol' instead of string in Ruby and

P. Understand the Problem
  Explicit Requirements:
  - input is string which is all lowercase letters
  - output is the count of all letters in a hash with each letter as the key and each letter count as the value.
  - the key must be a symbol and not a string

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})



D: Data Structures
  - input:input is a string
  - output: output is a hash which has every letter from the input as a hash and each letter's count as it's value.
  - possible intermediary structure: an array to iterate through each char


A: Algorithm
- we need to take the string from the input and convert each character onto a hash. and then get the count of each character
- to get each character iterate through each element of the input string.
- iniitalize a hash with all values set to 0 and then set all keys to each letter
- make sure to change all keys into symbols
- then set each value as the count of the key.

C: Code with intent
=end

def letter_count(str)
  letter_count_hash = Hash.new(0)
  str.chars.each {|letter|  letter_count_hash[letter.to_sym] += 1}
  letter_count_hash.sort.to_h
end


  letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
  letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
  letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}


=begin
2.Find all pairs
(https://www.codewars.com/kata/5c55ad8c9d76d41a62b4ede3/train/ruby)
7 kyu
Find all pairs

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)


P. Understand the Problem
  Explicit Requirements:
  -input is an array
  - output is string
  - count all pairs of numbers in the input array e.g. (2, 2, 1, 3) would be 1 pair of 2 and no others.
  - count all pairs and return the integer representing the number of pairs in the number.
  - if there are multiple  of the same pair count each pair only once.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
    p pairs([1, 2, 5, 6, 5, 2]) == 2
  p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
  p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
  p pairs([1000, 1000]) == 1
  p pairs([]) == 0
  p pairs([54]) == 0


D: Data Structures
  - input: array
  - output: string representing the amount of paits within the input array
  - possible intermediary structure: an array to count how many times each individual number appears in the input array


A: Algorithm
- we must get all pairs of numbers in the input array
- some numbers appear more than once but we only want to get the count of each unique number
- create a copy of the original array with only unique values
- iterate through the unique array and then check if element of unique_array to see the count in the original arr
- for each number of the iterated array that is >= 2 then divide each num  by 2   and then add the total together
- if there are no nums >= 2 then return 0 if there are no values then return 0 as well.

C: Code with intent


=end


def pairs(arr)
 unique_arr = arr.dup.uniq
 pairs_arr = unique_arr.map {|num| arr.count(num)}
 arr.empty? ? 0 :  pairs_arr.map {|n| n / 2}.reduce(:+)
end

 pairs([1, 2, 5, 6, 5, 2]) == 2
pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
 pairs([0, 0, 0, 0, 0, 0, 0]) == 3
 pairs([1000, 1000]) == 1
 pairs([]) == 0
 pairs([54]) == 0

=begin
66. Integer Reduction
In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of
the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that
the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

More examples in the test cases.

Good luck!


P. Understand the Problem
  Explicit Requirements:
  - input is integers which represents n and an integer which represents k
  - output is the string result of the input
  - the goal is to remove n amount of digits from n                                                                                                                                                                                            the lowest possible number without changing the order of any number
  -

  Implicit Requirements:
  - the numbers being removed can be from any index from the string. It just has to return the smallest possible integer value that remains in order.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  solve(123056,1),'12056') first int.size - second int is the  size of the substring to collect
  solve(123056,2),'1056')
  solve(123056,3),'056')
  solve(123056,4),'05')
  solve(1284569,1),'124569')
  solve(1284569,2),'12456')
  solve(1284569,3),'1245')
  solve(1284569,4),'124')
end

D: Data Structures
  - input: an integer number
  - output: a string that represents the lowest integer value when removing k digits from n
  - possible intermediary structure:


A: Algorithm
- the goal is to remove k digits from n. To see all possible variations since it can be any 2 indexes
- first convert n to str so we can use each index place and the size of the str
- then remove k from the size of the converted str. This value will be the size of the string digit that we are returning
- get all possible variations from beginning index place to the final index place of the new string that is in order
- append all of those variations to an array to store them. convert each to an integer and then get smallest value
- convert that value back to string and return the string


-  all possible variations steps broken down
  - e.g. solve(1284569,2) = '12456' we will have to get all possible in order 5 digit sequences
  - index (0, 1, 2, 3, 4,  will be '12845' and index (1,2,3,4,5) will be  '28456'
  - since this must be an the same order the beginning index cannot be any larger then the 3rd index or nil will be introduced into the order
  - possible method 'combination(string size we want) can be used

solve(123056,2)


=end


def convert_i_to_arr(num)
  num_arr = []
  num.to_s.each_char {|n| num_arr <<  n}
   num_arr
end


def get_return_str_size(str, int)
 num_arr = convert_i_to_arr(str)
  num_arr.size - int
end

def get_all_in_order_index_combinations(str, i)
  contain_all_combinations = []
  num_arr = convert_i_to_arr(str)
  combination_size = get_return_str_size(str, i)
  num_arr.combination(combination_size) {|num| contain_all_combinations << num}
  contain_all_combinations
end

def solve(n, k)
  all_combinations = get_all_in_order_index_combinations(n, k)
  all_combinations.map {|arr|  arr.map {|num|  num.to_i}}.min.join

end


  solve(123056,2) =='1056'
  solve(123056,1) == '12056'
  solve(123056,3) == '056'
  solve(123056,4) == '05'
  solve(1284569,1) == '124569'
  solve(1284569,2) == '12456'
  solve(1284569,4) == '124'
  solve(1284569,3) == '1245'



=begin
3.Return substring instance count
(https://www.codewars.com/kata/5168b125faced29f66000005/train/ruby)
7 kyu

Return substring instance count
Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

P. Understand the Problem
  Explicit Requirements:
  - input is a string  that is being searched through. And a string to which we want the count the instances of in the first str.

  Implicit Requirements:
  - multiple charactered string must be the same in the original string not the individual characters.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p solution('abcdeb','b') == 2
  p solution('abcdeb', 'a') == 1
  p solution('abbc', 'bb') == 1


D: Data Structures
  - input: two string
  - output: an integer that represents the instances of str2 in str1
  - possible intermediary structure: none


A: Algorithm
- check str1 for instances of str2 and then return that count

C: Code with intent





=end

def solution(str1, str2)
 str1.scan(/#{str2}/).size
end

 solution('abcdeb','b') == 2
 solution('abcdeb', 'a') == 1
 solution('abbc', 'bb') == 1


=begin
4.Alphabet symmetry
(https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0)
7 kyu
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

P. Understand the Problem
  Explicit Requirements:
  - input is an array containing string
  - output is an array containing integers in place of each string
  - the integer represents the number of characters in each word that are in the same index place as their positioning in the alphabet. e.g. 'ab' == 2 as 'a' is the 1st place
  and 'b' is the second place and they are in the same positioning in the word.
  - uppercase and lowercase letters are considered. not spaces
  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
    solve(["abode","ABc","xyzD"]) #==[4,3,1])
    solve(["abide","ABc","xyz"]) #==[4,3,0])
    solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) #==[6,5,7])
    solve(["encode","abc","xyzD","ABmD"]) #==[1, 3, 1, 3])


D: Data Structures
  - input: array containing string
  - output: array containing integers
  - possible intermediary structure: an array to compare the index place of each character


A: Algorithm
  - need to get each word. and return an array of the same original size
  - need to check each letter to see if it matches it's place in the alphabet
  - if the the index of the word in which the letter resides is the same as the letter's position in the alphabet.  then return 1 in place of the original array
  - if they do not then return 0.
  - get rid of all nil values and then add together the values of each subarray within the original array and return that value.
C: Code with intent


=end

def get_alphabet_with_index_arr(arr)
  alphabet_index = []
  alphabet = ('a'..'z').to_a.each_index {|i| alphabet_index << i }
  alphabet_with_index = alphabet_index.zip(alphabet)
end

def solve(arr)
alphabet_arr = get_alphabet_with_index_arr(arr)
 arr.map {|word|  word.split("").each_with_index.map { |l, i| alphabet_arr[i].include?(l.downcase) ? 1 : 0 }.reduce(:+)  }
end

    solve(["abode","ABc","xyzD"]) ==[4,3,1]
    solve(["abide","ABc","xyz"]) ==[4,3,0]
    solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) ==[6,5,7]
    solve(["encode","abc","xyzD","ABmD"]) ==[1, 3, 1, 3]



=begin
5.Longest vowel chain
(https://www.codewars.com/kata/59c5f4e9d751df43cf000035/train/ruby)
7 kyu
=begin
Longest vowel chain
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only
and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

P. Understand the Problem
  Explicit Requirements:
  - input  is string
  - output is the integer value that represents the size of the largest substring
  - get all substring values that only contains vowels
  - use those to get the largest value in size

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p solve("codewarriors") == 2
  p solve("iuuvgheaae") == 4
  p solve("ultrarevolutionariees") == 3
  p solve("strengthlessnesses") == 1
  p solve("cuboideonavicuare") == 2
  p solve("chrononhotonthuooaos") == 5
  p solve("iiihoovaeaaaoougjyaw") == 8
  p solve("suoidea") == 3


D: Data Structures
  - input: string
  - output: integer
  - possible intermediary structure:


A: Algorithm
  -
  - get all substring
  - filter out substring that include non vowels
  - get the greatest size of the substring that remains

  - substring broken down
    - two iterations
    - one is the first level that will iterate each index
    - second is the second level that will iterate over each character while the first level is still on it's specific index before moving on
    - get all combinations between the first level and second level on within the input str
C: Code with intent






=end

def get_substr(str)
  substr = []
  (0...str.size).each do |element|
    (element...str.size).each do |inner_elem|
      substr << str[element, inner_elem]
    end
  end
   substr
end


def filter_out_consonants(str)
  substr = get_substr(str)
  substr.select {|word| !word.match(/[^aeiou]/)}
end

def solve(str)
  filtered_substr = filter_out_consonants(str)
  filtered_substr.map {|char| char.size}.max
end

solve("codewarriors") == 2
solve("iuuvgheaae") == 4
solve("ultrarevolutionariees") == 3
solve("strengthlessnesses") == 1
solve("cuboideonavicuare") == 2
solve("chrononhotonthuooaos") == 5
 solve("iiihoovaeaaaoougjyaw") == 8
solve("suoidea") == 3


=begin
6.Non-even substrings
(https://www.codewars.com/kata/59da47fa27ee00a8b90000b4/train/ruby)
6 kyu
=begin
Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

  P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is the amount of odd numbered substrings that can be formed


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  solve("1341") == 7
  solve("13471") == 12
  solve("134721") == 13
  solve("1347231") == 20
  solve("13472315") == 28
  solve("1357") == 10

D: Data Structures
  - input: string
  - output: integer
  - possible intermediary structure: an array to iterate through two ranges to get substring and an array to convert all odd number substring into integer.


A: Algorithm
- get all substring
- convert all substring into digits and filter out even digits
- return the size of the filtered out array


- all substring detail
- initialize an array to store the results
- iterate through an initial range that from 0 to the size of the str non inclusive
- then with the iterated elements iterate from them to the size of the str inclusive
- now that we are iterating through every possible substring of indexes slice between every  element and it's inner element exclusive
- append to the results array
C: Code with intent







=end

def get_substr(str)
  substr = []
  (0...str.size).each do |element|
    (element..str.size).each do |inner_elem|
      substr << str[element...inner_elem]
    end
  end
 substr
end

def solve(str)
   substr = get_substr(str)
   substr.select {|char|  char.to_i.odd?}.size
end

 solve("1341") == 7
 solve("1357") == 10
 solve("13471") == 12
 solve("134721") == 13
 solve("1347231") == 20
 solve("13472315") == 28


=begin

7.Substring fun
(https://www.codewars.com/kata/565b112d09c1adfdd500019c/train/ruby)
7 kyu
=begin
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.


P. Understand the Problem
  Explicit Requirements:
  - input is an array containing string (or empty string)
  - output is a string composed of the character which is the same index as the index of the word in the input array. e.g. ('a', 'ab', 'abc) would result in 'abc'
   as 'a' is the first index (0) of the first index word of the array (0) and then 'b' is the 2nd index (1) of the 2nd index word 'ab' of the array

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p nth_char(['yoda', 'best', 'has']) == 'yes'
  p nth_char([]) == ''
  p nth_char(['X-ray']) == 'X'



D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: a possible array to access the two index positions i want to at once


A: Algorithm

-
- create an array to store each character we want to add to our final result
- we want to loop through as many times as the size of the word and then have a parameter that is set to the sequence.
- the parameter will increment by 1 on each sequence so we want to access our letter by getting the index of our parameter twice from the input arr.
- append the char we have to the result array and once finished then join together.

C: Code with intent






=end

def nth_char(arr)
  nth_word = []
  arr.size.times {|n| nth_word << arr[n][n]}
  nth_word.join
end


 nth_char(['yoda', 'best', 'has']) #== 'yes'
 nth_char([]) == ''
 nth_char(['X-ray']) == 'X'


=begin
8.Repeated Substring
(https://www.codewars.com/kata/5491689aff74b9b292000334/train/ruby)
6 kyu
=begin
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times.
The input string consists of lowercase latin letters. Your function should return a tuple (in Python) (t, k) or an array (in Ruby and JavaScript) [t, k]

Example #1:

for string

s = "ababab"
the answer is

["ab", 3]
Example #2:

for string

s = "abcde"
the answer is

because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is an array which is the result of when you get the smallest minimum size substring. The substring must be able to make up the entire input string and then
  will be index 0 of the returned array
  - index 1 of the array will be how many sequences of the repeated substring will take to make up the input str.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  f("ababab") == ["ab", 3]
  f("abcde") == ["abcde", 1]

D: Data Structures
  - input: string
  - output: array which the first index is the smallest possible substring that makes up the input string and the second index is the number of sequences it takes to make the
    input string.
  - possible intermediary structure: a possible array


A: Algorithm

  - get all substr
  - get all unique values from the str
  - get all substring that contain all unique string
  - check to see if all counts of unique letters from the input str are the same. If they are not then you can use the str itself as the 1st index
  - if it is true then get all the unique values from the input str and then choose all characters from the substr that contains all unique string.
  - then get the smallest valuew from all substring and add it to the return_array then add the size of that array to the array itself
  - if it is not true then take the input str and add it to the return array and then add the size of the return array to the array itself
C: Code with intent

=end

def get_substr(str)
substr = []
(0...str.size).each do |element|
  (element..str.size).each do |inner_elem|
    substr << str[element...inner_elem]
  end
end
  substr
end

def check_count(str)
 substr = get_substr(str)
 uniq_str = str.split('').uniq
 checked_str =  uniq_str.map {|char|   str.count(char)}
  checked_str.all? {|char| char == checked_str[0] }
end

def get_smallest_substr_that_makes_str(str)
  substr = get_substr(str)
  unique_str = str.split('').uniq.join
  check_count(str) ?    substr.select {|char| char.split.include?(unique_str)} : str
end

def f(str)
  result_arr = []
  smallest_substr = get_smallest_substr_that_makes_str(str)
  smallest_substr == str ? (  result_arr << smallest_substr && result_arr << result_arr.size) : result_arr << smallest_substr.uniq.join && result_arr <<  smallest_substr.size
end

#get_smallest_substr_that_makes_str('abceeeabc')
 f("ababab") == ["ab", 3]
 f("abcde") == ["abcde", 1]
 f("abceeeabc") == ["abceeeabc", 1]






##9.Typoglycemia Generator
#(https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby)
#5 kyu

=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are separated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata punctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)


P. Understand the Problem
  Explicit Requirements:
  - input is  a string
  - output is string but the first and last letters are ignored and remain the same. And every other letter is sorted alphabetically
  - special characters are not sorted. They must be letters
  - punctuation is limited to 4 characters - ' , and .
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p scramble_words('professionals') == 'paefilnoorsss'
  p scramble_words('i') == 'i'
  p scramble_words('') == ''
  p scramble_words('me') == 'me'
  p scramble_words('you') == 'you'
  p scramble_words('card-carrying') == 'caac-dinrrryg'
  p scramble_words("shan't") == "sahn't"
  p scramble_words('-dcba') == '-dbca'
  p scramble_words('dcba.') == 'dbca.'


D: Data Structures
  - input: string
  - output: string where each letter between the first and last index is sorted and each special character is left alone.
  - possible intermediary structure:


A: Algorithm
- return the str if the size is less than or equal to 3
-  create an array containing all letters
- if the str starts with or ends with a special character then initialize a variable to contain the the special character and it's index position
- then sub out the special character with empty no space

- initialize a variable named chopped_arr that will take off the first and last letter of the subbed out str
- initialize a variable to the result of sorting the array
- then add the first and last letter back to the sorted str.
- then add the special character back to it's original position of the input str to the new sorted and joined str.

- if the str contains a special character but it does not start with one
- then  create an array chopped_arr which is all characters from the first index to the second to last index
- then initialize special_character_positions which will contain the special character and it's index
- iterate through chopped_arr and add any special character and it's index to special_character_positions
- delete the special character from the chopped_arr
- sort together the characters in chopped_arr alphabetically
- initiailze unfinished_arr to the result of the sorted chopped_arr
- append the first and last character from the input str back to unfinished_arr
- initialize return_str to the result of joining unfinished_arr

- else if  str contains no special characters
- initialize chopped_arr to contain all characters from the second index to the second to last
- initilaize sorted_arr to the result of sorting the chopped_arr alphabetically
- initiailze unfinished_arr to the result of joining the 1st and last characters to the sorted_arr
- initialize return_str to the result of joining sorted_arr

C: Code with intent

=end
 ALPHABET = ('a'..'z').to_a

def contains_special_characters(str)
  special_character_and_position = []
  chopped_arr = str[1..-2].split("")

 chopped_arr.each_with_index {|l, i| special_character_and_position << l  if !ALPHABET.include?(l) && special_character_and_position << i if !ALPHABET.include?(l) }
   special_character_and_position.empty? ? false : special_character_and_position
  end

  def starts_or_ends_with_special_character(str)
  special_character = nil
  str.chars.each_with_index {|l| special_character = l if !ALPHABET.include?(l) }
  return false if special_character == nil
    str.start_with?(special_character) || str.end_with?(special_character)
  end


def when_starts_or_end_with_special_char(str)
  subbed_str =   str.gsub(/[^a-z]/, '')
  special_character = nil
  str.chars.each {|l| special_character = l if !ALPHABET.include?(l)}
  chopped_arr = subbed_str[1..-2].chars
  sorted_arr =  chopped_arr.sort {|a, b| a <=> b}
  sorted_arr
  unfinished_arr = sorted_arr.unshift(subbed_str[0]) && sorted_arr << subbed_str[-1]
  str.start_with?(special_character) ? unfinished_arr.unshift(special_character) : unfinished_arr << special_character
  result_str = unfinished_arr.join


end

def when_has_special_char(str)
  chopped_arr = str[1..-2].chars
  special_character_and_position = []
  chopped_arr.each_with_index {|l, i|special_character_and_position << l if !ALPHABET.include?(l) && special_character_and_position << i if !ALPHABET.include?(l) }
  chopped_arr.delete(special_character_and_position[1])
  sorted_arr = chopped_arr.sort {|a, b| a <=> b}
  unfinished_arr = sorted_arr.insert(special_character_and_position[0], special_character_and_position[1])
  unfinished_arr = sorted_arr.unshift(str[0]) && sorted_arr << str[-1]
  result_str = unfinished_arr.join
end

def has_no_special_char(str)
  chopped_arr = str[1..-2].chars
  sorted_arr = chopped_arr.sort {|a, b| a <=> b}
  unfinished_arr = sorted_arr.unshift(str[0]) && sorted_arr << str[-1]
  result_str = unfinished_arr.join

end


  def scramble_words(str)
return str if str.size <= 3
  if starts_or_ends_with_special_character(str)
    when_starts_or_end_with_special_char(str)
  elsif contains_special_characters(str)
    when_has_special_char(str)
  else
    has_no_special_char(str)
  end
end



 scramble_words('professionals') == 'paefilnoorsss'
 scramble_words('i') == 'i'
 scramble_words('') == ''
 scramble_words('me') == 'me'
 scramble_words('you') == 'you'
 scramble_words('card-carrying') == 'caac-dinrrryg'
 scramble_words("shan't") == "sahn't"
 scramble_words('-dcba') == '-dbca'
 scramble_words('dcba.') == 'dbca.'


=begin

10.Most frequently used words in a text]
(https://www.codewars.com/kata/51e056fe544cf36c410000fb/train/ruby)
4 kyu

Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order
 of the number of occurrences.

Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily.
If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.
Examples:
top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]

P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output are the three string that occur the most times within the code

  Implicit Requirements:
  - if the input contains no string or only special characters then retrun an empty array
  - if the input contains words/letters but they are less than 3 in size return each unique character
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
  p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
  p top_3_words("  //wont won't won't ") == ["won't", "wont"]
  p top_3_words("  , e   .. ") == ["e"]
  p top_3_words("  ...  ") == []
  p top_3_words("  '  ") == []
  p top_3_words("  '''  ") == []
  p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]



D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: an array to get the count of each character


A: Algorithm
- initialize an array to store the results we want
 - 3 conditions
 - when the size of the str is >= 3 and the str contains no letters
 - when the size of the str is >= 3 and the str contains letters
 - when the size of the str is > 3 and contains letters

 - in the first condition we will return the empty array and stop there

 - in the second condition here are the steps that must be taken
 - initialize a variable  words for the input str converted into an array and contain each word from the input str
 - initialize a variable named top_words to an empty array. This is what we will return eventually in this condition
 - initialize a variable named word_count to an empty array. This is what we will use to store the counts of each word in words
 - for words we want to account for all cases with apostrophes and spaces but remove any other special characters. set words to this result
 - organize word_count so that the highest values are before the lower values
 - once we have words and our word_count we can begin to append to our top_words
 - we want to iterate as many times as the size of the words array. Within each iteration we shall
 - check to see that if the index of the current iteration matches the count of each word within the words array.
 - if so then append to top_words
 - we now have all the words we want in the top_words array but each one of them. We only need one example of each so return the array with only unique values

 - final condition
 - Some of the test cases include examples with special characters. The output seems to discard those characters when counting the words. Because of that
 - initialize a variable filtered_chars to get rid of any non space special character
 - initialize top_3_words to an empty array since we only want the top 3 words
 - intiailze top_3_word count to an empty array as well to which we will store the count
 - initialize word_count to an empty array. this will contain the count of all words
 - set word_count to the result of iterating through each character of filtered_chars and then getting the count of each word in filterd_chars
 - organize top_3_word_count so that it only contains unique values and it is order from greatest value to smallest
 - now we must iterate 3 times so that we can get the 3 largest count values that we want
 - append to top_3_word count the result of accessing the first 3 indexes of word_count
 - append to top_3_words  3 times any word that  it's index in top_3_word count  matches the count of the word in filtered_chars
 - choose all unique values and then choose the first 3 index values from top_3_words and return that result

C: Code with intent



=end

def word_include_letters?(str)
   str.split.any? {|char|  char.size > 1 ? char.each_char.any? {|l| l.downcase.match(/[a-z]/)} : char.downcase.match(/[a-z]/) }
end

def has_letters_and_smaller_or_equal_to_three(str)
  top_words = []
  str_size = str.split.size
  top_words = []
  words = []
   str.each_char {|char| words << char if char.downcase.match(/[a-z'\s]/)}
   words = words.join.split
   word_count = words.map {|word|  words.count(word)}
  word_count = word_count.reverse
  words.size.times {|n|  words.each {|char| top_words << char.downcase if word_count[n] == words.count(char) } }
  top_words.uniq
end

def has_letters_and_greater_than_three(str)
  top_words = []
  filtered_chars = str.chars.map {|l|  l if l.downcase.match(/[a-z\s]/) }.join.split
  top_3_words = []
  top_3_word_count = []
   word_count = filtered_chars.map {|word|  str.split.count(word)  }
   word_count =  word_count.sort.uniq.reverse
   3.times {|n|    top_3_word_count << word_count[n] && filtered_chars.each {|char| top_3_words << char.downcase if top_3_word_count[n] == filtered_chars.count(char) }}
  top_3_words.uniq.slice(0..2)
end

def top_3_words(str)
  top_words = []
 if  !word_include_letters?(str) && str.split.size <= 3
   return top_words
 elsif str.split.size <= 3 && word_include_letters?(str)
 has_letters_and_smaller_or_equal_to_three(str)
 else
  has_letters_and_greater_than_three(str)
 end
end

top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
top_3_words("  //wont won't won't ") == ["won't", "wont"]
top_3_words("  , e   .. ") == ["e"]
top_3_words("  ...  ") == []
top_3_words("  '  ") == []
top_3_words("  '''  ") == []
  top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]



=begin


11.Extract the domain name from a URL
(https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby)
5 kyu
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:

domain_name("http://github.com/carbonfive/raygun") == "github"
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"


P. Understand the Problem
  Explicit Requirements:
  - input is string which represents a url for a website
  - output is string which represents the domain name alone from the input string

  Implicit Requirements:
  - if the input has https:// but no www. in the input then return the string following the final / and exit out before the period.
  - if the input has www. in the input then return the string following the first period in exit out prior to the 2nd

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 p domain_name("www.xakep.ru") == "xakep"
 p domain_name("https://youtube.com") == "youtube"
 p domain_name("http://google.com") == "google"
 p domain_name("http://google.co.jp") == "google"
12. Detect Pangram


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: array to isolate each character and take specific string from


A: Algorithm

- 2 conditions
- when the input  url has https:// and no www.
- when the input url has https:// and www. or just has www.


- first condition
- when the input url has https:// and no www.
- initialize variable second_slash and set to nil
- initialize variable exit_period and set to nil
- iterate through the input str and it's indexes. set second_slash to result of getting the index if the str is == to '/'. return the last instance of this
- do the same as prior but this time append to exit_period the first instance of when str is == '.'
- initialize sliced_word to the result of accessing the str and starting at the next index after second_slice and ending with the index before exit_period
- return the sliced word

- second condiiton
- when the input url has https:.. and www.  or just www.
  - initialize all_period and set to nil
  - initalize variable first_period and set to nil
  - initialize variable second_periond and set to nil
  - iterate through the input str and it's indexes. append to all_period each index it which the str is == to "."
  - append to first_period the first index from all_periods
  - append to second_period the second index from all_periods
  - initialize sliced_word to the result of accessing str from the next position after first period and the first position before second_period
  - return sliced_word


C: Code with intent


=end

def domain_contains_no_www(str)
 second_slash = []
 exit_period = []
 str.split('').each_with_index {|l, i| second_slash << i if l == '/'  }
 second_slash = second_slash[1]
 str.split('').each_with_index {|l,i| exit_period << i if l == '.'}
  exit_period = exit_period.first
   exit_period
  sliced_str = str[second_slash + 1.. exit_period - 1 ]
end

def domain_contains_www(str)
all_periods = []
str.split('').each_with_index {|l, i| all_periods << i if l == '.'}
first_period = all_periods.first
second_period = all_periods.last
sliced_str = str[first_period + 1.. second_period - 1]
end


def domain_name(str)
 if  str.include?("www.")
  domain_contains_www(str)
 else
  domain_contains_www(str)
  domain_contains_no_www(str)
 end
end


 domain_name("http://google.com") == "google"
 domain_name("http://google.co.jp") == "google"
 domain_name("https://youtube.com") == "youtube"
 domain_name("http://github.com/carbonfive/raygun") == "github"
 domain_name("http://www.zombie-bites.com") == "zombie-bites"
 domain_name("https://www.cnet.com") == "cnet"
 domain_name("www.xakep.ru") == "xakep"


