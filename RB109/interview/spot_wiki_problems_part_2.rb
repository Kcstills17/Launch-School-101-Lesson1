=begin


12. Detect Pangram
(https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby)
6 kyu
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.


P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is a boolean value
  - determine whether the input string is a panagram

  Implicit Requirements:
  - case insensitive

  Clarifications/ Questions:
  - a pangram is a sentence that contains every single letter of the alphabet at least once. Ignore numbers and punctuation

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: boolean
  - possible intermediary structure: a hash to set all letters as keys and their values to zero


A: Algorithm
- create a hash that contains all letters from a-z as keys and set each value to 0.
- -iterate through the input str and then increment the value of each character that is a key by 1. If the character is not apart of the hash then ignore it
- check all values of the hash and if all of them are greater or equal to 1 retrun true. Otherwise return false

C: Code with intent





=end

def initialize_alphabet_hash
  hash = {}
  ('a'..'z').each {|letter| hash[letter] = 0}
  hash
end

def pangram?(str)
 letter_hash = initialize_alphabet_hash
 str.each_char {|l| letter_hash.include?(l.downcase) ? letter_hash[l.downcase] += 1 : letter_hash  }
  letter_hash.values
   letter_hash.values.all? {|count| count >= 1 }
end

 pangram?("The quick brown fox jumps over the lazy dog.") == true
 pangram?("This is not a pangram.")== false
 pangram?("Cwm fjord bank glyphs vext quiz")



=begin

13. Kebabize
(https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby)
6 kyu
Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:

the returned string should only contain lowercase letters



P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is the input string but converted into kebab case

  Implicit Requirements:
  - if the character is a special character or uppercase then convert into a hyphen
  - if a character is a lower case letters then leave alone

  Clarifications/ Questions:
  - Kebab case has a hyphen between each individual word

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: an array to compare each character to an array of lowercase letters.


A: Algorithm
create an array containing only lowercase letters
- create a result array
- if the first character of the str is a letter and uppercase then convert the letter to lowercase
- if the first character of the str is a non letter then remove the character
- once that is done if the character includes any uppercase letters then downcase them and prepend a ('-')
- if there is now a hyphen at the beginning of the return array delete that first character. Otherwise leave as be
- leave the remaining characters as is and join the result array


C: Code with intent


=end

def kebabize(str)
alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
kebab_word = str.chars.map do |char|
if  str.start_with?(char) && alphabet.include?(char)
  char.downcase
elsif str.start_with?(char)

elsif ("A"..'Z').include?(char)
  char.downcase.prepend('-')
elsif !alphabet.include?(char)
else
  char
end
end.join
  kebab_word.delete!(kebab_word[0]) if kebab_word[0] == '-'
 kebab_word
end

 kebabize('myCamelCasedString') == 'my-camel-cased-string'
 kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
 kebabize("Jq0Phy") == "jq-phy"
 kebabize("5Izq0h") == "izqh"



=begin

14. Dubstep
(https://www.codewars.com/kata/551dc350bf4e526099000ae5/train/ruby)
6 kyu
Polycarpus works as a DJ in the best Berland nightclub, and he often uses dubstep music in his performance. Recently, he has decided to take a couple of old songs
and make dubstep remixes from them.

Let's assume that a song consists of some number of words (that don't contain WUB). To make the dubstep remix of this song, Polycarpus inserts a certain number of
words "WUB" before the first word of the song (the number may be zero), after the last word (the number may be zero), and between words (at least one between any pair
of neighbouring words), and then the boy glues together all the words, including "WUB", in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep remix as "WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into modern music, he decided to find out what was the initial song that Polycarpus remixed.
Help Jonny restore the original song.

Input
The input consists of a single non-empty string, consisting only of uppercase English letters, the string's length doesn't exceed 200 characters

Output
Return the words of the initial song that Polycarpus used to make a dubsteb remix. Separate the words with a space.

Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")  =>  WE ARE THE CHAMPIONS MY FRIEND

P. Understand the Problem
  Explicit Requirements:
  - input is a string
  - output is string that is the result of returning only the characters in between each complete 'wub' characters
  -

  Implicit Requirements:
  - if there is a B right after WUB you still must isolate that B and return it separately from the WUB

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: str
  - output: str
  - possible intermediary structure: array


