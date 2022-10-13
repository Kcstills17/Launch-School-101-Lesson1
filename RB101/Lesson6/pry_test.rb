require 'pry'
require 'pry-byebug'
require 'pry-doc'

def fizzbuzz(arr)
  arr.map do |num|
    binding.pry
    if num % 3 == 0 && num % 5 == 0
      "fizzbuzz"
    elsif num % 3 == 0
      "fizz"
    elsif num % 5 == 0
      "buzz"
    else
      num
    end
  end
end
p fizzbuzz([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])
