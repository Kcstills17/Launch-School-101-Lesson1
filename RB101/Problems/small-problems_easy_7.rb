=begin
1. Combine two lists
Write a method that combines two Arrays passed in as arguments, and returns a new Array
that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

P. Understand the Problem
  Explicit Requirements:
  - input is two separate arrays
  - output is a new array that contains all elements from both array arguments passed through
  - the output array will alternate between the two input array's values
  - assume both input arrays ar enot empty and include the same amount of elements


  Implicit Requirements:
  - start with the first input array's elements and begin alternation

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

D: Data Structures
  - input: two arrays containing the values we wish to alternate onto a new array
  - output: a new array contain the inputted values alternated


A: Algorithm
  def interleave(arr1, arr2)
    - combine the two arrays into a nested array which each nested array will include the same index of both input arr
    - combine the nested array into a single file array
  end

C: Code with intent



=end

def interleave(arr1, arr2)
arr1.zip(arr2).flatten
end

 interleave([1, 2, 3], ['a', 'b', 'c'])  == [1, 'a', 2, 'b', 3, 'c']

=begin
2. Lettercase Counter
Write a method that takes a string, and then returns a hash that contains 3 entries:
one represents the number of characters in the string that are lowercase letters,
one the number of characters that are uppercase letters, and one the number of characters that are neither.

P. Understand the Problem
  Explicit Requirements:
  -  input takes a string
  - output returns a hash that contains 3 entries
  - one represents the number of characters in the string that are lowercase letters.
  - one represents the number of characters in the string that are uppercase letters
  - one that is neither of the two above


  Implicit Requirements:
  - if there is nothing within the input string than all keys will have the value of 0

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
  - letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
  - letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
  - letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

D: Data Structures
  - input : string
  - output: hash that collects the string based on whether it is lowercased, uppercased, or neither into separate keys
  - intermidary structute: possible array to collect the str and mutate hash value

A: Algorithm
    initiallize constant LOWERCASE and set to range from 'a to 'z
    initiallize constant UPPERCASE and set to range from "A" to "Z"
  def letter_case_count(str)
    - initiallize check_hash and set hash to contain keys :lowercase, :uppercase, and :neither with all values set to 0
    - join str into an array  then iterate each element
      - if element is included in LOWERCASE than increment the value of :lowercase and set as new value
      - elsif element is included in UPPERCASE then increment the value of :uppercase and set as new value
      - else increment the value of :neither and set as new value
      end block
      return check_hash
  end

C: Code with intent

=end


LOWERCASE = ('a'..'z')
UPPERCASE = ("A".."Z")


def letter_case_count(str)
  count_hash = {:lowercase => 0, :uppercase => 0, :neither => 0 }
   str.chars.each do |element|
   if LOWERCASE.include?(element)
    count_hash[:lowercase] += 1
   elsif UPPERCASE.include?(element)
    count_hash[:uppercase] += 1
   else
    count_hash[:neither] += 1
   end
  end
count_hash
end

 letter_case_count('abCdef 123')   == { lowercase: 5, uppercase: 1, neither: 4 }


=begin
  3. capitalize words
  Write a method that takes a single String argument and returns a new string that contains the
  original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is new string that contains the original value of the arg string and each first character of every word is capitalized.
  - all other characters should be uppercased
  - you can asuume that words are any sequence of non-blank characters



  Implicit Requirements:
  - if before any specific word there is a non alphabetic character such as quotes " " do not uppercase the first character.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - word_cap('four score and seven') == 'Four Score And Seven'
  - word_cap('the javaScript language') == 'The Javascript Language'
  - word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


D: Data Structures
  - input: string
  - output: new string with each first word capitalized


A: Algorithm
  def word_cap(str)
    - initallize variable return_str and set to an empty array
    - split string based on spaces into an array
    - iterate through the  array and its elements
    -  capitalize each element and append back to return_str

C: Code with intent



=end

def word_cap(str)
  return_str = []
  str.split.map do  |e|
    e.capitalize
 end.join(' ')

end

     word_cap('four score and seven')    == 'Four Score And Seven'
    word_cap('the javaScript language') == 'The Javascript Language'
    word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


=begin
 4. Swap case

  Write a mehod that takes a string as an argument and a reutrns a new string in which every uppercase letter is replaced by a lowercase version, and every
  lower case letter is replaced by an uppercase one. Every other character is unaffected.
  You may not use String#Swapcase, write your own method

  P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is a new string with each lowercase letter changed to uppercase and each lowercase changed to uppercase
  - do not use String#Swapcase


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
    - swapcase(CamelCase) == "cAMELcASE"
    - swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

