"use strict"
let rlSync = require('readline-sync');

function log(input)  {
  return console.log(input);
}
/*

1. Double Char Part 1

Write a function that takes a string, doubles every character in the string, and returns the result as a new string.

P:
input is a string
output is a string with each value having a duplicate value following it

a:
initialize and declare dupStr
to add the duplicate value we will need access to each individual character
iterate through a loop starting at 0 until greater than the length of the input str
get the str at the current index and add it to the current str once more. add the two values to dupStr
finish the iteration and return dupStr

Examples:
*/
function repeater(str){
let dupStr = ''
for(let i = 0; i < str.length; i++) {
  dupStr += (str[i] + str[i])
}
return dupStr
}

repeater('Hello');        // "HHeelllloo"
repeater('Good job!');    // "GGoooodd  jjoobb!!"
repeater('');             // ""



/*
2. Double Char Part 2

Write a function that takes a string, doubles every consonant character in the string, and returns the result as a new string.
 The function should not double vowels ('a','e','i','o','u'), digits, punctuation, or whitespace.

 P:  input is string
 output is string that is the result of adding a duplicate of every consonant value.
 all non consonant values are left alone.

 A;
initialize and declare resultStr to an empty str
iterate through a loop setting the index to 0 until it is greater than the length of the input str.
we will compare all consonant values to the current char. if it matches
add two of those together and add to resultStr.
otherwise add one value to resultStr.
return resultStr

Examples:
*/

let doubleConsonants = function(str) {
  let resultStr = ''
  for (let i = 0; i < str.length; i++) {
    if (str[i].match(/[bcdfghjklmnpqrstvwxyz]/i)) {
      resultStr += (str[i] + str[i])
    } else {
      resultStr += str[i]
    }
  }
  log(resultStr)
}
doubleConsonants('String');          // "SSttrrinngg"
doubleConsonants('Hello-World!');    // "HHellllo-WWorrlldd!"
doubleConsonants('July 4th');        // "JJullyy 4tthh"
doubleConsonants('');                // ""


/*

3. Reverse Number

Write a function that takes a positive integer as an argument and returns that number with its digits reversed.

P:
input is a number.
output is a number that is the result of reversing the digits of the numbers.
keep in mind when there are trailing zeros, when it is flipped those zeros will get dropped

A:
initialize and declare strArr to the result of converting the input into a string and then splitting into an array of digits.
initiailize reverseStr to the result of reversing strArr and joining back together into string.
return the result of converting reverseStr into a number (this will also drop any uneccessary zeros)


Examples:
*/
let reverseNumber = function(num) {
  let strArr = String(num).split('')
  let reverseStr = strArr.reverse().join('')
  return Number(reverseStr)

}
reverseNumber(12345);    // 54321
reverseNumber(12213);    // 31221
reverseNumber(456);      // 654
reverseNumber(12000);    // 21 -- Note that zeros get dropped!
reverseNumber(1);        // 1





/* 4. Get the Middle Character

Write a function that takes a non-empty string argument and returns the middle character(s) of the string. If the string has an odd length,
 you should return exactly one character. If the string has an even length, you should return exactly two characters.

 P:
 input is a string
 output is a string that represents the middle character (or characters)
 when the string is odd length then 1 character will be returned.
 when ther string is even then two characters shall be returned.
When it is an even sized string the two characters selected will be the index of the length/2 and the previous index

a;
initialize and declare halfPoint to the length of the str /2 (round to floor to get integer value)

iterate through a loop from 0 until the index is greater than the length of the str
if the str length is even
return the value at the index of the halfpoint
otherwise
return the sum of the value at halfPoint - 1 and halfPoint

Examples:
*/
function centerOf(str) {
  let halfPoint = Math.floor(str.length / 2);

  if (str.length % 2 !== 0) {
    // If the string length is odd, return the single middle character
    return str[halfPoint];
  } else {
    // If the string length is even, return the two middle characters
    return str[halfPoint - 1] + str[halfPoint];
  }
}
centerOf('I Love JavaScript'); // "a"
centerOf('Launch School');     // " "
centerOf('Launch');            // "un"
centerOf('Launchschool');      // "hs"
centerOf('x');                 // "x"




/*
5. Always Return Negative

Write a function that takes a number as an argument. If the argument is a positive number, return the negative of that number.
 If the argument is a negative number, return it as-is.

P:
input is a number
output is a number which reprsents the input being switched from it's positive version to negative (and if negative leave alone)

DS: for when the input is positive or 0 we can convert to string and prepend a - symbol before converting back

A:
if the input is < 0 then return the input
initialize negativeStr to the result of adding the string '-' to the input converted to a string
return negativeStr converted back into a number.

Examples:
*/
let negative = function(num) {
  if (num < 0) {
    return num
  }
  let negativeStr = '-' + String(num)
  return Number(negativeStr)
}

