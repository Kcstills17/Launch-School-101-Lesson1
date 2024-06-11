#creating a fibonacci sequence using recursion in ruby!
#fibonacci example 1,1,2,3,5,8,13,21
def fibonacci(number)

  if number < 2
    number
  elsif number < 1
    "#{number} is not a valid fibonacci sequence "
  else
    fibonacci(number -1 ) + fibonacci(number -2)
    # fibonnacci (number -1) in  this case is fibonacci(5) and fibonacci(number -2) is fibonacci(4)
    # fibonacci 5 is equal to 5. and fibonacci(4) is equal to 3. 5 + 3 ==  fibonacci(6) and there you have it/
  end
end



  puts fibonacci(3)



