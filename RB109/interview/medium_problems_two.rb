require 'date'
=begin

1. Longest Sentence

Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.),
exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should
also print the number of words in the longest sentence.

P. Understand the Problem
  Explicit Requirements:
  - A sentence is considered any body of string that ends with either a period, exclamation mark, or question mark
  - any sequence of characters that are not considered spaces or sentence ending characters should be treated as a word.
  - print the number of words in the longest sentence

  Implicit Requirements:
  - You will have to separate spaces and sentence ending characters from other characters that are considered words.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.

The longest sentence in the above text is the last sentence; it is 86 words long. (Note that each -- counts as a word.)

D: Data Structures
  - input: str that represents several sentences
  - output: str that prints out the longest sentence and how long the sentence is.
  - possible intermediary structure: an array containing each sentence


A: Algorithm
def print_longest_sentence_and_its_word_count(str)
  output "The longest sentence in the above text is the #{display_which_sentence_is_longest(str); it is #{get_word_count(str)} words long.}"
end

  def (str)
    - initialize excerpt  to to split_sentences_by_ending_character(str)
    - initialize max_sentence to 0
    - iterate through excerpt and assign local parameter char and idx
    - set max_sentence to idx if char.size is > than max_sentence
  end

  def split_sentences_by_ending_characters
    - initialize str_arr to an array that contains the contents str with the characters separated by any sentence ending characters (., ?, !)
  end

def get_highest_word_count(str)
    excerpt = split_sentences_by_ending_characters
    initialize word_count_arr to the result of iterating through excerpt and split each char and then count the value of each newly split char.
    - return the greatest value  of word_count_arr
  end
C: Code with intent


=end


def split_sentences_by_ending_characters(str)
    str_arr = str.split(/\.|\?|!/)

end

def get_highest_word_count(str)
   excerpt = split_sentences_by_ending_characters(str)
     word_count_arr = excerpt.map {|char| char.split.count}
     word_count_arr.max

end

def display_which_sentence_is_longest(str)
  excerpt = split_sentences_by_ending_characters(str)
  max_sentence = 0
  excerpt.each_with_index {|char, idx|  max_sentence = idx if char.size > max_sentence}
   max_sentence
end

