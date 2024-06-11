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


=begin
Count letters in string
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key
and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.
Example:
letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}



P. Understand the Problem
  Explicit Requirements:
  -  input is a given string
  - output is the letter count of the given lowercase strings with the letter as the key and the count as the value  in a hash
  - the key must be a symbol instead of a string



  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  -  letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
  -  letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
  -  letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})

D: Data Structures
  -  input: string
  - output: hash
  - intermediary structure: array


A: Algorithm
  def letter_count(str)
    - create a hash with a base value of 0  and label it letter_count_hash
    -convert str into an array
    - iterate through the array and each element of the array
      - access each value of letter_count_hash at each element and increment the value by 1 and set to new value
      - convert the string value keys of  letter_count_hash into symbols
      - end block
    return letter_count_hash
  end

C: Code with intent

=end





def letter_count(str)
   letter_count_hash = Hash.new(0)
 str.chars.each do |element|
    letter_count_hash[element.to_sym] += 1
  end
   letter_count_hash
end

 letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}

 letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
 letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}


# Detect Pangram
=begin
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The
quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.



P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is a boolean that is true if the input contains every single string or false if it does not
  - capitalization does not matter
  - ignore numbers and punctuation


  Implicit Requirements:
  -

  Clarifications/ Questions:
  - pangram is a sentence that contains every single letter of the alphabet

E: Examples/ Edge Cases
  - panagram?("The quick brown fox jumps over the lazy dog.") == true
  - panagram?("This is not a pangram.") == false

D: Data Structures
  -  input: string
  - output: boolean


A: Algorithm
  initiallize constant ALPHABET and set to letters a - z
  def panagram?(str)
    - iterate through ALPHABET
    -  check to see if every element downcase and greater than 0 is included in ALPHABET
    - else return false
  end

C: Code with intent

=end
  p ALPHABET = ('a'..'z').to_a
def panagram?(str)
  ALPHABET.all? do |element|
    element.downcase.count(element) > 0
  end
end


   panagram?("The quick brown fox jumps over the lazy dog.")
  panagram?("This is not a pangram.") == false
  #panagram?("abcdefghijklmnopqrstuvwxyz")

=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text is found within the full_text.
Usage example:
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1


P. Understand the Problem
  Explicit Requirements:
  -  input is string that represents a series of substring , and a search_text that we will searching the output with
  - output should  be the number of times the search_text is within the substring



  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - solution('abcdeb','b') == 2
  - solution('abcdeb', 'a') == 1
  - solution('abbc', 'bb') == 1

D: Data Structures
  - input: string
  - output: integer


A: Algorithm
  def soultion(str, search_str)
    - create a hash named count_substr and set the initial value to 0
    - iterate through substr (which is the result of a helper method) and each element of it
      - access each element at the key of count_substr and increment by 1/ set new value on each increment
      -end block
      return count_substr[search_str]
  end

  Helper Method: get_substrings(str)
  def get_substrings(str)
    initiallize variable substring and set to an empty array
    -  iterate  a range from 0 until the size of the string exclusive as each element
      - iterate through a range from element until the size of the string inclusive  as each inner_elem
        - append each str slice from element to inner_elem inclusive
        -end inner block
        -end outer block
      - return substring

  end


C: Code with intent

=end

def get_substrings(str)
  substring = []
 (0..str.size ).each do |element|
  (element.. str.size).each do |inner_elem|
    substring << str[element..inner_elem]
  end
 end
 substring
end

p get_substrings('abcdeb')


def solution(str, search_str)
   count_substr = Hash.new(0)
  substr = get_substrings(str)
  substr.each do |element|
    count_substr[element] += 1
  end
   count_substr

end




 p solution('abcdeb','b')


