### Question 1:
### What will the following code print? Why?
```
def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep
```

On lines 1-8 a method definition is executed. On lines 2-7 a block is executed. On line 2 a block is passed in with `do..end` as an argument. on line 2 the `times` method is invoked  on the integer object `5`. an integer representing the index of the  iteration is passed into the block  and the block parameter `sheep`  now points towards this object at each iteration. On line 3 the `puts` method is invoked on sheep.  and on lines 3-5 an `if` conditional is formed with the logic stating `if sheep >= 2` then `return` . This conditional is using the `>=` operator which  will return `true` if the left hand element is greater or equal to the right hand element and `false` if otherwise.  the object `sheep` is referencing is output until the if statement is true. In that case. This outputs `0` `1` `2` as these integer object values are index based so they start from 0 . `return` has no value so therefore `nil` is the return value. Normally the `times` method would return the calling object which is `5` in this case,  however there is an explicit `return` within the block that changes that.  On line 9 the `p` method is invoked upon `count_sheep` and will  return and output `nil` as `p` returns the calling object. 

### Question 2:

### What does the following code return? What does it output? Why? What concept does it demonstrate?
```
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

```
On line 1 local variable `a` is initialized. On line 2 local variable `b` is initialized. On lines 3-6 a block is invoked. On line 3 the `times` method is invoked on the integer object `2`. An integer value representing the index of iteration is passed into the block and and the block parameter `a` now points towards each object at it's iteration.  On line 4 local block variable `a` is initialized to integer value `5`. on line 6 `puts` is invoked on the value that `a` references. This will output `5` two times because of the calling object. `5` and `5`.  `2` shall be returned as the  `times` method returns the calling object value. Because of this `nil` is not returned from the `puts` method.  On line 7 `puts` is invoked on the object that local variable `a` references which shall output `4` and return `nil`. On line 8 `puts` is invoked on the object that `b` references and output `2` and return `nil` . 

These demonstrates variable shadowing. as local  variable `a` was initialized in an outer scope and local block variable `a` was initialized in  a block scope. Because of this they are considered different and do not have access to each other. 

### Question 3:

### How does count treat the block's return value? How can we find out?
```
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

On lines 1 -3 there is a block invoked. On line 1 the `count` method is invoked  on an integer object value containing a collection of string  object's `['ant', 'bat', 'caterpillar']`. Each item of the collection is passed into the block and  block parameter `str` now points towards each object at it each iteration.  On line 2 the `length` method is invoked on `str` which returns the integer value representing how many characters are within the given string. The `<` method is invoked upon this integer object value and the argument `4` is passed in as the value to be compared. If the calling object of `length`  is less than the argument object then `count` then the calling object is a truthy value and will  return an incremented integer of 1. In the first iteration `'ant'.length ` is  == 3 and therefore the calling object of `length`  is a truthy value as the expression evaluates to `true` . so 1 shall be returned. On the next iteration `'bat'`  is a truthy value so   then another increment of 1 shall be returned which shall return 2.  On the last iteration `caterpillar` is the object that `str` references and is not a truthy value. Therefore The block has two truthy values and one falsy value so `2` is what will be the return value. 

### Question 4:

### Our predict_weather method should output a message indicating whether a sunny or cloudy day 
# lies ahead. However, the output is the same every time the method is invoked. Why? Fix the 
# code so that it behaves as expected.
```
def predict_weather
  sunshine = ['true', 'false'].sample
  
  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end
```

The issue here is that with  ` sunshine = ['true', 'false'].sample` . The string object's `'true'` and `'false'` are not the boolean values `true` and `false` . So replacing them with the boolean values will allow for the if conditional to actually sample between `true` and `false` . 

```
def predict_weather
  sunshine = [true, false].sample
  
  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end
```





### Question 5:

### What is the return value of map in the following code? Why?
```
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

