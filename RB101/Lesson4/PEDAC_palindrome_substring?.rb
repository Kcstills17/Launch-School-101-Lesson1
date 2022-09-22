# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []


=begin

Understand the Problem: Questions and clarifications upon implementation details
What is a palindrome? A palindrome is string that reads the same both forward and backwards. e.g. 'aba'
What is a substring? substring  is a range of characters within an existing string. In this case we want only Substring >= 2





What is being told to us by this problem?
  Explicit Requirements:
    The Input is a string
    Create a method named 'palindrome_substrings'
    Output is all of the substrings from the input that are also palindromes
    Palindromes are case sensitive. so 'moM' would not be a palindrome in this case

  Implicit Requirements:
      If no string is given the output shall return an empty array.
      If the string given contains no palindromes. Return an empty array
      If the string contains a palindrome. append it to a new array.


Data Structures

 palindrome_substrings("palindrome") = []

 # the data structure is given by the problem test case. We are to return an array. So we can use that as our Data structure.

s

 Algorithm

    Main Process Pseudocode
        create palindrome_substrings? method
        set result to  an empty arrray
        set substring array to substring
        iterate through the substring array and determine if each iteration is a palindrome
        If it is append it to result
          return result

    Sub Process Pseudocode: Palindrome?
      create is_palindrome? method
      input should be string.
      reverse the given string
      if string and reversed string are ==
        return string

 I do not know how to create an algorithm for substring so let's brainstorm on it

  substring example
  'halo' => 'ha', 'hal', 'halo', 'al', 'alo', 'lo
  'soccer' => 'so', 'soc', 'socc', 'socce',  soccer', 'oc', 'occ', 'occe', 'occer', 'cc', 'cce', 'ccer', 'ce', 'cer' ,'er',

  what do we notice about this?
  it seems that at the starting index the string at each remaining length is returned.
  We can see the
  for example at index 0 "h" we have 'ha' (starting at 2 because that is our requisite for a palindrome) then 'hal' and finally 'halo
  so we have at index 0 a string at a length of 2, 3, and then finally 4.
  then we move on to the next index 1. we have 'al', and 'alo'
  that gives us  the string at length 2 and then 3
  and finally at index 2 (final index with atleast one  value following it) we ave the string at 'lo' so just at length 2.

  so starting at index 0. return string at length 2,3,4
  increment
  index 1, return string at length 2,3
  increment
  index 2, return string at length 2.
  remaining index length is less  than 2.
  exit




    Sub Process Pseudocode: Substring
   create an empty array called `result` that will contain all required substrings
     create a `starting_index` variable (value `0`) for the starting index of a substring
     start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
       create a `num_chars` variable (value `2`) for the length of a substring
       start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
         extract a substring of length `num_chars` from `string` starting at `starting_index`
         append the extracted substring to the `result` array
         increment the `num_chars` variable by `1`
       end the inner loop
       increment the `starting_index` variable by `1`
     end the outer loop
     return the `result` array


    lets put these in action.

=end
def substring(input)
  result = []
  starting_index = 0

   while starting_index <= input.size - 2
    num_chars = 2
    while num_chars <= input.length - starting_index
      substr = input.slice(starting_index, num_chars)
      result << substr
      num_chars += 1
    end
    starting_index += 1
   end
   result
end


    p substring("halo ")


    def is_palindrome?(input)
      input == input.reverse

    end

 p is_palindrome?("lol")

 def palindrome_substrings(input)
  result = []
  substring_array = substring(input)
  substring_array.each do |substring|
       result << substring if is_palindrome?(substring)
    end
result
 end

p palindrome_substrings("supercalifragilisticexpialidocious")





