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

 ascii_value('Four score') == 984
 ascii_value('Launch School') == 1251
 ascii_value('a') == 97
 ascii_value('') == 0



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
    - if time_chunk > 0
        -initiallize hour and seto to time_chunk/60
        -intitiallize ten_minute and set to (time_chunk - 60 * hour)/ 10
        -initiallize one_minute and set to time_chunk.to_s.split(')[-1].to_i

        - print the variables formatted into hh:mm
    - elsif time_chunk < 0
        - initiallize negative_time_chunk and set to 1440 + time_chunk
        - set hour  to negative_time_chunk/60
        - set ten_minute  to (negative_time_chunk - 60 * hour)/ 10
        - set one_minute and set to negative_time_chunk.to_s.split(')[-1].to_i

        - print the variables formatted into hh:mm
    - else
        - print 00:00
  end

C: Code with intent




=end


def convert_number(time_chunk)
  if time_chunk > 0

    ten_hour = time_chunk/ 600
    hour = time_chunk/ 60
    ten_minute = (time_chunk - 60 * hour)/ 10
    ten_hour >= 1 ? hour = hour % 10 : hour = hour
    minute = time_chunk.to_s.split('')[-1].to_i
    sprintf("%d#{hour}:#{ten_minute}#{minute}", ten_hour)

  elsif  time_chunk < 0
    negative_time_chunk = 1440 + time_chunk
    ten_hour = negative_time_chunk/ 600
    hour = negative_time_chunk/ 60
    ten_minute = (negative_time_chunk - 60 * hour)/ 10
    minute = negative_time_chunk.to_s.split('')[-1].to_i
    ten_hour >= 1 ? hour = hour % 10 : hour = hour
    sprintf("%d#{hour}:#{ten_minute}#{minute}", ten_hour)
  else
     sprintf("%d0:00", 0)
  end
end

def time_of_day(number)
  if number > 1440
     reset_positive_number = number % 1440
     convert_number(reset_positive_number)
  elsif number < -1440
    reset_negative_number = number % -1440
    convert_number(reset_negative_number)
  else
    convert_number(number)
  end
end



  p time_of_day(0) == "00:00"
  p time_of_day(-3)
  time_of_day(35) == "00:35"
  time_of_day(-1437) == "00:03"
  time_of_day(3000) == "02:00"
  time_of_day(800) == "13:20"
  time_of_day(-4231) == "01:29"


 # LS solution
=begin
 MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

=end
=begin

3. After Midnight (Part 2)
As seen in the previous exercise, the time of day can be represented as the number of minutes before
or after midnight. If the number of minutes is positive, the time is after midnight. If the number of
minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before
and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.


P. Understand the Problem
  Explicit Requirements:
  - write two methods
  - one method returns the number of minutes before midnight
  - other method returns the number of minutes after mignight
  - both methods should return a value in the range 0..1439
  - do not use Date or Time methods



  Implicit Requirements:
  -  24:00 is a valid input for this specific example

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  after_midnight('00:00') == 0
  before_midnight('00:00') == 0
  after_midnight('12:34') == 754
  before_midnight('12:34') == 686
  after_midnight('24:00') == 0
  before_midnight('24:00') == 0

D: Data Structures
  - input: string
  - output: integer


A: Algorithm

   def after_midnight(string)
    - if string is equal to 00:00 or 24:00
      - return 0
    - else
      - set variable hours to equal string split at the : at index 0 conveted to integer multiplied by 60
      - set variable minutes to equal string split at the : at index 1
      return hour + minutes
      end
   end

   def before_midinight(string)
     - if after_midnight(string) is equal to 0 ? return 0 : otherwise return 1440 - after_midnight(string)
   end

C: Code with intent

=end

def after_midnight(string)
  if string == '00:00' || string == '24:00'
    0
  else
    hours = string.split(":")[0].to_i * 60
    minutes = string.split(":")[1].to_i
    hours + minutes
  end
end

def before_midnight(string)
  after_midnight(string) == 0 ? 0 : 1440 - after_midnight(string)
end

   after_midnight('00:00') == 0
   before_midnight('00:00') == 0
  after_midnight('12:34') == 754
  before_midnight('12:34') == 686
  after_midnight('24:00') == 0
  before_midnight('24:00') == 0

=begin
4. Letter Swap

Given a string of words separated by spaces, write a method that takes this string of words and returns
a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at
least one word. You may also assume that each string contains nothing but words and spaces

P. Understand the Problem
  Explicit Requirements:
  - argument is a string of words separated by spaces
  - output returns the input with the first and last letter of every word swapped with each other
  - assume that every word contains at leats one letter
  - assume that the string will always contain at least one word
  - string contains nothing but words and spaces


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
  swap('Abcde') == 'ebcdA'
  swap('a') == 'a'

D: Data Structures
  - input: string
  - output: string


A: Algorithm
  def swap_first_and_last(word)
    - set the first index of word and the last index of word to the last digit of word and the first digit of word
  end

  def swap(words)
    set result equal to words split then transform each element
      - use swap_first_and_last(words)
    end block
    join result together
  end

C: Code with intent

=end

def swap_first_and_last(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

  swap_first_and_last("hello world")


def swap(words)
  result = words.split(" ").map do |element|
   swap_first_and_last(element)
end
result.join(" ")
end
   swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
   swap('Abcde') == 'ebcdA'
   swap('a') == 'a'


=begin
5. Clean up the Words

Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters,
write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If
one or more non-alphabetic characters occur in a row, you should only have one space in the result
(the result should never have consecutive spaces).

P. Understand the Problem
  Explicit Requirements:
  - argument is lowercased string and an assortment of non alpha characters
  - return output that replaces all non alpha characters with spaces.
  - if one or more non alpha characters occur in a row, you should habe only one psace in the result


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  cleanup("---what's my +*& line?") == ' what s my line '

D: Data Structures
  - input: string
  - output: string


A: Algorithm
  def cleanup(input)
      - if the letters a-z are not included in the input substitute them with a space and remove any consecutive spaces
  end





C: Code with intent

=end


def cleanup(input)
  input.gsub(/\W+/, ' ').squeeze(' ')
# regex to substitute all non alpha characters with a space. then squeeze removes all duplicate spaces

end

 cleanup("---what's my +*& line?")   == ' what s my line '

=begin
LS Solution

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end
=end

=begin
6. Letter Counter (Part 1)

Write a method that takes a string with one or more space separated words and returns a
hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

  P. Understand the Problem
  Explicit Requirements:
  - argument is a string with one or more space separated words
  - output a hash that shows the nymber of words of different sizes


  Implicit Requirements:
  - order of hash  does not seem to have any particular pattern

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
  word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
  word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
  word_sizes('') == {}

D: Data Structures
  - input: string
  -output: hash with integer keys and values


A: Algorithm
def word_sizes(input)
  - create a new hash named frequency_of_characters and set a default value of 0
  - create variable array set to input split and iterate through each char
    - within this iteration access each char.size at frequency_of_character and += by 1  if the key does not exist or if their is a recurring char.
  end block
  return frequency_of_characters
end

C: Code with intent


=end

def word_sizes (input)
  frequency_of_characters = Hash.new(0) # this is the most important aspect of the program. This allows us to increment every non existing key with the starting value of 0
array = input.split
 array.each do |char|
  frequency_of_characters[char.size] += 1

end
 frequency_of_characters
end
\


    word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
    word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
    word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
    word_sizes('') == {}

=begin
7. Letter Counter (Part 2)
Modify the word_sizes method from the previous exercise to exclude non-letters when
determining word size. For instance, the length of "it's" is 3, not 4.

P. Understand the Problem
  Explicit Requirements:
  -  modify word_sizes method to exclude non-letters when determining word size


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
  word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
  word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
  word_sizes('') == {}

D: Data Structures
  - input: string
  - output: hash with integers as the key and value


A: Algorithm
  def word_sizes2(input)
    - create hash named count and set to default value 0
    - create array named array that splits the input
      - iterate through each element of array
      - create variable named remove_non-alpha and set to equal to if a-z/A-Z includes element return element ? return element : otherwise remove element
      -
  end

C: Code with intent


=end

def word_sizes2(input)
  remove_non_alpa = ''
  count = Hash.new(0)
  array = input.split
  array.each do |element|
    alpha_word = element.delete('^A-Za-z')
   count[alpha_word.size] += 1
  end
  count
end
 word_sizes2(" What's up doc, ")

  word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
  word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
  word_sizes2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
  word_sizes2('') == {}


=begin
8 . Alphabetical Numbers

Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

P. Understand the Problem

  Explicit Requirements:
  -  argument is an array of integers between 0 and 19
  -  output the  array sorted based on the english alphabet for each number


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]


D: Data Structures
  - input : array of integers
  - output: array of integers
  - possible direction: a hash where the key is the english string version of the integer and the value is the respective integer


A: Algorithm
  - create constant NUMBER_ENGLISH with the keys as the english version of the integersand the values as the integer value
  def alphabetic_number_sort(input)
    - create variable result and set to NUMBER_ENGLISH conveted to an array, then sort, and convert back into a hash
    - return the value at result
  end
C: Code with intent

=end

NUMBER_ENGLISH = {
'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
'five' => 5,'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9,
'ten' => 10,'eleven' => 11, 'twelve' => 12, 'thirteen' => 13, 'fourteen' => 14,
'fifteen' => 15,'sixteen' => 16, 'seventeen' => 17, 'eighteen' => 18, 'nineteen' => 19
}

def alphabetic_number_sort(input)
 result  = NUMBER_ENGLISH.to_a.sort.to_h.values
end

 alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

=begin
solution by student Richard Vu that is really effective

ENGLISH_WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
INTEGERS = (0..19).to_a
INTEGERS_TO_WORDS = INTEGERS.zip(ENGLISH_WORDS).to_h

def alphabetic_number_sort(arr)
  arr.sort_by { |int| INTEGERS_TO_WORDS[int]}
end

=end

=begin
9. ddaaiillyy ddoouubbllee

Write a method that takes a string argument and returns a new string that contains the value of the original string
with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

P. Understand the Problem
  Explicit Requirements:
  - argument is a string
  - output new string that removes all duplicates of the same number


  Implicit Requirements:
  - more than one of the same character can occur just not consecutively

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  crunch('ddaaiillyy ddoouubbllee') == 'daily double'
  crunch('4444abcabccba') == '4abcabcba'
  crunch('ggggggggggggggg') == 'g'
  crunch('a') == 'a'
  crunch('') == ''

D: Data Structures
  - input: string
  - output: string


A: Algorithm
def crunch(input)
  - create variable result and set to empty string
  - create variable counter and set to 0
  - create variable next_digit and set to counter + 1
  until counter is equal to input.size
    -if input at counter is equal to input at next digit
        - increment counter by 1
    -else
      - append counter to result
      - increment counter by 1
    end if statement
  end until loop
  return result
end

C: Code with intent
=end
def crunch(input)
 result = ''
 counter = 0
 next_digit = 1
 until counter == input.size
  if input[counter] == input[next_digit]
    counter += 1
    next_digit += 1
  else
    result << input[counter]
    counter += 1
    next_digit += 1
  end
 end
  result
end

  crunch('ddaaiillyy ddoouubbllee') == 'daily double'
  crunch('4444abcabccba') == '4abcabcba'
  crunch('ggggggggggggggg') == 'g'
  crunch('a') == 'a'
  crunch('') == ''


# Effective solution by LS student Daniel Chea
#   s.chars.each_with_index.map { |x, i| s[i] != s[i + 1] ? s[i] : "" }.join("")


=begin
9. Bannerizer
Write a method that will take a short line of text, and print it within a box.

P. Understand the Problem
  Explicit Requirements:
  -  print given input text within a box


  Implicit Requirements:
  -  assume input fits within box

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
- print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

- print_in_box('')
+--+
|  |
|  |
|  |
+--+

D: Data Structures
  - input: string
  - output: string


A: Algorithm
  def print_in_box(input)
    center the text by adding 10 to whatever the input is
  end

C: Code with intent

=end

def print_in_box(input)
  input.center(input.size + 10)
end

 print_in_box("hello world ")
