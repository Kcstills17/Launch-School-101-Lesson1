=begin

Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

P. Understand the Problem
  Explicit Requirements:
  - Given an array of n positive integers & a positive integer, find the smallest length of a contingous subarray for which the sum is >= integer


  Implicit Requirements:
  - if there is not a length sum from the contingous subarray  that is >= integer
    return 0
  -  if the positive integer is 9 for example and your subarray consist of [1,4,6,2]
      at the first integer the value 1 is not >= to 9
      at integer one, 4 plus the first index 1 is not >=5
      with the third integer 6. we surpass 9 and that is the smallest possible length within this example to meet the criteria of >= 9

  Clarifications/ Questions:
  - Why does the 3rd edge case return 4 digits when one of the digits of the array is the same value
    as the posiitive integer
    - continous here shows that you have to evaluate the length from the starting index going forward
  - is contingous in this case all of the succeeding integers within the array?


E: Examples/ Edge Cases
- # p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
- # p minSubLength([1, 10, 5, 2, 7], 9) == 1
- # p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
- # p minSubLength([1, 2, 4], 8) == 0


D: Data Structures
  - input: an array of n length and a positive integer
  - output: an integer
  -possible path: perhaps a new array that is appended

=end

arr = [2, 3, 1, 2, 4, 3]

=begin
A:
- Initialize a variable `lens` which will store the lengths of subarrays which have a sum >= integer argument.
- Perform nested iteration
    - At the first level, with the parameter `idx1` iterate over all elements from 0 to the length of the array - 1
    - At the second level, with the parameter `idx2` iterate over all elements starting from `idx1` until length of the array - 1
    - if `arr[idx1..idx2].sum >= target` append `(idx2 - idx1) + 1` to the array
=end

# 2
#   - [2, 2]
#   - [2, 3]
#   - [2, 1]
#   - [2,2]
#   - [2,4]
#   - [2,3]



arr = [2, 3, 1, 2, 4, 3]
lens = []
target = 7

(0..arr.size-1).each do |idx1|
  (idx1..arr.size-1).each do |idx2|
    p(arr[idx1..idx2]) if arr[idx1..idx2].sum >= target
  end
end


# Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

# ```ruby
# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0
# ```

C: Code with intent
P. Understand the Problem
Explicit Requirements:
- Given an array of n positive integers & a positive integer, find the smallest length of a contingous subarray for which the sum is >= integer


Implicit Requirements:
- if there is not a length sum from the contingous subarray  that is >= integer
  return 0
-  if the positive integer is 9 for example and your subarray consist of [1,4,6,2]
    at the first integer the value 1 is not >= to 9
    at integer one, 4 plus the first index 1 is not >=5
    with the third integer 6. we surpass 9 and that is the smallest possible length within this example to meet the criteria of >= 9

Clarifications/ Questions:
- Why does the 3rd edge case return 4 digits when one of the digits of the array is the same value
  as the posiitive integer
  - continous here shows that you have to evaluate the length from the starting index going forward
- is contingous in this case all of the succeeding integers within the array?


E: Examples/ Edge Cases
- # p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
- # p minSubLength([1, 10, 5, 2, 7], 9) == 1
- # p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
- # p minSubLength([1, 2, 4], 8) == 0


D: Data Structures
- input: an array of n length and a positive integer
- output: an integer
-possible path: perhaps a new array that is appended


A: Algorithm
def minSubLength(arr, positive_int)
  - intiallize variable counter and set to 0
  - initiallize variable check_value and set to an empty array
  - append arr[counter] to check_value
  - initiallize variable escape_value and set to 0
  create until loop with the condition that escape_value is >= to positive_int  or counter >= to the size of arr
    -iterate through check_value and each num
      - add the total of each num and set that value to escape_value
    end method
     append arr[counter] to escape_value
  end loop
  return escape_value

end

C: Code with intent
=end

require "pry"

def minSubLength(arr, positive_int)
  counter = 0
  check_value = []
  check_value << arr[counter]
  escape_value = 0
until escape_value >= positive_int || counter >= arr.size
  check_value.inject do |sum, num|
 escape_value += sum
  end
  counter += 1
  check_value << arr[counter]
end
escape_value >= positive_int ? escape_value = escape_value : escape_value = 0
end

p minSubLength([1,2,3,], 4)





def repeater(string)
  result = ''
  string.each_char do |char|
  string.chars.each
    result << char << char
  end
  result
end
repeater('Hello')

=begin
On line 8 the `repeater` method is called and the sting object `Hello` is passed to it as an argument.

This is a method definition for the `repeater` Method

On line 2 local variable `result` is initialized to the value ''

On line 3 the `each_char` method is call on the parameter `string` and a `do..end` block is passed to the `each_char` method call.  Within the block, each element in `string` is appended twice to the object that local variable `result` is referencing.  This is destructive/mutating method which changes the value of `result`.  Line 6 is the last evaluated line in this method so the object assigned to result is implciitly returned.

This method returns the string argument with each element repeated twice.  It outputs nothing.  The concept demonstrated is mutating methods.
=end


# https://fine-ocean-68c.notion.site/SPOT-Wiki-b58ff38ab84440bdb96797e59ee5fd34
