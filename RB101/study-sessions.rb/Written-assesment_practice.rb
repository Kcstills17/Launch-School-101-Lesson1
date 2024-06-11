
# question 1
# Have the method letter_changes(str) take the str parameter being passed and
# modify it using the following algorithm. Replace every letter in the string
# with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
# Then return this modified string.


=begin
P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output  is to replace every letter of the string with the 3rd letter following it in the alphabet
  - for example c becomes f, Z becomes C
  - then return the modified string.

  Implicit Requirements:
  - non alpha characters are not changed
  - if a character goes past Z on the asci value chart you must reset the value back to
  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')


D: Data Structures
  - input: is string
  - output: is string but with each alpha character replaced with the 3rd letter following it in the alphabet
  - possible intermediary structure: possible array


A: Algorithm
def letter_changes(str)
  convert str into an array
  - iterate through each element of str
  - if str is an alpha character
      then convert each str into an ascii value and increment by 3
      - initiallize variable ascii_num and set to each element converted to asci and then incremented by 3
      - if ascii_num is about to bypass "Z" then reset then subtract the current value to start over back at "A"
      - if acii_num is about to bypass 'z'  then reset then subtract the current value to start over back at 'a'
  else
     return element
  end. join the returned elements together
end

C: Code with intent


=end

def letter_changes(str)
     str.chars.map do |element|
      if('a'..'z').zip("A".."Z").flatten.include?(element)

         ascii_num = element.ord + 3
        ascii_num > 122 ?  ascii_num = ascii_num - 26 : ascii_num
         ascii_num > 90 && ascii_num <= 95 ? ascii_num = ascii_num - 26 : ascii_num
           ascii_num.chr
      else
        element
      end
    end.join
end

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p  letter_changes('xyz') == ('abc')



# question 2

=begin
 For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20


P. Understand the Problem
  Explicit Requirements:
  - find the number of integers less than or equal to the input are odd but not prime
  - the input will be an intege between 1 and 1000
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - a prime number is a natural number greater than 1 that has no positive divisors other than 1 and itseld

E: Examples/ Edge Cases
  p odd_not_prime(15) == 3
  p odd_not_prime(48) == 10
  p odd_not_prime(82) == 20



D: Data Structures
  - input:  integer
  - output:  integer that represents the amount of odd numbers that are <= to input and also a prime number
  - possible intermediary structure:


A: Algorithm
  def odd_not_prime(int)
     check all numbers between 1 and int
     with the list of numbers iterate through each and transform each value onto a block
      if num is odd?

      end

      helper_method
      def get_prime_number(num)
      end

  end

C: Code with intent

=end
=begin
def odd_not_prime(int)
   (1..int).to_a.map do |num|
    if num.odd?
        num %
    end
  end
end


odd_not_prime(15)
=end


=begin
# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

=begin
P. Understand the Problem
  Explicit Requirements:
  - input is an array of numbers
  - output is an array that contains how many numbers from each input number are smaller than the given number
    - only count unique values. so if it has already been counted
       do not count again


  Implicit Requirements:
  - if all input numbers within array are the same then within
    output array have 0 the same number of times as the original input array

  Clarifications/ Questions:
  - - modify the same original array or return a new array?

E: Examples/ Edge Cases
  p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
  p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
                            == [0, 2, 4, 5, 6, 1, 2, 3, 2]
  p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
  p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
  p smaller_numbers_than_current([1]) == [0]

D: Data Structures
  - input: array containing integer values
  - output: array containing integer values that each represent the number
            of other numbers from the original array are smaller than it
            e.g. [8,1,2,2,3] for 8 there are 4 values smaller than it but only 3 unique values smaller. So that should be appended to new array
  - possible intermediary structure: a new array to go through each num


A: Algorithm
       initiallize constant HASH_NUM_hash that has integers 0-9 as keys and set all values to 0

    def smaller_numbers_than_current(arr)
      - initiallize variable hash_nim and set to an empty hash
      - initiallize variable result_arr and set to an empty array
      - set the key value of hash_num  to be 0 - 20 for integers and each value to all be 0
      - initiallize  variable unique_arr to be all unique values of arr
      - iterate through unique_arr and its num.
        - iterate through all num and its values
          - if num is > value
            - then increment each value at the key that matches num > value by 1
              - end if statemengt
            - end inner block
          - end outer block
        - iterate through arr and its elements
            - append the value of hash_key that matches each element  to result_arr


    end

C: Code with intent
=end



# [8 1 1 2 3 ]
def smaller_numbers_than_current(arr)
  hash_num = {}
  result_array = []
  20.times { |i| hash_num[i] = 0 }
  unique_arr = arr.uniq
  unique_arr.each do |num|
    unique_arr.each do |value|
      if num > value
        hash_num[num] += 1
      end
    end
  end
  arr.each do |element|
    result_array << hash_num[element]
  end
  result_array
end

smaller_numbers_than_current([8,1,2,2,3]) #== [3, 0, 1, 1, 2]

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]


def increment(x)
   x << 'b'
  end
  y = 'a'
  p increment(y)
   puts y

    #desribe this hash
  hsh = {
    'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
    'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
    'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
    'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
    'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
  }

  # Given this data structure write some code to return an array containing the colors of the fruits, and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.
# - How to describe this hash?






=begin
hsh.values.map do |inner_hash|
  # type, colors, size = inner_hash.values
  details = inner_hash.values
  type = details.values[0]
  colors = details.values[1]
  size = details.values[2]
  p type
  p colors
  p size
end
=end


def test(str)
   str += '!'
   str.downcase!
  end

  test_str = 'Written Assessment'
  test(test_str)
  puts test_str


 p 1 > 2

 def fix(value)
   value = value.upcase!
   p value
   value.concat('!')
  end

  s = 'hello'
  p s
  t = fix(s)

p '1'.ord
