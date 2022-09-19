# creating a rangesum using recursion in ruby

def range_sum (number)

  if number <= 0
    number
  else
    range_sum(number -1 ) + number
  end
end

puts range_sum()
