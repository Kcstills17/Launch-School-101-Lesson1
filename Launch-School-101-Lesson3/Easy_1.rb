# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# numbers.uniq is not a destructive method. if you were to print numbers.uniq it should
# show => [1,2,3]
#but numbers is unaffected by this method.
#should show  => [1,2,2,3]
