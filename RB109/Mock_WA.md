```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

On line 1 the local variable `arr` is initialized to the array object value containing a collection of integer object values `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On line
3 a block is invoked.
On line 3 the `#select`  method is invoked upon `arr` and each item of `arr` is passed into the block and assigned to the local block parameter `n`. the `#select` method
evaluates all truthy values based on the result of the block. And each item from that evaluation that is truthy will be appended to a new collection on a new data type
that is the same type as the original calling object. In this case it is an array. Within the block the `#odd?` method is invoked upon `#n` and will  choose all values in this
case that evaluate to true or are odd numbers. The return value shall be  `[1, 3, 5, 7, 9]` . There is n output.

The concept demonstrated is how select functions and how it evaluates the return value of a block for all truthy values. Then takes any truthy values (or none if there are none)
and adds them to a new data type of the same kind as the calling object.



#2

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
end
p new_array
```

On line 1 local variable `arr` is iniitalized  to an array object value containing a collection of integer object values  `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On line 3 local variable `new_array`
is initialized to the return value of the `#map` method being invoked upon `arr`. This will pass each item from the object that `arr` references into the block one time. the
`#map` method evaluates  the return value of the block and based on that return value will transform these values onto a new collection onto a new array object value. This
collection will be of the same size as the original collection. On line 3-5 a block is invoked.  On line 3 `n` is compared to `1` using the `#>` method. This will return a boolean value of true every time
the left hand value is a greater integer value than the right hand value and `false` otherwise. The return value shall be `[false, true, true, true, true, true, true, true,
true, true ]` . The boolean values returned in the block makeup the new collection on the new array. On line 6 th `#p` method is invoked on `new_arr` which will output
`[false, true, true, true, true, true, true, true, true, true ]` and will return the same object `[false, true, true, true, true, true, true, true, true, true ]` as the `#p`
method will return the calling object and output the value of the object being called.

This demonstrates the concept of `#map` and how it evaluates the return value of the block, takes those values and creates a new transformed collection onto a new array
of the same size as the original object.




#3

#What does the following code return? What does it output? Why? What concept does it demonstrate?

```
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

On line 1 a hash object value that contains three key- value pairs. The keys being 3 symbol object values `a:`. `b:`, `c:` and the values being 3 string object values
`'ant'`, `'bear'`, `'cat'`. On lines 1-3 a block is invoked. On line 1 the `#all?` method is invoked upon the hash object value and each key symbol object value is
passed into the block once and assigned to the local block parameter `key`. And each string object value  is passed into the block once and assigned to
the local block parameter `value`. the `#all?` method evaluates the return value of the block for truthy values. if any value is not a truthy value  then the boolean value  `false` will be returned. Else the boolean `true`
will be returned. On line 2 the `#length` method is invoked upon the  value that `value` references and will return an integer object value representing how many characters are
within the string object value. It is then compared using the `#>=` method which evaluates whether the left hand element is either equal or greater than the left hand
element and will return `true` if so and `false` otherwise. `true` shall be returned as each iteration of `value`  will  evaluate as `true`. There is no output in the code.

The concept demonstrated is how the `#all?` method functions, how it evaluates the return value of the block and it will return true only if at each iteration, the value
is truthy or evaluates to true.



#4

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

on line1 there is  a hash object value  of key-value pairs containing 3 symbol object values `a:`, `b:`, `c:` as keys and 3 string object values as `'ant'`, `'bear'`, `'cat'`
as values. The `#each_with_object` method is invoked upon the hash object value.  A new object is created through `({})` which creates a new empty hash object value.
and each key of the hash is passed into the block as local block parameter `key`. Each value of the hash is passed in the block once as local block param `value`. The new
empty hash object value is passed into the block as `hash`. the `#each_with_object` method does not take into account the return value of the block and will instead
return the new object object value. On line 2 the new hash object value is created keys and values through the setter method `#hash[value] = key` this will cause us to return
`{ "ant" : a, "bear": b, "cat": c }` . This as a result of the setter method which allowed us to set a key and value for each iteration. 
is no output in this code

