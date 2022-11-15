# https://fine-ocean-68c.notion.site/RB109-Written-Questions-From-Christian-Larwood-s-Blog-91bcc598a24d4ad6aadad86802e7412b
# WA questions

# What does the following code return? What does it output? Why? What concept does it demonstrate?

def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')

#  this example was provided by Esther Kim and modified by Matic Kocijančič  to resemble what is required on the written assessment
=begin
- On line 15 the method `example` is being called and passed a string object `"hello"` as an argument
- the string is passed into the method taking the place of the parameter 'str'
  - the variable `str`, which is local to the method `example`, is now pointing to the same string object, that was passed in as an argument
- the variable i is initialized to the integer 3
- the puts method outputs a string representation of the string object, that `str` is pointing to
- the value of i is decucted by 1 which would equal 2 on the second loop
the integer i is still greater than 0 so the we go back to the top of the loop
the puts method puts outputs a string representation of the String
the value of i is deducted by 1 which would equal 1 on the third loop
the integer i is still greater than 0 so we would go back to the top of the loop
the puts method puts outputs a string representation of the String
the value of i is deducted by 1 which would  equal 0
we would break out of the loop becuase the breaking condition is met

this method is demonstrating the concept of looping
the variable i can be used inside the method because of scoping rules, since the variable was initialized in the method, it can be use only in the method.

The variable can be used inside the `do..end`` block, that is passed to the method `loop`, because the scoping rules of a block: a variable that is initialized in the outer scope is acccessible in the inner scope.

=end






