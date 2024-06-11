# BLOCKS
=begin
## 1. What are closures?

 Closures are chunks of code that can be passed around in ruby to be called upon later. Blocks, Lambdas, and Procs are considered closures.


 2. What is Binding
  Binding is what encloseses all artifacts around an enclosure. And allows for these artifacts to be retrieved at a later time.  It is scoped upon being defined
  (Methods, Variables, and Constants) Closures can access and/or update these artifacts regardless of when or where the closure is called upon later,
  we call this behavior and relationship, binding.


```ruby
def some_method(pro)
  puts pro.call # the local variable `name` is out of scope for the method, but is accessible through binding
end
name = 'Joe'
some_proc = proc { name }

some_method(some_proc)
```

This example shows us that a closure (the proc) is bound to the local var `name` and is able access it even if it is called upon within a method,
 where local variable are normally not accessable unless explicitly passed in as an argument upon method invocation.


 ## 3. How does binding affect the scope of closures?

 Binding allows for closures to have access to variables, methods, and constants based on where they are defined and not where they are called upon. For example if a local
 variable is defined before a closure it is binded to that closure, even if the closure is normally out of reach of that local variable. Therefore this allows closures
and whatever is calling upon the closure to access or manipulate data that may be completely out of its normal scope, had there been no binding.


for example given this problem

def call_me(some_code)
  some_code.call
end

 name = "Robert"

def name
 "Joe"
end

chunk_of_code = Proc.new {puts "hi #{name}"}

a closure is created on line 47 with the proc object `chunk_of_code` The local variable `name` is initialized and set to the string value `"Robert"`. This happens prior
to our closure and therefore the local variable is our binded value. In this case the binded value `"Robert"` is output. Local variables are searched first prior to methods.
If the local variable `name` was removed from this problem  the closure would then bind to the method`name` and the value of `"Joe"` would be output on line 47


4.  How do blocks work?
 In Ruby, **blocks** are sections of code that are surrounded by `do...end` or `{ .. }`. They are passed as arguments to a method call.
Any method can accept an implicit block, but only those that implement their execution with some sort of call to `yield` will execute the
code inside the given block. How the method which takes the block is implemented determines how the return value of the block is used, if at all.

5.  When do we use blocks? (List the two reasons)
  The two reasons to use blocks are to differ implementation and to sandwich code.

  6.  Describe the two reasons we use blocks, use examples.


  For differing implementation this will occur when you are trying to implement a method in which you are unsure of it's use during invocation time. For this
  You can create a general method that can have specific implementation added to by the the block during run time

  Sandwiching code is a good use for any code that may need a before or after action. For example if you need a certain amount of time to pass before and after your code you
  can sandwich a block in between the difference of time. Another example would be to open and close a file. The block in between would execute any specific implementation needed
  and the file can be opened and closed separately.

  example of differring implementation

  ```ruby

[1, 2, 3].map {|elem| elem.to_s}

  ```
In this example we can see that the `map` method will iterate through an array and return a new array but what goes into the new array is determined
by the block passed in by the caller.

example of sandwiching code

```ruby

def file(arr)
  #open file
  yield
  #close file
end


[1, 2, 3, 4, 5].file {|n| puts "this is the #{n} after opening and before closing"}

```

Here we are pretending to open and close a file. But we sandwich code in between by yielding to a block. The block of the method will output the given string message.


7. When can you pass a block to a method? Why?

You can pass a block to a method upon invocation at any time. Methods have an implicit parameter that is not visible to us but will accept a block at any time.
The method will need to be defined in a specific way to access that block, but even if a method is not defined to accept blocks,
it will not raise an error when a block is passed in.

8. How do we make a block argument mandatory?


We require a block in a method by using the `yield` keyword in the method definition or if expecting an explicit block then using the `#call`
method to call the block (which is now actually a proc) that is assigned to the parameter variable.

Example:

```ruby
def some_method(&block)
  block.call
end

def some_method_2
  yield
end

```


9. How do methods access blocks passed in?

Methods use the keyword `yield` to invoke implicit blocks passed in and use the `Proc#call` method to invoke explicit blocks passed in.
Example:


10. What is `yield` in Ruby?

`yield` in Ruby is a keyword used in a method definition that calls implicit and eplicit blocks passed into the method. `yield`
 can accept arguments and pass them into the block and assign them to the block local variable defined it its parameters.


11. How do we check if a block is passed into a method?

The `Kernel#Block_given?` method checks to see if there is a an implicit block passed into the method. If so `true` will be returned. Otherwise
`false` is returned.