The concept demonstrated is how the `#each_with_object` method functions and returns the new object value instead of the original object like in `#each`



#5

#What does the following code return? What does it output? Why? What concept does it demonstrate?

#What are a, b, and c? What if the last line was c = a.uniq!?

```
a = [1, 2, 3, 3]
b = a
c = a.uniq
```

On line 1 local variable `a` is initialized to an array object value that contains a collection of integer object values. `[1, 2, 3, 3,]`. On line 2 local variable `b` is
initialized to the same object that `a` references. On line 3 `c` is initialzied to the return value of the `#uniq` method being invoked upon the object that `a` references.
this is a non mutating method that will create a copy of the original object but with only unique values. `[1, 2, 3]`. that is what `c` points towards while `a` and `b` point
towards `[1, 2, 3, 3`]. There are no return values or output in this code. If the last line were `c = a.uniq!`  that mutating method will cause all 3 variables to point
towards the same mutated object `[1, 2, 3,]`.

This demonstrates variables as pointers and how while two variables are pointing to the same object. each can reflect the same result if there is a mutation, and reflect
different values if there is none




#6

#What does the following code return? What does it output? Why? What concept does it demonstrate?

#What values do s and t have? Why?
```
def fix(value)
 value[1] = 'x'
 value
end

s = 'abc'
t = fix(s)
```

On line 6 local variable `s` is initialized to the string object value `'abc'`. On line 7 local variable `t` is initialized to the return value of the `#fix` method being
invoked witht `s` being passed into the method as an argument and assigned to local block parameter `value`. On lines 1-4  the method definition `#fix` executes. On line 2 the `String#[]` method is invoked on
local block parameter `value` and accessed the index of the object that value references at index `1`. This value at index `1` is assigned  to the string object value `'x`.
On line 3 `value` is the last line. This shall be the return value as it is implicitly returned within the block as `'axc'`.  Nothing is output within the code and there
are no other return values. the object value that both `s` and `t` are in reference to is the string object value `axc `. They point to the same object and this object
has been modified within the method.

This demonstrates object mutating. The results of the `#String[]=` method mutated the original object value passed in. Which is reflect in both variables `s` and `t`.




#7

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```


On line 5 local variable `a` is initialized to the string object value `'hello'`. On line 6 method `#a_method` is invoked and the object value that `a` references
is passed into the method as an argument and assigned to local block parameter `string`. ON line 1-3 method definition `#a_method`  executes. On line 2  the mutating method `<<` is invoked which will append the
string object value `'world` to the object value  that local block parameter `string` references. This will return  `'hello world' ` as the passed in argument value `'hello`
is mutated to have `world` appended to it. On line 8 the `#p` method is invoked upon the object that `a` references. this will output and return `'hello world`. This is
the case because object that `a` is in reference to was modified within the method definition `#a_method`. And this returned because the `#p` method returns the calling object.

This demonstrates object mutating. The passed in object value is modified due to the effects of the `#<<` method and this is reflects with the output and return value of
`p a `





#8

#What does the following code return? What does it output? Why? What concept does it demonstrate?

#What values do s and t have? Why?
```
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

On line 6 local variable `s` is initialized to the string object value `'hello'`. On line 7 local variable `t` is initialized to the return value of the `#fix` method
being invoked with the object that `s` references being passed in to the method as an argument and assigned to local
method parameter `value`. On lines 1-4 the `#fix` method definition executes. On line 2 `value` is assigned the return value of the mutating `#upcase!` method being
invoked upon `value`. On line 3 the mutating `#concat` is invoked upon `value`. This will return `'HELLO!'` as the passed in object value was modified two separate times
due to the mutating methods. This is also the last thing in the method and therefore is returned. There is no output in the code.  the object that both `s` and `t`  references
are both `HELLO!`as both `#upcase!` and `#concat!` modify the orignal object that is in reference .`

What is demonstrates is object mutating. As the passed in object value is modified twice due to the two mutating methods `#upcase!` and `#concat`.




