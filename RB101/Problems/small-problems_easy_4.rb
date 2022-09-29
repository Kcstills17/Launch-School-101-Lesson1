=begin
1. short long shot
Write a method that takes two strings as arguments, determines the longest of the two strings,
and then returns the result of concatenating the shorter string, the longer string, and the
shorter string once again. You may assume that the strings are of different lengths.

P. Understand the Problem
  Explicit Requirements:
  - program has two parameters, both of which should be string
  - return the shorter string concatenated by the longer string and concatenated by the shorter string once more
  - assume they are of different lengths

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - Based on the last statement do not worry about if string are equal?

E: Examples/ Edge Cases
  - short_long_short('abc', 'defgh') == "abcdefghabc"
  - short_long_short('abcde', 'fgh') == "fghabcdefgh"
  - short_long_short('', 'xyz') == "xyz"

D: Data Structures
  - input: string
  - output: string


A: Algorithm
  def short_long_short(str1, str2)
    - is str1's size is greater than str2's size? if true str2 + str1 + str2. if not, str1 + str2 + str1
  end

C: Code with intent

=end
def short_long_short(str1, str2)
  str1.size > str2.size ? str2 + str1 + str2 : str1 + str2 + str1
end

  short_long_short('abc', 'defgh') == "abcdefghabc"
  short_long_short('abcde', 'fgh') == "fghabcdefgh"
  short_long_short('', 'xyz') == "xyz"

=begin
2. What century is that?
Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century number,
and ends with st, nd, rd, or th as appropriate for that number.

P. Understand the Problem
  Explicit Requirements:
  - one parameter that is a year(integer)
  - return value is a string that starts with the century number
  - ends with st, nd, rd, or th as appropriate for number


  Implicit Requirements:
  -

  Clarifications/ Questions:

E: Examples/ Edge Cases
 - century(2000) == '20th'
 - century(2001) == '21st'
 - century(1965) == '20th'
 - century(256) == '3rd'
 - century(5) == '1st'
 - century(10103) == '102nd'
 - century(1052) == '11th'
 - century(1127) == '12th'
 - century(11201) == '113th'



D: Data Structures
- input: integer
- output:  string


A: Algorithm
  def century(year)
    - initiallize variable teens and set equal to  range between 11 and 19
    - set counter equal to 1
    - until year is <= 100
      - decrement year by 100
      - increment counter by 1
    - end loop
    - set year equal to counter converted to string
    - if the string elements ranging from 11 to 19 are included in year
        - append th to year
    - elsif year's last character  == 1 converted to string
        - append st to year
    - elsif elsif year's last character == 2 converted to string
        - append nd to year
    -elsif year's last character  == 3 converted to string
        - append rd to year
    -else
        - append th to year
    end if statement

  end

C: Code with intent

=end

def century(year)
  counter = 1
  until year <= 100
    year -= 100
    counter += 1
  end
year = counter.to_s
if (%w[11 12 13 ]).include?(year[-2..-1])
  year << 'th'
elsif year[-1]== '1'
  year << 'st'
elsif year[-1] == '2'
  year << 'nd'
elsif year[-1] == '3'
  year << 'rd'
else
  year << 'th'
end
year


end

 century(2000) == '20th'
 century(2001) == '21st'
 century(1965) == '20th'
 century(256) == '3rd'
 century(5) == '1st'
 century(10103) == '102nd'
 century(1052) == '11th'
 century(1127) == '12th'
 century(11201) == '113th'

=begin

LS solution
def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

=end

=begin
4. Leap Years part 1
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4,
unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year
unless the year is evenly divisible by 400.
Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0
as input, and returns true if the year is a leap year, or false if it is not a leap year.

P. Understand the Problem
  Explicit Requirements:
  -  one parameter/argument that is a positive integer
  - return true if year is a leap year, false otherwise
  -


  Implicit Requirements:
  -

  Clarifications/ Questions:
  - a leap year occurs in every year that is evenly divisible by 4, unless the year is also divisible by 100.
  - the one edge case to when a leap year divisible by 100 is a leap year is if it is also divisible by 400

