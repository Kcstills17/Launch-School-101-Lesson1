
def valid_number?(number_string)
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
