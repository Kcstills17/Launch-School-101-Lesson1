# https://www.codewars.com/users/_callie_/completed

=begin
Given a string and an array of integers representing indices, capitalize all letters at the given indices.

For example:

capitalize("abcdef",[1,2,5]) = "aBCdeF"
capitalize("abcdef",[1,2,5,100]) = "aBCdeF". There is no index 100.
The input will be a lowercase string with no spaces and an array of digits.
=end

=begin
P. Understand the Problem
  Explicit Requirements:
  -  given a string and an array of integers that represent the indices of the string
  - at those given indices we are to capitalize the given letters at each indices
  -  given string is to be lowercase
  -


  Implicit Requirements:
  -  if the index is not available then there is no effect


  Clarifications/ Questions:
  - Are we to mutate the string with a destructive method? or create a new string?

E: Examples/ Edge Cases
 -

D: Data Structures
  - input: string and an array
  - output: string
  -intermediate data type: possible array


A: Algorithm
  - initiallize capitalized_array to a an empty array
  - convert the argument string into an array of characters.
  - Iterate through the array pairing each element with its corresponding index number.
    - On each iteration, check if the index number is included in the argument array and, if it is,  capitalize the corresponding element.
  - Once iteration is complete, join array back into string.


C: Code with intent


=end

# str.chars.each_wth_index

# def capitalize(string, arr)
#   capitalized_array = []
#   string.chars.each_with_index do |element, index|
#    if arr.include?(index)
#     capitalized_array << element.capitalize
#    else
#     capitalized_array << element
#    end
#   end
#   capitalized_array.join
# end

# def capitalize(string, arr)
#   capitalized_array = string.chars.map.with_index do |element, index|
#    if arr.include?(index)
#     element.capitalize
#    else
#     element
#    end
#   end
#   capitalized_array.join
# end

# p capitalize(("hello world"), [1,4,3,7,100])

# str = "Hello"

# str.chars.map.with_index(0) do |char, index|
#   p "#{index} #{char}"
#   idx + 1
# end

str = "hello world"
arr = [1,4,3,7,100]

# (0..(str.size - 1)).each do |idx|
#   if arr.include?(idx)
#     str[idx] = str[idx].capitalize
#   end
# end

# p str

arr_str = str.split('')

arr_str.map!





=begin
Deoxyribonucleic acid (DNA) is a chemical found in the nucleus of cells and carries the "instructions" for the development and functioning of living organisms.

If you want to know more: http://en.wikipedia.org/wiki/DNA

In DNA strings, symbols "A" and "T" are complements of each other, as "C" and "G". Your function receives one side of the DNA (string, except for Haskell); you need to return the other complementary side. DNA strand is never empty or there is no DNA at all (again, except for Haskell).
=end

# DNA_strand("AAAA") == "TTTT"
# DNA_strand("ATTGC") == "TAACG"
# DNA_strand("GTAT") == "CATA"

=begin
P. Understand the Problem
  Explicit Requirements:
  -  input is a given string of either or/and symbols "A" "T" "C" "G"
  - A and T are complimentary of eachother and the same for C and G
  - output the complimentary string of the given input at each indices


  Implicit Requirements:
  -   All characters are capitalized

  Clarifications/ Questions:
  - Return new string? or mutated string?

E: Examples/ Edge Cases
 - look up lol

D: Data Structures
  -  input:  string
  - output: string
  - intermediary structure: possible hash


A: Algorithm
  - create hsh which will represent one half of each complimentary pair
  - create DNA_HASH that will combine the inverted key: value of hsh  with hsh
  - convert the given string into an array and  transform and interate through block parameter element
    - if element is equal to a key of DNA_hash then return the value of that given key
  end block



C: Code with intent

=end

hsh = { "A" => "T", "C" => "G" }
DNA_HASH = hsh.merge(hsh.invert)

def DNA_strand(str)
  complements = str.chars.map do |element|
    DNA_HASH[element]
  end
  complements.join
end

# def DNA_strand(str)
#   str.chars.map {|element| DNA_HASH[element] }.join
# end

p DNA_strand("ATTCG")
