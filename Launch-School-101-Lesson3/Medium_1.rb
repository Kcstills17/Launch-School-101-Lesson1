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
c_2 = a

puts a_2.object_id
puts b_2.object_id
puts c_2.object_id

=begin
Loose PseudoCode

=end