#9

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```

On line 1 local variable `a` is initialized to  the string object value `'Hello'`. On line 2 local variable `b` is initialized to the same object that `a` references.
On line 3 `a` is reassigned to the string object value `'Goodbye'`. On line 4 the `#puts` method is invoked upon `a` which will output `'Goodbye'` and will return `nil`
due to `#puts` always returnng `nil`. On line 5 `#puts` is invoked on `b` and will output `'Hello'` and will return `nil`.

This demonstrates variables as pointers and due to `a` and `b` both initially pointing towards the same object. However once `a` is reassigned they no longer point towards
the same object and the output reflects this.



#10

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
a = "hello"

[1, 2, 3].map { |num| a }
```

On line 1 local variable `a` is initialized to string object value `'hello'`. On line 3 a block is invoked. On line 3 the `#map` method is invoked upon  an array object  value containing a
collection of integer object values `[1, 2, 3]`.  the `#map` method evaluates the return value of the block. based on that return value at every iteration it will add the value
as part of a transformed collection onto a new array object value. The new collection will be the same length as the calling object.  Within the block each item of the calling array object is passed into the block and assigned to local block
parameter `num`. in the block `a` is the only line of code. this will return the value that `a` is in reference to `'hello'` at each iteration. `'hello'` will be added onto the
new transformed array at every iteration as well. The return value is the new array `['hello, 'hello', 'hello']`. there is no output in this code .

What is demonstrated is how the `#map` method functions. How it evaluates the return value of the block at each iteration. Takes each value and adds to a new
transformed collection onto a new array object value. And it will have the same amount of items as the original calling object


#11

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
[1, 2, 3].each do |num|
  puts num
end
```

On line  1-3 a block is invoked. On line 1 the `#each` method is invoked upon an array object value containing a collection of integer object values `[1, 2, 3]`. Each
item of the collection is passed once into the block and assigned to local block parameter `num`.  On line 2  the `#puts` method is invoked upon `num`. this should
return `nil` as puts returns `nil` however, the `#each` method does not evaluate the return value of the block. It returns the original object. so `[1, 2, 3]` is what is returned.
`#puts` will output `num` at each iteration `1`, `2`, `3`.

This demonstrates how the `#each` method functions. how it returns the original calling object and does not take into account the return value of the given block.


#12

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
              n + 1
            end
p incremented
```

On line 1 local variable `arr` is initialized to an array object value containing a collection of integer object values `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
on line 3 local variable `incremented` is initialized to the return value of the `#map` method being invoked upon the object value that `arr` references. On lines 3-5
a block is invoked. On line 3 each item from the object that `arr` references is passed into the block once and assigned to the local block parameter `n`.
the `#map` method evaluates the return value of the block. the return value at each iteration is added to a new transformed collection onto a new array object value. This
collection will be of the same length as the original calling object. On line `4` the `#+` method is invoked which adds the two values on each end of the operator. After
each iteration the return value is a new array object value containing new integer object values.  `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`. On line 6 the `#p` method is invoked
on  incremented which will output `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]` and return `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`. as the `#p` method returns the calling object


What is demonstrated is how the `#map` method functions. How it evaluates the return value of the block at each iteration. Takes each value and adds to a new
transformed collection onto a new array object value. And it will have the same amount of items as the original calling object




#13

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
a = 4

loop do
  a = 5
  b = 3

  break
end

puts a
puts b
```



On line 1 local variable `a` is initialized and assigned to integer object value `4`. On lines 3-8 a block is invoked. On line 3 the `#loop` method is invoked and a `do..end`
block is passed into the block as an argument. On line 4 `a` is reassigned to the integer object value `5`. On line 5 local block parameter `b` is initialized to the integer
object value `3`. On line 7 the condition to terminate the loop is given with `break`. `nil` will be returned as `break` is implicitly returned within the  block and holds no
value.  On line 10 `#puts` is invoked on `a` which will output `5` and return `nil` due to `#puts` always returning `nil`. On line 11 an error will be raised for undefined
local variable. as `b`  cannot be accessed in this outer scope.