On lines 1-5 a block is invoked. On line 1 the `map` method is invoked on a hash object containing two key-value pairs. Each key is a symbol object `a:` and `b:` and each value is a string object `'ant'` and `'bear'` . each key is passed into the block and the block parameter `key` now points towards each object at it's iteration. Each value is passed into the block and the block parameter `value` now points towards each object at it's iteration. `map`  performs transformation on each element of the original collection . `map` considers the return value of the block at each iteration. and the return values of the block are added to a new array object. This collection will be of the same length as the original object collection.  On line 2 the if conditional `if value.size > 3` is given. The `size` method being invoked on the object that local block variable `value` references returns an integer value representing how many characters are  in the given string. The `<` method is invoked on this integer value and the integer object `3` is passed in as an argument. If the calling object  of `size` is greater than the argument object then the calling object is a truthy value. On line 3 the object that `value` references is returned only if evaluates as true within the if conditional.   the object that `value ` references  `'ant'` on the first iteration  does not pass this condition and is falsy  so the value shall not be returned. `map` still must return a collection of the same length, however, so `nil` shall be returned in this iteration as there is no value otherwise. `bear` passes the if statement so it shall be the return value of the block for the last iteration.. The return value is `[nil, 'bear']`  . 

### Question 6:

### What will the following code print? Why?
```
def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number
```
on lines 1-7 the method definition `tricky_number` spans. On lines 2-6 an if conditional takes place. On line 2 the condition `if true` is placed. On line 3 when the condition is  `true` local method variable `number` is assigned to the integer object `1`. to determine whether an expression is `true` any value must not be `false` and `nil` and therefore be truthy. with the condition `if true`  the condition is essentially asking if `true == true` which will return `true`. therefore the rest of the if statement ceases execution and on line  8  when `puts` is invoked on `tricky_number` `1` will be output. 


### Question 7:
### The following code throws an error. Find out what is wrong and think about how you would fix it.
```
colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i > colors.length
  
  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end
  
  i += 1
  
end
```

The issue here lies with that  the collection of `things` is one less in length than the collection of `things`. To make this work without error you can modify the break condition to be  `break if i >= colors.length` . That way after each  item from `things` has been output the loop can cease 

```
colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle
things.shuffle!

i = 0
loop do
  break if i >= things.length
  
  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end
  
  i += 1
  
end
```



### Question 8:

### What does the following code return? What does it output? Why? What concept does it demonstrate?
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

On line 1 local variable `arr` is initialized to an array object value containing a collection of integer object values `[1, 2, 3, 4]` . On line 3 local variable counter is initialized to integer object value `0`.   On line 4 local variable sum is initialized to integer object value `0`.  On lines 6-10 a block is invoked. On line 6 the `loop` method is invoked with a `do..end` block passed in as an argument. . On line 7 The  `#[]` method is invoked on the object that `arr` references and the object that `counter`  references is passed in as an argument. This  method allows for element referencing  as `arr[counter`] will access the given integer of whatever `counter` is referencing. The `+` method is invoked on the object that `sum` references and the integer object from `arr[counter]`  is passed in as an argument. The value of the argument object plus a copy of the calling object that `sum` references is the return value that `sum` is reassigned to.   On line 8 the `+` method is invoked on  the object that `counter` is referencing.  The integer object `1` is passed in as an argument . The return value of the argument object plus a copy of the calling object that `counter` references is what `counter` is reassigned to. The condition to terminate the loop is given with `break if counter == arr.size` . the `size` method invoked on the object that `arr` references will return the number of characters within the given object. This will return `nil` as the break condition has no value. The loop shall run four times until `counter` is == to `4`. On line 12 `puts` is invoked on the string interpolated statement `'your total is #{sum}''` which will return `nil`. and will output 'your total is 10'' due to `sum` and `counter` being reassigned until the loop condition is met. 

This demonstrates local variable scoping. As `counter` and `sum` were initialized in an outer scope and then reassigned in a block scope. Then once again `sum` is accessed in an outer scope. 

### Question 9:

### What is `a`? What if we called `map!` instead of `map`?
```
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```

