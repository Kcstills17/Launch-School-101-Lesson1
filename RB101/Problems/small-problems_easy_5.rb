=begin
1. ASCII String Value
Write a method that determines and returns the ASCII string value of a string that is passed in
as an argument. The ASCII string value is the sum of the ASCII values of every character in the
string. (You may use String#ord to determine the ASCII value of a character.)

P. Understand the Problem
  Explicit Requirements:
  - argument is string
  - returns the ASCII String value of every character in the string


  Implicit Requirements:
  - empty space by itself returns 0

  Clarifications/ Questions:
  - ASCII are integer values to represent string

E: Examples/ Edge Cases
  ascii_value('Four score') == 984
  ascii_value('Launch School') == 1251
  ascii_value('a') == 97
  ascii_value('') == 0

D: Data Structures
  - input: string
  - output: integer


A: Algorithm
  def ascii_value(string)
    - initiallize variable total and set to 0.
    - iterate through input with each element
      - set ascii_value to += element converted to ascii value
    end block
    - return total

  end


C: Code with intent

=end

def ascii_value(string)
total = 0
string.each_char do |element|
  total += element.ord
end
 total
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0



=begin
2. After Midnight (Part 1)
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes
is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format
(hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

P. Understand the Problem
  Explicit Requirements:
    -  input is an integer
    - represented by number of minutes
    - if  the number of minutes is positive it is after midnight
    - if the number of minutes is negative it is before midnight
    - use this logic to convert the time in a 24 hr format (hh:mm)
    - Do not use the Date and Time classes


  Implicit Requirements:
  - every single 1 digit is either 1 minute past or before midnight.
  - unless zero
  - output is string
  - edge cases show that if a time goes past 24 hr mark either in positive or negative direction that it loops back around.
  - first increment of 10 will move the digit place 1 digit over (00:10)
  - every increment of 60 in either direction will move the digit place 2 digits over (including the :).  (01:00)
  - first increment of 10 in the hr place will move digit over one place (10:00)
  - every increment of 1440 in either direction will reset to time to "00:00"

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  time_of_day(0) == "00:00"
  time_of_day(-3) == "23:57"
  time_of_day(35) == "00:35"
  time_of_day(-1437) == "00:03"
  time_of_day(3000) == "02:00"
  time_of_day(800) == "13:20"
  time_of_day(-4231) == "01:29"

D: Data Structures
  - input: integer
  - output: string


A: Algorithm
  def time_of_day(number)
    - if number > 1440
      -  number % 1440
      - convert_number(number)
    - elsif number < -1440
      - number % 1440
      - convert_number(number)
    -else
      - convert_number(number)
    end if statment
  end

  Sub-Method
  def convert_number(time_chunk)
    - initiallize variable hour and set to time_chumk/60
    - initiallize ten_minte and set to (time_chumk - 60 * hour) / 10
    - initiallize one_minute and set to time_chunk being converted to string, split into an array, grabbing the last place, and convert back to integer
    - use 3 variables to format into a time metric
  end

C: Code with intent




=end

def convert_number(time_chunk)
  hour = time_chunk/ 60
  ten_minute = (time_chunk - 60 * hour)/ 10
  one_minute = time_chunk.to_s.split('')[-1].to_i

  p sprintf("%d#{hour}:#{ten_minute}#{one_minute}", 0)
end
convert_number(1440)


def time_of_day(number)
  if number > 1440
     reset_positive_number = number % 1440
    convert_number(reset_positive_number)
  elsif number < -1440
    reset_negative_number = number % -1440
    convert_number(reset_negative_number).
  else
    convert_number(number).size
  end
end

p time_of_day(200)



