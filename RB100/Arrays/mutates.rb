a = [1,2,3]

def mutate(array)
  array.pop
end
puts "before mutate method: #{a}"
mutate(a)
puts "After mutate method: #{a}"

#We have permanently modified the array that local variable a references by passing it to the mutate method,
#even though a is outside the method definition's scope. This is because the pop method mutates the caller (the array specified by array).
#a is still pointing to the same array, but, in this case, the number of elements in the array has changed.



b = [1,2,3]

def no_mutate(array)
  array.last
end

puts "before no_mutate method #{b}"
no_mutate(b)
puts "afer no_mutate method:#{b}"

# You'll notice that we have the same output before and after the method invocation, so we know that b was not modified in any way.
#This is because the last method does not mutate the caller.


