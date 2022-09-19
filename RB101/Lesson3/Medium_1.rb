# Question 1
#Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).
#For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:
=begin
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
=end
10.times {|number| puts (" " * number) + "The Flintstones rock" }


# We use the times method to create our output 10 times.
# Now we want to find a way to add a 1 line indention onto every increment in the method.
# A good way to accompllish that is to utilize the string method #*. While it is a bit confusing at first due to its typical use for integers this method
# Returns a new String containing integer copies of self: So here we utilize a " " to create one space for every copy of the method. We then use #+ to add
# the string of text after our method so that our space will show up each time as a space to the right.

# Question 2. The result of the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# The error occurs because the way the line is formatted makes it try to add string to integers. Which cannot be allowed. Here are two solutions


 puts "the value of 40 + 2 is " + (40 + 2).to_s  # convert the integer to string
 puts "the value of 40 + 2 is #{40 + 2}" # use string interpolation


 # Question 3.
 #Alan wrote the following method, which was intended to show all of the factors of the input number:


=begin
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end




Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

Bonus 1
What is the purpose of the number % divisor == 0 ?

Bonus 2
What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?

=end

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end


p factors(-2)

# Bonus 1: The purpose is that if an integer can go into number with 0 leftover it can continue on with the method.
# Bonus 2: This is the return value that we will have with our method.


# Question 4
# Alyssa was asked to write an implementation of a rolling buffer.
 # Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

#She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?".
 #Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?


 def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end


# The differenc is one of the argument's in rolling_buffer1 (buffer) is mutated by the #<< method. There is no mutation in the second method.


# Question 5.
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
 # A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

#Bn coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

=begin
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

=end

#How would you fix this so that it works?

# The issue is the limit variable is initiallized outside of the scope of the method. It has no access to it.
# A possible fix is to use limit as a parameter within the method definition. Therefore we could not only allow the
# The method to work properly, but allows us to change the limit to whatever we see fit


def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

p fib( 10,9, 20)

# Question 6.
# What will be the  output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# The result should be => 8
# the method being called by answer does not use any mutating methods and therefore answer remains unaffected as if the method was not eben there.


# Question 7

# One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)
p munsters

# Did the family's data get ransacked? Why or why not?
# Yes because indexed assignment is mutating. And the hash method #[]= is apart of that.


# Question 8.
# Method calls can take expressions as arguments. Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game:
 # it returns the winning fist or, in the case of a tie, the fist that both players played.

 def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following call

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
puts rps(rps('paper', 'rock'), 'rock')

# The layout is a bit confusing so lets take a look at the parenthesis to figure out what is going on
# So first we have the outer parenthesis that links the first rps with the right outer parenthesis that contains "rock"
# Second we have a parenthesis that contains two method calls of the method rps.
# Now we want to evaluate from outside in. We know that our outside "rock" will be evaluated against the inner contents. But we must first evaluate all of it first.
# Starting with rps("rock", "paper") will result in "paper" being returned. rps("rock", "scissors") will result in "rock" returning.
# Now we can evaluate the result of those two. It now appears as this overall puts rps(rps("paper", "rock")"rock")
# Paper will be returned from our inner argument"
# Now we have reached the final step  puts rps("rock", "paper"))
# And out final return value will be "paper"


# Question 9.
# Consider these two simple methods

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

p bar(foo)

# foo returns "yes"
# bar has a ternary operator that shows if param == "no" return "yes" if true: "no" if false
# foo is being passed through with the return value of yes. "yes" != "no" so therefore it is false and bar should return "no"