This demonstrates local variable scoping. `b` is initialized within a block but then the object that it references was attempted to be reached in an outer scope. Block scoping rules
state that a block has access to variables initialized within an outerscope. But variables intialized in a block are not accessible in an outer scope.


#14

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```

on line 1 local variable `a` is initialized and assigned to string object value `'Bob`. On lines 3-5 a block is invoked. On line 3 the `#times` method is invoked upon the
integer object value `5`. An index based integer representing the iterations within the block is passed into the block and assigned to local block variable `x`. On line
4 `a` is reassigned to the string object value `'Bill`.  The return value is  `5` as the `#times` method will always return the calling object. On line 7 the `#p` method is invoked upon  the object that  `a` references. this will output `'Bill'` and return `'Bill'`.  This because the `#p` method always returns the calling object and the object that `a`references was reassigned within the scope of the block.

This demonstrates local variable scoping. The reason when the object that `a` references  shows a different output is only because of the rules of block scoping here. `a` is
initialized in an outer scope which then gives the block access to reach it and then reassign the value of `a`.



#15

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
def increment(x)
  x << 'b'
end

y = 'a'
increment(y)

puts y
```

On line 5 local variable `y` is initialized to the string object value `'a'`. On line 6 method `#increment` is invoked with the object that `y` references being passed into the
argument and assigned to local block variable `x`. On lines 1-3 method definition `#increment`executes. On line `2` the mutating method `#<<` is invoked which will append the
string object value `b` to the left hand element object that `x` references. this is the last line of the method and will return `'ab`. On line 8 `#puts` is invoked upon the object that `y` references and will return `nil` due to  `#puts`always returning `nil` and will output `'ab'`. This is because the object value that `y` references was mutated within the method.

This demonstrates object mutating. The value that `y` is in reference to has been modified within the method as a result of the `#<<` method. This is reflected with the output
of `puts y`

#16

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1
puts arr2
```

On line 1 local variable `arr1` is initialized to an array object value containing a collection of string object values `["a", "b", "c"]`. On line 2 `arr2` is is initialized
to the return value of the `#dup` method being invoked upon the object value that `arr1` references. This will create a copy of the array object value that `arr1` references
but all collection item values will still be the same or shared in this case. On lines 3-5 a block is invoked. On line 3 the `#map!`method is invoked upon the object
that `arr2` is in reference to. each item of the collection is passed into the block once and assigned to local block variable `char`. `#map!` evaluates the return value
of the block. Based on the return value at each iteration it will mutate the original object with a new item within the collection. after iteration the collection will be of
the same length of the original collection and be within the original object array. On line 4  the `#upcase` method is invoked upon `char`. which is a non mutating method
that will create a copy of each string object value but uppercased. this is the last line of the block and will return `["A", "B", "C"]`. On line 7 the `#puts` method is
invoked upon `arr1` which will return `nil` due to `#puts` and output `["a", "b", "c"]`. On line 8 `#puts` will return `nil` and output `["A", "B", "C"]`. The difference
is that in `arr2` the object in reference has been modified due to the results of `#map!`. However `arr1` does not reflect any changes due to within the block the non mutating
`upcase` method that was invoked. both variables are in reference to an object that contain a shared collection. However the copy created changed that.


This demonstrates the concept of passing objects, both pass by reference and pass by value, and how the `#map!` method functions. the object that `arr2` is in reference
of is being mutates as a result of `#map!`. Within the block the `upcase` method creates a copy of each block return value  from which the collection in the modified original
object can contain. And the `#map!` method evaluates the same way as `#map` in every regard except instead of transforming the new collection onto a new array into transforms
them onto the same original object. Replacing the original collection.
the `#map! `