## 12. Why is it important to know that methods and blocks can return closures?

It is important to know that closures can be returned from and passed to other methods because this allows us to access data
that would usally be out of scope and pass along functionality allowing for DRY and flexible code. It is also important to remember
that closures returned from method and blocks that are defined withing those methods and/or blocks will have access to the artifacts
within the scope of those methods and/or blocks, thus allowing the returned closure to reference and/or alter those artifacts at a later time.

Example:

```ruby
def retained_array
  arr = []
  Proc.new do |el|
    arr << el
    arr
  end
end

arr = retained_array
p arr.call('one') #=> ["one"]
p arr.call('two') #=> ["one", "two"]
p arr.call('three') #=> ["one", "two", "three"]
```

```ruby
def contained_data(password)
  Proc.new do |new_password|
    password = new_password unless new_password.nil?
    password
  end
end


joes_password = contained_data("joesmith2022")
p joes_password.call #=> "joesmith2022"
p joes_password.call("joeharvy2022") #=> "joeharvy2022"


 13. What are the benefits of explicit block?

Explicit blocks allow us to reference the block (now a proc) within the method definition via a variable and allows to the pass the block to other methods or return the block.
It also allows us to be able to return the explicit block from the method as a proc object.
Example:

```ruby
def some_method  #implicit block
  return yield
end

puts some_method {"Joe"} #=> "Joe"

def some_method2 (&bloc)
  return bloc
end

