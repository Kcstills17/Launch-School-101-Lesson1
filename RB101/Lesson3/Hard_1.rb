# Question 1
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

p greeting

# the conditional is giving greeting an assignment "IF" greeting is false.
# by calling greeting it is not false, therefore, it should have no value or nil


# Question 2
# What is the result of the last line of code below?

greetings = { a: 'hi' }

informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greeting
# there will be appended onto greeting as well due to the memory address both pointing to being mutated.


# Question 3
# In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A)

def mess_with_vars1(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars1(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# within the mess_with_vars1 method 3 variables are assigned to integers. Ints are immutable and no mutating method has occured either way.
# the result should print out " one is: one"  "two is: two", and "three is: three"

# B)

def mess_with_vars2(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars2(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"


# The only difference here is within out method strings have been assigned instead of integers. They can be mutated, however, they are not here due to
# it just being assigment. New copies are created that point towards new memory addresses and our callers remain unaffected


# C)

def mess_with_vars3(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars3(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# in this case our  mess_with_vars3 method uses a mutating method #gsub!. this will change the value of our caller's memory address.
# now we  should see " one is: two", "two is: three", and "three is: one"


# Question 4.
# Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers.
# e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number?
# that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.

=begin

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

=end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition,
# and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
# Help Ben fix his code.


def is_an_ip_number?(input_string)
  (0..255).include?(input_string.to_i) # does not check for non-numeric input
end


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
return false unless is_an_ip_number?(word)
  end
true
end

p dot_separated_ip_address?("10.22.31.201.2")