# The longest sentence in the above text is the last sentence; it is 86 words long. (Note that each -- counts as a word.)
def longest_sentence(str)
"The longest sentence in the above text is sentence number #{display_which_sentence_is_longest(str) }; It is #{get_highest_word_count(str)} words long."
end


   longest_sentence('Four score and seven years ago our fathers brought forth
  on this continent a new nation, conceived in liberty, and
  dedicated to the proposition that all men are created
  equal.

  Now we are engaged in a great civil war, testing whether
  that nation, or any nation so conceived and so dedicated,
  can long endure. We are met on a great battlefield of that
  war. We have come to dedicate a portion of that field, as
  a final resting place for those who here gave their lives
  that that nation might live. It is altogether fitting and
  proper that we should do this.

  But, in a larger sense, we can not dedicate, we can not
  consecrate, we can not hallow this ground. The brave
  men, living and dead, who struggled here, have
  consecrated it, far above our poor power to add or
  detract. The world will little note, nor long remember
  what we say here, but it can never forget what they
  did here. It is for us the living, rather, to be dedicated
  here to the unfinished work which they who fought
  here have thus far so nobly advanced. It is rather for
  us to be here dedicated to the great task remaining
  before us -- that from these honored dead we take
  increased devotion to that cause for which they gave
  the last full measure of devotion -- that we here highly
  resolve that these dead shall not have died in vain
  -- that this nation, under God, shall have a new birth
  of freedom -- and that government of the people, by
  the people, for the people, shall not perish from the
  earth.')


=begin
2. Now I know my ABCs

A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M
This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.


P. Understand the Problem
  Explicit Requirements:
  - You want to output true if the argument can be spelled without using a full pair from the block. E.g. ('ABC') are not in the same block so this would be true
  - You want to output false if the argument requires a full pair from a block to spell E.g. ("SAFE") "S" and "F" are in the same block therefore it will be false

  Implicit Requirements:
  - It does not matter if the letters are from the first part of the block or second as long as they do not share the same block

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  block_word?('BATCH') == true
  block_word?('BUTCH') == false
  block_word?('jest') == true


D: Data Structures
  - input: input string that will be compared in blocks
  - output: output true if no pair of blocks are in argument, false otherwise
  - possible intermediary structure: Create a hash to store the blocks. A possible array to determine boolean value


A: Algorithm
def block_word?(str)
- initialize block_hash to initialize_letter_block
- initialize result to nil
- iterate through block_hash and assign local parameters first_let and second_let. set the opposite value to this block
-   check if str includes first_let and second_let.  Return true if so. With the opposite value of the block set this should return false, and vice versa.
- also check if either first_let or second_let have more than one of any elemnet.
end


    def initiialize_letter_block(str)
      initialize first_letter to an array containing the first part of each block
      initialize second_letter to an array containing the second part of each block.
      create a hash and  set each key to an element in first_letter and each value to the corresponding element in second_letter
    end

C: Code with intent



=end


def initiialize_letter_block()
first_letter = %w[B G V X R L D F Z C J N H]
second_letter= %w[O T I K E Y Q S M P W A U]
first_letter.zip(second_letter).to_h
end

def block_word?(str)
  block_hash = initiialize_letter_block
  !block_hash.any? {|first_let, second_let| str.include?(first_let) && str.include?(second_let) || (str.count(first_let) >= 2 || str.count(second_let) >= 2) }
end

    block_word?('BATCH') == true
    block_word?('BUTCH') == false
    block_word?('jest') == true
    block_word?('BBBBBBBBATCH') == false



=begin
3. Letter Percentage Ratio
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two.
Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters,
one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

P. Understand the Problem
  Explicit Requirements:
  - output a hash
  - this hash should contains three keys lowercase, uppercase, and neither.
  - each value of the hash shall be a float with one decimal place that represents the percentage of the string that is lowercase, uppercase, or neither
  - string will always have one characters

  Implicit Requirements:
  - spaces count as characters

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
  letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
  letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

D: Data Structures
  - input: string
  - output: hash that shows the percentage of each key from the input string with it's values.
  - possible intermediary structure: a few separate arrays to get each type isolated.


A: Algorithm

def letter_percentages(str)
  letter_hash = initialize_percentage_hash
  str_count = str.count
  - letter_hash[:lowercase] = get_lowercase_letters_count(str) / str.count
  - letter_hash[:uppercase] = get_uppercase_letters_count(str) / str.count
  - letter_hash[:neither] = get_neither_letter_count(str) / str.count
  - return letter_hash
end

  def initialize_percentage_hash
    - initialize a hash with 3 symbols (:lowercase, :uppercase, and :neither) as keys. Set all values to 0.0
  end

  def get_uppercase_letters_count(str)
    initialize uppercase_arr and set to all uppercase letters.
    initialize str_arr to spliting str into an array and then splitting by each character.
   initialize uppercase_letters to the result of  iterating through str and assign parameter element
      - choose all element that are uppercase
    - return the count of uppercase_letters converted to a float and multiplied by 100
  end

  def get_lowercase_letters_count(str)
    initialize lowercase_arr and set to all uppercase letters.
    initialize str_arr to spliting str into an array and then splitting by each character.
   initialize lowercase_letters to the result of  iterating through str and assign parameter element
      - choose all element that are uppercase
    - return the count of lowercase_letters converted to a float and multiplied by 100
  end

  def get neither_letter_count(str)
    - initialize letter arr to the combine value of an array with both lowercase str and uppercase str
    -  initialize str_arr to spliting str into an array and then splitting by each character.
    - initialize neither_letter to the result of iterating through str_arr and assigning parameter element
      - select element if letter_arr does not include element
    - return count of neither_letter converted to a float and multiplied by 100
  end

C: Code with intent



=end

def initialize_percentage_hash
   {uppercase: 0.0, lowercase: 0.0, neither: 0.0}
end

def get_uppercase_letters_count(str)
 uppercase_arr = ('A'..'Z').to_a
 str_arr = str.split("")
 uppercase_letters = str_arr.select {|element| uppercase_arr.include?(element)}
   uppercase_letters.count.to_f * 100
end


def get_lowercase_letters_count(str)
  lowercase_arr = ('a'..'z').to_a
  str_arr = str.split("")
  lowercase_letters = str_arr.select{|element| lowercase_arr.include?(element)}
   lowercase_letters.count.to_f * 100
end

def neither_letter_count(str)
  letter_arr = ('a'..'z').to_a + ("A"..'Z').to_a
  str_arr = str.split('')
  neither_letter = str_arr.select{|element| !letter_arr.include?(element) }
    neither_letter.count.to_f * 100
end


def letter_percentages(str)
letter_hash = initialize_percentage_hash
 str_count = str.size
 letter_hash[:lowercase] = get_lowercase_letters_count(str) / str_count
 letter_hash[:uppercase] = get_uppercase_letters_count(str)/ str_count
 letter_hash[:neither] = neither_letter_count(str)/ str_count
 letter_hash
end

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }


