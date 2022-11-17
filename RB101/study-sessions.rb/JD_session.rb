=begin
 the variable arr1 is initialized and references an array of strings.  the variable arr2 is initialized and refereces a copy of the object that arr1 references.
 the map method is called on the object referenced by arr2.  the elements represented by strings are passed into the block in turn taking place of the parameter char.  the upcase method is called on char and is returned because it is the last line of code in the block.
 the puts method is called on arr1 which outputs an array which is referenced by arr1
 the puts method is called on arr2 which outputs an array which is reference by the mutated object arr2

On line 51, the local variable arr1 is initialized to `["a", "b", "c"]`. On line 52,  the variable arr2 is initialized and refereces a copy of the object that arr1 references.
 the map method is called on the object referenced by arr2. For each iteration, map passes in the current element into the block and assigns it to parameter `char`. the upcase method is called on the object referenced by `char` and the upcased string is returned because it is the last line of code in the block.
 the puts method is called on arr1 which outputs ['a', 'b', 'c']which is referenced by arr1
 the puts method is called on arr2 which outputs ["A","B","C"] which is reference by the mutated object


=end






#What does the following code return? What does it output? Why? What concept does it demonstrate?
arr1 = ["a", "b", "c"]
arr2 = arr1.dup

a = (arr2.map do |char|
  char.upcase!
end)
p a

p arr1
p arr2



# local variable arr1 is initiallized and set to an array containing 3 string objects 'a', 'b,', 'c'
# local variable arr2 is initiallized and set to a new object that contains strings pointing to the same addresses
# as each of the strings in arr1. This is due to the effects of the method#dup
#  local variable a is initiallized and set to the value of the map method being called on arr2
#   map being invoked on arr2 transforms a new created array with each char of the array
#  having the destructive method #upcase! being called onto it
#  map takes into account the return value of the block
# a, arr1, and arr2 are each separate objects but the string objects within each object are pointing to the same addresses
# in memory "A", "B", "C"
# return value should be  => ["A", "B", "C"]
#                         => ["A", "B", "C"]
#                         => ["A", "B", "C"]

# The concept's demonstrated here are Shallow copying on the second line of code
# on the 4th line of code pass by value is demonstrated by the transformative method map
# and on the 5th line of code pass by reference is demonstrated by the destructive method Upcase!



=begin
3. Return substring instance count (easy-med)
([https://www.codewars.com/kata/5168b125faced29f66000005/train/ruby](https://www.codewars.com/kata/5168b125faced29f66000005/train/ruby))
7 kyu
Return substring instance count
Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:


Goal: intake a full text string and a substring and return the integer number of times the substring appears in the full text string
input: two strings
output: integer

Rules:
- both argument strings are lowercase
- non alpha characters can be included in the full string

E:
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
'aa_bb_cc_dd_bb_e' --> split this into an array of characters
    ^        ^
    1        2
    temp_substring to store the substring that is the size of the search text?
    array of substrings created from the search text and count how many times the search text appears in the full string
solution('aaabbbcccc', 'bbb') # should return 1
'aaabbbcccc'
    ^
    1

D:
input: two strings
intermediate: counter, array of substrings
output: integer

A:
input: two strings, `full_text` and `search_text`
- create a helper method to find all of the substrings in the full_text string
  - initialize variable `substrings` to an empty array
  - iterating over a range from 0 upto but not including the size of the full_text string
    - then iterating over a range from current element in range to the current element in nested iteration create sliced substrings of the full_text string
    - push those substrings into the `substrings` array
  - return `substrings` array
- count the number of times the search_text appears in the substrings array and return that integer


=end

def solution(full_text, search_text)
  substrings = substrings(full_text)
  substrings.count(search_text)
end

def substrings(full_text)
  substr = []
  (0...full_text.size).each do |st_idx|
    (st_idx...full_text.size).each do |end_idx|
      substr << full_text[st_idx..end_idx]
    end
  end
  substr
end

p substrings('abcd')
# p solution('abcdeb','b') == 2
# p solution('abcdeb', 'a') == 1
# p solution('abbc', 'bb') == 1


# working on hashes and accessing hash keys and values.
a = {:a => 1, :b => 2, :c => 3}

# create a new hash with the values of a all being incremented by 1

a.each_with_object ({}) do |(key, value), hash|
 hash[key] = value + 1
 p hash
end

# a is invoked with the method each_with_object  and passes in a block.
# on the same line on each iteration of the block the local parameters (key, value) which represent one of a pair in this case
# and hash are passed into each iteration of the block
# on the following line we set the new key for hash by using the hash #[]= method (which creates a new key in this case because our hash is empty )
# on passed in argument key
# with the right side of the #[]= method we set the value of hash through passed in argument value
# on the same line we increment each value by 1
# on the final line we print the value of hash


