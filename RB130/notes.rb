#prepending unary &block vs prepending &: invocation
def some_method(&block)
  another_method(block)
end

def another_method(block)
  block.call
end

some_method { puts "hello" }

[1, 2, 3].map(&:to_s)

[1, 2, 3].map { |n| n.to_s }



# What will the method call call_me output? Why?

def call_me(some_code)
  some_code.call
end

 name = "Robert"

def name
  "Joe"
end

p chunk_of_code = Proc.new {puts "hi #{name}"}



call_me(chunk_of_code)

# as long as a variable is defined before a closure is created the closure will have access to the value. For a method however, The closure has access to the method even if
# the method is invoked after the closure is created.


# Why does the following raise an error?

def a_method(pro)
  pro.call
end

a = 'friend'
#a_method(&:a)

#[1, 2, 3].map(&:to_s)

# on line 47 the `(&a)` the ampersand is attempting to call `#to_proc` on the str value. Which will raise an error. `#to_proc` is a symbol instance method. So we need to
# have this code instead (&:a)

# how to organize argyuments in testing
=begin

assert(obj, [error message])
assert_raises(ErrorType) { ... }
assert_equal(expected, actual) # value equivalence #==
assert_includes(collection, object) #include?
assert_instance_of(class, object)
assert_in_delta(3.145, Math::PI, 0.001)
assert_empty(collection) #empty?
assert_nil(obj) #nil?
assert_same(array, array.sort!) # object equivalence
assert_match(regex, obj)
assert_kind_of(class, object) # checks if instance of class or subclass

=end

## 1. What are closures?

# A **closure** is a "chunk of code" that can be saved and executed at a later time, possibly from a different location.
#Closures work by *binding* their *surrounding artifacts*, which can include variables, methods, object, or other pieces of data and code.
#This binding creates an enclosure around these artifacts that allows them to be referenced when the closure is executed.

# In Ruby, blocks, Procs, and Lambdas are all closures

=begin
## 4. How do blocks work?

**Blocks** are pieces of code that are surrounded by either `do..end` or `{..}` which are passed as arguments to a method call.

All methods can accept an implicit block, but only methods that include an explicit call to `yield` will execute the code inside the provided block.
Furthermore, how the method which takes the block is implemented will determine how the return value of the block is used (if it is used).

Like methods, blocks have a return value, which is determined by the last expression in the block; more specifically, whatever that expression evaluates
to will be implicitly returned by the block.


=end

=begin

## 15. What other differences are there between lambdas and procs? (might not be assessed on this, but good to know)

In addition to their arity, `lambda`s and `Proc`s both handle the use of the keyword `return` differently. When `return` is used within a `lambda`, it passes control back to the calling method, just like a regular method would. In
contrast, when we use `return` within a `Proc`, it causes an immediate exit from the enclosing method, skipping any execution of any code that comes after it.
=end



# What does `&` do when in a method parameter? # block to proc

def my_method(&block)
  block.call
end

my_method { puts "I am a block that will become a Proc" }

#What does `&` do when in a method invocation argument? #check if proc to convert to block, otherwise convert to proc.

[1, 2, 3].map(&:to_s)
# Ruby checks if to_s is a proc before converting to block.
# Here, to_s is not a proc, so Ruby invokes Symbol#to_proc to convert to proc before converting to block.
# :to_s becomes { |n| n.to_s }, then is converted to a block

## 19. How do we get the desired output without altering the method or the method invocations?

def call_this
  yield(2)
end

# your code here

to_s = Proc.new {|n| n}

to_i = Proc.new {|n| n.to_s}

p call_this(&to_s) # => returns 2
p call_this(&to_i) # => returns "2"




## 20. How do we invoke an explicit block passed into a method using `&`? Provide example.

def get_output(&block)
  block.call
  yield
end

get_output {|str| puts 'This block is executing' }



#What will be outputted from the method invocation on line 84? Why does/doesn't it raise an error?

def block_method(animal)
  yield(animal)
end

block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end



## 24. What will the method call `call_me` output? Why?


def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new {puts "hi #{name}"}
p call_me(chunk_of_code)
name = "Griffin"

def name
  'Grat'
end




def a_method(pro)
  pro.call
end

def some_method(&block)
  block_given?
end

bl = Proc.new { puts "hi" }

p some_method(&bl)



def some_method(&block)
  block_given? # we want this to return `true`
end

bloc = proc { puts "hi" } # do not alter this code

p some_method(&bloc)


def some
  yield
end

bloc = proc { p "hi" } # do not alter

some(&bloc)


b = lambda { p "hi" }

b.class # => Proc
p b.lambda? # => true

new_lam = lambda { p "hi, lambda!" } # => NameError: uninitialized constant Lambda



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

=begin

The output shall be `["one", "two", "three", 4, "five"]`. This demonstrates the binding rules of closures. Within the `retained_array` we have a closure initialized with the
proc object being executed.  This has a local block variable `el`. we have an initialized arr `arr` prior to the proc object that we are appending `el` to. Outside of
the method we assigning local variable `arr` to the return value of `retained_arr`. That will be the Proc object.  The use of closures and binding is immediately seen as we call
`arr.call('one')`. This is possible despite being outside of the method since our closure has access to the method even when we are outiside of the method itself.  We bind the
proc parmater `el` to passed in string argument `one` and append that to the current arr. We do the same on line 222 as well. On line 223 we append `three` but we also able
  to append the integer 4 to our array directly with the `<<` method. Finally we append `five` to our array and we output `["one", "two", "three", 4, "five"]`
=end

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