E: Examples/ Edge Cases
  leap_year?(2016) == true
  leap_year?(2015) == false
  leap_year?(2100) == false
  leap_year?(2400) == true
  leap_year?(240000) == true
  leap_year?(240001) == false
  leap_year?(2000) == true
  leap_year?(1900) == false
  leap_year?(1752) == true
  leap_year?(1700) == false
  leap_year?(1) == false
  leap_year?(100) == false
  leap_year?(400) == true

D: Data Structures
  - input:integer
  - output: boolean


A: Algorithm
def leap_year(year)
  - set rare_leap year to when a year is evenly divisible by 400
  - set common_leap_year to when a year is evenly divisible by 4 and not by 100
  - year is true?  when  common_leap_year or rare_leap_year are true. false otherwise
end

C: Code with intent

=end

def leap_year?(year)
  rare_leap_year =( year % 400 == 0)
  common_leap_year = (year % 4 == 0 && year % 100 != 0 )
  year ? rare_leap_year || common_leap_year : false
end

  leap_year?(2016) == true
  leap_year?(2015) == false
  leap_year?(2100) == false
  leap_year?(2400) == true
  leap_year?(240000) == true
  leap_year?(240001) == false
  leap_year?(2000) == true
  leap_year?(1900) == false
  leap_year?(1752) == true
  leap_year?(1700) == false
  leap_year?(1) == false
  leap_year?(100) == false
 leap_year?(400) == true

=begin
5. Leap Years part 2
The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752,
the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly
divisible by 4. Using this information, update the method from the previous exercise to determine leap
years both before and after 1752.

P. Understand the Problem
  Explicit Requirements:
  - update previous method
  - before the year 1752 all years evenly distributed by 4 were considered leap years
  - determine leap years both prior and after this change


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  leap_year?(2016) == true
  leap_year?(2015) == false
  leap_year?(2100) == false
  leap_year?(2400) == true
  leap_year?(240000) == true
  leap_year?(240001) == false
  leap_year?(2000) == true
  leap_year?(1900) == false
  leap_year?(1752) == true
  leap_year?(1700) == true
  leap_year?(1) == false
  leap_year?(100) == true
  leap_year?(400) == true

D: Data Structures
  - input: integer
  - output: boolean


A: Algorithm
  - set rare_leap year to when a year is evenly divisible by 400
  - set common_leap_year to when a year is evenly divisible by 4 and not by 100
  - year is true?  when  common_leap_year or rare_leap_year are true. false otherwise
  - set new_leap equal to previous statement
  - when year > 1752 ? use new_leap : else use number % 4 == 0
end

C: Code with intent

=end

def leap_year_new?(year )
  rare_leap_year = ( year % 400 == 0)
  common_leap_year = (year % 4 == 0 && year % 100 != 0 )
  new_leap = year ? rare_leap_year || common_leap_year : false
  year > 1752 ? new_leap : year % 4 == 0
end


  leap_year_new?(2016) == true
  leap_year_new?(2015) == false
  leap_year_new?(2100) == false
  leap_year_new?(2400) == true
  leap_year_new?(240000) == true
  leap_year_new?(240001) == false
  leap_year_new?(2000) == true
  leap_year_new?(1900) == false
  leap_year_new?(1752) == true
  leap_year_new?(1700) == true
  leap_year_new?(1) == false
  leap_year_new?(100) == true
  leap_year_new?(400) == true


=begin
6. Multiples of 3 and 5
Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number,
and then computes the sum of those multiples. For instance, if the supplied number is 20, the result
should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).You may assume that the number passed in is an
integer greater than 1.

P. Understand the Problem
  Explicit Requirements:
  - searches for all multiples of 3 and 5 that between 1 and some other number
  - other number is parameter/ argument passed in
  - parameter will be greater than 1


  Implicit Requirements:
  -

  Clarifications/ Questions:
  - are common multiples between 3 and 5 only added once to our result?

