=begin

# Question 1
# Every object in Ruby has access to a method called object_id, which returns a numerical value that uniquely identifies the object.
# This method can be used to determine whether two variables are pointing to the same object.
# Take a look at the following code and predict the output:

a_1 = "forty two"
b_1 = "forty two"
c_1 = a_1

puts a_1.object_id
puts b_1.object_id
puts c_1.object_id

=begin
Loose PsuedoCode
1. a_1 is pointing towards the memory address containing "forty two"
2. b_1 is pointing towards a separate memory address that also contains "forty two"
3. c_1 is pointing towards the same memory address as a
Prediction:
a_1 and c_1 will share the same object is as they are pointing towards the same address.
b-1 is pointing towards a separate one and thus, should have a different id
=end

# Question 2
# Let's take a look at another example with a small difference in the code:
a_2= 42
b_2 = 42
c_2 = a_2

puts a_2.object_id
puts b_2.object_id
puts c_2.object_id

=begin
Loose PseudoCode
a_2 is pointing towards the memory address containing 42
b_2 is pointing towards the same memory address, because numbers are immutable and can only have one object for each individual number.
c_2 is pointing towards the same place as a_2 and b_2
# Prediction:
Due to the given reasons all should display the same object_id
=end

# Question 3
#Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.
#Study the following code and state what will be displayed...and why:
=begin
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
=end
=begin
 What will be displayed
 First off both variables have different methods performed on them .
 #+= is a method in which does not mutate the caller and #<< is a method that does mutate the caller.
 Both are set to the string "pumpkins" and my_array is within an array.
 What should display for the first put statement is => "My string looks like this now: pumpkins"
 What should display for the second put statement is => "My string looks like this now: ["pumpkins", "rutabaga"]
 The reasoning is that the first example is not mutated and thus has just created a new string value for a_string_param. It no longer points to the same address.
 The second example has had the memory address's value being pointed to mutated. And therefore my_array should display accordingly

=end

#Question 4.
#To drive that last one home...let's turn the tables and have the string show a modified output,
 #while the array thwarts the method's efforts to modify the caller's version of it.
=begin
 def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
=end
#Difference
# Now we have the string example with a mutating method #<< the same principals apply here that applied to the array previously.
# For the array it has been assigned and assignment can never mutate the caller. It simply creates a new object which in this case is an_array_param
# which does not affect my_array in the outer scope.


# Question 5.
#Depending on a method to modify its arguments can be tricky:
=begin
def tricky_method_3(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_3(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
=end


#Whether the above "coincidentally" does what we think we wanted depends upon what is going on inside the method.

# How can we change this code to make the result easier to predict and easier for the next programmer to maintain?
# That is, the resulting method should not mutate either argument, but my_string should be set to 'pumpkinsrutabaga' and my_array should be set to ['pumpkins', 'rutabaga']


def tricky_method_3(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ['rutabaga']

  return a_string_param, an_array_param  # initially it was only returning an_array_param due to it being the last line in the method. This lets us return both.
end

my_string = "pumpkins"
my_array = ["pumpkins"]
 p tricky_method_3(my_string, my_array)


puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# Question 6.
#How could the following method be simplified without changing its return value?


=begin
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

=end


def color_valid(color)
  color == "blue" || color == "green"
end

    p color_valid("red")
# with the above method Ruby automatically will evaluate an expression as either truthy or falsy. We can discard the if statement
# and set the color to "blue" or "green". When we pass the argument if it is not either of those values it will return false
# and if it is those colors it will return true.


# Question 7.