On line 5 local variable `a` is initialized and assigned to an array object value that contains a collection of string objects  `a = ['a', 'b', 'c']`.  On line 6 the `test` method is invoked and The object that `a` references  is passed into the method and now the block parameter `b` points towards this object. On lines 1-3 method definition `test` spans.   `map` performs transformation on each element of the original collection . And  `map` considers the return value of the block at each iteration and the return values of the block are added to a new array object. Because of this the object that `a` references remains the same and is `['a', 'b', 'c']` .  However if `map!` ,  a mutating method, was used instead. The calling object would be modified and the transformed collection of the `map!` method would be reflected with  `["I like the letter: a", "I like the letter: b", "I like the letter: c`].  `a` would still point toward the same object but it would have been modified due to `map!`. 

### Question 10:

### What does the following code return? What does it output? Why? What concept does it demonstrate?
```
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b
```

On line 4 local variable `a` is initialized to integer object value `3`. On line 5 local variable `b` is initialized to the return value of the `plus` method being invoked with the object that `a` references and the integer object value `2` being passed into the method. The block parameter `x` now points towards the same object as `a` and the block parameter `y` now points towards the integer object `2`.  On lines 1-3 the method definition `plus` spans. On line 2 the `#+` method is invoked upon the object that `x` references and the object that `y` references is passed in as an argument. The argument object is added to a copy of the calling object and that return value is what `x` is assigned to. this will return the integer value `5`.  On  line 7 the `puts` method is invoked on the object that `a` references which will return `nil` and output `3`. On line 8 the `puts` method is invoked on the object that `b` references and will return `nil` and output `5`. 

This demonstrates The concept of pass by value. As the `+` method creates a copy of the argument object added onto the calling object. This leaves the object that `a`  references unaffected. 

### Question 11:

### What values do `s` and `t` have? Why?
```
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```

ON line 6 the local variable `s` is initialized to the string object `'hello'` . On line 7 local variable `t` is assigned to the return value of the `fix` method being invoked with the object that `s` references being passed into the method as an argument. This will make local block parameter `value` point towards the same object as `s`. On lines 1-5 the method definition `fix` spans. On line 2 the  mutating method `upcase!` is invoked on the object that `value` references which will take all string values and convert them to the uppercase version of their original string values. This newly mutated object is then invoked by the mutating method `concat!` which passes in the argument string `'!'` to append to our calling object. This object is then returned on the final line of the block. `'HELLO!`' . Because `s` points towards the same object that has been mutated,  when `s` is output  `'HELLO!'` will be the value and `t` is assigned to the return value of the method invocation and will also output `'HELLO!'` . 

### Question 12:

### What is the return value of each_with_object in the following code? Why?
```
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

```
On lines 1-3 a block is invoked. On line 1 the `each_with_object` method is invoked on an array object value with a collection of string `['ant', 'bear', 'cat']`  the `each_with_object` method passes in two parameters.  Each item of the collection is  passed into the block and the block parameter `value` now points towards the object at each iteration. The created hash object `({})` is passed into the block and the local block parameter `hash` now points towards it.  Within the block there is both the hash setter method `[]=` and the element reference method `[]`.   `value[0]` allows for the element at the first index assignment to be accessed. In this case it would be the first string value of each object that `value` references. This is a non modifying method and a copy of the first element has been created.   This is what is being set as the key with the setter method. the object that `hash` references is having it's key set as the first element of each object that `value[0]` references as it each iteration. And the value of the hash object is being set to the object that `value` references at each iteration. Therefore After iteration the return value shall be `{"a"=>"ant", "b"=>"bear", "c"=>"cat"}` 

### Question 13:

### What does the following code return? What does it output? Why? What concept does it demonstrate?
```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
  puts n
end
p new_array
```

On line 1 local variable `arr` is initialized to an array object with a collection of integer object values `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` . On lines 3-6 a block is invoked.  on line 3 local variable `new_array` is initialized to the return value of the object that  `arr` references being invoked by the `select` method. `select` evaluates the truthiness of the block's return value. If the block's return value is truthy, then the element during that iteration will be selected and placed in a new collection that is the same type as the original calling object.  The length of the collection  can be any size from 0 to the size of the original collection based on how many return values are truthy. `select` returns this new object.  a `do..end` block is passed in as an argument. Each item of the collection is passed into the block and now the block parameter `n` now points towards the object at each iteration.  On line 4 the `+` method is invoked on the object that `n` references and the integer object `1` is passed in as an argument.  the argument object is added to a copy of the calling object. On line 5  the `puts` method is invoked on the object that `n` references which will output the object's 1-10 at each iteration. And will return `nil` at each iteration. `nil` is not a truthy value so the new array object returned shall be an empty array. `[]` 