#17

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end

puts "Your total is #{sum}"
```

on line 1. local variable `arr` is initialized to an array object value that contains a collection of integer object values `[1, 2, 3, 4]`. On line 3 local variable `counter`
is initialized to the integer object value `0`. On line 4 local variable `sum` is initialized to the integer object value `0`.  on lines 6-10 a block is invoked. On line
6 a `#loop` method is invoked and a `do..end` block is passed into the block as an argument. On line 7 `sum` is reassigned to the return value of the `#+` being invoked
which will add the value that `sum` is in reference to together with the integer object value that `arr[counter]` accesses. On line 8 `counter` is reassigned to the return
value of the `#+` being invoked  which will add together the object that `counter` is in reference to and the integer object value `1`. On line 9 the condition to
terminate the loop is given `break if counter == arr.size`. this will return `nil` as it is the last line of the block and it holds no values.  On line 12 the `#puts` method
is invoked on the string interpolated statement `"your total is #{sum}` which will return `nil` due to `#puts` and will output "your total is 10" .This is because within
the loop `counter` will increment 4 times to reach the break condition `break if counter == arr.size`.  the `#size` method invoked on the object that arr references will return
an integer object of how many items are within the collection. that is `4`.  the result of `sum` += arr[counter] will result in `10`

This demonstrates local variable scoping. both  `counter` and `sum` are initialized in an outer scope and the reassigned within the scope of a block. This functions within the
rules of block scoping which allows this.