D: Data Structures
  - input: string
  - output: string with upcase reversed with lowercase and viceversa


A: Algorithm
    - create a constand UPPERCASE for all uppercase string
    - create a constant LOWERCASE for all lowercase string
  def swapcase(str)
    - convert str into an array and iterate through the new arr and transform elements onto a new arr object
      - if UPPERCASE includes an element
        - change the element to be downcase
      - elsif LOWERCASE includes the element
        - change the element to be upcase
      - else
        element
      end if statemenet
    end block

  end

C: Code with intent

=end
UPPERCASE1 = ("A"..'Z')
LOWERCASE1 = ('a'.."z")

def swapcase(str)
str.chars.map do |element|
  if UPPERCASE1.include?(element)
    element.downcase
  elsif LOWERCASE1.include?(element)
    element.upcase
  else
    element
  end
end.join
end

  swapcase("CamelCase")  == "cAMELcASE"
  swapcase('Tonight on XYZ-TV')  == 'tONIGHT ON xyz-tv'

=begin
5. Staggered caps (Part 1)

Write a method that takes a String as an argument, and returns a new String that contains the original value
using a staggered capitalization scheme in which every other character is capitalized,
and the remaining characters are lowercase. Characters that are not letters should not be changed,
but count as characters when switching between upper and lowercase.

P. Understand the Problem
  Explicit Requirements:
  -  input is a string
  - output is a new string that contains the original value
  - output value has the effects of staggering capitalization which every other character is capitalized
  - reamaining characters are lowercased
  - if character is not a letter it should not be changed, but still count as a character for the switching mechanic


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
   - staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
   - staggered_case('ALL_CAPS') == 'AlL_CaPs'
   - staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

D: Data Structures
  - input: string
  - output: new string containing the same value with the results of the staggering caps mechanic


A: Algorithm
  - create constant ALPHABET that contains all lowercase and uppercase letters
    def staggered_case(str)
      - initiallize variable final_str and set to ''
      - initiallize variable counter and set to 0
      - str.size times do
        - if counter is even?
        - upcase the character and append to final_str  if it is included in ALPHABET else append character to final_str
          counter += 1
        - elsif counter is odd?
        - downcase the character and append to final_str  if it is included in ALPHABET else append character to final_str
          counter += 1
      - end if statement
    - end block
    return final_str
  end

C: Code with intent

=end
 ALPHABET = UPPERCASE.zip(LOWERCASE).flatten

 def staggered_case(str)
  final_str = ''
  counter = 0
  str.size.times do |n|
   if counter.even?
    p str[counter]
     ALPHABET.include?(str[counter]) ?  final_str << str[counter].upcase :  final_str << str[counter]
     counter += 1
   elsif counter.odd?
    p str[counter]
    ALPHABET.include?(str[counter]) ?  final_str << str[counter].downcase :  final_str << str[counter]
     counter += 1
   else
      final_str << str[counter]

   end
  end
   final_str
 end


#  staggered_case('I Love Launch School!')   #== 'I LoVe lAuNcH ScHoOl!'
 #  staggered_case('ALL_CAPS') == 'AlL_CaPs'
 #  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

=begin
6. Staggered caps (Part 2)

Modify the method from the previous exercise so it ignores non-alphabetic characters
when determining whether it should uppercase or lowercase each letter.
The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

P:
Explicit Requirements:
- the non alpha characters from the previous problem now no longer count for the toggle for staggered caps

E:
Edge cases/Examples:
  - staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
  - staggered_case('ALL CAPS') == 'AlL cApS'
  - staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


A:
  def staggered_case_two(str)
    initiallize and set variable stagger_case to equal false
    convert str into an array and then transform each element of said array onto a new array object
      - if the element is included within ALPHABET than set stagger_case to not equal stagger_case else leave stagger_case
      - if stagger_case is true upcase the elemnt and if it is not then downcase the element
      end block (join the return value of the block into a string)
  end

=end
def staggered_case_two(str)
  stagger_case = false
str.chars.map do |element|
  ALPHABET.include?(element) ? stagger_case = !stagger_case : stagger_case
  stagger_case ?  element.upcase : element.downcase
