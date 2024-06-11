
=begin
def something
  file = File.open('words.txt', 'r')
  yield(file.read)
  file.close
end

something{|txt| puts txt  }
=end

#1. Using & as an Argument:
#Problem:
# Implement a method called merge_functions that accepts two procs and returns a new proc. This new proc, when called, should execute both input procs in order.


def merge_functions(proc1, proc2)

  Proc.new do |_|
    proc1.call
    proc2.call
  end
end

# Usage:
say_hello = Proc.new { puts "Hello" }
say_world = Proc.new { puts "World" }

 greeting = merge_functions(say_hello, say_world)
 greeting.call  # Should print "Hello" on one line and then "World" on the next.





def custom_filter(numbers, filter_method)
  numbers.select(&filter_method)
end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Helper function
def even?(num)
  num % 2 == 0
end

# Helper function
def odd?(num)
  num % 2 != 0
end

filtered = custom_filter(numbers, :even?)
#puts filtered  # => [2, 4, 6, 8, 10]#

filtered = custom_filter(numbers, :odd?)
puts filtered  # => [1, 3, 5, 7, 9]