A: Algorithm
- split the input str up by the string value "WUB" and then join all str together that is not a space.
C: Code with intent



=end
def song_decoder(str)
   str.split("WUB").select {|char|  char != '' }.join(' ')
end

 song_decoder("AWUBBWUBC") == "A B C"
 song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
 song_decoder("WUBAWUBBWUBCWUB") == "A B C"
 song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")  ==  "WE ARE THE CHAMPIONS MY FRIEND"


=begin

15. Take a Ten Minute Walk
(https://www.codewars.com/kata/54da539698b8a2ad76000228/train/ruby)
6 kyu
You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity
to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings
representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction and you know it takes you one minute to traverse one city block,
so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return
you to your starting point. Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty array
(that's not a walk, that's standing still!).

P. Understand the Problem
  Explicit Requirements:
  - input is an array of string.
  - output is a boolean value
  - boolean is determined by whether the output array makes it back to thes same location in 10 minutes
  - each string represents walking one block in a direction. it will take one minute for each block walked
    If you have N then S you are back in the same place. If you have W W E you are still one block east


  Implicit Requirements:
  - to walk for exactly 10 minutes there will need to be 10 str elements or blocks walkes.

  Clarifications/ Questions:you will always contain a random assortment of letters. Never an empty array as input
  -

E: Examples/ Edge Cases
  p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
  p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
  p is_valid_walk(['w']) == false
  p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false




D: Data Structures
  - input: string
  - output: boolean
  - possible intermediary structure:


A: Algorithm
- return false if the input str does not contain 10 elements
- check to see what is the first vertical direction (if there is one) and the first horizontal direction (if there is one)
- set either or/both values to 1.
- set their counterpart directions to -1.
- convert all elements in the input str to represent those numbers
- all all digits together and if 0 is the final value return true, false otherwise

C: Code with intent



=end
def get_digit_values(arr)
vertical_values = ['n', 's']
horizontal_values = ['w', 'e']
vertical_values = arr.select {|l| l if vertical_values.include?(l)}
horizontal_values = arr.select {|l| l if horizontal_values.include?(l)}

 direction_values = arr.map do |l|
  if vertical_values[0] == l
    l = 1
  elsif horizontal_values[0] == l
    l = 1
  else
    l = -1
  end
 end
   direction_values.reduce(:+)
end




def is_valid_walk(arr)
  direction_total = get_digit_values(arr)
  arr.size == 10 ? direction_total == 0  : false
end

 is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
 is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
 is_valid_walk(['w', 'n', 'n', 's', '']) == false
 is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false



=begin


=begin
16. Stop gninnipS My sdroW!
(https://www.codewars.com/kata/5264d2b162488dc400000001)
6 kyu
Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed
(Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"


P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is string
  - goal is to take input string and reverse any words that are greater or equal to 5 in length

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: array to check each word for it's size


A: Algorithm
- iterate through the inout str and get each separate word
- check the size of each word
- if the size is >= 5 then reverse the word
- else leave the word as be

C: Code with intent


=end

def spinWords(str)
  str.split.map {|word|  word.size >= 5 ? word.reverse : word  }.join(' ')
end


 spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
 spinWords("This is a test") == "This is a test"
 spinWords("This is another test") == "This is rehtona test"
 spinWords('test') == 'test'


=begin
17. Write Number in Expanded Form
(https://www.codewars.com/kata/5842df8ccbd22792a4000245)
6 kyu
Write Number in Expanded Form
You will be given a number and you will need to return it as a string in Expanded Form. For example:

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
NOTE: All numbers will be whole numbers greater than 0.

If you liked this kata, check out part 2!!

P. Understand the Problem
  Explicit Requirements:
  - input is an integer
  - output is string which contains each digit in it's expanded form
  - all numbers will be whole and greater than 0

  Implicit Requirements:
  - do not count 0 as an expanded number.

  Clarifications/ Questions:
  - expanded form meaning the digit followed by the amount of 0s remaining in the number.  e.g. (42) would be 40 and then 2

E: Examples/ Edge Cases


D: Data Structures
  - input: integer
  - output: string
  - possible intermediary structure: an array for all converted to string digits


A: Algorithm
-  convert the input integer into string and break up by each digit
- get each digit and it's index.
- work on only the non 0 digits
- from those digits convert the str num into integers
- set the index to the value of index + 1
- add to each string digit the amount of 0s that equal the index value

- after each digit has had the n amount of 0s added join the words together separated by a '+' symbol



C: Code with intent

=end

def expanded_form(int)
  digit_arr = int.to_s.chars
  digit_arr.reverse.map.with_index { |num, i|num.to_i != 0  ? "#{num + (0.to_s * i)}" : nil }.compact.reverse.join(" + ")
end

 expanded_form(12) == '10 + 2'
 expanded_form(42) == '40 + 2'
 expanded_form(70304) == '70000 + 300 + 4'


=begin

18. Persistent Bugger.
(https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby)
6 kyu
Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

For example:

 persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

 persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 persistence(4) # returns 0, because 4 is already a one-digit number

 P. Understand the Problem
  Explicit Requirements:
  - input is an integer
  - output is an integer result that represents the number of times you multiply the digits of the input integer until the result of the multiplication is a single digit number
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: integer
  - output: integer
  - possible intermediary structure: convert input to string and contain in an array then convert each digit to int and multiply


A: Algorithm
- return 0 if the input int converted to str size is 1
- convert input integer into string digits within an array
-  initialize times_till_single_digit to 0
- initialize digits
- until the array containing all digits being multiplied together is 1 in size
  - set digits to the the result of multiplying all integer values together and then convert to string split up by digits
  - set digit_array to the result of iterating through all digits and transforming back into integer
  - increment  times_till_single_digit by 1
  - repeat

C: Code with intent


=end

def persistence(int)
  return 0 if int.to_s.size == 1
  times_til_single_digit = 1
  digit_array = int.to_s.chars
  digit_array = digit_array.map {|num| num.to_i}

  until  digit_array.reduce(:*).to_s.size == 1
    times_til_single_digit += 1
    digits = digit_array.reduce(:*).to_s.chars
    digit_array = digits.map {|num| num.to_i}
  end
 times_til_single_digit
end


 persistence(39) == 3
 persistence(4) == 0
 persistence(25) == 2
 persistence(999) == 4



=begin

19. Title Case
(https://www.codewars.com/kata/5202ef17a402dd033c000009)
6 kyu
A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of the word is in upper case) or
  (b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional list of exceptions (minor words). The list of minor words will be given as a string
with each word separated by a space. Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor
word string is changed.

P. Understand the Problem
  Explicit Requirements:
  - input is two string arguments
  - output is the first argument with every word capitalized except for the words specified by argument 2.
  - if the first word is specified by argument 2 still keep it capitalized as the first word is always capitlaize.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: array to convert each specific character to uppercase that is specified.


A: Algorithm
- account for 1 or more arguments
- if only 1 argument is included then split the input argument by it's first index, capitalize all values and join the values back together by each word
- otherwise check to see the values from index2 of the argument that are included in index1 of the argument.
- if they are included then lowercase then value
- if they are not included then capitalize the value
- join the values together by each word
- capitalize the first word of the returning string to make sure that it is always capitalize even if specified in index2.
C: Code with intent









=end

def title_case(*arr)
if arr.length == 1
   arr.join.split.map {|word| word.capitalize}.join(' ')
else
  converted_sentence =  arr[0].split.map {|word|   arr[1].downcase.include?(word.downcase) ? word.downcase : word.capitalize }
  converted_sentence[0] = converted_sentence[0].capitalize
   converted_sentence.join(" ")
end

end


  title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
  title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
  title_case('the quick brown fox') == 'The Quick Brown Fox'


=begin
  20. Count and Group Character Occurrences in a String
(https://www.codewars.com/kata/543e8390386034b63b001f31)
6 kyu
Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.

P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is a hash with the each key being a count total of some specfic elements and the value being an array of each string character that has the count of the key
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: hash containing  integers as keys and and array containing string as values
  - possible intermediary structure: an array to get the count of each unique element in the input str. and an array to array to store each value


A: Algorithm
- initialize a hash with the count of each unique character as the key and an empty array as the value.
- for the key we want to select all lowercase characters and we want the input string to be case insensitive when checking the count's
- we want to remove any non letter or non string digits from our filtered_array .
- once we have our array filtered we will iterate through that and select all unique characters as the key and
- set each value to an empty array
- now we want to iterate through  the hash and get both the k and v from the hash
- sort our filtered_arr as we want it to be sorted by string value and then iterate through this once again
- now we will append to the specific hash value array when it fits this specific criteria
  - if the count in the filtered_arr of a specific char is == to a specific key in the hash then we will append that char to the value of that key-value pair
- once we have gone through each char we will likely have multiple of the same characters for any character that has a count over 1. So mutate the values to only
    have unique values
-  return our hash
C: Code with intent







=end





def initialize_count_hash(str)
  filtered_arr = str.downcase.chars.select {|char| ('a'..'z').include?(char) || ('0'..'9').include?(char)}
  hash = {}
  filtered_arr.each {|char| hash[filtered_arr.count(char)] = []}
  hash.sort {|a, b| b <=> a}.to_h
end


  def get_char_count(str)
    result_hash = initialize_count_hash(str)
    result_hash.each_pair do |k, v|
        filtered_arr = str.downcase.chars.sort.select {|char| ('a'..'z').include?(char) || ('0'..'9').include?(char) }
      filtered_arr.each {|char|    result_hash[k] << char  if filtered_arr.count(char) == k }
       v.uniq!
    end
     result_hash
  end



  get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
  get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
  get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
  get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
  get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}
  get_char_count("AaAAaAAabB!B!B3b23jdc")




=begin

21. Find the Mine!
(https://www.codewars.com/kata/528d9adf0e03778b9e00067e/train/ruby)
6 kyu
You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array.
Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array (Tuple<int, int> in C#) where the first element is the row index, and the second element is the column index of the bomb location
(both should be 0 based). All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.

P. Understand the Problem
  Explicit Requirements:
  - input is a sequence of arrays
  - output is an array that represents the position of the mine in the input
  - you must get the first index as the position of the mineamongst the subarrays and te second index as the position of the mine within the specific array

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - a mine is represented as the integer 1 in the 2d array

E: Examples/ Edge Cases


D: Data Structures
  - input: array containing multiple subarrays
  - output: an array which represents the index of the mine in the outer array and within the specific array
  - possible intermediary structure: two arrays to pick out the indexes which are contained at each level


A: Algorithm
- create a result array
- initialize subarrays to the result of iterating through the first outer array and getting all subbarrays
- account for multiple parameters (*param)
- access each specific subarray within the main array.
- within the first iteraton we want select the index in which the subarray contains the integer 1
  - append to the result_arr the index this fulfills this requirement
- iterate once again and within this array choose the index in which character is == to the integer 1
  - append to the result_arr the index that fulfills this requirement
return result_array

C: Code with intent









=end
def mineLocation(*arr)
  result_arr = []
  subarrays = []
  arr.each {|arrays| subarrays = arrays }
  subarrays.each.with_index {|array, i| result_arr << i if array.include?(1)}
  subarrays.each {|array| array.each.with_index {|num, i| result_arr << i if num == 1 }}
  result_arr
end

mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
 mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
 mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
 mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
 mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
 mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]



=begin

22. Scramblies
(https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby)
5 kyu
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.


P. Understand the Problem
  Explicit Requirements:
  - input is two string arguments.
  - output is boolean
  - only worry about lower case string
  - no punctuation or digits are included
  - goal is to return true if a portion of  str1 can be rearranged to match str2
  - otherwise return false

  Implicit Requirements:
  - multiple condtions as far as the sizes of str1 and 2

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: boolean
  - possible intermediary structure:


A: Algorithm
- when the size of str1 is == to str2 then if they are sorted they should be equal if true
-  when the size of str1 is > then str2
    - iterate through all of str1 and get the count of the char in str2
    - if all counts are >= 1 then it is true. false otherwise


 break into two separate methods

    def both_string_equal(str1, str2)
      - sort str1 and str2
      return true if the two sorted str are == and false otherwise
    end

    def first_string_greater(str1, str2)
        - iterate through str2 and then get the count of each char in str1
        - this is to see if the count will be full as if true all counts from str1 should be at least 1 from the char of str2
        - if the array containing all characters is >= 1 then return true. otherwise falsse
    end

    def scramble(str1, str2)
         if str1.size == str2.size  then both_string_equal. Otherwise first_string_greater
    end

C: Code with intent




=end
def both_string_equal(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def first_string_greater(str1, str2)
 char_count =  str2.chars.map {|char|  str1.count(char)}
  char_count.all? {|count| count >= 1}
end

def scramble(str1, str2)
   str1.size == str2.size ? both_string_equal(str1, str2) : first_string_greater(str1, str2)
end


 scramble('rkqodlw', 'world') == true
 scramble('cedewaraaossoqqyt', 'codewars') == true
 scramble('katas', 'steak') == false
 scramble('rkqodlw','world') == true
 scramble('cedewaraaossoqqyt','codewars') == true
 scramble('katas','steak') == false
 scramble('scriptjava','javascript') == true
 scramble('scriptingjava','javascript') == true


=begin
 23. Longest alphabetical substring
(https://www.codewars.com/kata/5a7f58c00025e917f30000f1)
6 kyu
Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

There are tests with strings up to 10 000 characters long so your code will need to be efficient.

The input will only consist of lowercase characters and will be at least one letter long.


P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is string
  - goal is to return the largest possible substring that is in alphabetical order
  - input as only lowercase letters and is at least one letter long
  -

  Implicit Requirements:
  - example 3 appears to show if there are two alphabetical substring that re the same in size then choose them based on their sorted order comparatively.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p longest('asd') == 'as'
  p longest('nab') == 'ab'
  p longest('abcdeapbcdef') == 'abcde'
  p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
  p longest('asdfbyfgiklag') =='fgikl'
  p longest('z') == 'z'
  p longest('zyba') == 'z'


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: array to get all substring


A: Algorithm
- get all substring(str)
- once we have all substring then compare each substring with the sorted version of the substring itself
- append the substring that is == to the sorted version of itself onto a new array
- check the new sorted_array for the largest string in size. If more than one are that max size then return the one that takes precedence in order of string

 getting_all_substr
- iniitalize result_arr
- iterate through a range non inclusive from 0 to the size of the input str and assign param element
- iterate from a range inclusive from element to the size of the input str and assign param inner_elem
- append to result_arr the result of every combination of characters from element to inner_elemment

 longest(str)
-  initialize  substring to the result of getting_all_substring
- initialize alphabetical_substring to the result of selecting all substring that are equal to the sorted version of itself
- get the largest character in alphabetical_substring and if the size is greater than one return the first character after sorting the values.

C: Code with intent






If there are multiple solutions, return the one that appears first.
=end

def getting_all_substr(str)
  result_arr = []
(0...str.size).each do |element|
  (element..str.size).each do |inner_element|
 result_arr << str[element..inner_element]
  end
end
 result_arr
end

def longest(str)
  substr = getting_all_substr(str)
  alphabetical_substring = substr.select {|str|  str.chars.sort == str.chars}
  alphabetical_substring.max {|a, b| a.length <=> b.length}

end

 longest('asd') == 'as'
 longest('nab') == 'ab'
 longest('abcdeapbcdef') == 'abcde'
 longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
 longest('asdfbyfgiklag') =='fgikl'
 longest('z') == 'z'
 longest('zyba') == 'z'


=begin


24. The Hashtag Generator
(https://www.codewars.com/kata/52449b062fb80683ec000024)
5 kyu
The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!

Here's the deal:

It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.
Examples
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false

P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is string
  - here are the conditions we must fulfill
  - all words must start with a hashtag
  - all words must have their first letter capitalized
  - return false if the final result is longer than 140 characters (not input str )
  - if the input is an empty str return false

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false



D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure:


A: Algorithm
- if input is empty or begins with empty string return false
  - initialize capitalized_str to the result of capitalizing each word of the input str
  - initialize hashtag_str to the result of adding a hashtag to the first element of capitalized_str

  - check the size of hashtag_str and if it is > 140 then return false, otherwise return hashtag_str
  - also return false if the only character returned is a # so the size is 1 for instance




C: Code with intent









=end


  def generateHashtag(str)
    return false if str.empty?
    capitalized_arr = str.split.map {|char|  char.capitalize}
    hashtag_str = capitalized_arr.join.insert(0, '#')
    hashtag_str.size > 140 || hashtag_str.size == 1  ? false : hashtag_str
  end

  generateHashtag("") == false
  generateHashtag(" " * 200) == false
  generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
  generateHashtag("Codewars") == "#Codewars"
  generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
  generateHashtag("Codewars is nice") == "#CodewarsIsNice"
  generateHashtag("code" + " " * 140 + "wars") #== "#CodeWars"
  generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
  generateHashtag("a" * 139) == "#A" + "a" * 138
  generateHashtag("a" * 140) == false
  generateHashtag(' ') == false


=begin

25. Pete, the baker
(https://www.codewars.com/kata/525c65e51bf619685c000059/train/ruby)
5 kyu
Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, how many cakes he could
 bake considering his recipes?

Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can
bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present
in the objects, can be considered as 0.

Examples:

// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});


P. Understand the Problem
  Explicit Requirements:
  - input is two hashes.
   the key from the first hash is the ingredients from a recipe and the values are the amount of ingredients necessary to make 1 cake
   the key from the second hash is the available ingredients and the values are the amount of ingredients that we currently have.
  - output is an integer that represents the number of cakes that can be made using hsh1 and based off of hsh 2
  -

  Implicit Requirements:
  - if hsh 2 is empty we cant make any cakes so return 0
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: two hashes
  - output: boolean
  - possible intermediary structure: arrays to  check the keys if each hash to see if hsh2 contains all of the keys of hash 1


A: Algorithm
- return 0 if hsh2 is empty
- initialize two variables that are set to the sorted values of both hsh1 and hsh2 and converted back to a hash
- check the keys of the sorted hsh1 and then return false if not all keys are included in hsh2
- if that is not the case select all keys from hsh2 that appears in hsh1 and ignore any that do not appear
- combine the values of both hsh1 and hsh2 and then iterate through this new combined arr
- divide the first index of the array by the second index of the array at each iteration.
- take this final array result value and return the lowest integer value in the array .

C: Code with intent




=end

def cakes(hsh1, hsh2)
  return 0 if hsh2.empty?
    sorted_hsh1 =  hsh1.sort.to_h
    sorted_hsh2 = hsh2.sort.to_h
   return 0  if sorted_hsh1.keys.all? {|ingredients| hsh2.keys.include?(ingredients)} == false
   sorted_hsh2.select! {|k|  sorted_hsh1.include?(k) }
  sorted_hsh2.values.zip(sorted_hsh1.values).map {|array|  array[0] / array[1]}.min
end


 p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
 cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
 cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
 cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
 cakes({"eggs"=>4, "flour"=>400},{}) #== 0
 cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1












=begin
26. Mean Square Error
https://www.codewars.com/kata/51edd51599a189fe7f000015/train/ruby

Complete the function that

- accepts two integer arrays of equal length
- compares the value of each member in one array to the corresponding member in the other
- squares the absolute value difference between those two values
- and returns the average of those squared absolute value difference between each member pair.

[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2
P. Understand the Problem
  Explicit Requirements:
  - input is two arrats
  - output is an integer
  -  goal is to take the difference between each integer at their respective index from both arrays and then square the values
  - once we have the values of all totals then add together each value and divide by the size of either array


  Implicit Requirements:
  - have one decimal place if the result of the division is not a whole number.

  Clarifications/ Questions:
  - is it neccessary to return specific answers as integers and floats are all as floats?

E: Examples/ Edge Cases


D: Data Structures
  - input: two arrays
  - output: integer
  - possible intermediary structure: an array to get the index of each specific value and them do the respective additions and then divisoin


A: Algorithm
 - get the indexes of both the arr1 and arr2
 -  get the specific value from each array at it's specific index
 - merge arr1 and arr2 by their indexes and initialize as combined_arr
 -  compare each subarray values by their value and sort them
 - get the difference in value between each two value  and square them
 -  take the total of each new number and divide by the size of  arr1
 - if the result of the division is not a clean whole number then
    - return a float to the first decimal place
  - otherwise return the number

C: Code with intent


=end
=begin
def solution(arr1, arr2)
  combined_arr = arr1.zip(arr2)
  sorted_arr = combined_arr.map {|arr| arr.sort {|a, b| b <=> a}}
  total_difference =  sorted_arr.map {|arr|  (arr[0] - arr[1]) ** 2}.reduce(:+)
  total_difference % arr1.size == 0 ? total_difference / arr1.size : total_difference.to_f / arr1.size
end


 solution([1, 2, 3], [4, 5, 6])  == 9
 solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
 solution([-1, 0], [0, -1])  == 1

=end