negative(5);     // -5
negative(-3);    // -3
negative(0);     // -0





/*

6. Counting Up

Write a function that takes an integer argument and returns an array containing all integers between 1 and the argument (inclusive), in ascending order.

You may assume that the argument will always be a positive integer.

P:
input is a number
output is an array that represents all values starting from 1 upto and including the input number.
here all cases will be positive.
Examples:

A:
initiailize stairsArr to an empty arr
initialize currentStair to num
iterate through a loop while currentStair is > 0
append the currentStair value to stairArr
return stairsArr
*/

function sequence(num) {
  let stairsArr = [];
  let currentStair = num
  while (currentStair > 0) {
    stairsArr.unshift(currentStair)
    currentStair -= 1
  }
  return stairsArr

}
sequence(5);    // [1, 2, 3, 4, 5]
sequence(3);    // [1, 2, 3]
sequence(1);    // [1]


/*
7. Name Swapping

Write a function that takes a string argument consisting of a first name, a space, and a last name, and returns a new string consisting of the last name,
 a comma, a space, and the first name.
 P:
 we are given an input that takes a string (this represents a first and last name).
 we output a string that is the result of the input having the names swapped and a comma added after the first name.

 A:
 initialize and declare reverseName to the result of converting the string into an array split by spaces and reversing the values
 return the first value of array, followed by a comma, a space and the last value of the array

Examples:

*/

let swapName = function(str) {
  let reverseName = str.split(' ').reverse()
  log(reverseName.join(', '))

}

swapName('Joe Roberts');    // "Roberts, Joe"



/*
S8. equence Count

Create a function that takes two integers as arguments. The first argument is a count, and the second is the starting number of a sequence that your function will create.
 The function should return an array containing the same number of elements as the count argument. The value of each element should be a multiple of the starting number.

You may assume that the count argument will always be an integer greater than or equal to 0. The starting number can be any integer.
If the count is 0, the function should return an empty array.

P:
input is 2 integers. the first input being a count, and the second is the starting number of a sequence of it's multiples (in sequential order)
output is an array. This represents our second input, the starting sequence. and the array values is our sequence (up to the count or the first input )
here the count will always be >= 0
when the count is 0 return an empty arra
the starting number can be any number

A:
initialize sequnceArr to an empty arr.
iterate through a loop setting the index to 0. loop until greater than the counter
to properly have the right amount of elements added to our sequenceArr we will use the current index value + 1 to multiply  times the sequence argument.
append each result to sequenceArr
return sequenceArr

Examples:
*/

function sequence(counter, sequence) {
 let  sequenceArr = []
 for (let i = 0; i < counter; i++) {
  sequenceArr.push((i + 1) * sequence)
 }
return sequenceArr

}

sequence(5, 1);          // [1, 2, 3, 4, 5]
sequence(4, -7);         // [-7, -14, -21, -28]
sequence(3, 0);          // [0, 0, 0]
sequence(0, 1000000);    // []


/*
9. Reverse It Part 1

Write a function that takes a string argument and returns a new string containing the words from the string argument in reverse order.

P:
input is a string
output is a string that represents the input string in reverse

A:
initialize reversedArr to the result of splitting the string by spaces into an array and reversing the array
return the result of joining reversedArr

*/

let reverseSentence = function(str) {
  let reversedArr = str.split(' ').reverse()
  return reversedArr.join(' ')

}
reverseSentence('');                       // ""
reverseSentence('Hello World');            // "World Hello"
reverseSentence('Reverse these words');    // "words these Reverse"



/*
10. .Reverse It Part 2

Write a function that takes a string argument containing one or more words and returns a new string containing the words from the string argument.
 All five-or-more letter words should have their letters in reverse order. The string argument will consist of only letters and spaces.
  Words will be separated by a single space.

  P:
  input is a string representing a sequence of words/sentences
  output is string that is the result of having all five or more lettered words being reversed. All other values are the same.
  all string will be letters and spaces
  words only separated by a single space

  A:
  initialize specificReversedWords to an empty str
  initialize wordArr to the result of splitting the values up by spaces into an array
  iterate through the array and get each word
  if the word is >= 5 in length then split into an array of letters. reverse the letters, join back together and append to specificReversedWords.
  otherwise just append to specificReversedWords
  return the result of splitting specificReversedWords into strings separated by spaces.

Examples:
*/

let reverseWords = function(str) {
  let specificReversedWords = [];
  let wordArr = str.split(' ')
  wordArr.forEach(function(word) {
    if (word.length >= 5) {
      specificReversedWords.push(word.split('').reverse().join(''))

    } else
    specificReversedWords.push(word)
  })

return specificReversedWords.join(' ')
}
reverseWords('Professional');             // "lanoisseforP"
reverseWords('Walk around the block');    // "Walk dnuora the kcolb"
reverseWords('Launch School');            // "hcnuaL loohcS"

