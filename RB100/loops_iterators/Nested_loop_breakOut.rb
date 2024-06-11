loop do
number_of_lines = nil
input_string = nil
loop do
  puts '>> How many output lines do you want? Enter a number >= 3:'
  input_string = gets.chomp
  number_of_lines = input_string.to_i
  break if input_string == 'q' || input_string == 'Q'

  break if number_of_lines >= 3
  puts ">> That's not enough lines."
end
break if input_string == 'q' || input_string == 'Q'

while number_of_lines > 0
  puts 'Launch School is the best!'
  number_of_lines -= 1
end
end
