# method that reports if a number is between 0-50, 51-100, or above 100.

def between_numbers
  puts "Where does this number fall between"  # asks question
  n = gets.chomp.to_i          # n is what the user will have to input as in integer

  if n >= 0 && n <= 50
    "#{n} is between 0 and 50"

  elsif n>= 51 && n<= 100
    "#{n} is between 51 and 100"

  elsif n > 100
    "#{n} is above 100"

  else
    "Does not fall under required criteria"
  end
end

puts between_numbers