end.join
end



 staggered_case_two('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
 staggered_case_two('ALL CAPS') == 'AlL cApS'
 staggered_case_two('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


=begin
7. Multiplicative Average
Write a method that takes an Array of integers as input, multiplies all the numbers together,
divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.


P. Understand the Problem
  Explicit Requirements:
  - input is an array of integers
  - output is the result of all input numbers multiplied together and then divided by the number of elements withing the array.
  - round the results of the output to 3 decimal places
  - assuume the array is non-empty


  Implicit Requirements:
  -

  Clarifications/ Questions:


E: Examples/ Edge Cases
  - show_multiplicative_average([3, 5])                # => The result is 7.500
  - show_multiplicative_average([6])                   # => The result is 6.000
  - show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

D: Data Structures
  - input : array
  - output: integer that is the result of taking the input values and multiplying together and dividing by the amount of array values


A: Algorithm
  def show_multiplicative_average(arr)
    - initallize num_average and set to 0
    - intiallize variable total_num and set to the result of subsequent block
    -iterate through  arr and add the total amount of each num within arr
      - calculate product  of num within  block
    - end block
    - divide total_num by arr.size and set to num_average converted to a float
    - format num_average to have 3 decimal places
    - print "the result is #{num_average}"
  end

C: Code with intent

=end


def show_multiplicative_average(arr)
  num_average = 0
  total_num = arr.reduce do |num, sum|
      num *= sum
  end
   num_average = total_num/arr.size.to_f
     "the result is #{ sprintf("%.3f", "#{num_average}")}"
end

    show_multiplicative_average([3, 5])                # => The result is 7.500
   show_multiplicative_average([6])                   # => The result is 6.000
   show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667


=begin
8. Multiply List

Write a method that takes two Array arguments in which each Array contains a list of numbers,
and returns a new Array that contains the product of each pair of numbers from the arguments
that have the same index. You may assume that the arguments contain the same number of elements.

P. Understand the Problem
  Explicit Requirements:
  - input is two arrays that both contain a list of numbers
  - output is a new array that takes a product of each pair of numbers (numbers with the same index)
  - You may assume the argument contains the same number of elements


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

D: Data Structures
  - input: 2 arrays that contain numbers
  - output: new array that contains the product of each index pair


A: Algorithm
  def multiply_list(arr1,arr2)
  - initiallize variable list_product and set to an empty array
  - initiallize counter and set to 0
  as many times as arr1.size
    - multiply arr1[counter] by arr2[counter] and append to list_product
    - counter += 1
  end block
  return list_product
  end
C: Code with intent

=end
def multiply_list(arr1, arr2)
  list_product = []
  arr1.size.times do |num|
   list_product <<  arr1[num] * arr2[num]
  end
   list_product
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

 # quick one liner for LS bonus solution
def multiply_list2(arr1, arr2)
   arr1.zip(arr2).map {|num| num.reduce(:*)}
end


 multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

=begin
9. Multiply pairs
Write a method that takes two Array arguments in which each Array contains a list of numbers,
and returns a new Array that contains the product of every pair of numbers
that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

P. Understand the Problem
  Explicit Requirements:
  - input is two arrays that contain a list of numbers
  - output is a new array that contains the product of every single pair of numbers
  - pairs in this case is every possible different product between each number within each array
  - the output should be sorted from least to greatest in value
  - you may assume neither argument is an empty array


  Implicit Requirements:
  - if more than one product is the same output all products of the same value

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
   - multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

D: Data Structures
  - input : two arrays containing numbers
  - output: new array containg all possible products between the two arrays


A: Algorithm
  - iterate through and transform arr1 into the return values onto num1
    - itertae through and transform arr2 into the return values onto num2
      - multiply num1 by num 2
    -end inner block
  - end outer block (flatten the nested array and then sort)
  end
C: Code with intent


=end

def multiply_all_pairs(arr1, arr2)
  arr1.map do |num1|
    arr2.map do |num2|
     num1 * num2
    end
  end.flatten.sort
  end

    multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

=begin
10. The End Is Near But Not Here

Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is the 2nd to last word in the given string
  - words are any sequence of non blank characters
  - you may assume there will always be at least two words

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - penultimate('last word') == 'last'
  - penultimate('Launch School is great!') == 'is'

D: Data Structures
  - input: string
  - output: string
  - intermediary: probable array


A: Algorithm
def penultimate(str)
  - convert str into an array and then access the 2nd to last index of array
end


C: Code with intent

=end

def penultimate(str)
 str.split[-2]
end

penultimate('last word') == 'last'
 penultimate('Launch School is great!') == 'is'
