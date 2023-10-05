=begin
P. Understand the Problem
  Explicit Requirements:
  - we are to create a Perfect number class which can tell if an input number is a perfect, abundant, or deficient number

  -  Perfect numbers have an Aliquot sum that is equal to the original number.
  - Abundant numbers have an Aliquot sum that is greater than the original number.
  - Deficient numbers have an Aliquot sum that is less than the original number.


  Implicit Requirements:
  - for each input that is passed in we must get all divisors.
  - must raise a StanardError if a number lower than 0 is passed in.
  - must create a class method classify that will return either the string 'perfect', 'abundant' or 'deficient'
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


    6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
    28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
    15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
    24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
    Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

Write a

D: Data Structures
  - input: int
  - output: string
  - possible intermediary structure: array


A: Algorithm
- Create PerfectNumber class
- create a private class method called determine_value. This method shall create an array from 1 up until the number before last of int.
- then select all values from which int % by each elem is == to 0
- add all of these values together for return value
- create class method classify(int)
  - raise a StandardError if int is < 0
  - otherwise return 1 of these 3 str based on condition
    - if determine_value is == to int return 'perfect'
    - if determine_value is < int return 'deficient'
    - otherwise return 'abundnat'
C: Code with intent

=end

class PerfectNumber

  def self.classify(int)
    number =  determine_value(int)
    raise StandardError if int < 0

    case
    when number == int
        'perfect'
    when number < int
        'deficient'
    else
        'abundant'
    end

  end

  class << self
  private

  def determine_value(int)
    result = (1...int).select{|elem|  int % elem == 0 }.sum
  end
  end
end



p PerfectNumber.classify(15)
