# What is PEDAC?
=begin

The PEDAC process is one approach to solving programming problems. Its primary goal is to help you identify and avoid pitfalls
that you may encounter when you don't code with intent.

P - [Understand the] Problem

E - Examples / Test cases

D - Data Structure

A - Algorithm

C - Code

=end

#  P - [Understand the] Problem


#Understanding the problem has three steps.

# 1. Read the problem description.
# 2. Check the test cases, if any.
# 3. If any part of the problem is unclear, ask the interviewer or problem requester to clarify the matter.
# 4. Let's walk through this process for the problem given below:

# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"


=begin
After reading this problem, some items may need clarification:

1.  What is a palindrome? You might ask the interviewer to tell you what a palindrome is, and the interviewer would tell you
    that it is a word that reads the same forwards and backward.

2.  Should the words in the string remain the same if they already use uppercase? Here, you can check the test cases.
    In the fourth test case, the word LOVE already uses uppercase, and it remains uppercase in the solution.

3.  How should I deal with empty strings provided as input? The test cases frequently answer this question.
    In this case, test case number 3 provides the answer. This is an implicit requirement that we can infer from the test cases.

4.  Can I assume that all inputs are strings? Test cases don't show any non-string inputs,
    so you should ask whether the inputs can contain non-string values, and what you should do with them. In this problem, we won't worry about non-string values.

5.  Should I consider letter case when deciding whether a word is a palindrome? Again, test cases don't show any appropriate examples.
    The interviewer might tell you that the palindrome words should be case sensitive: 'mom' is a palindrome, 'Mom' is not.

6.  Do I need to return the same string object or an entirely new string? This question is one of the most important and most overlooked that you can ask.
    Typically, while solving problems, students make certain assumptions. One assumption might be that they need to return the same string object.
    Students often start solving the problem without checking whether the assumption is correct.
    For this reason, the student might end up losing 10-15 minutes struggling with the wrong problem. In this problem, you should return an entirely new string.

7.  Always verify your assumptions either by looking at the test cases or by asking the interviewer.
    Some assumptions, like whether we should treat strings as case-sensitive or not,
    can be verified either by looking at the problem description, if that is mentioned there, or by checking the test cases.
    If you can't determine the answer with the test cases or problem description, you should ask the interviewer to clarify this for you.


=end


#To conclude this part of the PEDAC process, you need to write down what the inputs and outputs for the problem are.
#You should also describe the rules that you must follow.
#The rules should encapsulate all the explicit and implicit requirements in the problem.
#So, you should identify what the explicit requirements are, write them down, and then repeat the process for the implicit requirements:


# input: string
# output: string (not the same object)
# rules:
#      Explicit requirements:
#        - every palindrome in the string must be converted to
#          uppercase. (Reminder: a palindrome is a word that reads
#          the same forwards and backward).
#        - Palindromes are case sensitive ("Dad" is not a palindrome, but "dad" is.)

#      Implicit requirements:
#        - the returned string shouldn't be the same string object.
#        - if the string is an empty string, the result should be an empty
#          string

# Data Structure/Algorithm

# Let's consider another problem. Try to work through the "understand the problem" part of this problem on your own,
 # and write the input, output, and rules for it. We'll provide a solution below. Later, we'll tackle the data structure and algorithm.


 # PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# 1. What is a substring?
# 2. Do I need to return the same string or a new string?
# 3. Do I need to check if the input is valid string or not?
# 4. Should the outputted palindromes be in order of their inputted sequence?


# input: string
# output: string
# rules:
#     Explicit requirements:
#     1. given an input string you must return all of the substrings from which are palindromes. (palindromes are words that read the same normally and backwards)
#     2. All palindrome words are case sensitve (e.g. Mom will not be a palindrome like mom would)

#     Implicit requirements:
#     1. if the input is an empty string the output should return an empty array
#     2. if the input contains no palindromes the output should return an empty array.
#     3  The outputted array should list the palindromes in order of their inputted sequence
#     4. to return a palindrome the string must be at least 2 in length

# Algorithm:
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array


#This algorithm is a "high-level" algorithm and it resembles those that we often see students write during interviews.
#It looks complete, but let's think about it for a moment: what is the hardest part of this problem?
#Is it looping through an array and pushing substrings that are palindromes in the result array?
#Is it determining whether a substring is a palindrome? Is it something else entirely?

#Determining whether a word is a palindrome isn't that difficult for most students.
#Looping through the array and selecting all the palindromes is relatively easy as well.
#However, finding all the substrings for a given string can be challenging.
#The above algorithm doesn't tackle that issue. It lacks implementation details for the "hard" parts.

#When a student starts writing code based on this algorithm, he soon realizes that returning all the substrings won't be easy.
#Ideally, the student should return to the algorithm and try to come up with a way to find all the substrings from the input string.
#He might also create a new method named substrings that returns the array of substrings.
#In practice, though, the time limitations often lead him to take a hack & slash approach instead.
#That almost always leads to spending more time than necessary on the problem or, worse yet, not solving it at all.

#Let's now follow the correct approach. The student can use the "high-level" algorithm from above and first write the code for it. The code might look like this:

=begin

def palindrome_substrings(str)
  result = []
  substring_arr = substring(str)
  substring_arr.each do |substring|
  result << substring if is_palindrome?(substring)
  end
  result
end
 palindrome_substrings('hello')

 =end

