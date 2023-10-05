=begin

P. Understand the Problem
  Explicit Requirements:
  - we  have a Roman_numeral class. In this class we pass in one input as an argument


  Implicit Requirements:
   - we shall output a value that represents this integer in roman_numeral form
  - this shall occur when a custom class method `to_roman` is invoked.
  - We should be able to compare integers with our roman_numeral values
  - Need to create a structute that accounts for each digit of a roman numeral and it's appropriate value.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: integer
  - output: roman numeral
  - possible intermediary structure:


A: Algorithm
- create a hash that has each specified integer value of importance as a key and each specified roman_numeral associated as the value
- create a variable named roman_numeral_result and set to an empty str
- access the keys which are each integer of the hash and the values which are the rn of the hash
- enter a while loop that relies on the condition that while the current passed in argument is >= then the current integer (which will start from the top)
- subtract int from the num
- then add the rn to the roman_numeral_result
- repeat and then return roman_numeral_result

C: Code with intent

=end

class RomanNumeral
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  ROMAN_NUMERALS = {
    1000 => 'M', 900 => 'CM', 500 => 'D',
    400 => 'CD', 100 => 'C', 90 => 'XC',
    50 => 'L', 40 => 'XL', 10 => 'X',
    9 => 'IX', 5 => 'V', 4 => 'IV',
    1 => 'I'
  }

  def to_roman
    final_value = ''

    ROMAN_NUMERALS.each do |int, rm|
      while self.num >= int
        self.num -= int
        final_value += rm
        final_value
    end
  end
  final_value
  end
end


