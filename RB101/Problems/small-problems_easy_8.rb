=begin
1. Write a method that takes an Array of numbers and then returns the sum of the sums
of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

P. Understand the Problem
  Explicit Requirements:
  - input is an array of numbers
  - output is the sum of each subsequent num
  - you may assume the array contains at least one number

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
  - sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
  - sum_of_sums([4]) == 4
  - sum_of_sums([1, 2, 3, 4, 5]) == 35

D: Data Structures
  - input: array
  - output: integer


A: Algorithm
def sum_of_sums(arr)
  - iterate through each num of arr
    - from the range of 0 to arr.size non inclusive iterate through each return value as num
      - from the range of num to arr.size inclusive iterate through each return value as inner_num
        - append the slicing of arr at each num through each inner_num to total_arr
          - end inner block
        - end outer block
      - combine total_array into one array and then remove the 2nd hald of the array. Then add the total value together

C: Code with intent

=end

def sum_of_sums(arr)
total_arr = []
   (0...arr.size).each do |num|
    (num...arr.size).each do |inner_num|
     total_arr <<   arr[num..inner_num]
    end
  end
   total_arr.flatten.slice(0, total_arr.size).reduce(:+)
end

   sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
   sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
   sum_of_sums([4]) == 4
   sum_of_sums([1, 2, 3, 4, 5]) == 35


=begin
2. Madlibs

Mad libs are a simple game where you create a story template with blanks for words.
You, or another player, then construct a list of words and place them into the story,
creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
and an adjective and injects those into a story that you create.

P. Understand the Problem
  Explicit Requirements:
  - mad libs are a game where you create a story template with blanks for words
  - create a mad-lib program that prompts for a noun, verb, adverb, and adjective and then adds them into
    a story you create

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - Enter a noun: dog
    Enter a verb: walk
    Enter an adjective: blue
    Enter an adverb: quickly

    Do you walk your blue dog quickly? That's hilarious!

D: Data Structures
  - input: none
  - output: a constructed sentence


A: Algorithm
  def mad_libs
    - prompt for a noun
    - initiallize variable noun
    - prompt for a verb
    - initiallize variable verb
    - prompt for a verb
    - initiallize variable adjective
    - prompt for an adjective
    - initiallize variable adverb
    - prompt for an advern

    print "Why are you #{adverb} #{verb} the #{adjective} #{noun}"
  end

C: Code with intent


=end
def mad_libs
  puts "Choose a noun "
  noun = gets.chomp
  puts "Choose an adjective "
  adjective = gets.chomp
  puts "Choose a verb "
  verb = gets.chomp
  puts "Choose an adverb "
  adverb = gets.chomp
  puts "Why are you #{adverb} #{verb} the #{adjective} #{noun}?"
end

#mad_libs

=begin
3. Leading Substrings

Write a method that returns a list of all substrings of a string that start at the beginning
of the original string. The return value should be arranged in order from shortest to longest substring.

P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is a list of all substrings that start at the beginning of the string.
    for example if a string was ('abc') then all substring that start with 'a'
  - should be arranged in order from shortest to longest substring
    end

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
- leading_substrings('abc') == ['a', 'ab', 'abc']
- leading_substrings('a') == ['a']
- leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

D: Data Structures
  - input: string
  - output: string that is the result of all substring starting with the first character


A: Algorithm
    def leading_substrings(str)
        initiallize  lead_substr as an empty arr
        - gather all substring from iterating through element and it subsequent inner_element
          - if the substr starts with str[0] append to lead_substr
          end inner block
        end outer block
        return lead_substr
    end

C: Code with intent


=end


def leading_substrings(str, idx)
  lead_substr = []
  (0..str.size).each do |element|
    (element...str.size).each do |inner_element|
     str[element..inner_element].start_with?(str[idx]) ? lead_substr << str[element..inner_element] : element
    end
  end
  lead_substr
end


p leading_substrings('abc', 0) == ['a', 'ab', 'abc']
leading_substrings('a', 0) == ['a']
leading_substrings('xyzzy', 0 ) == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']


=begin
4. All Substring

Write a method that returns a list of all substrings of a string. The returned list
should be ordered by where in the string the substring begins. This means that all substrings
that start at position 0 should come first, then all substrings that start at position 1,
and so on. Since multiple substrings will occur at each position, the substrings at a given
position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:


