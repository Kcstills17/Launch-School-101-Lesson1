# frozen_string_literal: true

# 1. method that returns the sum of two numbers
#  define a method and name it sum
#  create two parameters within the method.
#  name the two method number1 and number2
# within the method add numer1 by number2.
# call the method sum

# 2. a method that takes an array of strings, and returns a string that is all those strings concatenated together

# create a method with the name string_concat
# create an array, name it strings, and give it string values.
# join each value together.
# return value
# def string_concat()
#   strings = ["dolly", "lola", "sakura", 'Megumin']
#
#  joined_string = strings.join
#  joined_string
# end
#
# puts string_concat

# 3. a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element.

#  #informal pseudocode
#  create method name
#  within, create an array and assign it
#  iterate through array with select
#  create conditional that filters out array index by whether even or odd
#  return odd indices numbers
#
#  formal pseudocode
#  START
#  define method
#  SET array to [1,4,7,2,5]
#  SET count to 0
#  SET new_array to array iteration.
#  iterate array with select
#  IF array at index count is odd
#  PRINT index
#  count += 1
#  new_array
#  END
#
#
=begin
def every_other_element
  array = [1, 4, 7, 2, 5]
  count = 0

  array.select do |num|
    new_array = (num if array[count].odd?)
    count += 1
    new_array
  end
end

p every_other_element

# 3. a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements
# at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. For instance:
# merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

#  Given a collection of two separate arrays.
#

def merge_two_arrays
  a = [1, 2, 3]
  b = [4, 5, 6]

  Array.new(a.size, b.size.max) { |i| [a[i], b[i]].compact }
end

p merge_two_arrays
=end

array = [1,2,3,4,5]

 new_array = array.map do |num|
num * 2
end

puts new_array
puts num
