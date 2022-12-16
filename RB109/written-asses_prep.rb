# Key Thing's to remember about written assessment

# 1. Answer the question. Be specific about what the question is asking. Do not add irrelevant details that do not
# add or provide needed information to the given question. This will also save you needed time

# 2. Do not describe code in bullet points/ outline/ list like detail
# this just does not show the nature of code in the best possible manner.
# The ideal way to descibe the code should be in paragraphs.

# 3. When describing a method,  always be concerned with what is being output and what is being returned.



# Examine the code example below. The last line outputs the String 'Hi' rather than the String 'Hello'.
# Explain what is happening here and identify the underlying principle that this demonstrates.

greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting

=begin
on line 3 the variable greeting is assigned to the string object representing 'Hello'
on line 5 a loop do is invoked and functions with the same scoping rules as a  block
on line 6 greeting is reassigned to the object representing the string "Hi"
on line 7 the loop breaks and no longer continues
on  line 8 the loop do reaches it's end

on line 11 greeting is printed and prints out 'Hi'  The reasoning for this is  because of block scoping rules
greeting is initially initiallized outside of the blocks scope. blocks have access to variables initiallized in an outer scope
greeting is then reassigned within the scope
Because greeting is initiallized outside of the blocking scope, then reassingned within it, we can print the result of that reassignment outside of our block on line 11.


This demonstrates local variable scoping. In particular in this case scoping within a block. Due to a block's ability to access variables outside of their scope this problem
functions as shown .

LS example to how this ideally should be answered

  D) The local variable greeting is assigned to the String 'Hello' on line 1.
  The do..end alongside the loop method invocation on lines 3 to 6 defines a block, within which greeting
  is reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument;
  since greeting is now assigned to 'Hi', this is what is output. This example demonstrates local variable scoping rules in Ruby;
  specifically the fact that a local variable initialized outside of a block is accessible inside the block.

My example checks the code as if it were a list. This is not a good way of describing what is happening within the actual code.
paragraphs are a better way for the info to flow and describe in better nature how and why the code is occuring.


=end

#What does this code Print and Why?

def replace(str, value)
  loop do
    break
  end
  str = value
end

greet = 'Hey!'
replace(greet, 'Hello')
puts greet


=begin

'Hey! should be printed because while within the method replace(str,value) str is being assigned to equal value
  this is not a mutating process and creates a copy of the original string object being passed through
  the local variable greet that is passed through the method replace and  represents the string object "Hey!" remains unaffected


LS provided answer

 the pertinent issues here are that the code prints Hey! since the replace method doesn't mutate the string passed in as its first argument.
On line 5, we reassign the 2nd argument to the str variable. However, reassignment of a variable never mutates
the referenced object, so it has no effect on the object referenced by the variable.
=end



=begin

14. Explain what this code returns and how the method works.
```
arr = [['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']]
arr.sort
```
The return value is `[["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]`. This demonstrates how the `sort` method works.

On line 64, the local variable `arr` is initialized to an array object.

On line 65, `sort` is invoked on the array object referenced by `arr`. To dive deeper, `sort` method utilizes the `<=>` spaceship operator to evaluate each element.
It compares each element in each array to the other elements of the other array.

`sort` uses the return value of the spaceship operator to order the array elements.  `sort` returns -1, 0, or 1 depending which operand is greater than or less than
 the other. For example 'a' <=> 'b' would return 1.  `sort` uses this return value to order the elements that it returns.

We first look at the first element 'a', the sub-arrays who have the first element 'a' will come before the arrays that have the first element `'b'`.  When sorting
arrays, we go element by element.  If all of the elements are identical up to a certain point, the shorter sub-array comes first.

## Thomas

The return value is `[["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]`. This demonstrates how the `sort` method works when invoked on a
nested array object whose elements are arrays.

On line 64, the local variable `arr` is initialized to an array object. On line 65, `sort` is invoked on the array object referenced by `arr`. To dive deeper, `sort`
method utilizes the `<=>` spaceship operator to compare each element in `arr`. Since the element in `arr` are arrays `<=>` compares the two arrays. It first compares each element in one array to the element in the other array with the same index value.

sort` uses the return value of the spaceship operator to order the array elements.  `sort` returns -1, 0, or 1 depending upon which operand is greater than or less
than the other. For example 'a' <=> 'b' would return 1.  `sort` uses this return value to order the elements that it returns.

If one element on the left is less than its corresponding element on the right, then `Array#<=>` will return -1. If one element on the left is greater than the element
on the right, then `Array#<=>` will return 1.

If the return value of the comparison between array elements with like indexes is 0 for all elements, then the array with more elements is deemed larger than the array
with less.


We first look at the first element 'a', the sub-arrays who have the first element 'a' will come before the arrays that have the first element `'b'`.  When sorting arrays,
we go element by element.  If all of the elements are identical up to a certain point, the shorter sub-array comes first.
=end



