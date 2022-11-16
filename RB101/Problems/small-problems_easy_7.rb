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
    initiallize and set variable stagger_case to equal true
    convert str into an array and then transform each element of said array onto a new array object
  end

=end
def stagger_case_two(str)
  stagger_case = true
str.chars.map do |element|
  if stagger_case
    element.upcase
  else
    element.downcase
  end
  stagger_case = !stagger_case

end
end


    p stagger_case_two('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
  #staggered_case('ALL CAPS') #== 'AlL cApS'
  #staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 nUmBeRs'