This demonstrates how the `#select` method functions. `#select` evaluates the truthiness of the block's return value. If the block's return value is truthy, then the element during that iteration will be selected and placed in a new collection that is the same type as the original calling object.  The length of the collection  can be any size from 0 to the size of the original collection based on how many return values are truthy. `#select` returns this new object.

### Question 14:

### Explain the Hash#any? method and what it's doing in this code.
```
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end

```
 The `any?` method evaluates the return value of the block.  If a return value at any iteration is a truthy value then the iteration shall cease and true shall be returned. a  truthy value is any value that is not false or nil. If every return value is falsy then false shall be returned.  A hash object with symbol objects  as the keys and string objects as the values has been invoked by the `any?` method. The block parameter `key` points towards each hash object key at it's given iteration.. The block parameter `value` points towards each hash value object at it's given iteration.  Within the block the `size` method has been invoked on the object  that `value` references which will return an integer object representing how many characters are in a given string. This integer object is invoked by the `<` method which will pass in the integer object `4` as an argument. If the calling object that `value` references  is greater than the argument object then the calling object is truthy and the iteration will continue. here the first object of the iteration is a falsy value and iteration ceases and `false` is returned. 

### Question 15:

### We want to iterate through the numbers array and return a new array containing only the even numbers. 
# However, our code isn't producing the expected output. Why not? How can we change it to produce the expected result?
```
numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.map do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]
```

This error is a result of how `map` functions. It will always return a new array of the same collection size as the original calling object. To avoid this we can change `map` to `select`. `select` only evaluates for the truthiness of a block's return value and can be any length from 0 to the original calling object's collection size. 

```
numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]
```



### Question 16:

### What will the following code print, and why?
```
a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a
```

There will be an undefined local variable error. This is as a result of local variable `a` being initialized in an outerscope and then the method definition `my_value` attempts to access the object that `a` is in reference to. Local variable scoping  is done correctly with the object that block parameter `b` references as the object value that `a` references was passed into the method as an argument. However because `a` is directly referenced and not assigned within the method no action can be done  because of method's scoping rules.  a method does not have access to variables initialized in an outer scope and  variables initialized in within a method are not accessible in an outer scope. 

### Question 17:

### The output of the code below tells you that you have around $70. However, 
```
# you expected your bank account to have about $238. What did we do wrong?

# Financially, you started the year with a clean slate.

balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

# Let's see how much you've got now...

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum
  
  plus - minus
end

[january, february, march].each do |month|
  balance = calculate_balance(month)
end

puts balance

```
The issue we have here is mainly due to the  block involving the `each` method being invoked on the array object containing the 3 month variables `[january, february, march].` Within this block `balance` is being reassigned at each iteration to the result of the  `calculate_balance` method being invoked on the argument that object that `month`  references. The last value from `march` will be the value around  $70 dollars that we keep getting. To fix this here is a possible solution. You can instead of having this reassignment of `balance = calculate_balance(month` )  you can invoke the `#+` method alongside reassignment at each iteration. This will  invoke `#+` on the integer object that `balance ` references and it will pass in the result of `calculate_balance(month` ) as the argument. The argument object will be added to a copy of the calling object at each iteration. And now when we output balance the value shall be approx. `238` as expected. 

```

balance = 0

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}



def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum
  
  plus - minus
end

[january, february, march].each do |month|
  balance += calculate_balance(month)
end

puts balance

```



### Question 18:

### What does the following code return? What does it output? Why? What concept does it demonstrate?
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

