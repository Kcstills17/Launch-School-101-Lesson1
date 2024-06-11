# dividing numbers


def valid_number?(number_string)  # how to tell if the number we're given back is a valid integer.
  p number_string.to_i.to_s == number_string
end
# when getting an integer from a gets.chomp it will be converted into string. But if we simply change with .to_i it will also change valid string back into 0.
# so we create a test to tell if the number_string is changed in anyway after the conversion. '4' will become 4 but will only change data types. 'cat' will become 0 and lose it's value



numerator = nil
loop do
  puts '>> Please enter the numerator:'
  numerator = gets.chomp

  break if valid_number?(numerator)
  puts '>> Invalid input. Only integers are allowed.'
end

denominator = nil
loop do
  puts '>> Please enter the denominator:'
  denominator = gets.chomp

  if denominator == '0'
    puts '>> Invalid input. A denominator of 0 is not allowed.'
  else
    break if valid_number?(denominator)
    puts '>> Invalid input. Only integers are allowed.'
  end
end

result = numerator.to_i / denominator.to_i
puts "#{numerator} / #{denominator} is #{result}"
