
# The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

=begin
PEDAC

P:
Input: any string containing letters only

Output: length of longest vowel (aeiou)
substring - return will be an integer
Implicit requirement: "y" is not considered a vowel in this case

E:
p solve("codewarriors") == 2
p solve ("ybd")  == 0

D:
input: string
output: integer
possible_intermediary struture: array to convert
"codewarriors" ==> ['o','e','a','io']

A:
- initiallize variable vowel_substr and set to an empty array
- create a list of  substrings, substring
  - initiallize variable check_substr
  -  set check_substr to the substring method being used on the
    given str.
  - iterate through check_substr and append all elements that start with a vowel and have no non vowels inbetween to result
  - return the longest substr length of vowel_substr

- the longest substr length of vowel_substr

Algorithm:
- list of substrings
- get the longest substr size



 High end Algorithm
- create a list of  substrings, list_substring(str)
  - initiallize a variable check_substr that will check for an substring containing non vowels and remove them
  - check_substr will be the result of remove_non_vowls being invoked on our substrings
  - remaining substr initiallized as vowel_substr
    given str.
  - return the longest substr length of vowel_substr

Helper Method Algorithm: list_substr(str)

  def list_substr(str)
    - intiallize variable substring and set to an empty array
    - iterate through a range from 0 to the size of str with the last number not inclusive.
    - result of iteration is method element element
      - iterate through each element of the range  with another range from each element to
      the size of the str with the last number not inclusive.
      - the result of that iteration is method parameter inner_elem
      - append to substring str while slicing between element and inner_elem with the final digit included
    - end inner block
  - end outer block
  - return substring
end

Helper Mthod Algorithm: remove non vowels

def remove_non_vowels(arr)
    initiallize return variable and set to an empty array
     iterate through the given array and block parameter "element"
     if an element matches any non vowel symbol than we ignore that element, else we append it to our result variable
    end block
     return result
end

Main Method Algorithm: longest_vowel_substr_length(str)

def longest_vowel_substr_length(str)
  initiallize vowel_str_size and set to 0
  initiallize substring and set to list_substring being invoked on str
    initiallize check_substring and set to remove_non_vowels being invoked on substring
    iterate through substring and local block parameter 'vowels'
    vowel_str_size if the size of vowels is greater than variable vowel_str_size then set vowel_str_size to vowels.size, else leave vowel_str_size as is
   end block
  return vowel_str_size
end
=end

def list_substring(str)
  substring = []
  (0...str.size).each do |element|
    (element...str.size).each do |inner_elem|
      substring << str[element..inner_elem]
    end
  end
  substring
end

  list_substring("codewars")

  def remove_non_vowels(arr)
    result = []
    arr.each do |element|
         element.match?(/[^aeiou]/i) ? element : result << element
    end
     result
  end
   remove_non_vowels(['c', 'co', 'a', 'io', 'ri', 'o', 'a',])



def longest_vowel_substr_length(str)
  vowel_str_size = 0
  substring = list_substring(str)
   check_substring = remove_non_vowels(substring)
   check_substring.each do |vowels|
    vowels.size > vowel_str_size ? vowel_str_size = vowels.size : vowel_str_size
   end
   vowel_str_size
end



     longest_vowel_substr_length('codewariors') == 2
     longest_vowel_substr_length('ybd') == 0
     longest_vowel_substr_length('caeioucu') == 5
     longest_vowel_substr_length('aaa') == 3




[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.to_i == el   # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end



a = [1, 2, 3, 3]
b = a
c = a.uniq!


def fix(value)
  value[1] = 'x'
  value
 end

 s = 'abc'
 p t = fix(s)
