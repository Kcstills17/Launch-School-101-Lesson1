numbers = []
p numbers.size
loop do
  puts 'Enter any number:' + " #{numbers.size}"
  input = gets.chomp.to_i

  break if numbers.size  ==5
    numbers.push(input)
  end
p  numbers