E: Examples/ Edge Cases
  multisum(3) == 3
  multisum(5) == 8
  multisum(10) == 33  3, 5, 6, 9, 10
  multisum(1000) == 234168


D: Data Structures
  - input: integer
  - output: integer


A: Algorithm
    def multisum(number)
      - intiallize empty array named tally_nums
      - from 1 to the given num iterate through each num and selec those evenly divisible by 3 or 5
      - if num is evenly divisible by 3 or 5
          - append num to tally_nums
      end if statement
      end block
      add together the total of all of the individual elements of tally_nums
    end


C: Code with intent

=end
def multisum(number)
  tally_nums = []
(1..number).select do |num|
  if num % 3 == 0 || num % 5 == 0
    tally_nums << num
  end
end
   tally_nums.inject {|total, num| total += num}
end

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

=begin
7. Running totals
Write a method that takes an Array of numbers, and returns an Array with the same number of elements,
and each element has the running total from the original Array.

P. Understand the Problem
  Explicit Requirements:
  - one parameter/argument, an array of numbers
  - return array with the same elements but at each point has the running total of the original array


  Implicit Requirements:
  - if the array is empty, return an empty array.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  running_total([2, 5, 13]) == [2, 7, 20]
  running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
  running_total([3]) == [3]
  running_total([]) == []


D: Data Structures
  - input: array
  - output: array


A: Algorithm
    def running_total(number_array)
      - set running_array to []
      - set current_iteration to
      - set counter to 1
      - append number_array at counter to running_array

      - until counter == number_array.size + 1
        - set variable current_iteration equal to  go through number_array starting at index 0 until current index.
        - set current_total to add the current numbers together at the point of vurrent_iteration.
        - append current_total to running_array
        - increment counter by 1
      end until loop
      running_array
    end

C: Code with intent

=end

def running_total(number_array)
  running_array = []
  counter = 1

  until counter ==  number_array.size + 1
    current_iteration = number_array[0, counter]
   current_total = current_iteration.inject(:+)
   running_array << current_total
    counter += 1
  end
  running_array
end

 running_total([2, 5, 13]) == [2, 7, 20]
 running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
 running_total([3]) == [3]
 running_total([]) == []


# LS solution
# def running_total(array)
  # sum = 0
  # array.map { |value| sum += value }
# end

=begin
8. convert a string to number
The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer.
String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer.
You may not use any of the methods mentioned above.For now, do not worry about leading + or - signs, nor should you
worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i,
Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

P. Understand the Problem
  Explicit Requirements:
  -  convert string to a number without using any prebuild methods such as String#to_i or Integer()
  -  take a string of digits as the argument
  -


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  string_to_integer('4321') == 4321
  string_to_integer('570') == 570

D: Data Structures
  - input: string
  - output: integer


A: Algorithm
  - create a constant DIGITs and set it to a hash with 9 string '0' - '9' with each value being the corresponding number
  def string_to_integer(string)
    - initiallize variable digits and set it to equal iterating through the input as an array. Then change the characters into the value of DIGITS

    - set value to 0
    - iterate through digits. set value to equal 10 times value + digit
    - return value

  end

C: Code with intent


=end



  DIGITS = {
    '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
    '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
  }

  def string_to_integer(string)
     digits = string.chars.map { |char| DIGITS[char] }

    value = 0
     digits.each { |digit| value = 10 * value + digit }
    value
  end


 p string_to_integer('674')


# come back to this problem. Could not solve on my own.
# this is LS solution



=begin
9. Convert a String to a Signed Number!
In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise,
you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a
leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method
should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.You may not use any of the standard conversion methods
available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