#18

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end
p new_array
```



On  line 1 local variable `arr` is initialized to an array object value that contains a collection of integer object values  ` [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
On lines 3-5 a block is invoked. On line 3 local variable new_array is initialized to the return value of the `#select` method being invoked upon the object that `arr`
references. Each item from the collection is passed in once and assigned to local block parameter `n`. `#select` evaluates the return value of the block based on truthy values.
If at each iteration the return value is a truthy value that item will be added to a new collection within an object value that is the same as the original caller. In this case
an array. It does not have to be the same length as the original object value. If the block has a falsy value it will not be added to the new collection. On line 4
the `#+` method is invoked which adds the left hand element which is the object that `n` is in reference to and the right hand element `1`. The only non truthy values are
`false` and `nil`. every value shall be truthy in this case. The return value shall be `1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` which is an new array object value containing
a collection of all truthy values from the block.  On line 6 the `#p` method is invoked on `new_array` which will return `1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` as `#p` always
returns the calling object and output `1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` .

This demonstrates how `#select` functions. How select evaluates the return value of the block at each iteration for truthy values and will only add  truthy values
to a new collection in the new object that is the same type as the calling object.




#19

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```

[1, 2, 3].any? do |num|
  num > 2
end
```

On lines 1-3 a block is invoked. On line 1 the `#any?` method is invoked upon an array object containing a collection of integer object values `[1, 2, 3]`. Each item of the
collection is passed into the block once and assigned to block parameter `num`. `#any?` evaluates the return value of the block at each iteration for truthy values. If any
values is truthy then the block will cease iteration and `true` will be the return value. If there are no truthy values the return value of the block will be `false`.
On line 2 the `#>` method is invoked which compares whether the left hand element object value that `num` is in reference to is greater than the right hand
integer object value `2`. On the last iteration`3` which is the integer object value that `num` is in reference to is greater than `2`. therefore `true` is returned.

This demonstrates how the `#any?` method functions. How is evaluates the return value of the block for a truthy value at each iteration. And will cease iteration and return `true`
once a truthy value has been returned. It will return `false` if there are no truthy values.



#20

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```

def fix(value)
  value.upcase!
  value += '!'
  value
end

s = 'hello'
t = fix(s)
```

On line 7 local variable `s` is initialized to the string object value `'hello'`. On line 8 local variable `t` is initialized to the return value of `#fix` being invoked
and the object that `s` references being passed into the method as an argument and assigned to local block parameter `value`. On lines 1-5 method definition `#fix` executes.
On line 2 the  mutating method `upcase!` is invoked upon the object value that `value` is in reference to. This will modify the original object by changing all string values
to the uppercase version of itself. On line 3 `value` is reassigned to the return value of the `#+` being invoked which adds the value that `value` was initially referencing
together with the string object `!`.  On line 4 `value` is the last line in the block and will return `HELLO!`. There is no outptut in this code.  The object that `s` is in
reference is now `HELLO` and the object that `t` references is now `HELLO!`. This is due to the mutating method of `#upcase!` and then the reassignment of `value` that which
no has `value` point towards the same object that `s` points towards.


This demonstrates Mutating Objects, variables as pointers, and local variable scoping.  the object that `s` is in reference to has been modified as a result of the value
being passed into method as an argument. and then having the mutating method `#upcase!` invoked upon it. Variables as pointers is shown with the reassignment on line 4 which
then has the local block parameter `value` no longer pointing towards the same object as `s`. And local variable scoping because  the object that `s` references is passed into
the block as an argument. This gives the method access to the value in reference.





#21

#What does the following code return? What does it output? Why? What concept does it demonstrate?

#What values do s and t have? Why?
```

a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```

on line 1 local variable `a` is initialized to the integer object value `4`. On line 2 local variable `b` is initialized to the integer object value `2`. On lines 4-8 a block
is invoked. On line 4 a `#loop` method is invoked which passes in a `do..end` block into the block as an argument. On line 4  local block variable `c` is initialized to
the integer object value `3`. on line 5 `a` is reassigned to the same object value that `c` references.  on line 6 the condition to terminate the loop is given `break`. this
will return `nil` as this is the last line of code in the block and holds no value. On line 10 `#puts` is invoked on the object that `a` references which will return `nil`
because `#puts` always returns `nil` and will output `3`. as `a` was reassigned within the scope of the block. On line 11 `#puts` is invoked on the object that references
`b` which will return `nil` and output `2`.

This demonstrates local variable scoping as the reassignment of `a` was able to occur because block scoping rules allow for variables initialized in an outer scope to be
accessed within a block's scope.





#22

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```

a = %w(a b c)
a[1] = '-'
p a
```

On line 1  local variable `a` is initialized to an array object value which contains a collection of string object values `['a', 'b', 'c']`. On line 2 the `String#[]=` is invoked
which will return a new reassigned substring with the original array object value.  here `a[1]`  which will return `b` as the second value of the index is reassigned
 to the string object value  `-`. On line 3 the `#p` method is invoked on the object that `a` references which will output `['a, '-', 'c']` as the array object has been
  modified as result of the string  index reassignment. It will return `['a, '-', 'c']` as `#p` always returns the calling object.

  This demonstrates Object Mutating. the `String#[]=` changes one of the items of the collection and in tune modifies the original array object.


#23

#What does the following code return? What does it output? Why? What concept does it demonstrate?
```

def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```



On line 5 local variable `names` is initialized to an array object value containing a collection of string object values `['bob', 'kim']`. On line 6 the `#add_name` method
is invoked with the the object value that `names` references being passed in as an argument and assigned to method parmeter `arr` and the string object value `'jim'` being
passed into the method as an argument and assigned to method parameter `name` .On lines 1-3 method definition `#add_name` executes. On line 2  the object value that `arr`
references is assigned to the return value of the `#+` method being invoked which adds the original object that `arr ` references and and a new array object containing
only the object value that `name` is in reference to. this will return  `['bob', 'kim', 'jim']` as  this is the return value of the last line within the method. On line 7
`#puts` method is invoked upon `names` which shall output `'bob'` and `'kim'`, and will return `nil` as `#puts` always returns `nil`. the object that `names` points towards
is unaffected because the method did not use any mutating methods to change the original object .

This demonstrates the concept of pass by value. Or creating a copy  so the original object reamins unaffected.

