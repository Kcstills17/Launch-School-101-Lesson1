def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

number1 = nil
number2 = nil

loop do
puts ">> Please enter a positive or negative integer"
number1 = gets.chomp

break if valid_number?(number1)
puts "please enter a non zero integer. "
end


loop  do
puts ">> Please enter a positive or negative integer"
number2 = gets.chomp

if number1.to_i * number2.to_i > 0
  puts "Oops. One number must be positive, and the other Negative. Please try again."ef valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
loop do
  puts ">>> What is the numerator"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "invalid input. Only non zero integers allowed."
end

denominator = nil
loop do
  puts ">>> What is the denominator?"
  denominator = gets.chomp



  if  denominator =='0'
    puts "0 is not allowed. Please pick another integer."
  else
    break if valid_number?(denominator)
    puts "invalid input. Only non zero integers allowed."
  end
end

result = "#{numerator.to_i /  denominator.to_i}"

puts "#{numerator} / #{denominator} is equal to #{result}"

else

break if valid_number?(number2)
puts "please enter a non zero integer. "
end

end

sum = number1.to_i + number2.to_i

puts "#{number1} + #{number2} is #{}"


