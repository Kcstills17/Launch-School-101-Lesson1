=begin



44. Counting Duplicates
(https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/ruby)
6 kyu
Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

P. Understand the Problem
  Explicit Requirements:
  - input  is a string
  - output is an integer
  - our goal is to count all cases of alpha-numeric character that appear more than once in the string
  - it is case insensitive

  Implicit Requirements:
  - if a character has a count more than one it does not matter how much more the count is. That character now counts as 1 to our tally of total duplicates.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
#p duplicate_count("abcde") == 0
#p duplicate_count("abcdeaa") == 1
#p duplicate_count("abcdeaB") == 2
#p duplicate_count("Indivisibilities") == 2
#p duplicate_count("") == 0


D: Data Structures
  - input: string
  - output: integer
  - possible intermediary structure: an array to get all counts


A: Algorithm

- iterate through the input str and get each char.
- check the count from the input str of each char downcased
- ignore the count if it is 1
- get an array of all count's > than 1
- get all unique values from this array and then return the size of the array
C: Code with intent



=end

def duplicate_count(str)
  filtered_str = str.chars.map {|char| char.downcase}
  filtered_str.select {|char| char  if filtered_str.count(char.downcase) != 1}.uniq.size
end

duplicate_count("") == 0
duplicate_count("abcde") == 0
duplicate_count("abcdeaa") == 1
duplicate_count("abcdeaB") == 2
duplicate_count("Indivisibilities") == 2


=begin
45. Alphabetized
(https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby)
6 kyu
The alphabetized kata
Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the english alphabet letters.

P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is string
  - goal is to take the input str and then reorder the str in order of case insensitive alphabetical order. so 'AaBb' etc
  - whitepsace and punctuation is removed

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure:


A: Algorithm
- initialize input_arr and set to contain each character of  the input arr
- set input_arr to get rid of any non alphabetical character
- iterate through input_arr and sort each two character downcased by alphabetical order
- return the result of the sorted values

C: Code with intent




Example:

alphabetized("The Holy Bible") # "BbeehHilloTy"
=end

def alphabetized(str)
input_arr = str.chars
input_arr = input_arr.select {|char| char.match(/[a-zA-Z]/)}
input_arr.sort {|a, b| a.downcase <=> b.downcase}.join
end

 alphabetized("") == ""
 alphabetized(" ") == ""
 alphabetized(" a") == "a"
 alphabetized("a ") == "a"
 alphabetized(" a ") == "a"
 alphabetized("A b B a") == "AabB"
 alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"


=begin
 46. Sum of Digits / Digital Root