P. Understand the Problem
  Explicit Requirements:
  - input: a string
  - output: all substring in a given string ordered  from index position and within each index from shortest to longest in length
  - you should implement leading_substring when making this method

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  - substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
]


D: Data Structures
  - input: string
  - output: string that is all substring ordered by substring and by length within each index


A: Algorithm
  def substrings(str)
    - convert str into an array of each character and iterate through each element with it's index and transform each value onto a new array
      - invoke leading_substrings on each str at each idx
  end

C: Code with intent


=end

def substrings(str)
 str.chars.each_with_index.map do |_, idx|
   leading_substrings(str, idx)
end.flatten
end

  substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]


=begin
5. FizzBuzz

Write a method that takes two arguments: the first is the starting number, and the second
is the ending number. Print out all numbers from the starting number to the ending number,
except if a number is divisible by 3, print "Fizz", if a number is divisible by 5,
print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".


P. Understand the Problem
  Explicit Requirements:
  - input is two integers that represent a starting and ending number
  - output prints "Fizz" if a number is divisible evenly by 3
  - output prints "Buzz" if a number is divisible evenly by 5
  - output prints "FizzBuzz" if a number is evenly divisible by both 3 and 5

  Implicit Requirements:
  - if a number is not divisible by either 3 or 5 then print the number

  Clarifications/ Questions:
  - is the return value of the numbers in this case string?

E: Examples/ Edge Cases
  - fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

D: Data Structures
  - input: two integers
  - input: integer or string based on whether the specific number is divisible by 3 or 5


A: Algorithm
    def fizzbuzz(int1, int2)
      iterate through a range from int1 to int2 inclusive and return each value as num
        - if num is evenly divisible by 3 and 5
            return "FizzBuzz"
        - elsif num is evenly divisible by 3
            return "Fizz"
        - elsif num is evenly divisible by 5
            return "buzz"
        else
           return num
      -end block

    end

C: Code with intent

=end

def fizzbuzz(int1, int2)
 (int1..int2).map do |num|
  if num % 3 == 0 && num % 5 == 0
      "FizzBuzz"
  elsif num % 3 == 0
      "Fizz"
  elsif num % 5 == 0
      "Buzz"
  else
      num
  end
 end
end

fizzbuzz(1, 15) ==  [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz']

=begin
6.  Double Char (Part 1)

Write a method that takes a string, and returns a new string in which every character is doubled.

P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is a new string in which every character is doubled

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
   - repeater('Hello') == "HHeelllloo"
   - repeater("Good job!") == "GGoooodd  jjoobb!!"
   - repeater('') == ''


D: Data Structures
  - input: string
  - output: new string with each element doubled
  - intermediaty: possible array

A: Algorithm
  def repeater(str)
   - convert str into an array with each character as a single element and then transform each value onto element.
      - add each element once more
  end

C: Code with intent

=end

def repeater(str)
 str.chars.map {|element|  element + element}.join
end


  repeater('Hello') == "HHeelllloo"
  repeater("Good job!") == "GGoooodd  jjoobb!!"
 repeater('') == ''


=begin
7. Double Char (Part 2 )

Write a method that takes a string, and returns a new string in which every consonant character
is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.


P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is a new string in which every consonant character is doubled
  - nothing else should be doubled

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
- double_consonants('String') == "SSttrrinngg"
- double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
- double_consonants("July 4th") == "JJullyy 4tthh"
- double_consonants('') == ""

D: Data Structures
  - input: string
  - output: new string with each consonant value from the original string doubled and all other values left alone



A: Algorithm
  def double_consonants(str)
    - convert str into an arr which contains each character of str and then pass the transformed values into a block
      - iterate through the block with the parameter element
        - if element does not match a consonant value
            - concatenate element by element
        else
            -element
        end if statement
      end block  (join the elements together )
  end

C: Code with intent

=end

def double_consonants(str)
   str.chars.map do |element|
      element.match?(/[bdfghjklmnpqrstvwxyz]/i) ? element + element : element
  end.join
end



  double_consonants('String') == "SSttrrinngg"
  double_consonants("Hello-World!") #== "HHellllo-WWorrlldd!"
 double_consonants("July 4th") == "JJullyy 4tthh"
  double_consonants('') == ""