On line 1 local variable `a` is initialized to integer object value `4`. On line 2 local variable `b` is initialized to integer object value `2`. On lines 4-8 a block is invoked. On line 4 the `loop` method is invoked and a `do..end` block is passed in as an argument. On line 5 local block variable is initialized to integer object value `3`.  On line 6  `a` is reassigned to the object that `c` references. On line 7 `break` signifies the condition to terminate the loop. This will return `nil` as `break` holds no value.  On line 10  `puts` is invoked on the object that `a` references which will return `nil` and output `3`. On line  11 `puts` is invoked on the object that `b` references and will return `nil` and output `2`. 

This demonstrates Local variable scoping. When a variable is initialized in an outer scope then the object the variable refers to is accessible  within the block. Here `a` is initialized in an outer scope and then reassigned within a block, then the value is output in an outerscope. 

### Question 19:

### We started writing an RPG game, but we have already run into an error message. Find the problem and fix it.
```
# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

player.merge(character_classes[input])

puts 'Your character stats:'
puts player
```

our error here is this `no implicit conversion of nil into Hash (TypeError)` . This usually implies that we are not accessing the values of one of the hashes here incorrectly. And in fact, that is the case.  On the line where `player.merge(character_classes[input])` is we are not actually accessing the value of any hash. The input will be given will be a string. And in the case of our hash there are no keys that are string object values. To resolve this we can convert our input into a symbol by typing this code in place of the previous `player.merge(character_classes[input.to_sym])` and now we will be able to access the 	`character_classes`  's ' hash values. 



```
# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

player.merge(character_classes[input.to_sym])

puts 'Your character stats:'
puts player
```



### Question 20:

### Explain Hash#each_with_object method and what it's doing in this code.
```
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```

On lines 1-3 a block is invoked. On line 1 a `do..end` block is passed in as an argument. the `each_with_object` method is invoked on a hash object value that contains 3 symbol objects as it's keys and 3 string objects as it's values. `{ a: "ant", b: "bear", c: "cat" }` .  Both the keys and values are passed into the block and the block parameter `pair` now points towards the object that each pair references at each iteration. a new object is created with `([])` and this empty array object is passed into the block and the local block parameter `array` now points towards it .  `each_with_object` does not evaluate the return value of the block and it returns the new passed in object as opposed to the calling object. On line 2 within the block the   `last` method is invoked on the object that `pair` references. This will return a copy of  the last value of the object it is called upon. Here the last value would be the string value part of the object that `pair` references. the mutating `<<`  method  is invoked on the object that `array` references and the string value returned from `pair.last` is passed in as an argument.  This will append to the empty array object that `array`  references  the argument object at each iteration.  This will return `["ant", "bear", "cat"]`. 

### Question 21:

### What will the following code print, and why?
```
a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

```
on line 1 local variable `a` is initialized to integer object value `7`. On line 2 local variable `array` is initialized to an array object containing a collection of integer object values. `[1, 2, 3]` . On line 3-5 a block is invoked. On line 3 the `each` method is invoked on the object that `array` references. each object from the collection is passed into the block and local block parameter `a` points toward  the object at each iteration.  on line 4 reassignment is occurring with local block parameter `a`. This  code within the block is no longer relevant to the output of local block variable `a`. On line 8 the `puts` method is invoked on the object that local variable `a` references and will output `7` as it is unaffected by the results of the block variable `a`. This is because of the concept of variable shadowing. 

## Question 22:

##  Magdalena has just adopted a new pet! She wants to add her new dog, Bowser, to the pets hash. 

### After doing so, she realizes that her dogs Sparky and Fido have been mistakenly removed. Help* 

### Magdalena fix her code so that all three of her dogs' names will be associated with the* 

###   # key :dog in the pets hash.*

```
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] = 'bowser'

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}
```

To fix this issue there is only one simple change that needs to be made. with the line `pets[:dog] = 'bowser'` this is a method that is currently modifying the value of the value of our `:dog` key to only be `'bowser'`  as opposed to adding it to it. We can use the mutating `<<` method in place which will be invoked upon the `:dog` values  and  `'bowser'` will be passed in as an argument. This will append to our calling object or the values array object of dogs our argument object. Now the `dog:` key shall have the values of `['sparky','fido' , 'bowser' ]` . 

```
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] << 'bowser'

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}
```



