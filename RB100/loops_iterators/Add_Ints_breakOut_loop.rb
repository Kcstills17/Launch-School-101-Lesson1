=begin
 Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

Do not check for the positive/negative requirement until both integers are entered, and start over if the requirement is not met.

=end


def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end
number1 = nil
loop do
  puts "what is your number"
  number1 = gets.chomp

break if valid_number?(number1)
  puts "Please put a valid integer."
end
number2 = nil
  loop do
puts "what is your 2nd number"
number2 = gets.chomp
if number1.to_i * number2.to_i > 0
  puts "One of the numbers must be a negative. Please Try again."
else
break if valid_number?(number2)
  puts "Please put a valid integer."
end
end

sum = number1.to_i + number2.to_i
puts "#{number1}  + #{number2} is #{sum}"

