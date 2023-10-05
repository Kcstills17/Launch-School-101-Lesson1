=begin
P. Understand the Problem
  Explicit Requirements:
  - we create a class SumOfMultiples that will take in a n amount of  integers
  - these integers will represent the multiples that will want to use later

  Implicit Requirements:
  - the class will have an instance method `to` that will have an int argument
  - This number represents from 1 upto but not including the current int. It will use the arguments passed in at instantiation to determine the multiples.
  - if no number is passed in 3 and 5 will be default instantiation parameters

  - create a class method to  that works the same way as the instance method.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: integer/s
  - output: integer
  - possible intermediary structure: array


A: Algorithm
- create SumOfMultiples class and initialize @multiple_value to *multiple_values to store possible values. Set the default value to [3, 5] if nothing is passed in
- create a getter method for @values
- create  method to which passes in an integer
    - initialize an arr called selected_values to an empty arr
    - iterate through values and get each divisor. within the arr iterate from 1 upto and not including int. if  the current element % by the current_num of the range is 0
    - then append the current_num to selected_values
    - remove any copy values as if there are 2 of the same number it counts only once.
    - return the sum of selected_values

- create a class method to
    - instantiate a new instance and invoke the to method on this instance.
-


C: Code with intent




=end

class SumOfMultiples
  attr_reader :values

  def initialize(*values)
    @values = values.empty? ? [3, 5] : values
  end

  def to(int)
    selected_values = []
    values.each {|divisor|  (1...int).each {|curr_num|    curr_num % divisor == 0 ? selected_values << curr_num : selected_values }}
    selected_values.uniq.sum
  end

  def self.to(int)
    SumOfMultiples.new.to(int)
  end
end