puts some_method2 {"Joe"} #=> proc object <Proc:0x000055b5376f6d68>
```


14. Describe the arity differences of blocks, procs, methods and lambdas.
 Methods and lambdas have strict arity. This means the amount of arguments passed in must matched the amount of parameters the specific object contains. Otherwise
 an `ArgumentError` will be raised.  Blocks and procs have lenient arity. Meaning they can execute even if fewer arguments or more arguments than are defined are passed in.
 An unassigned error will be set to `nil`.

 15.  What are other differences are there between lambdas and procs? (might not be assessed on this, but good to know)

 Procs have their own class while Lambdas are simply Proc objects that do not have their own class. They are instantiations of the `Proc` class.
  Lambdas have strict arity, whereas Procs have lenient arity. You cannot instantiate a Lambda with `Proc.new`. You need the `Kernel#lambda` method.
  This will check the amount of arguments passed in when invoked.  When `return` is explicitly stated in a lambda the control is returned to the calling
  method, however when `return` is explicitly stated in a proc the control will not return to the calling method, but will simply end the calling method.


  ## 16. What does `&` do when in a the method parameter?
  The unary `&` prepended in a method parameter signifies we are saving a passed in block as a `Proc` object.  This can now be referenced or passed around via the parameter.
  When referencing the `Proc` object simply reference the parameter without the unary `&`. However when you wish to execute the block you must invoke the `Proc#call` method
  on it.

  def method(&block)
    p block #references proc object
    block.call #invoke block object
  end


  method {|_| #doing something in block execution}


  17. What does `&` do when in a method invocation argument?

    When in a method invocation it is checked to see if the object passed in is a `Proc` object or not. if it is not the `Symbol#to_proc` will be invoked.
    After being converted to a proc the proc will then be converted into a block object. If the passed in argument is not a proc and `to_proc` is not being invoked, an
    error will be raised.



    18.  What is happening in the code below?

```ruby
arr = [1, 2, 3, 4, 5]

p arr.map(&:to_s) # specifically `&:to_s`

# In this code, the `&:to_s` syntax is used within the `map` method.
# The `&` symbol is used to convert a symbol (representing the method `to_s`)
# into a proc object. This proc object is then used as a block when invoking `map`,
# resulting in each element of the `arr` array being converted to a string.
p arr.map(&:to_s)



 How do we get the desired output without altering the method or the method invocations?

```ruby
def call_this
  yield(2)
end

to_s = proc { |n| n }
to_i = proc { |n| n.to_s }

we are passing in two proc objects into our `call_this ` method and we cannot alter the method or method invocation. Since we already have a proc object and this
proc object will be executed as a block in our invocation then we simply need to change the return value of the proc object itself. For `to_s` we wish to return `2` so we can
simply return the passed in object since we are passing in the integer `2` with `yield(2)`. For to_i we call the `to_s` method on the block parameter to return `'2'`.

p call_this(&to_s) # => returns 2
p call_this(&to_i) # => returns "2"

20. How do we invoke an explicit block passed into a method using `&`? Provide example.

  def get_output(&block)
  block.call
  yield
end

get_output {|str| puts 'This block is executing' }

Here we invoke the explicit block in 2 different ways. `&block` passes in a block converted into a `Proc` object. We can execute this explicit block through the use
of `Proc#call` which we do with `block.call`. We can also use `yield ` which can execute an explicit or implicit block.



## 21. What concept does the following code demonstrate?

```ruby
def time_it
  time_before = Time.now
  yield
  time_after= Time.now
  puts "It took #{time_after - time_before} seconds."
end
```

This demonstrates the concept of Sandwiching code. Here we have a `time_before` which is saving the current time, then a `yield` which will execute the passed in block and
then `time_after` which saves the time after the block. We then output the difference in time which represents the time it took for the block to execute. This is a common way
of achieving sandwiching code. As the actual invocation taking place can be abstracted, have more specificity, and is separated from the process of the before and after time
values.


22. What will be outputted from the method invocation on line 84? Why does/doesn't it raise an error?

```ruby
def block_method(animal)
  yield(animal)
end

block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
```
The output shall be `"This is a #{turtle} and a ."`
This output occurs because are executing this block within `block_method` with `yield(animal)` this is only passing in one argument. The answer to why this does not raise an
error is because blocks have lenient arity. Meaning they can take more or less arguments than what is defined in a method. In this case we are not passing in a second argument
in place of our second block variable `seal`. When this happens this value will be set to `nil`. When you interpolate `nil` this will result in a space so therefore
`"This is a #{turtle} and a ."` is output. `



23. What will be outputted if we add the follow code to the code above? Why?

```ruby
block_method('turtle') { puts "This is a #{animal}."}
```
This will result in an error. Although blocks have lenient arity. Here no block parameters are defined and we are attempting to inteprolate the variable `animal` which in the code
is initialized in a method. Therefore this block has no way of accessing it meaning `animal` in this case is an undefined lcoal variable.




## 24. What will the method call `call_me` output? Why?

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)
```

The output is `"hi Griffin"`.
First we have a method definition `call_me` which is invoking the `Proc#call` method on it's parameter `some_code`. We then have a local variable `name` assigned to `'Robert'`
, a closure in the form of a proc object assigned to local variable `chunk_of_code`. This outputs `" #{name}"`. We then have `name` being reassigned to `'Griffin'` and finally
`call_me` is invoked with our closure `chunk_of_code` as the argument. What happens here is closures binds all artifacts around them. Variables, methods, constants and other
ruby objects. It will search for variables first. Here what is important is that the local variable `name` is defined prior to the closure being initialized. However closures
have access to scopes that an object normally does not have access to. Even though `name` is initialized prior to the closure being initialized when the closure is invoked
it has access to the current value of `name` which is the value `Griffin.`

## 25. What happens when we change the code as such:

```ruby
def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)
```

Here an error will be rasied. While a closure can bind it's surrounding artifacts. When there is only a local variable to work with you must first initialize the variable first.
The block variable `name` will not be able to find anything and raise an error.


## 26. What will the method call `call_me` output? Why?

```ruby
def call_me(some_code)
  some_code.call
end

def name
  "Joe"
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}

call_me(chunk_of_code)
```

The output shall be `"hi Robert"`. This is because closures will search variables first for it's binding over method names. Here `name` is initialized prior to the closure's
initialization and can be properly binded. So when `call_me(chunk_of_code)` is executed the block will bind local variable `name` to the block variable `name`.


## 27. Why does the following raise an error?

```ruby
def a_method(pro)
  pro.call
end

a = 'friend'
a_method(&a)
```

`&` in the method call is attempting to call `Symbol#to_proc` on a string object. This will result in an error.

28. Why does the following code output `false`?

```ruby
def some_method(block)
  block_given?
end

bl = { puts "hi" }

p some_method(bl)
```

We are attempting to save a block to a local variable `bl`. You cannot do this as a block is not an object and thus, an error will be raised.



  29. Why does the following code output `false`?

```ruby
def some_method(block)
  block_given?
end

bloc = proc { puts "hi" }

p some_method(bloc)
```


Here we are now initializing `bloc` to a proc object.  `block_given?` is evaluating whether a block is being executed, not a proc. So this will return `false.` To return true
here we would  prepend a unary `&` to the argument `block` on line 422. This would pass in an explicit Proc. We then would prepend a unary `&` before `block` in the
method invocation on line 428. This would execute the Proc object as a block. Therefore when `block_given?` executes `true` will be returned.



30. How do we fix the following code so the output is `true`? Explain

```ruby
def some_method(block)
  block_given? # we want this to return `true`
end

bloc = proc { puts "hi" } # do not alter this code

p some_method(bloc)
```

answer
def some_method(&block)
  block_given? # we want this to return `true`
end

bloc = proc { puts "hi" } # do not alter this code

p some_method(&bloc)

In the unaltered code a Proc object is being passed into the block and therefore `block_given?` is returning false. A simple fix is in the method invocation on line 446 prepend
the unary `&` before `block`. this will convert the Proc object to execute as a block. We must also either remove the explicit block parameter or we can choose to prepend
`&` before block on line 441 so there is a proper explicit block parameter. I choose the first option as it is slightly quicker.

31. How does `Kernel#block_given?` work?

It returns a boolean based on whether or not `yield` executes a block or not in the current context.

32. Why do we get a `LocalJumpError` when executing the below code? &
How do we fix it so the output is `hi`? (2 possible ways)

```ruby
def some(block)
  yield
end

bloc = proc { p "hi" } # do not alter

some(bloc)

we are getting a `LocalJumpError` because no block is being executed in the current context. There is an attempt of an explicit block parameter, however the syntax is not
correct.

solution1

```ruby
def some(&block)
  yield
end

bloc = proc { p "hi" }

some(&bloc)
```

solution2

```ruby

def some
  yield
end

bloc = proc { p "hi" }

some(&bloc)


```


33. What does the following code tell us about lambda's? (probably not assessed on this but good to know)

```ruby
bloc = lambda { p "hi" }

bloc.class # => Proc
bloc.lambda? # => true

new_lam = Lambda.new { p "hi, lambda!" } # => NameError: uninitialized constant Lambda
```

This tells us that Lambdas are an instance of the `Proc` class and not a class unlike procs.  This also tells us we cannot initialize a lambda the same way that you would a
proc. As a proc used `Proc.new`. Here we try something similar  `Lambda.new` and raise an error. However on line 513 we use the proper syntax which is the `Kernel#lambda` method
to initialize a Lambda.


 34. What does the following code tell us about explicitly returning from proc's and lambda's? (once again probably not assessed on this, but good to know ;)

```ruby
def lambda_return
  puts "Before lambda call."
  lambda {return}.call
  puts "After lambda call."
end

def proc_return
  puts "Before proc call."
  proc {return}.call
  puts "After proc call."
end

lambda_return #=> "Before lambda call."
              #=> "After lambda call."

proc_return #=> "Before proc call."

```

Lambda (lambda_return method):

When a return statement is encountered inside a lambda and the lambda is called, it doesn't exit the enclosing method but only exits the lambda itself.
In the lambda_return method, the "Before lambda call" is printed, the lambda containing return is invoked, but the "After lambda call" is also printed,
indicating that the lambda's return did not exit the method.

Proc (proc_return method):

In contrast, when a return statement is encountered inside a proc and the proc is called, it behaves like a regular method-level return statement and exits
the enclosing method.In the proc_return method, the "Before proc call" is printed, the proc containing return is invoked, and then the method immediately
exits. The "After proc call" is never printed.So, this code demonstrates that lambdas and procs have different behaviors regarding how return statements
affect control flow. Lambdas allow you to exit only the lambda itself, while procs can cause an exit from the enclosing method.


## 35 What will `#p` output below? Why is this the case and what is this code demonstrating?

```ruby
def retained_array
  arr = []
  Proc.new do |el|
    arr << el
  end
end

arr = retained_array
arr.call('one')
arr.call('two')
arr.call('three') << 4
p arr.call("five")

```

The output shall be `["one", "two", "three", 4, "five"]`. This demonstrates the binding rules of closures. Within the `retained_array` we have a closure initialized with the
proc object being executed.  This has a local block variable `el`. we have an initialized arr `arr` prior to the proc object that we are appending `el` to. Outside of
the method we assigning local variable `arr` to the return value of `retained_arr`. That will be the Proc object.  The use of closures and binding is immediately seen as we call
`arr.call('one')`. This is possible despite being outside of the method since our closure has access to the method even when we are outiside of the method itself. The
artifacts within the method are immediately accessible to the closure. We bind the proc parmater `el` to passed in string argument `one` and append that to the current arr.
We do the same on line 222 as well. On line 223 we append `three` but we also able to append the integer 4 to our array directly with the `<<` method. Finally we append
`five` to our array and we output `["one", "two", "three", 4, "five"]`
