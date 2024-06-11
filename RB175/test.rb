=begin

There are no explanations. You have to create the code that gives the following results in Python, Ruby, and Haskell:

PEDAC
explicit:
input takes in a single input
the output is an array

implicit:
if input is single digit  then first index of output array is the input
  second index of output array will be the input size but all in the integer 1
end
if it is not single digit then take the input value with an additional last index, then reverse and add to the first index in the output arr
end


algo:
initialize output_arr to []
check to see the size of the input integer. if it is append to output_arr
if not convert to an arr of chars and append to this array the last value once more. Name this str_arr
  - join this value, convert to an integer and append to output_arr
- now to handle the last index of the output_arr
- initialize placeholder_arr. input times append the input integer to this arr. join this together, convert to int and append to output_arr
end
=end

def one_two_three(int)
output_arr = []

if int < 10
  output_arr << int
else
  digits = int.to_s.chars
  output_arr << (digits + [digits.last]).join.reverse.to_i
end

output_arr << ("1" * int).to_i

output_arr
end
p one_two_three(0) == [0, 0]
p one_two_three(1) == [1, 1]
p one_two_three(2) == [2, 11]
p one_two_three(3) == [3, 111]
p one_two_three(19) == [991, 1111111111111111111]




