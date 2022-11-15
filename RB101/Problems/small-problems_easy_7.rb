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
    - join str into an array  then iterate each element onto a new object name count_hash with the set value of 0
      - set count_hash to have the keys :lowercase, :uppercase, and :neither
      - if element is included in LOWERCASE than increment the value of :lowercase and set as new value
      - elsif element is included in UPPERCASE then increment the value of :uppercase and set as new value
      - else increment the value of :neither and set as new value


  end

C: Code with intent

=end


LOWERCASE = ('a'..'z')
UPPERCASE = ("A".."Z")
def letter_case_count(str)
   str.chars.each_with_object (Hash.new(0)) do |element, count_hash|
    count_hash[:lowercase] = 0 && count_hash[:uppercase] = 0 && count_hash[:neither] = 0
    case count_hash
    when LOWERCASE.include?(element)
      then  count_hash[:lowercase] += 1
    when UPPERCASE.include?(element)
      then count_hash[:uppercase] += 1
    else
      count_hash[:neither] += 1
    end
  end

end

p letter_case_count('abCdef 123')  # == { lowercase: 5, uppercase: 1, neither: 4 }