=begin
The Array#map method is used to iterate over a collection. This method always returns a new object and it does not mutate the orginal calling object.
 As map iterates over the collection, it uses the return value of the block to transform each element which is then added to the new collection.

For example, we have the code [1, 2, 3].map { |num| num * 2 }.
 Here we invoke the map method on the array collection [1, 2, 3]
  with one block parameter num. As the method iterates, each element is passed into the block
   and assigned to the local variable num in turn. Inside the block we multiply each element by 2,
    and add that result to the new collection. The return value of this operation is the new array collection [2, 4, 6].

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


30. What do lines 4 and 7 output and why?  What concepts are influencing this behavior?

  trees = ['PINE', 'birch', 'MAple', 'fIR', 'cEdaR']

  trees = trees.each { |tree| tree.downcase! }
  p trees

  trees = trees.map { |tree| tree.capitalize }
  p trees

  on line 99 `trees` is initialized to an array object value that contains a collection of string object values. `['PINE', 'birch', 'MAple', 'fIR', 'cEdaR']`.
  on line 101 `trees` is reassigned to the result of the `each` method being invoked upon the original object that `trees` is in reference to. Each item of the
  collection is passed into the  block once and assigned to the parameter `tree`. The `each` method functions by returning the original calling object and not taking
  into account the return value of the block. Within the block the mutating method `downcase!` is invoked on `tree`. This will mutate each object of the collection by
  changing each string value to a lowercase version of this.  The return value shall be `['pine', 'birch', 'maple', 'fir', 'cedar']` as the original object has been
  returned. However This object has been mutated as a result of the mutating method `downcase!`

  On line 102 the `p` method is invoked upon `trees` which will output `["pine", "birch", "maple", "fir", "cedar"]` due to the result of the `#downcase!` method and will
  return `['pine', 'birch', 'maple', 'fir', 'cedar']` as the `#p` method always returns the original calling object. On line 104  `trees` is reassigned to the return value
  of the `map` method being invoked upon the object that `trees` references. Each item of the collection is passed into the block and assigned to block parameter `tree`.
  the `map` method evaluates the return value of the block after each iteration. It adds each value to a new transformed collection in a new array object value. This
  collection will be of the same size as the original calling object collection. Within the block the `capitalize` method is invoked upon `tree`. This is a non mutating
  method that will create a copy of the original object with a new string value containing the first letter being capitalized. Despite this being non mutating. This will
  be the return value of the block at each iteration. These will be collected onto the new transformed collection within a new array. The return value of the block shall
  be `["Pine", "Birch", "Maple", "Fir", "Cedar"]`.

  On line 105 the `p` method is invoked upon `trees` which will output `["Pine", "Birch", "Maple", "Fir", "Cedar"]` and return `["Pine", "Birch", "Maple", "Fir", "Cedar"]`.
  Due to how the `p` method always returning the calling object.

  The concepts shown in this problem is a combination of pass by reference, variables as pointers, pass by value, and how `each` and `map` function. . with the first block
  the `each` method does not take into account the return value of the block. However the original object is changed due to the mutating `downcase!` method.  On line 104
  `trees` is then reassigned which then has `trees` pointing towards a different object than previously. This new reassignment is used in conjoinment with how the `map`
  method functions to create a new array with a new collection of values. Which these  values were created from a non mutating method in `capitalize` .




  =begin
## Local variable Scoping

This demonstrates Local variable scoping. When a variable is initialized in an outer scope then the scoping rules of a block permits the object that the variable references to be accessible within the block.

# a local variable initialize in the outer scope can be accessed within a block's inner scope.

This demonstrates Local variable scoping. When a variable is initialized in the scope of a block. The object that is being referenced by the variable is not accessible in an outer scope.

## #Each Method

This demonstrates how the `#each` method functions. The method does not evaluate the return value of the block and it will always return the original calling object.

# `do..end` block passed in as an argument.
# Each element from the calling collection/object is assigned to a block parameter

## #Map Method

This demonstrates how the `#map` method functions.  `map` performs transformation on each element of the original collection . `map` considers the return value of the block at each iteration. and the return values of the block are added to a new array object. This collection will be of the same length as the original object collection.  `map` will return the new array object.

# #each ignores the block's return value
# #map considers the block's return value for transformation.
# #select considers the truthiness of the block's return value

## #Select Method

This demonstrates how the `#select` method functions.  `select` considers the truthiness of the return value of the block. any value that is not `false` or `nil` is a truthy value. Any value that is truthy shall be added to a new object that is the same type as the original object. The length of the collection  can be any size from 0 to the size of the original collection based on how many return values are truthy.

`#select` evaluates the truthiness of the block's return value.  If the block's return value is "truthy", then the element during that iteration will be selected and placed in a new collection that is the same type as the original calling object.

## String#sort Method

This demonstrates how the `String#sort` method functions.  The method uses the spaceship `<=>` operator to compare 2 items from the original object’s collection. If the left hand element is smaller than the right hand element it will return `-1`, if they are they are equal they will return `0` and if the left hand element is greater it will return `1.` #The comparison is used from the ASCII chart which assigns all string elements to an integer position.#

