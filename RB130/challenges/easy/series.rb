=begin

P. Understand the Problem
  Explicit Requirements:
  - Create a Series class that will take a string argument
  - the goal is to take a string of digits and return all the possible consecutive number series of a specified passed in integer length
  Implicit Requirements:
  - there will be a slices instance method that passes in an integer argument
  -  if the specified integer length to slice of the str is larger than the size of the str then raise an argument error

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
- the string "01234" has the following 3-digit series:

    012
    123
    234


D: Data Structures
  - input: str
  - output: array
  - possible intermediary structure: array


A: Algorithm
    - create Series class and initialize @str to passed in argument str
    - create a getter method for @str
    - create a private method convert to split_arr_and_conver_to_int
      - this will convert the passed in str into an array split by each element then convert each to an integer
    - create method slices with an integer parma.
      - initialize value_arr to split_arr
      - raise an argument error if value_arr's size is < then integer argument
      - initialize result_arr to []
      - initialize start_point to 0
      - initialize end_point to int argument -1
      - until end_point is > then value_arr.size - 1
        - append an array that consists of a range from start_point to end_point to result_arr
        - increment both start_point and end_point
      - return result_arr

C: Code with intent










=end

  class Series
    attr_reader :str

    def initialize(str)
      @str = str
    end

    def slices(int)
      value_arr = split_arr_and_conver_to_int
      raise ArgumentError if value_arr.size < int
      result_arr = []

      start_point = 0
      end_point = int - 1

      until end_point > value_arr.size - 1
        result_arr << value_arr[start_point..end_point]
        start_point += 1
        end_point += 1
      end
      result_arr
    end

    private

    def split_arr_and_conver_to_int
      str.chars.map {|num| num.to_i}
    end
  end

ran = Series.new('123457')
p ran.slices(3)