=begin
Note that we are calling methods named substrings and is_palindrome?. We haven't defined those methods yet.
Instead of trying to write the code for those methods, let's return to our algorithm and determine how they need to work.
Let's see how that might look; we'll tackle the substrings method first.

To find a correct algorithm, you can simplify the problem by using a small, concrete example to determine what we need to do.
For instance, you can start with a short word like halo and write all its substrings that are at least 2 characters in length.
The resulting list is ['ha', 'hal', 'halo', 'al', 'alo', 'lo']. Do you see a pattern here? It's clear that some sort of complex looping is going on.

The first loop - the outermost loop - iterates over the starting index for the substrings. With halo as a starting string,
we need to iterate over the letters h, a, and l. (We don't need to iterate over o since there are no substrings of at least 2 characters that start with o.)

Within the first loop, we need to iterate over the substrings that start at the given starting index. It's easiest to start with the substring of length 2,
then the substring of length 3, and so on. The resulting loops look something like this:

=end


# for each starting index 0 through the next to last index position
  # for each substring length from 2 until there are no substrings of that length
    # extract the substring of the indicated length starting at the indicated index position
  # end of inner loop
# end of outer loop.

=begin
Beginning with the first letter of the string at index 0, 'h', we first find all of the substrings that begin with that letter:
   ['ha', 'hal', 'halo']. As you can see, we're showing the inner loop at work here:

First, we get a 2-letter substring that begins at index 0: 'ha'
Next, we get a 3-letter substring that begins at index 0: 'hal'
Finally, we get a 4-letter substring that begins at index 0: 'halo'
The loop, in this case, is one that starts with a length of 2 and ends with a length of 4.

Next, we need to find the substrings that start at index 1 (a). The loop, in this case, starts with a length of 2 and ends with a length of 3.

First, we get a 2-letter substring that begins at index 1: 'al'
Next, we get a 3-letter substring that begins at index 1: 'alo'

Finally, we get all of the substrings that begin at index 2. This time, the loop starts and ends with a length of 2, so there is only one iteration:
We get a 2-letter substring that begins at index 2: 'lo'
('goalies) => ('goalies', goalie', 'goali', 'goal', 'goa,', 'go' )
What would happen if the original string was, say, 7 characters in length, such as goalies? In that case, we'd still have to go through the same process
- an outer loop that iterates from index 0 (the letter g) to index 5 (the letter e),
and an inner loop that starts with a length of 2 and continues until there are no substrings of the desired length:

On the first iteration of the outer loop, the substring length used in the inner loop ranges from 2 to 7.
On the second iteration, the substring length ranges from 2 to 6.
On the third iteration, the substring length ranges from 2 to 5.
On the fourth iteration, the substring length ranges from 2 to 4.
On the fifth iteration, the substring length ranges from 2 to 3.
On the sixth, the substring length starts and ends at 2.
Looking at these two examples, we can determine that the outer loop iterates over indexes from 0 to the length of the next to the last index position
 (e.g., string.length - 2). We can also see that the inner loop ranges from 2 to the original string length minus the starting index
  (string.length - startingIndex). We can use both of these facts in our algorithm. Let's go ahead and write the complete algorithm for this method:

=end


# - create an empty array called `result` that will contain all required substrings
# - create a `starting_index` variable (value `0`) for the starting index of a substring
# - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#   - create a `num_chars` variable (value `2`) for the length of a substring
#   - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#     - extract a substring of length `num_chars` from `string` starting at `starting_index`
#     - append the extracted substring to the `result` array
#     - increment the `num_chars` variable by `1`
#   - end the inner loop
#   - increment the `starting_index` variable by `1`
# - end the outer loop
# - return the `result` array

#Since this pseudocode is relatively complex, you might decide to convert it to formal pseudocode as shown in the Pseudo-Code assignment.
#For instance, we might write the following formal pseudocode:

# START
#
#   /* Given a string named `string` */
#
#   SET result = []
#   SET starting_index = 0
#
#   WHILE starting_index <= length of string - 2
#     SET num_chars = 2
#     WHILE num_chars <= length of string - starting_index
#       SET substring = num_chars characters from string starting at index starting_index
#       append substring to result array
#       SET num_chars = num_chars + 1
#
#     SET starting_index = starting_index + 1
#
#   RETURN result
#
# END

=begin

def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2 )
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

 substrings('goalies')

=end


 # Now we go over the steps to create a palindrome method

 # Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.
=begin

def is_palindrome?(str)
  str == str.reverse
end
 is_palindrome?("aba")

=end

 # finally here is all of the informal pseudocode for all of the thought process for palindrome_substrings


 # input: a string
# output: an array of substrings
# rules: palindrome words should be case sensitive, meaning "abBA"
#        is not a palindrome

# Algorithm:
#  substrings method
#  =================
#    - create an empty array called `result` that will contain all required substrings
#    - create a `starting_index` variable (value `0`) for the starting index of a substring
#    - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#      - create a `num_chars` variable (value `2`) for the length of a substring
#      - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#        - extract a substring of length `num_chars` from `string` starting at `starting_index`
#        - append the extracted substring to the `result` array
#        - increment the `num_chars` variable by `1`
#      - end the inner loop
#      - increment the `starting_index` variable by `1`
#    - end the outer loop
#    - return the `result` array

#  is_palindrome? method
#  =====================
# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array



# here is the entire problem with our method and our two other method's to break down it down

def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)  # halo would be 3 <= 4 - 2
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end
p substrings("soccer")
def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");           # []
