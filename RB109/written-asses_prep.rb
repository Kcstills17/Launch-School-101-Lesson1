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