=begin
4. Matching Parenthesis
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise.
To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
Note that balanced pairs must each start with a (, not a ).

P. Understand the Problem
  Explicit Requirements:
  - input is a string.
  - output is a boolean value that will return true if all strings are properly balanced, false otherwise

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - a properly balances string must begin with '(' and end witha ')'

E: Examples/ Edge Cases
  balanced?('What (is) this?') == true
  balanced?('What is) this?') == false
  balanced?('What (is this?') == false
  balanced?('((What) (is this))?') == true
  balanced?('((What)) (is this))?') == false
  balanced?('Hey!') == true
  balanced?(')Hey!(') == false
  balanced?('What ((is))) up(') == false

D: Data Structures
  - input:
  - output:
  - possible intermediary structure:


A: Algorithm
 def balanced?(str)
  return false if str ends with a '('
  - if str includes '( or ') check to see if there are the same amount of each parenthesis and that their count is >= 1 . Else return true

C: Code with intent

=end

def balanced?(str)
  return false if str.end_with?("(")
  str.include?('(') || str.include?(')') ? str.split('').all? {|char|str.count('(') == str.count(')') && (str.count('(') >= 1 && str.count(')') >= 1)} : true
end


 balanced?('What (is) this?') == true
 balanced?('What is) this?') == false
 balanced?('What (is this?') == false
 balanced?('((What) (is this))?') == true
 balanced?('((What)) (is this))?') == false
 balanced?('Hey!') == true
 balanced?(')Hey!(') == false
 balanced?('What ((is))) up(') == false

=begin
5. Triangle Sides

A triangle is classified as follows:

equilateral All 3 sides are of equal length

isosceles 2 sides are of equal length, while the 3rd is different

scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater
than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
on whether the triangle is equilateral, isosceles, scalene, or invalid.

P. Understand the Problem
  Explicit Requirements:
  -input is three integers
  -output is a symbol representing whether or not the input is considered :equilateral, :isosceles, :scalene, or :invalid
  - to be valid the length of the two shortest sides must be more than the longest side.
  - each side must be greater than 0
  - if either of these two conditions are not met then the triangle is invalid
  - equilateral means all three sides are equal
  - isosceles means two sides are of equal lengths
  - scalene means all three sides are different lengths

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  triangle(3, 3, 3) == :equilateral
  triangle(3, 3, 1.5) == :isosceles
  triangle(3, 4, 5) == :scalene
  triangle(0, 3, 3) == :invalid
  triangle(3, 1, 1) == :invalid

D: Data Structures
  - input: integer
  - output: key
  - possible intermediary structure: array to determine if triangle is valid


A: Algorithm
    def valid_triangle(int1, int2, int3)
      - initialize num_arr to an empty arr and append each num argument to it
      - sort num_arr
      - initialize two_digit_sum to the result of adding the first two digits of num_arr
      - return true if two_digit_sum is  > then the last digit of num_arr and there is no 0 included in num_arr else return false
    end

    def triangle(int1, int2, int2)
      - return :invalid if valid_triangle(int1, int2, int3) == false
      - return :equilateral if all three num are equal
      - return :isosceles if two of the three num are equal
      - else return :scalene
    end

C: Code with intent

=end

def valid_triangle(num1, num2, num3)
num_arr = []
num_arr << num1 && num_arr << num2 && num_arr << num3
  num_arr = num_arr.sort
 two_digit_sum = num_arr[0] + num_arr[1]
 two_digit_sum > num_arr[-1]  && !num_arr.include?(0)  ? true : false
end

def triangle(num1, num2, num3)
   valid_triangle(num1,num2, num3)
  case
    when valid_triangle(num1, num2, num3) == false then :invalid
    when num1 == num2 && num1 == num3 then :equilateral
    when num1 == num2 || num1 == num3 || num2 == num3 then :isosceles
    else :scalene
  end
