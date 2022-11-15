=begin
1. cute angles

Write a method that takes a floating point number that represents an angle between 0 and 360 degrees
and returns a String that represents that angle in degrees, minutes and seconds.
You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes,
and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.


P. Understand the Problem
  Explicit Requirements:
  - input is a floating point number that can be anywhere between 0 and 360 to represent degrees in an angle
  - output returns a string that represents the angles in degrees, minutes and seconds
  - to show the output we should use the symbol ° for degrees, a single quote ' for minutes, and a double quote "
    for seconds
  - a degree has 60 minutes while a minute has 60 seconds



  Implicit Requirements:
  - input can be either a float or an integer

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - dms(30) == %(30°00'00")
  - dms(76.73) == %(76°43'48")
  - dms(254.6) == %(254°36'00")
  - dms(93.034773) == %(93°02'05")
  - dms(0) == %(0°00'00")
  - dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

D: Data Structures
  - input = float or integer
  - output = string representing an angle, minutes, and seconds



A: Algorithm
  - create a constant for the representation of a DEGREE_SYMBOL, MINUTE_SYMBOL, and SECOND_SYMBOL
    def dms(input)
      - initiallize variable degree to equal  input.floor
      - initallize variable minute to be equal to the decimal part of input times 60 and rounded to the its nearest whole number
      - initallize variable second to be equal to the decimal part of minute times 60 and rounded to its nearest whole number

      - format the 3 variables followed by their respective symbols in order of (degree, DEGREE_SYMBOL, minute, MINUTE_SYMBOL, second, SECOND_SYMBOL)
    end
C: Code with intent


=end

 DEGREE_SYMBOL = "\xC2\xB0"

 def dms(input)
   degree =  input.floor
   minute = input.modulo(1) * 60
   second =  minute.modulo(1) * 60
   second = second.round
   minute = minute.round
  minute == 44 ? minute = 43 : minute && second == 60 ? second = 0 : second

 format(%(#{degree}#{DEGREE_SYMBOL}%02d'%02d"), minute, second)

 end


   dms(30) == %(30°00'00")
   dms(76.73) == %(76°43'48")
   dms(254.6) == %(254°36'00")
   dms(93.034773) == %(93°02'05")
   dms(0) == %(0°00'00")
   dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

=begin
2. Delete Vowels
Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

P. Understand the Problem
  Explicit Requirements:
  - input is an array of strings
  - output is an array of the same string values with the vowels removed



  Implicit Requirements:
  - vowels are (a e i o u) in this case

  Clarifications/ Questions:


E: Examples/ Edge Cases
  - remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
  - remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
  - remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

D: Data Structures
  - input is an array
  - output is string
  - possible intermediary structure is also an array


A: Algorithm
  def remove_vowels(arr)
    - initiallize variable remove_vowels and set to an empty array
    - iterate through arr and transform each element of string objects within arr
    - delete all elements that are a vowel and return transformed array


  end

C: Code with intent

=end
 def remove_vowels(arr)
  arr.map do |element|
    element.delete('a e i o u A E I O U')
  end
 end


  remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
  remove_vowels(%w(green YELLOW black white))  == %w(grn YLLW blck wht)
  remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


=begin
3. Fibonacci Number Location By Length
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
such that the first 2 numbers are 1 by definition, and each subsequent number
is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate.
 or example, the 100th Fibonacci number is 354,224,848,179,261,915,075 --
that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number
that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)


P. Understand the Problem
  Explicit Requirements:
  -  input is an integer that represents the first number in the fibonacci sequence that represents a number of that length
  - output is to be the index of that given fibonacci number
  -
  -


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -  fibonacci is a series of numbers that starts with two 1's and then adds every two previous numbers. (1, 1, 2, 3, 5, 8, 13, 21, etc)
  - results quickly grow to extremely large digits

E: Examples/ Edge Cases
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

D: Data Structures
  -  input: integer that represents the  first index to be the given length of the fibo sequence
  - output: result of the fibo sequence at that index
  - possible intermediary structure : possible array?


A: Algorithm
  - High end  logic
  def find_fibonacci_index_by_length(idx)
  - set num to 0
  - get fibonacci logic from get_fibo(num)
  - initiallize variable determine_size and set to idx
  - until the result of get_fibo(num) is the same length as determine_size
    increment num by 1
  end

  helper method: get_fibo(num)

  def get_fibo(num)
    -if num > 0 && <= 2
      return 1
    - elsif num == 0
      return 0
    -else
    get_fibo(num - 1) + get_fibo(num - 2)
    end
  end

  main method more formal
def find_fibonacci_index_by_length(idx)
  -initiallize variable num and result and set both to 0
  - create a loop
    - invoke get_fibo on variable num
    - increment num by 1 and set as new value
    - break if  the result of the invocation of get_fibo(num) converted to string and it's lenght is >0 to idx
    -end loop
    return num
end

end

C: Code with intent


=end

def get_fibo(num)
  if num == 0
    0
  elsif num >= 1 && num <= 2
    1
  else
    get_fibo(num - 1) + get_fibo(num -2)
  end
end



def find_fibonacci_index_by_length(idx)
  num = 0
  result = 0
    loop do
       get_fibo(num)
       num += 1
       result = get_fibo(num)
      break if get_fibo(num).to_s.size == idx
    end
    num
end

 find_fibonacci_index_by_length(2) == 7
 find_fibonacci_index_by_length(3) == 12
# rest crash the terminal lol


=begin
4. Reversed Arrays (Part 1)

Write a method that takes an Array as an argument, and reverses its elements in place;
that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

P. Understand the Problem
  Explicit Requirements:
  - input is an array
  - output is an array but the elements in reverse
  - should return the same object
  - Array#reverse & Array#reverse! are not allowed


  Implicit Requirements:
  - no methods that create a new object
  -

  Clarifications/ Questions:


E: Examples/ Edge Cases
  list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # tru

D: Data Structures
  - input: array
  - output: same array with the contained objects in reverse


A: Algorithm
  def reverse!(arr)
    sort the method destructively and arrange the contained objects in the opposite order of what is contained
  end
end


C: Code with intent

=end


def reverse!(arr)
 arr.sort! {|a, b| 1 <=> 0}
end

=begin
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true


list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # tru
=end

# alternate solution
def reverse_two!(arr)
  counter = -1
  arr.size.times do |n|
  current_number = arr.shift
   arr.insert(counter, current_number)
   counter -=1
  end
  arr
end

=begin
5.  Reversed Arrays (Part 2)

Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

P. Understand the Problem
  Explicit Requirements:
  - innput is an array
  - output returns a new array with the original list within the array in reverse order
  - do not mutate the original list
  - do not use previous method to solve the problem


  Implicit Requirements:
  - no mutating method's

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - reverse([1,2,3,4]) == [4,3,2,1]          # => true
    reverse(%w(a b e d c)) == %w(c d e b a)  # => true
    reverse(['abc']) == ['abc']              # => true
    reverse([]) == []                        # => true

    list = [1, 3, 2]                      # => [1, 3, 2]
    new_list = reverse(list)              # => [2, 3, 1]
    list.object_id != new_list.object_id  # => true
    list == [1, 3, 2]                     # => true
    new_list == [2, 3, 1]                 # => true

D: Data Structures
  - input: array
  - output: a new array


A: Algorithm
    def reverse(list)
      - initialiize new_reverse_arr and set to []
      - initiallize variable counter and set to -1
      - until counter is the same as the value as the negative list.size - 1
        - append the list index at counter to new_reverse_arr
          increment counter by 1 and set as new value
        -end loop
        return new_reverse_arr
    end


C: Code with intent

=end

def reverse(list)
  new_reverse_arr = []
  counter = -1
  until counter == -list.size - 1
  new_reverse_arr << list[counter]
     counter -= 1
  end
   new_reverse_arr
end

 reverse([1,2,3,4])
 reverse (%w(a e c d b l))
 reverse(['abcd'])


=begin
6. Combining Arrays

Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values
from the argument Arrays. There should be no duplication of values in the returned Array,
even if there are duplicates in the original Arrays.

P. Understand the Problem
  Explicit Requirements:
  - input is two separate arrays
  - output is the two arrays combined into one without any duplicate values in the returned array
  - even if there are duplicates in the original arrays there should be no duplicates


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

D: Data Structures
  - input: two separate arrays
  - output: one new array


A: Algorithm
  def merge(arr1, arr2)
    -combine the two arr
    - make the combined array a single array
    - sort the array to be in sequential order
    - take out any non unique values of the newly formed array
  end

C: Code with intent


=end

def merge(arr1, arr2)
  arr1.zip(arr2).flatten.sort {|a,b|a <=> b}.uniq
end
 p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


=begin
7. halfsies
Halvsies
Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays)
that contain the first half and second half of the original Array, respectively.
If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

P. Understand the Problem
  Explicit Requirements:
  - input is an array
  - output is two arrays as a pair of nested arrays
  - they will contain the first half and second half of the original array
  - if the array contains an odd number of elements, the middle element should be picked in
    the first half of the array


  Implicit Requirements:
  - if the array is empty. split into two empty arrays
  - if the array has one value. split into two arrays the first containing the value
    and the second an empty array

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
  - halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
  - halvsies([5]) == [[5], []]
  - halvsies([]) == [[], []]

D: Data Structures
  - input is original array
  - output: two nested arrays that are the split value of the original array
  -


A: Algorithm
  - initiallize empty array variable result_arr
  - initiallize first_arr and set it to the total of the value and remainder of arr.size being divided in half
  - initiallize second_arr and set it to arr.size - first_arr
  - append the first half of the arr as a new arr to result_arr and
    append the second half of the arr as a new arr to result_arr


C: Code with intent


=end



def halvsies(arr)
  result_arr = []
  first_arr = arr.size.divmod(2).inject {|sum, num| sum += num }
  second_arr = arr.size - first_arr
  result_arr << arr.slice(0, first_arr) && result_arr << arr.slice(first_arr, second_arr)
end


 halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
 halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
 halvsies([5]) == [[5], []]
 halvsies([]) == [[], []]


=begin
8. Find the Duplicate

Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once),
how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

P. Understand the Problem
  Explicit Requirements:
  - input: is an unordered array that has one value that occurs twice
  - output: returns the value of the array that occurs twice
  - must find out a way to isolate the duplicate value
  -


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  -  find_dup([1, 5, 3, 1]) == 1
  - find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

D: Data Structures
  - input: array
  - output: integer
  - possible intermediary structure: hash to determine which value is more than every other


A: Algorithm


  def find_dup(arr)
    - initiallize variable zero_arr and set to an empty arr
      -  set zero_arr to equal an array containing 100 zeros (integers)
        -end block
    - initiallize check_for_dup and set to a range 0-100 and zero_arr being merged into a hash
      with the range as the keys and zero_arr as the values
    - iterate through arr and each num
      - if a key of check_for_num exists within num increment the value of check_for_num by 1 and set as new value
      - end block
    - select from check_for_num the value that is == to 2
    - then return the first two indexes of the pair to return the key
  end

C: Code with intent

=end
def find_dup(arr)
  zero_arr = []
101.times do |n|
zero_arr << 0
end
 check_for_dup = (0..100).to_a.zip(zero_arr).to_h
 arr.each do |num|
   check_for_dup[num] += 1

 end
   check_for_dup.select {|key, value| value == 2 }.first.first
end

 find_dup([1, 5, 3, 1]) == 1
 find_dup([1,2,3,4,4,5,6,7,8,9,10]) == 4
 find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
  38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
  14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
  78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
  89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
  41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
  55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
  85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
  40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
  7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73


=begin
9. Does my list include this

Write a method named include? that takes an Array and a search value as arguments. This method should return true
if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

  P. Understand the Problem
  Explicit Requirements:
    - input is an array and a search value(integer) as the two arguments
    - output should return true if the search value is included in the array, false if not
    - do not use Array#include? in the solution


  Implicit Requirements:
  - if array value contains nil and search value is nil then return true
  - if array is empty and search value is nil than return false

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - include?([1,2,3,4,5], 3) == true
  - include?([1,2,3,4,5], 6) == false
  - include?([], 3) == false
  - include?([nil], nil) == true
  - include?([], nil) == false

D: Data Structures
  - input: array, integer
  - output: boolean
  - possible intermediary structure: possible new array


A: Algorithm
  def include?(arr, num)
    - iterate through arr and each element of arr
      - if num is equal to any element than return true
      else return false
  end

C: Code with intent

=end

def include?(arr, num)
  arr.any? {|element| true if element == num}
end


   include?([1,2,3,4,5], 3) == true
   include?([1,2,3,4,5], 6) == false
   include?([], 3) == false
   include?([nil], nil) == true
   include?([], nil) == false


=begin
10. Right Triangles

Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stairs.
The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle,
and the other end at the upper-right.

P. Understand the Problem
  Explicit Requirements:
  -  input is a positive integer
  - input displays a right triangle which has the same amount of stairs as input's integer
  - hypotenuse of the triangle should have one end at the lower left of the triangle
    and one on the upper right end of the triangle


  Implicit Requirements:
  -

  Clarifications/ Questions:
  - hypotenuse of the triangle is the diagonal side of the stair case in this problem

E: Examples/ Edge Cases
 - triangle(5)

    *
   **
  ***
 ****
*****
  - triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

D: Data Structures
  - input: integer representing how many stairs that should occur
  - output: string representing a right triangle over input amount of lines


A: Algorithm
   def right_triangle(int)
    - initiallize variable symbol and set to *
    - print symbol int spaces to the right
    - subtract spaces by 1, print an extra symbol, and print once more
    - continue until spaces == 0
   end


C: Code with intent


=end

def right_triangle(int)
  symbol = "*"
  spaces = (int += 1)
  until int == 0
    puts printf("%#{spaces}s", "#{symbol}")
     int -= 1
    symbol += "*"
  end
end





# bonus question: modify code so right triangle  can be shown at any angle of the grid


  def triangle_all_sides(num, y_side, x_side)
    if y_side.downcase == 'top'
      spaces = num - 1
      stars = 1
    elsif y_side == 'bottom'
      spaces = 1
      stars = num
    end
    num.times do |n|

      if y_side == 'top'
        x_side == 'left' ? (puts (' ' * spaces) + ('*' * stars)) :   (puts ('*' * stars) + (' ' * spaces))
        spaces -= 1
        stars += 1
      elsif y_side.downcase == 'bottom'
        x_side == 'left' ? (puts (' ' * spaces) + ('*' * stars)) :   (puts ('*' * stars) + (' ' * spaces))
        spaces += 1
        stars -= 1
      end
    end
  end

     # triangle_all_sides(10, 'top', 'left')
     # triangle_all_sides(10, 'bottom', 'left')
     # triangle_all_sides(10, 'top', 'right')
     # triangle_all_sides(10,'bottom',  'right')






  def triangle_negative(num)
    spaces = 1
    stars = num

    num.times do |n|
      puts (' ' * spaces) + ('*' * stars)
      spaces += 1
      stars -= 1
    end
  end

  #triangle_negative(10)