String order is determined by a character's position in the ASCII table.
It is this ASCII character order that determines the result if we compare one ASCII character with another using the `String#<=>` method.

character by character sorting - compares character at corresponding indices from two string
If all characters at like-indices are the same then it will consider the string length

In this chart the order goes most punctuation and digits, uppercase letters, and then lower case letters. If two elements are of different types are compared  an `ArgumentError` will be raised and `nil` shall be returned. Each two elements of the original collection are compared and based on the return values from the `<=>` operators, a new sequential collection is returned within a new array object.

"aaa" vs. "aaaa"

String
arrays
integers
symbols

## Integer#sort Method

This demonstrates how the `integer#sort` method functions. The method uses the spaceship `<=>` operator to compare 2 items from the original object’s collection. If the left hand element is smaller than the right hand element it will return `-1`, if they are they are equal they will return `0` and if the left hand element is greater it will return `0.` If two elements are of different types are compared  an `ArgumentError` will be raised and `nil` shall be returned. Each two elements of the original collection are compared and based on the return values from the `<=>` operators, a new sequential collection is returned within a new array object.

## Array#sort Method

This demonstrates how the `Array#sort` method functions. The method uses the spaceship `<=>` operator to compare 2 items from the original object’s collection. If the left hand element is smaller than the right hand element it will return `-1`, if they are they are equal they will return `0` and if the left hand element is greater it will return `0.` (element-wise) Each comparison is made based off of the index position within each array. values at index `0` will be compared and then 1 , etc.  if two elements are of different types are compared  an `ArgumentError` will be raised and `nil` shall be returned. Each two elements of the original collection are compared and based on the return values from the `<=>` operators, a new sequential collection is returned within a new array object.

## any? Method

This demonstrates how the `any?` method functions. This method evaluates the return value of the block.  If a return value at any iteration is a truthy value then the iteration shall cease and `true` shall be returned. a truthy value is any value that is not `false` or `nil`. If every return value is falsy than `false` shall be returned.

## all? Method

This demonstrates how the `all?` method functions. This method evaluates the return value of the block. If a return value at any iteration is not truthy then `false` shall be returned. a truthy value is any value that is not `false` or `nil`.  If all values are truthy then  `true` shall be returned.
=end

# [1, 2, 3, 4, 5].all? do |num|
#   p num
#   num > 3
# end

# first, last = [*1..10].partition { |num| num > 5 }


# a local variable references an object
# an object is assigned to a variable
# an object is bound to a variable

# arr = [*1..10]
# p arr.partition.with_index { |_, i| i == 5 }

# [*1..10].partition { |num| num > 5 }
# p [*1..10].partition { |num| num > 5 }


# def add_name(arr, name)
#   arr << name
# end

# - `Array#<<` is being invoked on the array object referenced by local variable `arr` and the string referenced by local variable `name` is passed in as an argument.
# - `#<<` is a destructive method which mutates the calling object and appends the argument to the array calling array object.
# - Local variable `arr` will not reference an array with the value ["john", "mary" ...]



#What does the following code return? What does it output? Why? What concept does it demonstrate?

# ```
# def increment(x)
#   x << 'b'
# end

# y = 'a'
# increment(y)

# puts y
# ```

 On line 5 local variable `y` is initialized to the string object with the value `'a'`. On line 6 method `#increment` is invoked with the object that `y` references being passed into the argument and assigned to local method variable `x`. On lines 1-3 method definition `#increment`executes.
 The method definition for `increment` spans lines 1-3.

 On line `2` the mutating method `#<<` is invoked (`<<` is being invoked on the string object referenced by local method variable `x` and the string literal "b" is passed to it as an argument.)
 which will append the string object with value `b` to the calling object that `x` references. this is the last line of the method and will return `'ab`. On line 8 `#puts` is invoked upon the object that `y` references and will return `nil`  and will output `'ab'`. This is because the object value that `y` references was mutated within the method.

 # establishes an alias between the string referenced by `y` and the parameter `x` in the `increment` method definition.

# This demonstrates pass by reference and  object mutability. The value that `y` is in reference to has been modified within the method as a result of the `#<<` method. This is reflected with the outputof `puts y`

# def amethod(param)       # param = str
#   param += ' universe' # param = param + ' universe'
#   param << ' world'
# end

# str = 'hello'
# b = amethod(str)

# `#+` is invoked on the object referenced by `param` and `universe` is passed to it as an argument.
# `#+` is a non-mutating method which returns a new string, "hello universe".  The local method variable `param` is reassigned to this new string.

# x << 'b'

# - Mention the method being invoked and the argument passed it
# - Whether the method is mutating/non-mutating
# - Describe the new value or mutated value

# arr = [*1..10]

# arr.map do |num|
#   p num
#   arr.shift
# end

# def amethod(param)       # param = str
#   param += ' universe' # param = param + ' universe'
#   param << ' world'
# end

# str = 'hello'
# b = amethod(str)