end



 triangle(3, 3, 3) == :equilateral
 triangle(3, 3, 1.5) == :isosceles
 triangle(3, 4, 5) == :scalene
 triangle(0, 3, 3) == :invalid
 triangle(3, 1, 1) == :invalid



=begin
6. Tri-Angles
A triangle is classified as follows:

right: One angle of the triangle is a right angle (90 degrees)
acute: All 3 angles of the triangle are less than 90 degrees
obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied,
the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right,
acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.



P. Understand the Problem
  Explicit Requirements:
  - input is 3 integer values
  - output is a symbol representing whether or not a traingle is an :acute, :right, :obutuse, or :invalid triangle
  - To be valid the sum of the angles must be exactly 180 degrees and all must be greater than 0.
  - if one angle is greater than 90 degrees it is obtuse
  - if one angle of the triangle is 90 degrees and nothing is higher than that it is a right triangle.
  - if all three angles are smaller than 90 than it is an acute triangle.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  triangle(60, 70, 50) == :acute
  triangle(30, 90, 60) == :right
  triangle(120, 50, 10) == :obtuse
  triangle(0, 90, 90) == :invalid
  triangle(50, 50, 50) == :invalid


D: Data Structures
  - input: integer representing the degree of each triangle
  - output: a symbol representing what type of angle the triangle has
  - possible intermediary structure:


A: Algorithm
def triangle(num1, num2, num3)
  - initialize num_arr to get_degree_array(num1, num2, num3)
  - when check_if_valid_triangle is true
    - when num_arr includes a number over 90 then return :obtuse
    - when num_arr includes 90 and not a number return :right
    - when num_arr includes no number greater or equal to 90 then return :acute
  - else return :invalid
end


def get_degree_arrary(num1, num2, num3)
  - initialize num_arr and add each parameter to the array
end

def check_if_valid_triangle(num1, num2, num3)
  - initialize num_arr to get_degree_array(num1, num2, num3)
  - if num_arr contains the number 0 or if the sum of the values is greater than 180 than return false else return true
end

C: Code with intent
=end
def check_if_valid_triangle(num1, num2, num3)
num_arr = get_degree_arrary(num1, num2, num3)
num_arr.reduce(:+) != 180 || num_arr.include?(0) ? false : true
end

def get_degree_arrary(num1, num2, num3)
  num_arr = [num1, num2, num3]
end


def triangle(num1, num2, num3)
  num_arr = get_degree_arrary(num1, num2, num3)
  if check_if_valid_triangle(num1, num2, num3)
      case
      when num_arr.any?{|num|  num > 90} then :obtuse
      when num_arr.any?{|num| num == 90 } then :right
      when num_arr.all?{|num| num < 90 } then :acute
      end
    else :invalid
  end
end



   triangle(60, 70, 50) == :acute
   triangle(30, 90, 60) == :right
   triangle(120, 50, 10) == :obtuse
   triangle(0, 90, 90) == :invalid
   triangle(50, 50, 50) == :invalid




