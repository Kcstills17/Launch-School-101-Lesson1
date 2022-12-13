# nested_array = 10.times.map { 2.times.map { [*0..50].sample } }
# p nested_array

# p (1..20).to_a
# p [*1..20]
# nested_arr = [[38, 16], [28, 39], [40, 5], [24, 19], [27, 19], [35, 14], [8, 37], [16, 47], [47, 46], [24, 28]]

# Select the numbers from the sub-arrays that are less than 20

# less_than_twenty = nested_arr.flat_map do |sub_arr|
#   sub_arr.select do |num|
#     num < 20
#   end
# end

# less_than_twenty = []

# nested_arr.each do |sub_arr|
#   sub_arr.each do |num|
#     less_than_twenty << num if num < 20
#   end
# end

# p less_than_twenty








# # def say_hello
# #   puts 'Hello, World'
# # end

# # # 5.times { say_hello }


# # What will this output?  How would you fix this code?

# animal = "cat"

# if animal == "dog"
#   p "I have a golden retriever"
# else
#   p "I don't have a dog"
# end


# =begin
# The  output shall be `"I have a golden retriever"`. the reason being
# is on line 12 with the `if` condtional statement we have assignment taking
# place with `"dog"` being assigned to the local variable `animal`. So
# When the if statement is trying to check whether `animal` is equal to `"dog"` or not. That reassignment will always make the condition evaluate  as `true`. To fix this issue on line 12 replace the `=` assignment operator with the
# `==` equality operator.

# ```ruby
# animal = "cat"

# if animal == "dog"
#   p "I have a golden retriever"
# else
#   p "I don't have a dog"
# end
# ```

# =end

# https://launchschool.com/lessons/3ce27abc/assignments/cd8e4629

# https://code.visualstudio.com/docs/datascience/jupyter-notebooks

# ```ruby
# arr.each do |element|
#   puts element.foo
# end
# ```

# This paragraph talks about the `each` method being
# called by the array referenced by `arr` in the above
# code. It invokes the block for each element, passing
# that element to the block as an argument. Within the
# block, the element is known by the parameter name
# `element`, and the block uses the `puts` method to
# print the value of `element.foo`.

=begin

What does the following code return? What does it output? Why? What concept does it demonstrate?
=end


# a = 5.2
# b = 7.3
# a = b
# b += 1.1

# What is `a` and `b`? Why?

# any?
# all?
# each_with_object(
# each_with_index
=begin
[1,2,3].each_with_index do |num, idx|
  p "#{idx} --> #{num}"
end

`each_with_index` is called on the array object `[1,2,3]` and a `do..end` block is passed as an argument.  Each number in the calling collection is assigned to the block parameter `num` and its corresponding index position is assigned to the block parameter `idx`.  Within the block, the current index position is output next to its associated number using string interpolation.


[10, 11, 12].all? { |x| x > 11 }


https://regex101.com/
=end

=begin
What does the following code return? What does it output? Why? What concept does it demonstrate?

=end

# array = [1, 2, 3, 4, 5]

# array.select do |num|
#     puts num if num.odd?
#   end

#   https://docs.google.com/document/d/16XteFXEm3lFbcavrXDZs45rNEc1iBxSYC8e4pLhT0Rw/edit#
=begin
What does the following code return? What does it output? Why? What concept does it demonstrate?


a = "hello"

 [1, 2, 3].map { |num| a }

on line 135 local variable `a` is initialized and assigned the string
object value `'hello'`. On line 137 `#map` is invoked upon the array object `[1, 2, 3]` that contains a collection of integer object values. each item of the collection is passed into the block once and assigned to the the local block parameter `num`. `#map` evaluates the return value of the block at each iteration. Based on that return value it will add a new transformed collection onto a new array object of the same size as the original collection.  Within the block the value that `a`  is in reference to is returned.  This is transformed onto a new array and the return value shall be ['hello', 'hello', 'hello']. Nothing is output.

  The concept that is demonstrated here is how `#map` functions. It evaluates the return value of the block at each iteration and then returns a new array containing a transformed collection of the same size as the original object being called.

  =end
=begin
What does the following code return? What does it output? Why? What concept does it demonstrate?
=end

[1, 2, 3].any? do |num|
  num > 2
end

=begin
The `#any?` method is invoked on an array object with a collection of integer objects.  A `do..end` block is passed to the `#any?` method.  Each integer object in the original collection will be passed into the block in turn, and be assigned to the block parameter `num`.  The `>` operator compares two integer objects and if the integer object on the left of it is greater, will evaluate as true.  The `#any?` method looks at the truthiness of the return value of the block and will return the boolean `true` if any of the block return values evaluate as true.
This example demonstrates how the `#any?` method works.  The return value of the block is being considered and if any of the return values evaluate as true, the boolean `true` will be returned.
=end

=begin
What does the following code return? What does it output? Why? What concept does it demonstrate?
=end

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
array << pair.last
end

=begin
on line 162 the `#each_with_object` method is invoked upon a hash object `{a: 'ant', b: 'bear', c: 'cat'}` Which contains three key: value pairs. Each key is a symbol object value  and each value is a string object value.  A new object is created within the block and is an **empty** array object `[]`. Each key-value pair is passed into the block once and assigned the block parameter value   `pair`. The new array object is passed into  the block as `array`. `Each_with_object` will not take into account the result of the block and return the object that has been created within the block. Which is `array`. Within the block `array` is appended the return value of `#last` being invoked upon `pair`. This will take the last value based on its index in a collection and return that value on each iteration of the block. In this case that will be our value section of the pair. Which will be the string objects within our original hash object.

The return value shall be the object `array` is in reference to `['ant', 'bear', 'cat']`. There shall be no output. The concept that is demonstrated is how   #each_with_object functions. How it creates a new specified object that is passed in as an argument. And then will return that new object instead of the original caller similar to how `#each` will function.

=end

=begin
https://www.codewars.com/kata/55703a2a52dd10501c000131/train/ruby

You are a lonely hobbit, and you've been given a manifest of all the residents in this side of the country. The manifest is an array of hashes,
that have the form: {name: 'string', race: 'string', home: 'string'}

You want to find all of the other hobbits! Your task is to return an array from a given manifest that contains all of the potential
halflings in the list. From your experience you know that hobbits don't always follow the rules, and some may have entered their race
under their home and vice versa. You also know that some hobbits will refer to themselves as halflings, and that popular homes for hobbits
include the shire, south farthing, and hobbiton.

TLDR; For a given array of hashes of the form {name: 'string', race: 'string', home: 'string'}, return an array of all the objects that have
the words halfling,hobbit,shire,farthing, or hobbiton anywhere within the race or home field.

Goal: intake an array of hashes and return an array of all objects that have the words halfling,hobbit,shire,farthing, or hobbiton anywhere within
 the race or home field



 P. Understand the Problem
  Explicit Requirements:
  -

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




=end

def find_hobbits_in(arr)
selected_hash = arr.select do |hash|
   hash.any? do |k, v|

    p v[0][0][0]
   end
end

end


manifest = [
  { name: 'Aragorn', race: 'Human', home: 'Kingdom of Men' },
  { name: 'Bilbo', race: 'Hobbit', home: 'The Shire' },
  { name: 'Tom Bombadil', race: nil, home: 'The Forest' }
]

p find_hobbits_in(manifest) #== { name: 'Bilbo', race: 'Hobbit', home: 'The Shire' }
