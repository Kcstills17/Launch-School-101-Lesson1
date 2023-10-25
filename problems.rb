# Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.

# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

# If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.
# Examples

# "is2 Thi1s T4est 3a"  -->  "Thi1s is2 3a T4est"
# "4of Fo1r pe6ople g3ood th5e the2"  -->  "Fo1r the2 g3ood 4of th5e pe6ople"
# ""  -->  ""

P:
Explicit:
- we are given a string and our goal is to sort it.
- each word in the string contains a single number
- this number in the word is to be the way that we sort each word in the str
- numbers included are only 1-9
- if the string is empty return empty string.
- only consecutive numbers are included

Implicit:


Data Structures:
- input: string
- output: string
- possible structure to use: array

Algorithm:
- return input_str if it is empty
-



# order("is2 Thi1s T4est 3a") ==  "Thi1s is2 3a T4est"
#order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
# order("") == ""   # "Empty input should return empty string"