=begin
7. Unlucky Days

Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752
(when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

P. Understand the Problem
  Explicit Requirements:
  - input is the given year
  - output is the amount of friday the 13ths in a given year

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - a year with three friday the 13ths occurs when a leap year occurs and january 1st falls on a sunday on a leap year
  - or if january 1st occurs on a thursday on a non leap year
  - a year with two friday the 13ths will occur in a non leap year if it is Sun - Tue
  - or if it is a leap year and january 1st is on Mon, Wed, or  Thur
  - a year with one friday the 13th will occur if it is a non leap year and january 1st is on Wed, Fri, Sat
  - or it is a leap year on january 1st on Tue, Fri, or Sat

E: Examples/ Edge Cases
  friday_13th(2015) == 3
  friday_13th(1986) == 1
  friday_13th(2019) == 2

D: Data Structures
  - input: integer representing the given year
  - output: integer representing how many friday the 13ths  are in the input
  - possible intermediary structure:


A: Algorithm
def friday_13th(num)
- initialize leap_year? to the result of invoking determine_if_leap_year on num
- initialize january_first to the result of getting the date of january 1st from the year that num represents.
  - when leap_year? is true
  - determine what day january 1st is on the year num is.
    - if january 1st is on a sunday then return 3
    - if january 1st is on mon, wed, or thur, then return 2
    - if january 1st is on tues, friday or saturay then return 1
  - when leap_year? is false
  - determine what day january 1st is on the year num is.
    - if january 1st is on a thursday then return 3
    - if it is on  sunday, monday, or tuesday  then return 2
    - if it is on wednesday, friday, or satuday then return 1
end

def determine_if_leap_year(num)
 - if  num is evenly divisible by 100 but not 400 then return false
 - if num is evenly divisible by 100 and evenly divisible by 400 then return true
 - if num  is evenly divisible by 4 then return true
end


C: Code with intent

=end

def determine_if_leap_year(num)
  Date.gregorian_leap?(num)
end

def friday_13th(num)
  leap_year = determine_if_leap_year(num)
  january_first =  Date.parse("January 1st #{num}")
  if leap_year
    return 3 if january_first.sunday?
    return 2 if january_first.monday? ||  january_first.wednesday? ||  january_first.thursday?
    return 1 if  january_first.tuesday? ||  january_first.friday? ||  january_first.saturday?
  else
    return 3 if  january_first.thursday?
    return 2 if  january_first.sunday? ||  january_first.monday? ||  january_first.tuesday?
    return 1 if  january_first.wednesday? ||  january_first.friday? ||  january_first.saturday?
  end
end

 friday_13th(2015) == 3
 friday_13th(1986) == 1
 friday_13th(2019) == 2

=begin
8. Next Featured Number Higher than a Given Value

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example,
49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if
there is no next featured number.

P. Understand the Problem
  Explicit Requirements:
  - input is an integer
  - output is an integer that is a featured number that is the next number higher than the given value
  - return te error message There is no possible number that fulfills those requirements if there is no next featured number

  Implicit Requirements:
  - if the digit is larger than 10 values the requirment that all digits must be unique can no longer be fulfilled

  Clarifications/ Questions:
  - a featured number is an odd number
  - is a multiple of 7
  - and whose digits have occures exactly once.
  -

E: Examples/ Edge Cases
  featured(12) == 21
  featured(20) == 21
  featured(21) == 35
  featured(997) == 1029
  featured(1029) == 1043
  featured(999_999) == 1_023_547
  featured(999_999_987) == 1_023_456_987

  featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

D: Data Structures
  - input:
  - output:
  - possible intermediary structure:


A: Algorithm
def featured(num)
 - initialize odd_num to the result of invoking  is_odd_num? on num
 - initialize multiple_of_seven to the result of is_multiple_of_seven? on num
 - initialize digit_once to the result of does_all_digits_occur_once? on num
 - initialize next_featured_num to num being incremented by 1
 - initialize num_arr_size to the result of invoking get_num_size  on next_featured_num
 - until the result of invoking odd-num, multiple_of_seven and digit_once on next_featured_num are all true
    - increment by 1
    - return "There is no possible number that fulfills those requirements" if num_arr_size is greater than 10
    - reassign num_arr_size to the result of invoking get_num_size on next_featured_num
  - end until loop
  - return next_featured_num
end

def odd_num?(num)
  determine if num is odd or not
end

def multiple_of_seven(num)
  - determine if seven evenly divides into num
end

def does_all_digits_occur_once?(num)
  - initialize num_hash which has the string digits 0-9 as keys and integer value 0 as the value
  - convert num into an array with each value as a converted string. assign parameter str_num
  -  increment each value of num_hash by 1 each time the specific key appears with str_num
- end  iteration
- iterate through num_hash and return true if all values are <= 1 and false otherwise
end

C: Code with intent


=end

def odd_num?(num)
num.odd?
end

def multiple_of_seven?(num)
num % 7 == 0
end

def does_all_digits_occur_once?(num)
 num_hash =  ('0'..'9').to_a.zip([0, 0, 0, 0, 0, 0, 0,0, 0, 0]).to_h
 num.to_s.chars.each {|num_str| num_hash[num_str] += 1}
 num_hash.all? {|key, value| value <= 1 }
end

def get_num_size(num)
  num_arr = []
num.to_s.chars.each {|num|num_arr << num}
   num_arr.size
end


def featured(num)
  num_arr_size = get_num_size(num)
  num_arr_size =  get_num_size(num)
  next_featured_num = num += 1
  until odd_num?(next_featured_num) && multiple_of_seven?(next_featured_num) && does_all_digits_occur_once?(next_featured_num)
    return "There is no possible number that fulfills those requirements" if num_arr_size > 10
    next_featured_num += 1
    num_arr_size = get_num_size(next_featured_num)
  end
   next_featured_num
end

  # featured(12) #== 21
  featured(20) #== 21
  featured(21) #== 35
  featured(997) #== 1029
  featured(1029) #== 1043
  featured(999_999) #== 1_023_547
  #featured(999_999_987) #== 1_023_456_987
 # featured(9_999_999_999)


=begin
9. Bubble Sort
Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise,
you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements
is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array
is completely sorted.

P. Understand the Problem
  Explicit Requirements:
  - input is an array
  - output is the same array but mutated using the bubble sort algorithm to compare each two indices e.g. (0,1), (1,2) (2, 3) etc and swap if the first number is larger
   then the second. then repeat if neccesssary as many times as needed until no swaps are needed.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  array = [5, 3]
  bubble_sort!(array)
  array == [3, 5]

  array = [6, 2, 7, 1, 4]
  bubble_sort!(array)
  array == [1, 2, 4, 6, 7]

  array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
  bubble_sort!(array)
  array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


D: Data Structures
  - input: array
  - output: mutated array sorted using the bubble sort method
  - possible intermediary structure: an array to use each indices to compare


A: Algorithm
  def bubble_sort!(arr)
    - initialize first_num to 0
    - initialize second num to first_number + 1

    - upto arr.size - 1
      - if arr[first_num] > arr[second_num] then switch the index value placement of the two numbers else leave as be
      - reassign first_num and second_num to the result of the + method being invoked on the value that they point to
      - once the
      -end iteration

    - recursively invoke bubble_sort!(arr) until arr is equal to the value of arr.sort
    - return arr
  end

C: Code with intent


=end

def bubble_sort!(arr)
  first_num = 0
  second_num = first_num + 1
  1.upto(arr.size - 1) do
    arr[first_num] > arr[second_num] ? (arr[first_num], arr[second_num] = arr[second_num], arr[first_num]) : arr
     first_num, second_num = first_num += 1, second_num += 1
      arr[second_num]
    end
  bubble_sort!(arr) until arr == arr.sort
  arr
end


 array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
  bubble_sort!(array)


# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

#array = [5, 3]
#bubble_sort!(array)
#array == [3, 5]




=begin
10. Sum Square - Square Sum
Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

P. Understand the Problem
  Explicit Requirements:
  - get the square of the sum of the first n positive integers
  - get the sum of the squares of the first n positive integers.
   subtract the square of the sum by the  sum of the square

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
  sum_square_difference(10) == 2640
  sum_square_difference(1) == 0
  sum_square_difference(100) == 25164150

D: Data Structures
  - input: integer representing the first n numbers
  - output: an integer representing the sum of subtracting the square of the sum by the sum of the square
  - possible intermediary structure: array to work on each element from n


A: Algorithm
  def get_square_of_the_sum(num)
    iterate through a range from 1 to num and assign parameter element
      add each element together
    -end block
    - add the value together and return this result.
  end

  def get_sum_of_the_square(num)
    iterate through a range from 1 to num and assign parameter element
      - multuply each element by 2
      - end block
  initialize product_arr to the result of this block.
    - add together the values of product_arr and return this value
  end

  def sum_square_difference(num)
 get_square_of_the_sum(num) - get_sum_of_the_square(num)
  end

C: Code with intent


=end

def get_square_of_the_sum(num)
  (1..num).to_a.reduce(:+) **2
end



def get_sum_of_the_square(num)
 product_arr = (1..num).to_a.map {|num| num ** 2 }
  product_arr.reduce(:+)
end

def sum_square_difference(num)
get_square_of_the_sum(num) - get_sum_of_the_square(num)
end

  sum_square_difference(10) == 2640
  sum_square_difference(1) == 0
  sum_square_difference(100) == 25164150





  # [8 1 1 2 3 ]
  def smaller_numbers_than_current(arr)
    arr.map do |num|
       arr.uniq.count { |other_num| num > other_num }
    end
  end


smaller_numbers_than_current([8,1,2,2,3]) #== [3, 0, 1, 1, 2]

 #p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
 #p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
 #p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
#p  smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
#p  smaller_numbers_than_current([1]) == [0]




