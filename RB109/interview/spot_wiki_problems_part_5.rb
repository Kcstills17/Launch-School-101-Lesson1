=begin
62.
(https://www.codewars.com/kata/5266876b8f4bf2da9b000362)
6 kyu
You probably know the "like" system from Facebook and other pages. People can "like" blog posts, pictures or other items. We want to create the text that should be displayed next to such an item.

Implement a function likes :: [String] -> String, which must take in input array, containing the names of people who like an item. It must return
 the display text as shown in the examples:

likes [] // must be "no one likes this"
likes ["Peter"] // must be "Peter likes this"
likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"

P. Understand the Problem
  Explicit Requirements:
  - we are given an input array which either is empty or contains a n amount of string words
  - if the input array is empty we are to return 'no one likes this'
  - if the input array contains one word we are to return 'word likes this'
  - if there are two words then we are to return ' wordA and wordB likes this'
  - if there are three words then we are to return ' WordA, WordB, and WordC likes this'
  - if there are four or more then return 'WordA, WordB, and (n amount) others like this

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: string
  - possible intermediary structure:


A: Algorithm

- return 'no one likes this' if the input array is empty
- when the input arr size is equal to 1
    - return '(specific word) likes this'
- when the input arr size is equal to 2
    - return '(specific word one) and (specific word two) likes this
- when the input arr size is equal to 3
   - interpolate each string value at index 0 followed by a comma then index 1 and 2 like this
- when the input size > 3
       -initalize others_who_likes to the result of adding 'and' +  input_size - 2 converted to str  +  'others like this'
       - add input_arr at index 0 and index 1 to the front  of others_who_likes and return this value
C: Code with intent



=end

def likes(arr)
  return 'no one likes this' if arr.empty?
  if arr.size == 1
      return "#{arr[0]} likes this"
  elsif arr.size == 2
    return "#{arr[0]} and #{arr[1]} like this"
  elsif arr.size == 3
    "#{arr[0]}, #{arr[1]} and #{arr[2]} like this"
  else
    others_who_likes = 'and'  +  " #{arr.size - 2} "  + 'others like this'
    "#{arr[0]}, #{arr[1]} #{others_who_likes}"
  end
end


  likes([]) == "no one likes this"
  likes(["Peter"]) == "Peter likes this"
  likes(["Jacob", "Alex"]) ==  "Jacob and Alex like this"
  likes(["Max", "John", "Mark"]) ==  "Max, John and Mark like this"    #"Max, John, and Mark like this"
  likes(["Alex", "Jacob", "Mark", "Max"]) ==  "Alex, Jacob and 2 others like this"





=begin

63. Find The Parity Outlier
(https://www.codewars.com/kata/5526fc09a1bbd946250002dc)
6 kyu
You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

P. Understand the Problem
  Explicit Requirements:
  - we have an array containing n amount of integers. Our goal is to find the single outlier based on the majority of the array contents
  - if all but one are odd we are to return the even integer
  - if all but one are even we are to return the odd integer


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: integer
  - possible intermediary structure:


A: Algorithm

- initialize even_nums to the result of iterating through the input arr and getting all even num
- initialize  odd_num to the result of iterating through the input arr and getting all odd num
- if even_num is equal in size to 1 then return even_num (added together to return the integer) else return odd_num added together

C: Code with intent



=end

def find_outlier(arr)
even_num, odd_num = arr.partition {|num|  num.even? }
even_num.size == 1 ? even_num.reduce(:+) : odd_num.reduce(:+)
end


 find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) #== 11
 find_outlier([160, 3, 1719, 19, 11, 13, -21]) #== 160




=begin
64. Is Integer Array?
6 kyu
Write a function with the signature shown below:

def is_int_array(arr)
  true
end
returns true / True if every element in an array is an integer or a float with no decimals.
returns true / True if array is empty.
returns false / False for every other input.

P. Understand the Problem
  Explicit Requirements:
  - we are given an array which can contain n elements or no elements at all. We need to return a boolean value dependant on these conditions
  - return true if
    - every element is an integer of a float with no decimals (aka 2.0)
    - the array is empty
  - else return false

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: boolean
  - possible intermediary structure: an array to make sure all elements of the given array elements fulfill the same conditions


A: Algorithm
- return  false if the given arr is == to nil  or if the class is not an array and return true if the array is empty.
-  if all elements are equal to the element converted to an integer return true
    - to test this iterate through the given array and check each element if they are all equal to being converted to an integer
  -esle
-false

C: Code with intent



=end

def is_int_array(arr)
  return false if arr == nil || arr.class != Array
  return true if  arr.empty?
   arr.all? {|num| num == num.to_i  } ? true : false
end

 is_int_array([]) ==  true
 is_int_array([1, 2, 3, 4]) ==  true
 is_int_array([-11, -12, -13, -14]) ==  true
 is_int_array([1.0, 2.0, 3.0]) ==  true
  is_int_array([1, 2, nil]) == false
  is_int_array(nil) == false
 is_int_array("") ==  false
  is_int_array([nil]) ==  false
 is_int_array([1.0, 2.0, 3.0001]) ==  false
 is_int_array(["-1"]) ==  false


=begin

65. Reversing and Combining Text
(https://www.codewars.com/kata/56b861671d36bb0aa8000819/train/ruby)

Your task is to Reverse and Combine Words.

Input: String containing different "words" separated by spaces

1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
  (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…

P. Understand the Problem
  Explicit Requirements:
  - we have to reverse and combine words. however they are not all done the same.
  - if there is more than one word. We first reverse each word
    - then we combine the first and the second. third with the fourth, etc
    - if there is an uneven amount of words then leave the last word uncombined but still reverse it
  - repeat the process until there is only one word without spaces

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
- initialize joined_str to str
- initialize reversed_array to an empty arr
- initialize store_joined_words
- now that we have reversed we must now combine each pair of words
- until joined_str converted to an array of words has a size of 1
    set  reversed_array to the result of reversing each word in joined_str
    - iterate through an array which contains each reversed word and then pair each in groups of two (leaving a last alone if odd)
    -  add each pair to store_joined_words
    - iterate through store_joined_words and add the first index and last index of each pair together. If there is a final odd array then ignore that value
    - set the result of this to joined_str
    - repeat if neccessary
  - end
  - join the array together into str and return the str

C: Code with intent



=end
def reverse_words(str)
 str.split.map {|word|  word.reverse }
end


def reverse_and_combine_text(str)
  joined_str = str
  until joined_str.split.size == 1
  reversed_arr = reverse_words(joined_str)
  store_joined_words = []
  reversed_arr.each_slice(2) {|word| store_joined_words <<  word}
  p joined_str =  store_joined_words.map {|arr| arr.size == 1 ? arr : arr.reduce(:+)}.join(" ")
  end
   joined_str
end


  reverse_and_combine_text("abc def") == "cbafed"
  reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
  reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
  reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
  reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"



=begin
66. Integer reduction

In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

More examples in the test cases.

Good luck!


P. Understand the Problem
  Explicit Requirements:
  - we have our two integers. int1 (n) and int2(k). Our goal is remove k digits from n and return the lowest possible number
  - we cannot change the order of any number. so every possible combination as is order with k digits removed from n.
  - then we choose the smallest number out of those and convert it back to str

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: two integers
  - output: string
  - possible intermediary structure:


A: Algorithm
convert n into an array containing each digit converted to str
- initialize this as digit_str_arr
- iterate through digit_str_arr and get every possible combination that is the size of digit_str_arr.size - k
- append these results to all_k_combinations
- get the smallest value in all_k_combinations and join that string together. Return this result
C: Code with intent



=end

def solve(n, k)
  string_digits_arr = n.to_s.chars
  all_k_combinations = []
  string_digits_arr.combination(string_digits_arr.size - k) {|digit| all_k_combinations << digit }
  all_k_combinations.min.join
end

 solve(123056,1) =='12056'
 solve(123056,2) =='1056'
 solve(123056,3) =='056'
 solve(123056,4) =='05'
 solve(1284569,1) =='124569'
 solve(1284569,2) =='12456'
 solve(1284569,3) =='1245'
 solve(1284569,4) =='124'


=begin
# practice problems from LS in preparation for L. Interview

# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:



P. Understand the Problem
  Explicit Requirements:
  - we are given an array with n amount of numbers. Our goal is to return an array where in place of every original integer there is an integer that represents how many
    integers are smaller then the original integer.
  -  the numbers that are being compared to see if smaller must be from a unique list. If there is a number that occurs multiple times that still only counts as 1 number that
   is smaller
  - if there are no numbers smaller then return 0 as that character

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
  p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
                            == [0, 2, 4, 5, 6, 1, 2, 3, 2]
  p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
  p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
  p smaller_numbers_than_current([1]) == [0]



D: Data Structures
  - input: array
  - output: array
  - possible intermediary structure:


A: Algorithm
- initialize store_all_nums_greater to an empty array
 - iterate through the input arr and get param n. (this is the array we will store each number that is greater in ) initialize smnthc to this result
 - iterate within the previous iteration through unique_integers and get uv as para
 -  select n if n is greater than uv
 -  iterate through smnthc and transform each value  based on it's size.
C: Code with intent



# The tests above should print "true".


=end

def smaller_numbers_than_current(arr)
unique_values = arr.uniq
store_all_nums_greater = []
snthc = arr.map do |n|
  unique_values.select do |uv|
     n if n > uv
  end
end
snthc.map {|arr| arr.size}
end

  smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
  smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])      == [0, 2, 4, 5, 6, 1, 2, 3, 2]
  smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
  smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
  smaller_numbers_than_current([1]) == [0]



=begin

# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true"


P. Understand the Problem
  Explicit Requirements:
  - we have to find the minmum sum of 5 consecutive numbers within the array.
  - if there is not 5 numbers then return nil
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: integer or nil
  - possible intermediary structure:


A: Algorithm
- return nil if the input arr size is not == to 5
- initialize all_combs to an empty arr
- otherwise iterate through the input arr and get every consecutive combination of the size of 5. add each to all_combs
- iterate through all_combs and get each sum of each arr. Get the smallest integer value among the returned integers.


C: Code with intent



=end


def minimum_sum(arr)
if arr.size < 5
  nil
else
  all_combs = []
  arr.each_cons(5) {|arr| all_combs << arr }
  all_combs.map {|arr| arr.reduce(:+)}.min
end
end

  minimum_sum([1, 2, 3, 4]) == nil
  minimum_sum([1, 2, 3, 4, 5, 6]) == 15
  minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
  minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10




=begin

# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".


P. Understand the Problem
  Explicit Requirements:
  - we are given a sentence containing string words. We are to take every 3rd word in the sentence and then within that word convert every 2nd letter (or every other letter
   starting with index 1, 3, 5, etc) to uppercase.
  - all other words should be left untouched

  Implicit Requirements:
  - if in the 3rd word there is only one letter or if the correct values to be switched to uppercase are already uppercase then leave as be


  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure:


A: Algorithm
 - initialize word_arr to the result of getting each word from the input str in an array
 - iterate through word_arr and get each word and each index
 - if  index + 1 is evenly divisible by 3 then iterate through the word and get i2 and get the char else leave the word alone
  - in the second iteration change the char to uppercase  if i2 is odd. leave char as be if i2 is even
 - return to top of iteration and join the array together

C: Code with intent


=end

def to_weird_case(str)
  word_arr = str.split
 final_result =  word_arr.map.with_index do |word, i|
     (i + 1) % 3 == 0 ? word.chars.map.with_index {|char, i2| i2.odd? ?  char.upcase : char}.join : word
  end
 p   final_result.join(' ').object_id

end


  to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
              'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
  to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'

 to_weird_case('aaA bB c') == 'aaA bB c'

 to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'


=begin
  # Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".
P. Understand the Problem
  Explicit Requirements:
  -  we are given an array of integers. Our goal is to find the two integers who are closest to each other in value

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - If there are more than one pair that is the same do we return the earliest case of these?

E: Examples/ Edge Cases


D: Data Structures
  - input: input is an array of integers
  - output: array containing the two integers closest to each other
  - possible intermediary structure: array


A: Algorithm

- get every possible combination of 2 numbers from the input array
- initialize this as each_comb
-
- initialize current_smallest to  the result of index 0 in each_comb
- iterate through each_comb once more and set array
  - set current_smallest to arr if  the evaluation of current_smallest sorted from greatest to least is > then the evaluation of arr sorted from greatest to least
- once the iteraton is finished return that array
-

C: Code with intent


=end

def closest_numbers(arr)
  each_comb = []
  arr.combination(2) {|arr|each_comb << arr }
  current_smallest = each_comb[0]
  final_result = each_comb.select do |arr|
  current_smallest = arr if current_smallest.sort {|a, b|b <=> a}.reduce(:-) >  arr.sort {|a, b| b <=> a}.reduce(:-)
  end
  current_smallest
end

   closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
  closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
  closest_numbers([12, 7, 17]) == [12, 7]




=begin

# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.



# The tests above should print "true".
P. Understand the Problem
  Explicit Requirements:
  - we are given a string that contains n amount of characters. Our goal is to return the  character that occurs least often in the input str
  - all str counted is case insensitive
    - if there is more than one character that has the smallest occurence then return the character that occurs first

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: single string
  - possible intermediary structure:


A: Algorithm
- initialize a hash that contains all characters downcased  that occur in the str as keys and each value set to 0
- name this hash character_count_hsh
- iterate through each character of the str and initialize k as a param. for every instance of k increment the value by 1
- initialize count_arr to the result of converting our hash into an array
- initialize smallest_count to the result of sorting through count_arr and  getting the smallest index integer value among our array elements
- iterate through count_arr once more and select the subarrays that have a index at position 1 that == smallest_count
- initialize this to all_smallest_counts
- access the first element of all_smallest_counts and then to get the character we want access the first index here as well. Return this string

C: Code with intent



=end
def hash(str)
  hash = {}
  str.chars.each {|char| hash[char.downcase] = 0}
  hash
end

def least_common_char(str)
character_count_hsh = hash(str)
str.chars.each {|k| character_count_hsh[k.downcase] += 1 }
count_arr = character_count_hsh.to_a
smallest_count = count_arr.min_by {|subarr| subarr[1]}[1]
all_smallest_counts = count_arr.select {|subarr| subarr[1] == smallest_count}[0][0]
end

 least_common_char("Hello World") == "h"
 least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
 least_common_char("Mississippi") == "m"
 least_common_char("Happy birthday!") == ' '
 least_common_char("aaaaaAAAA") == 'a'


arr = [['m',3 ], ['a', 2], ['d', 3], ['f', 1]]
 smallest_val = arr.min_by { |subarr| subarr[1] }[1]
 smallest_subarrays = arr.select { |subarr| subarr[1] = smallest_val }






=begin
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

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index

P. Understand the Problem
  Explicit Requirements:
  - we are to use our input array and find each pair that add up to our input integer
  - if there is more than one pair. You decide between those based on whose second index is the smallest in the original array
  - if there are no pairs that fit this criteria we will return nil

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input:is an array and an integer
  - output: array
  - possible intermediary structure:


A: Algorithm
- intialize all_combs to an empty array
 get theresult of each possible pairs of twos from the input array and append to all_combs
 - initialize correct_comb to the result of iterating through all_combs and selecting each arr that when added together is equal to the input integer
 - if correct_comb is empty
    - return nil
 - if correct_comb is the size of 1
  - return correct_comb
 - else
 - initialize correct_result = 0
  - initialize second_index_of_chosen_words to the result of iterating through correct_comb and choosing the last index for each iteration
  - intialize first_word to the result of iterating throigh the input arr and returning i if the char is equal to  index 0 of second_index. Return the last
    character in case there are any that share the same number
    - initialize second_word and repeat the same process except acess index 1 of second_index
    -  if first_word < second_word set correct_result to first_word else set  correct_result to second_word
    - iterate through the input arr once more and get each char and i
      - return char if  i == to correct_result
   - initialize this result to final_index and get remove from arr
   - iterate through correct_comb  and choose the array that includes final_index
C: Code with intent



== [3, 7]

=end



l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

def sum_pairs(arr, int)
all_combs = []
arr.combination(2) {|char| all_combs << char }
correct_comb = all_combs.select {|arr| arr.reduce(:+) == int }
if correct_comb.empty?
  return  nil
elsif correct_comb.size == 1
  correct_comb.first
else
  correct_result = 0
  second_index = correct_comb.map {|arr|  arr[1]}
  first_word = arr.map.with_index {|char, i| i if second_index[0] == char}.compact.last
  second_word = arr.map.with_index {|char, i| i if second_index[1] == char}.compact.last
  first_word < second_word ? correct_result = first_word : correct_result = second_word
  smallest_index =  arr.select.with_index {|char, i| char if i == correct_result}.first
  correct_comb.select {|arr| arr.include?(smallest_index)}.first
end
end

  sum_pairs(l1, 8) == [1, 7]
  sum_pairs(l2, -6) == [0, -6]
   sum_pairs(l3, -7) == nil
  sum_pairs(l4, 2) == [1, 1]
   sum_pairs(l5, 10) == [3, 7]
  sum_pairs(l6, 8) == [4, 4]
  sum_pairs(l7, 0) == [0, 0]
  sum_pairs(l8, 10) == [13, -3]

str = 'hello'
str.insert