P. Understand the Problem
  Explicit Requirements:
  -  argument/parameter is string of digits
  - returns appropriate number as integer
  - string may have a + or -; if the first character is + it is positive, and if -, it is negative
  - if no sign is givenm return a positive number.
  - do not use any standard conversion methods
  - you can use the string_to_integer method from before


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - string_to_signed_integer('4321') == 4321
  - string_to_signed_integer('-570') == -570
  - string_to_signed_integer('+100') == 100

D: Data Structures
  - input: string
  - output: positive or negative integer


A: Algorithm
  def string_to_signed_integer(string)
    - if string starts with ('+')
      - set variable remove_plus_sign to equal  string with the + removed
      - use string_to_integer(remove_plus_sign)
      else if string starts with ('-')
        - set variable remove_minus_sign to equal string with - removed
        - use string_to_integer(remove_minus_sign)
      else
        - use string_to_integer(string)
      end if statement
  end

C: Code with intent

=end
def string_to_signed_integer(string)
  if string.start_with?("+")
    remove_plus_sign = string.delete("+")
    string_to_integer(remove_plus_sign)
  elsif
    string.start_with?('-')
    remove_minus_sign = string.delete("-")
    string_to_integer(remove_minus_sign) * -1
  else
    string_to_integer(string)
  end
end

   string_to_signed_integer('4321') == 4321
   string_to_signed_integer('-570') == -570
   string_to_signed_integer('+100') == 100


   # LS solution
   # def string_to_signed_integer(string)
    # case string[0]
    # when '-' then -string_to_integer(string[1..-1])
    # when '+' then string_to_integer(string[1..-1])
    # else          string_to_integer(string)
    # end
  # end

=begin
9. Convert a Number to String!
In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers.
In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format,
etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

  P. Understand the Problem
  Explicit Requirements:
  - argument is positive integer or zero
  - output is the string representation of the argument
  - Conventional conversion methods are not allowed
  -


  Implicit Requirements:
  - return the string number e.g. 1 => '1' not for example 1 => 'one'

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - integer_to_string(4321) == '4321'
  - integer_to_string(0) == '0'
  - integer_to_string(5000) == '5000'


D: Data Structures
  - input: integer
  - output: string


A: Algorithm
  - create constant NUMBERS with your keys being the digits 0-9 and the values being those respective numbers in string form

 def integer_to_string(number)
    - set counter to -
    - set result =[]
  - if NUMBERS includes the input number
    - append number to result
    - counter += 1
    end if statement
    return result joined back into string
 end


C: Code with intent



=end


NUMBERS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9',
}

def integer_to_string(number)
  counter = 0
  result = []

    if  NUMBERS.include?(number[counter])
      result << number
      counter += 1
    end
  result.join("")
end

  integer_to_string(4321) == '4321'
  integer_to_string(0) == '0'
  integer_to_string(5000) == '5000'



=begin
LS Solution

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

=end


=begin
10. Convert a Signed Number to a String!
In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise,
you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s,
String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

P. Understand the Problem
  Explicit Requirements:
  -  argument is an integer
  - output the string representation
  - do not use any standard methods
  - You can use the integer_to_string method from the previous question


  Implicit Requirements:
  -  if greater than 0 add the character "+" to the beginning of the string
  -  if less than 0 add the character '-' to the beginning of the string

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  signed_integer_to_string(4321) == '+4321'
  signed_integer_to_string(-123) == '-123'
  signed_integer_to_string(0) == '0'

D: Data Structures
  - input: integer
  - output: string


A: Algorithm
  use same constant NUMBERS from previous exercies
  def signed_integer_to_string(number)
   initiallize positive_number and set to "+" + integer_to_string(number)
   if number is > 0 ? return positive number : if not return integer_to_string(number)

  end

C: Code with intent

=end
def signed_integer_to_string(number)
  positive_number =  integer_to_string(number).prepend('+')
  number > 0 ? positive_number : integer_to_string(number)
end

 p signed_integer_to_string(4321) == '+4321'
 p signed_integer_to_string(-123) == '-123'
 p signed_integer_to_string(0) == '0'
