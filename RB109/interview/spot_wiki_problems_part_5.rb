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
  joined_str =  store_joined_words.map {|arr| arr.size == 1 ? arr : arr.reduce(:+)}.join(" ")
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

p solve(123056,1) =='12056'
p solve(123056,2) =='1056'
p solve(123056,3) =='056'
p solve(123056,4) =='05'
p solve(1284569,1) =='124569'
p solve(1284569,2) =='12456'
p solve(1284569,3) =='1245'
p solve(1284569,4) =='124'
