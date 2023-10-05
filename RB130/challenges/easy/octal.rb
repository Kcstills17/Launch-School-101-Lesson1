=begin
P. Understand the Problem
  Explicit Requirements:
  - we are to create an Octal class that takes a string value as an argument and outputs the decimal unit that represents that value as an octal.
  - Decimal is a base-10 system. A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

    The rightmost digit gets multiplied by 100^ = 1
    The next digit gets multiplied by 10^1 = 10
    The digit after that gets multiplied by 10^2 = 100
    The digit after that gets multiplied by 10^3 = 1000
    ...
    The n*th* digit gets multiplied by 10^n-1.
    All of these values are then summed.

    - Octal numbers are similar, but they use a base-8 system. A number 233 in base 8 can be understood as a linear combination of powers of 8:

    The rightmost digit gets multiplied by 8^0 = 1
    The next digit gets multiplied by 8^1 = 8
    The digit after that gets multiplied by 8^2 = 64
    The digit after that gets multiplied by 8^3 = 512
    ...
    The n*th* digit gets multiplied by 8n-1.
    All of these values are then summed.

Thus:

  Implicit Requirements:
  - invalid str argument examples. These all return 0
    - any alpha characters being included
    - any str number greater than 7 or including a number > 7 is not  valid.
    - must get each element at each particular index of the passed in str.
    - starting in reverse order of the index you multiply the digit by 8(index)

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
    233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

D: Data Structures
  - input: integer
  - output: integer
  - possible intermediary structure: array

A: Algorithm
- Create Octal class with an int argument being passed in and initialized as instance variable @int
- create a getter method for @int
- create a private method validation
    - return true if there is any alpha character, value less than 0, or value greater than or equal to  8
- create private method split_int_array
  - initialize an arr to an empty array
  - append to the array the reversed str values
  - split the arr by each elements and then iterate through the array and convert each value back into an integer

  - create method to_decimal
    - return 0  if validation
    - initialize values to split_int_array
    - iterate through values  and get each num and index. multply each num by the result of 8^2.
    - sum this value and return it

C: Code with intent

=end

class Octal
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_decimal
    return 0 if validation
    value = split_int_array
    value.map.with_index { |num, i| num * (8**i) }.sum
  end

  private

  def validation
    arr = value.chars
    arr.any? { |elem| elem.to_i.to_s != elem || elem.to_i < 0 || elem.to_i >= 8 }
  end

  def split_int_array
    arr = value.chars.reverse.map(&:to_i)
  end
end