(https://www.codewars.com/kata/541c8630095125aba6000c00/train/ruby)
6 kyu
In this kata, you must create a digital root function.

A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has more than one digit,
continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.

Here's how it works:

digital_root(16)
=> 1 + 6
=> 7

digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6

digital_root(132189)
=> 1 + 3 + 2 + 1 + 8 + 9
=> 24 ...
=> 2 + 4
=> 6

digital_root(493193)
=> 4 + 9 + 3 + 1 + 9 + 3
=> 29 ...
=> 2 + 9
=> 11 ...
=> 1 + 1
=> 2

P. Understand the Problem
  Explicit Requirements:
  - input is an integer
  - outpt in an integer
  - goal is to first  get the sum of each individual digit in the integer
  - we then check if the result is a single digit integer. If so return that result
  - if not break that total into individual digits once more and add togther
  - this only applies to natural numbers
  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: integer
  - output: integer
  - possible intermediary structure: array to convert each integer individually into string and convert back


A: Algorithm
- initialize digits to the result of getting an array of each str digit from the input array and iterating through and converting each digit into an integer
- initialzie current_digit_total to the result of the sum of digits
- until current_digit_total converted to a str has the size of 1
- set current_digit_total to the result of the new sum of digit_total
- when the size is 1
- return current_digit_total

C: Code with intent





=end
def digital_root(int)
 digits =  int.to_s.chars.map {|digit| digit.to_i}
 current_digit_total = digits.reduce(:+)
 until current_digit_total.to_s.size == 1
 digits = current_digit_total.to_s.chars.map {|digit| digit.to_i}
 current_digit_total = digits.reduce(:+)
 end
  current_digit_total
end

digital_root(16) == 7
digital_root(456) ==  6
digital_root(132189) == 6
digital_root(493193) == 2


=begin
47. Array.diff
(https://www.codewars.com/kata/523f5d21c841566fde000009/train/ruby)
6 kyu
Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.

It should remove all values from list a, which are present in list b.

array_diff([1,2],[1]) == [2]
If a value is present in b, all of its occurrences must be removed from the other:

array_diff([1,2],[1]) == [2]

P. Understand the Problem
  Explicit Requirements:
  - input is two arrays
  - output is an array
  - the first array is the array we are modifying and the second array is the array we are using to modify array 1
  - the goal is to check the first array for any values that are in array 2. if so then remove those totals from array 1
  - this will result in our output array.

  Implicit Requirements:
  - if the first array is empty return an empty array
  - if the second array is empty return the first array

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([1,2], [1]) == [2]
p array_diff([], [1,2]) == []


D: Data Structures
  - input: two arrays
  - output: array
  - possible intermediary structure:


A: Algorithm
  - return arr1 if arr1 is empty
  - iterate through arr1 and select each element that is not included in arr2
  - return this result

C: Code with intent




=end
def array_diff(arr1, arr2)
  return arr1 if arr1.empty?
  arr1.select {|num| !arr2.include?(num) }
end

 array_diff([1,2], [1]) == [2]
 array_diff([1,2,2], [1]) == [2,2]
 array_diff([1,2,2], [2]) == [1]
 array_diff([1,2,2], []) == [1,2,2]
 array_diff([], [1,2]) == []



=begin
   48. Where is my parent!?(cry)
(https://www.codewars.com/kata/58539230879867a8cd00011c/train/ruby )
Where's my parent?
6 kyu
Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere you want.

Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
-Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".


P. Understand the Problem
  Explicit Requirements:
  - input is string
  -output is string
  - all uppercase letters are considered mothers.
  - all lowercase letters are considered their children.
  - goal is to place the characters in alphabetical order but with the caviat  that all mothers come before thier children

  Implicit Requirements:
  - if string is empty then return the innput str

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure: array


A: Algorithm
 - initialize uppercase_array to the result of sorting each character by the alphabetically
 iterate through uppercase_array and sort each character by it's downcase self
-  join and return this result
C: Code with intent

=end

def find_children(str)
  uppercase_arr = str.chars.sort{|a, b| a<=> b }
  uppercase_arr.sort {|a, b| a.downcase <=> b.downcase}.join
end

 find_children("abBA") == "AaBb"
 find_children("AaaaaZazzz") == "AaaaaaZzzz"
 find_children("CbcBcbaA") == "AaBbbCcc"
 find_children("xXfuUuuF") == "FfUuuuXx"
 find_children("") == ""


=begin
 49. Playing with digits
(https://www.codewars.com/kata/5552101f47fc5178b1000050/train/ruby)
6 kyu
Some numbers have funny properties. For example:

89 --> 8¹ + 9² = 89 * 1

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.
In other words:

Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

If it is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.

dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51
64, 1296, 32, 262144, 2097152
P. Understand the Problem
  Explicit Requirements:
  - input is two integers
  - output is an integer
  - goal is to take the sum of the digits to the successful powers of p (second int) and see if there is a number that is equal to the result of  this sum * our second int
  - e.g.  (dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
  - e.g. dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2

  Implicit Requirements:
  - if the result of the sum of digits is less than the first number than return -1
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p dig_pow(89, 1) == 1
  p dig_pow(46288, 3) == 51
  p dig_pow(695, 2) == 2
  p dig_pow(92, 1) == -1



D: Data Structures
  - input: two integers
  - output: integer
  - possible intermediary structure: array


A: Algorithm
- initialize digit_array to the result of an array containing all string digits converted back into an integer.
- iterate through digit_array and get each char and it's index. get the value of each index + int2 and then use that as the square for each num at each iteration.
- initialize total_digit_square_value to the result of this
- return -1 if total_digit_square is < than int1
- iterate through a range of numbers from 1 to 1000 inclusive
- initialize evenly_divide_into_total_value to the result of choosing every num from the range that total_digit_square_value evenly divides into
- iterate through evenly_divide_into_total_value and select the value that multiplying by int1 == total_digit_square_value. convert into a single integer and return that value
- initialize valid_value_array to the result of this
- if valid_value_array is empty then return -1 else get the integer version of valid_value_array and return that value

C: Code with intent



=end

def dig_pow(int1, int2)
   digit_array = int1.to_s.chars.map {|sdig| sdig.to_i }
   total_digit_square_value = digit_array.map.with_index {|num, i| num**(int2 + i) }.reduce(:+)
   evenly_divide_into_total_value = (1..100000).select {|num|  total_digit_square_value % num == 0 }
   valid_value_array =  evenly_divide_into_total_value.select {|num|  num if int1 * num == total_digit_square_value }
   valid_value_array.empty? || total_digit_square_value < int1 ? -1 : valid_value_array.reduce(:+)
end

 dig_pow(89, 1)  == 1
 dig_pow(92, 1) == -1
 dig_pow(46288, 3) == 51
 dig_pow(695, 2) == 2
 dig_pow(46288, 5) == -1
 dig_pow(10382, 6)











=begin
 50. Equal Sides Of An Array
 (https://www.codewars.com/kata/5679aa472b8f57fb8c000047/train/ruby)
 Equal sides of an array
 6 kyu
 You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal
to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

 For example:

 Let's say you are given the array {1,2,3,4,3,2,1}: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

 Let's look at another one.
 You are given the array {1,100,50,-51,1,1}: Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

 Last one:
 You are given the array {20,10,-80,10,10,15,35}
 At index 0 the left side is {}
 The right side is {10,-80,10,10,15,35}
 They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
 Index 0 is the place where the left side and right side are equal.

 Note: Please remember that in most programming/scripting languages the index of an array starts at 0.

 Input:
 An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.

 Output:
 The lowest index N where the side to the left of N is equal to the side to the right of N. If you do not find an index that fits these rules, then you will return -1.

 Note:
 If you are given an array with multiple answers, return the lowest correct index.


P. Understand the Problem
  Explicit Requirements:
  - input is an array
  - output is an integer
  - goal is to find if there is an index which has a sum of numbers to the left of the value that is equal to the sum of numbers to the right of the value
  - return that number if so and return -1 if no index fits this requirement
  - if there is more than one return the smallest correct index

  Implicit Requirements:
  - return 0 if one side has none to the closest side of it and the remaining numbers to the opposite side  total to 0

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  p find_even_index([1,2,3,4,3,2,1]) == 3
  p find_even_index([1,2,3,4,5,6]) == -1
  p find_even_index([20,10,30,10,10,15,35]) == 3
  p find_even_index([20,10,-80,10,10,15,35]) == 0
  p find_even_index([10,-80,10,10,15,35,20]) == 6
  p find_even_index(Array(1..100)) == -1
  p find_even_index([0,0,0,0,0]) == 0
  p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
  p find_even_index(Array(-100..-1)) == -1
  p find_even_index([1,100,50,-51,1,1]) == 1

D: Data Structures
  - input: array
  - output: integer
  - possible intermediary structure: array


A: Algorithm
- initialize left_of_index
- initialize right_of_index
- iterate through the input array and get each num and each index
- append to left_of_index each value to the left of the current_index
- append to right_of_index each value to the right of the current_index
- remove any empty arrays from both arrays
- iterate through both right_of_index with param r_ind and iterate through left_of_index l_ind
- return 0 if right_of_index[0] and left_of_index[0] are equal
- return r_ind if left_of_ind -1 is == to right_of_ind + 1
- return -1 if there are no cases of the previous requirement
C: Code with intent

=end

def find_even_index(arr)
  (0...arr.length).each do |i|
      left_sum = arr[0...i].reduce(0, :+)
      right_sum = arr[i+1..-1].reduce(0, :+)
    return i if left_sum == right_sum
  end
  -1
end


    find_even_index([1,2,3,4,3,2,1]) #== 3
    #find_even_index([1,2,3,4,5,6]) #== -1
    #find_even_index([20,10,30,10,10,15,35]) #== 3
    #find_even_index([20,10,-80,10,10,15,35]) == 0
   # find_even_index([10,-80,10,10,15,35,20]) == 6
    #find_even_index(Array(1..100)) #== -1
    #find_even_index([0,0,0,0,0]) #== 0
    #find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
    #find_even_index(Array(-100..-1)) == -1
    #find_even_index([1,100,50,-51,1,1]) == 1



=begin
    51. Decipher this!
    https://www.codewars.com/kata/581e014b55f2c52bb00000f8
    Decipher this!
    6 kyu
    You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

    For each word:

    the second and the last letter is switched (e.g. Hello becomes Holle)
    the first letter is replaced by its character code (e.g. H becomes 72)
    Note: there are no special characters used, only letters and spaces

    Examples

    decipherThis('72olle 103doo 100ya'); // 'Hello good day'
    decipherThis('82yade 115te 103o'); // 'Ready set go'


    P. Understand the Problem
  Explicit Requirements:
  - input is string
  - output is string
  - goal is to decipher the input string into the intended sentence
  - here are keys to deciphering the input
  - the second and last letter should be switched for each word
  - the first character in each word  is in it's askii format and should be converted back
  - there are no special characters used. only letters and spaces

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: output
  - possible intermediary structure: array to convert each string digit and to switch the second and last letter


A: Algorithm
- iterate through an array which is split apart by all alpha characters so that all string digit characters are in place
- iterate through this word and convert each string digit to an integer and then to each alpha character alternative
- initialize converted_letters to this result
- for each index place from converted_letters will be the index of word that we will replace the input str with
- initialize only_letters to the result of selecting only the values from the input str that match an alpha character
- iterate through only_letters and get each char and index. Insert to only_letters the character from converted_letters at the index of the iteration to index 0
- initialize this result to scrambled_letters
- iterate through scrambled_letters and set the placement of each word at index 1 and index -1 to be swapped as long as there are more than two letters
- join the resulting array and return that string
C: Code with intent


=end
  def decipher_this(str)
    converted_letters = str.split.map {|word| word.scan(/[^a-z]/).join.to_i.chr}
    only_letters = str.split.map {|word|  word.scan(/[a-z]/).join}
   p scrambled_letters = only_letters.map.with_index {|char, i|  only_letters[i].insert(0, converted_letters[i])}
    scrambled_letters.map do |word|
      word.size < 2 ? word : (word[1], word[-1] = word[-1], word[1])
      word
    end.join(' ')
  end


     decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
     #decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
     #decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
     #decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
     #decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"





=begin
     52. Bouncing Balls
(https://www.codewars.com/kata/5544c7a5cb454edb3c000047)
6 kyu
A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, is known.

He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).

His mother looks out of a window 1.5 meters from the ground.

How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?

Three conditions must be met for a valid experiment:
Float parameter "h" in meters must be greater than 0
Float parameter "bounce" must be greater than 0 and less than 1
Float parameter "window" must be less than h.
If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

Note:
The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

Example:
- h = 3, bounce = 0.66, window = 1.5, result is 3

- h = 3, bounce = 1, window = 1.5, result is -1
(Condition 2) not fulfilled).


P. Understand the Problem
  Explicit Requirements:
  - input is 3 integers
  - output is integer
  - the first integer represents the height from which the ball is dropped from
  - the second integer represents the percentage of the original height that the ball will back up to
  - the final integer represents the height of the window that the mother is looking out from
  - if the height of the ball being dropped is less than 0, the bounceback height is 1 or greater, or if the height of the mother's window is greater than the height of where
    the ball is dropped then return -1

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: 3 integer
  - output: integer
  - possible intermediary structure:


A: Algorithm

- to get our returned integer value we will have to see how many times the ball drops pass the mother and bounces back
- if the ball is dropped from 3 meters has a bounce of .66 of the drop and the mother is watching from 1.5 m
- add 1 when the ball passes by the mother
- .66 of 3 is 1.9 so the ball bounces above the mother so she sees it once more
- the ball drops back down so that is 3
- now .66 of 1.9 is 1.3 so it does not reach back up the mother's window so the total remains 3

- in short add two when multiplying the drop height by the bounce height is still more than the mother's window height
- continue adding two until you reach the point where the result is less than the mother's window height.
- at that point add one and finish the total

- initialize times_ball_seen to 0
- if ball_height < mother_window || < 0 then return -1
- if ball_bounce >= 1 or less than 0 return -1
- if the ball only drops and never backs up to window then return 1
- until the result of ball_height * ball_bounce is < mother_window
  increment time_ball_seen by one to represent the ball dropping the first time
 - multiply ball_height by ball_bounce
 - set ball_height to this new result
 - is ball_height > mother_window ? if so
 - increment times_ball_seen by 1
 if not return times_ball_seen
C: Code with intent



=end
def bouncingBall(ball_height, ball_bounce, mother_window)
  times_ball_seen = 1
  return -1 if ball_height < 0 || ball_height <= mother_window || (ball_bounce >= 1 || ball_bounce < 0)
return 1 if ball_height * ball_bounce <= mother_window
  until ball_height * ball_bounce < mother_window
    times_ball_seen  += 1
      ball_height = ball_height * ball_bounce
      times_ball_seen += 1
  end
   times_ball_seen
end

bouncingBall(3, 0.66, 1.5) == 3
bouncingBall(30, 0.75, 1.5) #== 21
bouncingBall(30, 0.4, 10) #== 3
bouncingBall(40, 1, 10) == -1
bouncingBall(-5, 0.66, 1.5) == -1
bouncingBall(30, 0.66, 1.5) #== 15
bouncingBall(1, 0.66, 0.66) #== 1
bouncingBall(1, 0.66, 1) == -1






=begin
 53. WeIrD StRiNg CaSe
(https://www.codewars.com/kata/52b757663a95b11b3d00062d)
6 kyu

    Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased and you need to start over for each word.

    The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').


    weirdcase( "String" )#=> returns "StRiNg"
    weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"

    P. Understand the Problem
      Explicit Requirements:
      - input is  string
      - output is string
      - goal is to take the input str and then convert each character from the input str based on it's index position
      - if the index position is even then the character should be uppercased.
      - if the index position is odd then the character should be lowercase.
      - input will only consist of alpha characters and spaces

      Implicit Requirements:
      - leave spaces as be

      Clarifications/ Questions:
      -

    E: Examples/ Edge Cases


    D: Data Structures
      - input: string
      - output: string
      - possible intermediary structure: array


    A: Algorithm
    - initialize word_array to the result of splitting the input str into an array of words
    - iterate through word_array and iterate through each word and get their char and i
    - if i is even then uppercase the letter. and if i is odd then lowercase the letter
    - join the new array to string and return
    C: Code with intent

=end





    def weirdcase(str)
       word_array = str.split
       word_array.map {|word| word.chars.map.with_index do |char, i|
        i.even? ? char.upcase : char.downcase
       end.join
      }.join(' ')
    end

     weirdcase('This') == 'ThIs'
     weirdcase('is') == 'Is'
     weirdcase('This is a test') == 'ThIs Is A TeSt'








=begin
54. Are they the "same"?
(https://www.codewars.com/kata/550498447451fbbd7600041c)
6 kyu
Given two arrays a and b write a function comp(a, b) that checks whether the two arrays have the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

Examples
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
Invalid arrays
If we change the first number to something else, comp may not return true anymore:

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.

Remarks
a or b might be [] (all languages except R, Shell).
a or b might be nil or null or None or nothing (except in Haskell, Elixir, C++, Rust, R, Shell, PureScript).
If a or b are nil (or null or None), the problem doesn't make sense so return false.

Note for C
The two arrays have the same size (> 0) given as parameter in function comp.
P. Understand the Problem
  Explicit Requirements:
  - input is two arrays that contains either integrs, nil, or are empty
  - the output is a boolean
  - goal is to check if every number in array2 is the squared value of at least one number from arrray1.
  - if every number from array1 can be squared into one number from array2 we will return true
  - otherwise return false

  Implicit Requirements:
  - if nil is contained in either array return false
  - if either array is empty then return false

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false
p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true


D: Data Structures
  - input: two arrays
  - output: integer
  - possible intermediary structure: an array to sort both input arrays


A: Algorithm
- return false if arr1 or arr2 is nil or if either have an empty arr
- return false if arr1 and arr2 are not of the same size. .
- initialize sorted_arr_one and to the result of sorting each value by it's integer value
- initialize sorted_arr_two to the result of sorting each value by it's integer value
- initialize merged_arr to merging onto sorted_arr_one sorted_arr2
- acccount for uniq values
- now check if all subarrays pass this condition
  - that arr[0] squared is == arr[1]
- return true if they all do and false otherwise

C: Code with intent


=end

def comp(arr1, arr2)
  return false if  (arr1 == nil || arr2 == nil)  || (arr1.empty? || arr2.empty?)
  return false if arr1.size != arr2.size
   sorted_arr_one =  arr1.sort {|a, b| a <=> b}
   sorted_arr_two = arr2.sort {|a, b| a <=> b}
   merged_arr = sorted_arr_one.zip(sorted_arr_two)
   merged_arr.all? {|arr|   arr[0]**2 == arr[1]}
end

comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
comp(nil, [1, 2, 3]) == false
comp([1, 2], []) == false
comp([1, 2], [1, 4, 4]) == false
comp([4, 4], [1, 31])
comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true




=begin
55. Grouping and Counting
(https://www.codewars.com/kata/53a452dd0064085711001205)
6 kyu
Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a hash. Empty or nil input must return nil
 instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:

Array#count
Array#length



P. Understand the Problem
  Explicit Requirements:
  - goal is to take our input array and return a hash with each key as the unique characters in the input array and the value as the count of each unique key
  - if there is an empty input array of if it is nil return nil

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array or nil
  - output: hash
  - possible intermediary structure: array to increase each hash value


A: Algorithm
initialize input_array_hash with each unique char as a key and each value set to 0
set hash to the result of input_array_hash
- return nil if the input is nil or the input array is empty
- iterate through the input array and get each character and set to k
- if there is in instance of k in the hash increment the value by 1
  - return the hash
C: Code with intent



=end

def input_array_hash(arr)
hash = {}
arr.map {|char| hash[char] = 0  }
hash
end

def group_and_count(arr)
  return nil if arr == nil || arr.empty?
  hash = input_array_hash(arr)
  arr.each {|char| hash[char] += 1 }
  hash
end


 group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
 group_and_count([]) == nil
 group_and_count(nil) == nil
 group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}



=begin


56. Find the Nexus of the Codewars Universe
(https://www.codewars.com/kata/5453dce502949307cf000bff)
6 kyu
Not to brag, but I recently became the nexus of the Codewars universe! My honor and my rank were the same number. I cried a little.

Complete the method that takes a hash/object/directory/association list of users, and find the nexus: the user whose rank is the closest is equal to his honor.
Return the rank of this user. For each user, the key is the rank and the value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who come closest, return the one with the
 lowest rank (numeric value). The hash will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

Example
         rank    honor
users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,    <--- nexus
          23  =>  11,
          30  =>   2 }

P. Understand the Problem
  Explicit Requirements:
  - goal is to return the key that fulfills these conditions, AKA the nexus
  - has the smallest difference in it's integer value with the value of the hash. This is the user that has the tank closest to equal his honor.
  - if there are more than one that share this smallest value then choose the key which has the smallest integer value


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: hash
  - output: integer that represents the smallest key that has the closest difference (or no difference) from it's value
  - possible intermediary structure:


A: Algorithm
-
- convert the hash into arrays and initialize as array_pairs
- iterate through array_pairs and subtract together the total for each subarray. Make sure to get the positive difference
- initialize this as pair_difference
- iterate through pair difference and get each num and their index
- get the index if the num is equal to the smallest value of pair_difference
- get rid of any nil values
 - initialize as smallest_difference_indexes
- iterate through smallest_difference_indexes and get each index
- get the value of each integer from array_pairs which is the result of accessing array_pairs at each index from smallest_difference_indexes
- return the smallest key from which is the smallest integer among the remaining pairs.

C: Code with intent



=end

def nexus(hash)
array_pairs = hash.to_a
pair_difference =  array_pairs.map {|arr| arr.reduce(:-).abs}
smallest_difference_indexes =  pair_difference.map.with_index {|num, i| i if num == pair_difference.min}.compact
smallest_difference_indexes.map {|num| array_pairs[num]}.min.first
end


 nexus({1 => 3, 3 => 3, 5 => 1}) == 3
 nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
 nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2
 nexus({30=>5, 25=>10, 20=>15, 15=>20, 10=>25, 5=>30})


=begin
57. Count letters in string
(https://www.codewars.com/kata/5808ff71c7cfa1c6aa00006d)
6 kyu
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'.
The key must be 'symbol' instead of string in Ruby

P. Understand the Problem
  Explicit Requirements:
  - we have string as an input and our goal is to create  a hash which has the symbol version of each unique character of our input str. And has the count of each string key
  as a value
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: string
  - output: hash
  - possible intermediary structure: hash


A: Algorithm
- initialize  count_hash  which will take each string char as a symbol. And set each value to 0
- iterate through an array which contains each character. for every instance of the character converted to a symbol to match the char increment the value by 1
- sort the hash and convert the array back into a hash and then return it.
C: Code with intent



=end

def count_hash(str)
  hash = {}
  str.chars.each {|char| hash[char.to_sym] = 0 }
  hash
end

def letter_count(str)
  hash = count_hash(str)
  str.chars.each {|char|hash[char.to_sym] += 1}
  hash.sort {|a, b| a <=> b }.to_h
end

 letter_count('arithmetics') ==  {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}


=begin
58. Triple trouble
(https://www.codewars.com/kata/55d5434f269c0c3f1b000058)
6 kyu
Write a function

triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

P. Understand the Problem
  Explicit Requirements:
  - we must check both int1 and int2 to see if int1 has an example of a straight triple. And that int2 has at least one straight double
  - if both have one of these cases return 1
  - if only one does or neither do return 0

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: two string
  - output: an integer
  - possible intermediary structure: array to get all substring of a size of 3


A: Algorithm
- get all substring that are of the size of 3 and sixe of two
- initialize both substring_one and substring_two
- substring_one should be the result of integers converted to string that are substrings the size of three
- substring_two should be the result of integers converted to string that are substrings the size of two
- select from substring_one any consecutive digits of three and then the first index
- select from substring_two any consecutive digits of two and then select only the digits that each char from substring_one starts with
- we will return 0 when either of these two conditions are true
    - subtring_one or substring_two is nil
    - the first index of substring_one is not equal to the first index of substring_two
- otherwise return 1





=end


def substring_size_three(str)
 array = []
 (0...str.size).each do |elem|
  (elem..str.size).each do |inner_elem|
    array << str[elem..inner_elem]
  end
 end
 array.select {|substr| substr.size == 3 }

end



def substring_size_two(str)
  array = []
  (0...str.size).each do |elem|
   (elem..str.size).each do |inner_elem|
     array << str[elem..inner_elem]
   end
  end
  array.select {|substr| substr.size == 2 }

 end



def triple_double(int1, int2 )
  substring_one = substring_size_three(int1.to_s)
  substring_two = substring_size_two(int2.to_s)
  result_one =  substring_one.select {|str| str.chars.all?{|char|  char == str[0] }}.first
  result_two =  substring_two.select {|str| str.chars.all?{|char|  char == str[0] }}.select {|str|  str.start_with?(result_one[0].chars[0])  }.first
  (result_one == nil || result_two == nil) || (result_one.empty? || result_two.empty?) || (result_one[0] != result_two[0]) ? 0 : 1
end


   triple_double(12345, 12345) == 0
   triple_double(666789, 12345667) == 1
   triple_double(1112, 122) == 0


=begin

59. Which are in?
(https://www.codewars.com/kata/550554fd08b86f84fe000a58)
6 kyu
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

#Example 1: a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

#Example 2: a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []

Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.

In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.

Beware: r must be without duplicates.
Don't mutate the inputs.


P. Understand the foblem
  Explicit Requirements:
  - we have two arrays. We are to check all substring of a2 to see if any words from a1 are included.
  - if they are included we are to add those words to a new array as our input is to remain unmodified
  - the return array should have no duplicates
  - if there are no substrings that are included from a1 then return an empty array

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: array
  - possible intermediary structure:


A: Algorithm
- get all substring
-  initialize a2_substring to the result of getting all substring from a2
- iterate through a1 and get all words
- select each word that appears in a2_substring
- return the new resulting array sorted in lexiographical order

C: Code with intent



=end

def substring(str)
  array = []
  (0...str.size).each do |elem|
    (elem..str.size).each do |inner_elem|
      array << str[elem..inner_elem]
    end
  end
  array
end

def in_array(a1, a2)
   a_2_substring = substring(a2.join(' '))
   a1.select {|word| a_2_substring.include?(word)}.sort
end

in_array(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"] ) ==  ["arp", "live", "strong"]



=begin

60. Format a string of names like 'Bart, Lisa & Maggie'.
(https://www.codewars.com/kata/53368a47e38700bd8300030d2)
6 kyu
Given: an array containing hashes of names

Return: a string formatted as a list of names separated by commas except for the last two names, which should be separated by an ampersand.

Example:

list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'

list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'

list([ {name: 'Bart'} ])
# returns 'Bart'



P. Understand the Problem
  Explicit Requirements:
  - we have an array which contains 3 separate hashes. Each hash has the symbol name: as a key and a specic string as a value
  - the goal is to join all of the values of each hash together. If there is more than one hash pairing there should be a '&' between the 2nd to last and last word.
  - if there is only one word then just return that one hash value

  Implicit Requirements:
  - if the array is empty then return empty string

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array containing 3 separate hashes
  - output: string
  - possible intermediary structure: array


A: Algorithm
- return '' if the input arr is empty
- initialize when_greater_than_two to an empty array
- let us first iterate through the entire array and get each hash
- access the :name key at each iteration and return the string values
- initialize this result as  each_name
-  if the size of each_name is 1
     - join the str and return the str
- if the size of each_name is 2
   - add the '&' string between the 2nd to last and last index and join together by words
- else
  - iterate through each_name and get each word and index. if added_ampersand at the index of -1, -2, and -3 are not equal to word then leave those words as be
    - else add ',' to each word
  - append to greater_than_two these results
-end
return greater_than_two if each_name.size > 2

- if the size of th
C: Code with intent
=end

def list(arr)
  return '' if arr.empty?
  greater_than_two = []
  each_name = arr.map {|hash, i|  hash[:name]}
 if each_name.size == 1
    each_name.join(" ")
 elsif each_name.size == 2
   each_name.insert(-2, '&').join(" ")
 else
   added_ampersand = each_name.insert(-2, '&')
   added_ampersand.map.with_index  do |word, i|
  added_ampersand[-1] !=  word && added_ampersand[-2]  != word  && added_ampersand[-3] != word ? word + ',' :  word
   end.join(' ')
 end
end

 p list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ]) ==  'Bart, Lisa & Maggie'
 p list([ {name: 'Bart'}, {name: 'Lisa'} ]) == 'Bart & Lisa'
 p  list([]) == ''










=begin

61. Find the missing letter
(https://www.codewars.com/kata/5839edaa6754d6fec10000a2)
6 kyu
#Find the missing letter

Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
The array will always contain letters in only one case.

  P. Understand the Problem
  Explicit Requirements:
  - input is an array
  - output is a string
  - goal is to return the missing str that is removed from the input str which is in alphabetical order

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array
  - output: integer
  - possible intermediary structure: array


A: Algorithm
- initialize  total_size which will be a range of all letters starting from the first index of arr and ending with the final index of arr
- initialize total_size_ord which will take each element from total_size and convert it into an integer value. then add all values together
- initialize input_ord which will take each element from the input arr and convert into integer. Then add all values together
- initialize missing_value to the result of subtracting input_ord from total_size_ord
- convert that integer back into it's specific string placement based on the ASKI chart

C: Code with intent




=end

def find_missing_letter(arr)
  total_size = (arr[0]..arr[-1]).to_a
  total_size_ord = total_size.map {|char| char.ord }.reduce(:+)
  input_ord = arr.map {|char| char.ord }.reduce(:+)
  missing_value = (total_size_ord - input_ord).chr

end

 find_missing_letter(["a","b","c","d","f"]) ==  "e"
 find_missing_letter(["O","Q","R","S"]) == "P"
 find_missing_letter(["b","d"]) ==  "c"
 find_missing_letter(["a","b","d"])  == "c"
 find_missing_letter(["b","d","e"])  =="c"
require 'prime'

p 4.prime?



# def pairs(arr)
#   pairs = []
#   counter = arr.size - 1

#   (0..((arr.size - 1) / 2)).each do |i|
#     pairs << [arr[i], arr[counter]]
#     counter -= 1
#   end

#   pairs
# end

def sum_pairs(arr, sum)
  pairs = []

  (0...arr.size).each do |i|
    (i+1...arr.size).each do |ii|
      if arr[i] + arr[ii] == sum
        pairs << [arr[i], arr[ii], ii]
      end
    end
  end

  return nil if pairs.empty?
  pairs.sort_by! { |subarr| subarr[-1] }
  pairs[0].pop
  pairs[0]
end


p sum_pairs([1, 2, 4, 5, 2, 6],  25)
