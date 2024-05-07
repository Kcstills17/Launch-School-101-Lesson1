/*
Odd Numbers

Write a function that takes a positive integer as an argument, and logs all the odd numbers from 1 to the passed in number (inclusive).
 All numbers should be logged on separate lines.
Example

logOddNumbers(19);

// output on console
1
3
5
7
9
11
13
15
17
19
*/

num = 20

function oddNumbers(number) {
  for (i = 0; i <= num; i++) {
    i % 2 === 1 ? console.log(i) : num;
  }

}

//oddNumbers(num);


/*
Multiples of 3 and 5

Write a function that logs the integers from 1 to 100 (inclusive) that are multiples of either 3 or 5. If the number is divisible by both 3 and 5, append an "!" to the number.
Example

multiplesOfThreeAndFive();

// output on console
'3'
'5'
'6'
'9'
'10'
'12'
'15!'
// … remainder of output omitted for brevity
*/

function multiplesOfThreeAndFive(range) {
  for (i = 1; i <= range; i++) {
    if (i % 3 === 0 && i % 5 == 0) {
      console.log(`${i}!`)
    } else if (i % 3 == 0 || i % 5 == 0) {
      console.log(`${i}`)
    }

  }
}
//multiplesOfThreeAndFive(25);


/*

Print Multiples

Write a function logMultiples that takes one argument number. It should log all multiples of the argument between 0 and 100 (inclusive)
 that are also odd numbers. Log the values in descending order.

You may assume that number is an integer between 0 and 100.
Example

logMultiples(17);
// output (5x, 3x and 1x)
85
51
17

logMultiples(21);
// output (3x and 1x)
63
21
*/

function largestMultiple(num) {
  return (Math.floor(100 / num) * num);
}

let logMultiples = (range) => {
  largestNum = largestMultiple(range)
  for (let i = largestNum; i >= range; i--) {
    if (i % 2 === 1 && i % range === 0) {
      console.log(`${i}`)
    }
  }
}

logMultiples(4)


/*
FizzBuzz

Write a function that iterates over the integers from 1 to 100, inclusive. For multiples of three, log "Fizz" to the console.
 For multiples of five, log "Buzz". For numbers which are multiples of both three and five, log "FizzBuzz". For all other numbers, log the number.

Your output should look like this:

fizzbuzz();

// console output
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
// … rest of output omitted for brevity
*/

let fizzBuzz = function (range) {
  for (let i = 1; i <= range; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(i)
      console.log('FizzBuzz');
    } else if (i % 3 === 0) {
      console.log(i)
      console.log('Fizz');
    } else if (i % 5 === 0) {
      console.log(i)
      console.log('Buzz');
    }
  }
}

//fizzBuzz(30); // Example usage


/*
Prime Check

Write a function that takes a number argument, and returns true if the number is prime, or false if it is not.

You may assume that the input is always a non-negative integer.
Example

isPrime(1);   // false
isPrime(2);   // true
isPrime(3);   // true
isPrime(43);  // true
isPrime(55);  // false
isPrime(0);   // false
*/
function isPrime(number) {
  if (number <= 1) {
    return false;
  }

  for (let currentNumber = 2; currentNumber < number; currentNumber += 1) {
    if (number % currentNumber === 0) {
      return false;
    }
  }

  return true;
}


console.log(isPrime(11));

/*
XOR

For boolean values, the || operator returns true if either or both of its operands are true, false if both operands are false. The && operator, on the other hand, returns true if both of its operands are true, and false if either operand is false. This works great until you need only one of two conditions to be true, the so-called "exclusive or", or XOR.

Write a function named isXor that takes two arguments, and returns true if exactly one argument is truthy, false otherwise. Your function should work with the boolean values of true and false, but also any JavaScript values based on their "truthiness".

Revisit this lesson for a refresher on how JavaScript does logical operations of || and &&.
Example

isXor(false, true);     // true
isXor(true, false);     // true
isXor(false, false);    // false
isXor(true, true);      // false


isXor(false, 3);        // true
isXor('a', undefined);  // true
isXor(null, '');        // false
isXor('2', 23);         // false
*/

let isXor = function (a, b) {
 return !! (a && !b) || (!a && b)
}




console.log(isXor(false, 3));        // true


/*
Guessing the Password

Write a password guessing program that tracks how many times the user enters the wrong password. If the user enters the password wrong three times, log 'You have been denied access.' and terminate the program. If the password is correct, log 'You have successfully logged in.' and end the program.
Example

// password = 'password'

// The program displays a dialog that asks the user to enter a password.
// If the user enters the wrong password, keep asking up to three times. After
// three failures, log the access denied.

What is the password: 123
What is the password: opensesame
What is the password: letmein

// message on the console
You have been denied access.

// If the user enters the right password, report login success.
What is the password: password

// message on the console
You have successfully logged in.
*/

function prompt() {
  const RLSYNC = require('readline-sync');
  return RLSYNC.question('Please enter the password\n')
}


function guessPassword(password) {
  guessCount = 0
  for (attempts = 0; attempts < 3; attempts++) {
    password_attempt  = prompt();
    if (password_attempt === password) {
      console.log('You have succesfully logged in')
      return
    }
  }

  console.log('You have been denied access')
  return
}

//guessPassword('hello')


/*
Student Grade

Write a program to determine a student’s grade based on the average of three scores you get from the user. Use these rules to compute the grade:

    If the average score is greater than or equal to 90 then the grade is 'A'
    If the average score is greater than or equal to 70 and less than 90 then the grade is 'B'
    If the average score is greater than or equal to 50 and less than 70 then the grade is 'C'
    If the average score is less than 50 then the grade is 'F'

You may assume that all input values are valid positive integers.
Example

// prompts to get the 3 scores
Enter score 1: 90
Enter score 2: 50
Enter score 3: 78

// log to the console
Based on the average of your 3 scores your letter grade is "B".
*/

let studentGrade = (score1, score2, score3) => {
  let avgScore = Math.round((score1 + score2 + score3) / 3)
  console.log(avgScore);

  if (avgScore >= 90) {
    console.log('Based on the average of your 3 scores your letter grade is "A"')

  } else if (avgScore <= 89 && avgScore >= 70 ) {
    console.log('Based on the average of your 3 scores your letter grade is "B"')
  } else if (avgScore <= 69 && avgScore >= 50) {
    console.log('Based on the average of your 3 scores your letter grade is "C"')
  } else
  console.log('Based on the average of your 3 scores your letter grade is "F"')
}


studentGrade(89, 89, 90);


/*
Greatest Common Divisor

Create a function that computes the Greatest Common Divisor of two positive integers.
Example

gcd(12, 4);   // 4
gcd(15, 10);  // 5
gcd(9, 2);    // 1
*/
function greatestCommonDivisor(num1, num2) {
  let minNum = Math.min(num1, num2);  // Determine the smaller number
  let maxNum = Math.max(num1, num2);  // Determine the larger number

  // Start from the smaller of the two numbers
  for (let checkDivisor = minNum; checkDivisor >= 1; checkDivisor--) {
    if (minNum % checkDivisor === 0 && maxNum % checkDivisor === 0) {

      return checkDivisor;  // Return the first (largest) common divisor found
    }
  }
  return 1;
}

greatestCommonDivisor(10, 15);
//console.log(smallestCommonDivisor(15, 10))


/* Write a function named checkGoldbach that uses Goldbach's Conjecture to log every pair of primes that sum to the number supplied as an argument.
 The conjecture states that "you can express every even integer greater than 2 as the sum of two primes". The function takes as its only parameter,
an integer expectedSum, and logs all combinations of two prime numbers whose sum is expectedSum. Log the prime pairs with the smaller number first.
If expectedSum is odd or less than 4, your function should log null.

Your checkGoldbach function may call the isPrime function you wrote for a previous practice problem.
Example

checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53

To solve this problem, you need to get all possible pairs of numbers that add up to expectedSum. For each pair of candidates, check whether both numbers are prime.
 Be mindful of duplicates. For example: (47, 53) and (53, 47) are the same pair of numbers; check only one of the pairs, and log only one.
*/



/* PEDAC
P:
Explicit: we are given a number input.
          we need to get all pairs of prime numbers that add up to the given input. From 1 to the given input - 1
          we must not have any duplicate pairs and only unique ones.

Implicit: We will need to get all prime numbers from 1 to the given input - 1


D: Since we need to log each pair together we can have an array that contains separate arrays of each pair.

A:

First we must go through each number from 1 to n - 1. Check each number if it is prime and if so store it onto a new array. This shall be it's own functionality
now we create a new empty array called arrayPairs.
iterate through our prime arrays and to get each pair we will need a nested iteration. Once for the intial loop of all numbers and a nested iteration to compare each
individual num with the others.
we iterate through our pairs and get a num and index for out first iteration. We will deal with duplicates by using the index from out first iteration index to make all possible
values with the current num are accounted for
get the second iterat num by getting the index of prime_nums.
if first iterat number + second iterat number matches the give number then append an array with these two elements.
log the prime_pair array.

*/

let primeNumberRange = function(range) {
  prime_arr = []
for (int = 1; int < range; int++) {
  if (isPrime(int)) {
    prime_arr.push(int)
  }
}
return prime_arr
}

function checkGoldbach(number) {
  let prime_nums = primeNumberRange(number);
  let prime_pairs = [];

  prime_nums.forEach((firstIteratNum, firstIterateIndex) => {
    // Start from firstIterateIndex to avoid duplicates and ensure each pair is only considered once
    for (let i = firstIterateIndex; i < prime_nums.length; i++) {
      let secondIteratNum = prime_nums[i];
      if (secondIteratNum + firstIteratNum === number) {
        prime_pairs.push([firstIteratNum, secondIteratNum]);
      }
    }
  });

  console.log(prime_pairs);
}


checkGoldbach(1)

/* Write a function that takes a number of rows as the argument nStars and logs a square of numbers and asterisks. For example, if nStars is 7, log the following pattern:

generatePattern(7);

// console output
1******
12*****
123****
1234***
12345**
123456*
1234567

You may assume that nStars is greater than 1 and less than 10.
*/

function generatePattern(number) {
  let star = '*'
  let strDigits = ''

  for (index = 1; index <= number; index++) {
    strDigits += String(index)
    console.log(`${strDigits}${star.repeat(number - index)}`)
}
}

generatePattern(2)

/*
Write two functions that each take two strings as arguments. Their expected behaviors are as follows:

    The indexOf function searches for the first instance of a substring in firstString that matches the string secondString,
     and returns the index of the character where that substring begins.

    The lastIndexOf function searches for the last instance of a substring in firstString that matches the string secondString,
     and returns the index of the character where that substring begins.

    Both functions return -1 if firstString does not contain the substring specified by secondString.

Examples

function indexOf(firstString, secondString) {
  // statements
}

function lastIndexOf(firstString, secondString) {
  // statements
}

indexOf('Some strings', 's');                      // 5
indexOf('Blue Whale', 'Whale');                    // 5
indexOf('Blue Whale', 'Blute');                    // -1
indexOf('Blue Whale', 'leB');                      // -1

lastIndexOf('Some strings', 's');                  // 11
lastIndexOf('Blue Whale, Killer Whale', 'Whale');  // 19
lastIndexOf('Blue Whale, Killer Whale', 'all');    // -1

You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length.
 However, you may not use any other properties or methods from JavaScript's built-in String class.

'hello'[0];    // "h"
'hello'[4];    // "o"



PEDAC


*/




function indexOf(string, searchStr) {
 (string.indexOf(searchStr))
}

indexOf('Some strings', 's');                      // 5
indexOf('Blue Whale', 'Whale');                    // 5
indexOf('Blue Whale', 'Blute');                    // -1
indexOf('Blue Whale', 'leB');                      // -1


function lastIndexOf(string, searchStr) {
  let lastIndex = -1;  // Start with -1, indicating "not found"

  // Loop through the string
  for (let index = 0; index < string.length; index++) {
    // Temporary index to check occurrence from current index
    let tempIndex = string.indexOf(searchStr, index);
    if (tempIndex !== -1) {
      lastIndex = tempIndex;
      // Move index forward to the last character of the found substring
      index = tempIndex + searchStr.length - 1;
    }
  }

  return lastIndex;
}


/*

Trimming Spaces

Write a function that takes a string as an argument, and returns the string stripped of spaces from both ends. Do not remove or alter internal spaces.
Example

trim('  abc  ');  // "abc"
trim('abc   ');   // "abc"
trim(' ab c');    // "ab c"
trim(' a b  c');  // "a b  c"
trim('      ');   // ""
trim('');         // ""

You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length.
 However, you may not use any other properties or methods from JavaScript's built-in String class.

'hello'[0];       // "h"
'hello'[4];       // "o"

*/

/* PEDAC
E: function takes one string input
   You must remove all prepending or trailing white space but not any white space between characters.
   You cannot use any built in JS string methods besides square brackets and length .



D: I: string
   O: string

  At this point String is likely the format I will use to remove excess string

  A:
  We are given a string input and we are to trim any prepending or trailling string. We must figure out how to ignore any containing elements without using any
  built in JS methods.
  I want to capture the first index in which the  character at that position  is not a space.
  And I want to capture the last index where the character is not a space
  Therefore i can remove all elements prior to and after to keep all of my center contents.
  The start and end point is established. Now all that has to be done is to iterate through once more and set the loop to iterate the difference between the two amount times
  and add the character to a new string at each iteration
  return that new str




*/





let trim = function(text) {
  let space = ' '
  let filtered_str = ''
  let non_space_arr = []
  for (let index = 0; index < text.length; index ++) {
    if (text[index] !== space ) {
      non_space_arr.push(index)

    }
  }
  let min = non_space_arr[0];
  let max = non_space_arr[non_space_arr.length - 1];

  for (let index = min; index <= max; index++) {
       filtered_str += text[index]
  }
  return filtered_str
}

trim('  abc  ');  // "abc"
trim('abc   ');   // "abc"
console.log(trim(' ab c'));    // "ab c"
trim(' a b  c');  // "a b  c"
trim('      ');   // ""
trim('');         // ""


/*
Splitting a String

Write a function that takes two arguments:

    a string to be split
    a delimiter character

The function logs the split strings to the console, as shown below:
Examples

function splitString(string, delimiter) {
  // …
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello

You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length.
 However, you may not use any other properties or methods from JavaScript's built-in String class.

'hello'[0];    // "h"
'hello'[4];    // "o"

PEDAC

E:
There are 2 string inputs
A string to split, and a delimiter in which you will use to split the str.
This function will output the result of the split string in the console log
We can onlu use square brackets and the String Function length for our built in JS string functions.

I:
If there is no delimiter the function must throw an error and output 'ERROR: no delimiter'


D: I: string
   O: String
   We will want to utilize the position of each string to create a new proper string

A:

We want to build our new split string by our delimiter and then output once we reach a new deliimiter. Following this we want to reset the built string and do this again
until the next delimiter or when the index has reached the same size as the length of the str.
First thing we do is check if there is a delimiter. If not we output the built in guard clause error 'ERROR: No delmiter'
now we declare `tempStr` and set it to empty str.
if the delimiter is emptystr then we need to account for this logic more explicitly. The empty str will not match any character but we wish to split every char. Therefore
we do not need to utilixe tempStr and simply log every character
In any other given condition we will need to loop through and get an index. if the index matches the length of the str then we will just output the tempStr
(This will handle the final part after we have reached the last delimiter) We want to check the string at each given index. If it is NOT the delimiter we will add it to
out tempSTR. Continue this until we reach a value that matches the delimiter or the index is the same size as the string length. Once we have done this we output the log
and reset  tempSTR.


*/



function splitString(string, delimiter) {
 if ( delimiter === undefined) {
   console.log('ERROR: No delimiter');
   return;
 }
 let tempStr = ''
 if ( delimiter === '') {
  for (let index1 = 0; index1 < string.length; index1++) {  // could move this logic into the main if condition.
    console.log(`${string[index1]}`)
  }
 }
 for (let index2 = 0; index2 <= string.length; index2++) {
  if (index2 === string.length) {
      console.log(tempStr);
  } else if (string[index2] !== delimiter) {
      tempStr += string[index2];
  } else  {
      console.log(tempStr);
      tempStr = '';
  }
}
}


splitString('test', '')
splitString('abc,123,hello world', ',');
splitString(';hello;', ';');


/*
Repeating Strings

Implement a function that takes a string and a number times as arguments.
 The function should return the string repeated times number of times. If times is not a number, return undefined.
 If it is a negative number, return undefined also. If times is 0, return an empty string. You may ignore the possibility that times is a number that isn't an integer.

function repeat(string, times) {
  // …
}

repeat('abc', 1);       // "abc"
repeat('abc', 2);       // "abcabc"
repeat('abc', -1);      // undefined
repeat('abc', 0);       // ""
repeat('abc', 'a');     // undefined
repeat('abc', false);   // undefined
repeat('abc', null);    // undefined
repeat('abc', '  ');    // undefined

You may concatenate strings, but you may not use any other properties or methods from JavaScript's built-in String class.

PEDAC

E: we are given 2 inputs. An input string and a number that represents the number of times to repeat that input.
   When the times input is negative or not a number, return undefined. If times is 0 then return empty string.
   We can ignore the edge case where the number is not an integer
   you can concat str but not use any other built in JS methods

I: no implicit tasks

DS: input is a string and a number
    output is a string (or undefined for an invalid times param)
    Will utilize strings and loops to get intended output

A:

First let's handle edge cases. Make a conditional which will output an empty string when the times param is 0 and output undefined when times is not a number or negative.
declare the var timedStr to an empty str
Now create a loop that has a index at 0 and loops until it matches the times argument.
in each loop concat the string to timedStr.
output the timedStr when finished

*/



let repeat = function(string, times) {

  if (times === 0 ) {
    console.log('');
    return;
  } else if (typeof times !== 'number'){
    console.log('undefined');
    return ;
  }

  let timedStr = ''
  for (let index = 0; index < times; index++) {
    timedStr = timedStr.concat(string)
  }
  console.log(timedStr)
}

repeat('abc', 1);       // "abc"
repeat('abc', 2);       // "abcabc"
repeat('abc', -1);      // undefined
repeat('abc', 0);       // ""
repeat('abc', 'a');     // undefined
repeat('abc', false);   // undefined
repeat('abc', null);    // undefined
repeat('abc', '  ');    // undefined


/*

Implement a function that determines whether a string begins with another string. If it does, the function should return true, or false otherwise.
Examples

function startsWith(string, searchString) {
  // …
}

let str = 'We put comprehension and mastery above all else';
startsWith(str, 'We');              // true
startsWith(str, 'We put');          // true
startsWith(str, '');                // true
startsWith(str, 'put');             // false

let longerString = 'We put comprehension and mastery above all else!';
startsWith(str, longerString);      // false

You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.

'hello'[0];    // "h"
'hello'[4];    // "o"

PEDAC

E: input 2 strings. one that represents the entire str and the other that represents a amount of chars that the string either starts with (true) or does not (false)
   You can use square brackets and str.length but no other built in string methods

I: if the startWith argument is '' then true will be returned
   If anything passed into the startWith argument does not match the exact placement of the original str, false will be returned

DS: two string input.
  boolean output.
  Will use a looping mechanism and work with strings.

A:
first let's handle the edge case which is ''. simply return true since this problem requires some str.
We need to check that all the digits of startWith param matches the given str. So we will iterate through a loop startWith.length amount of times
now we need a conditional for each loop
if the index at str and at startWith are the same value then we move on to the next index.
if they do not match we will return false as the str have to match perfectly.
If the iteration finishes without a discrepancy then exit the loop and return true.

*/


  const startsWith = (str, sw) =>  {
    if (sw === '') {
      return true;
    }
    for (let index = 0; index < sw.length; index++) {
      if (sw[index] !== str[index]) {
        return false;
      }
    }
   return true;
  };

  let str = 'We put comprehension and mastery above all else';

console.log(startsWith(str, 'We'));              // true
console.log(startsWith(str, 'We put'));          // true
console.log(startsWith(str, ''));                // true
console.log(startsWith(str, 'put'));             // false

/*


Converting Strings to Lower Case

Write a function that returns a string converted to lowercase.

To convert a single uppercase character to a lowercase character, get its ASCII numeric representation from the ASCII table, add 32 to that number,
 then convert the number back to a character using the same ASCII table. You can use the String.fromCharCode and the String.charCodeAt methods
  for these operations. For example:

let string = 'A';
let asciiNumeric = string.charCodeAt(0);         // 65
asciiNumeric += 32;
string = String.fromCharCode(asciiNumeric);  // "a", converted to lowercase

Examples

function toLowerCase(string) {
  // …
}

toLowerCase('ALPHABET');    // "alphabet"
toLowerCase('123');         // "123"
toLowerCase('abcDEF');      // "abcdef"

You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length.
 However, you may not use any other properties or methods from JavaScript's built-in String class.

'hello'[0];    // "h"
'hello'[4];    // "o"

PEDAC

E: there is one input string.
   convert each uppercase string to its lower case counterpart.
   you can use ASCII operations to convert these string.

I: If the value is not a alpha character or within the ASCII range of uppercase characters then leave the values alone.


DS: input a string. Output a string.
    In this case we can use iteration to create a new string object.

A:

declare the var lowercaseStr to an empty str. Iterate through a loop of string.length times. create an index variable and increment until it reaches that size
If the index value of the str converted to the ascii value is within the range of uppercase characters (65 - 90) then convert that value to the lower case counterpart
askii value and add to the lowercaseStr value.
else then we just add the normal value at the index to lowercaseStr
return lowercaseStr



*/



let toLowerCase = (string) => {
  let lowercaseStr = ''

  for (let index = 0; index < string.length; index++) {
    let asciiNumeric = string[index].charCodeAt(0);
    if (asciiNumeric >= 65 && asciiNumeric <= 90) {
      asciiNumeric += 32;
     lowercaseStr +=  (String.fromCharCode(asciiNumeric));
  } else
    lowercaseStr += string[index]
  }
  lowercaseStr;
};

toLowerCase('ALPHABET');    // "alphabet"
toLowerCase('123');         // "123"
toLowerCase('abcDEF');      // "abcdef"


/*
Substring (1)

Write a function that returns a substring of a string based on a starting index and length.
Examples

function substr(string, start, length) {
  // …
}

let string = 'hello world';

substr(string, 2, 4);      // "llo "
substr(string, -3, 2);     // "rl"
substr(string, 8, 20);     // "rld"
substr(string, 0, -20);    // ""
substr(string, 0, 0);      // ""

    The start argument is the starting index. If negative, treat it as strLength + start where strLength is the length of the string.
     For example, if start is -3, treat it as strLength - 3.
    The length argument is the maximum length of the desired substring. If length exceeds the number of characters available, just use the available characters.

You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length.
 However, you may not use any other properties or methods from JavaScript's built-in String class.

let a = 'hello';
a[0];             // "h"
a[4];             // "o"

PEDAC:

E:  we are given 3 inputs. a string that is the given string we are using, a start point  number which represents the place where we start the substring
    and a length number which represents the amount of str to add to the sunbtr.
    If the starting length is negative then the value represents the size of the str - 3
    if the ending length is above the size of the str length then use the str length as the length.
    You may only use brackets and the length method for built in JS string methods.

I: If the end length is - then dont output anything
   if both are 0 then the substring is also empty.


DS: input is 1 string and 2 numbers.
    output is a string
    We will use a looping mechanism to build the new string

A:

Let's handle edge cases first.
set startPoint to the str length - 3 if that value is negative, otherwise keep as is.
declalre subStr to ''
declare subStrcCount to 0
return '' if endpoint is <= 0

if the endpoint is greater than the str.length then we will start at the start point and iterate until that index hits the size of the str
  append this substr to subStr

else if the startpoint is less than the endpoint then start the index at the startpoint and increment until it is the same size as the endpoint
 add the index value of the str to subStr

 else if the start point is higher than the end point. Set the index to 0. until the index is higher than the endpoint increment the index
 append the str value at start point to the subStr.
 increment startvalue

*/




function substr(string, start, length) {
  if (start < 0) {
    start = string.length + start;
  }

  let newString = '';
  for (let counter = 0; counter < length; counter += 1) {
    let index = start + counter;

    if (string[index] === undefined) {
      break;
    }

    newString += string[index];
  }

  return newString;
}

let string = 'hello world';



/*
Substring (2)

This practice problem is similar to the previous one. This time though, both arguments are indices of the provided string. The following rules apply:

    If both start and end are positive integers, start is less than end, and both are within the boundary of the string,
     return the substring from the start index (inclusive), to the end index (NOT inclusive).
    If the value of start is greater than end, swap the values of the two, then return the substring as described above.
    If start is equal to end, return an empty string.
    If end is omitted, the end variable inside the function isundefined. Return the substring starting at position start up through (and including) the end of the string.
    If either start or end is less than 0 or NaN, treat it as 0.
    If either start or end is greater than the length of the string, treat it as equal to the string length.

Examples

function substring(string, start, end) {
  // …
}

let string = 'hello world';

substring(string, 2, 4);    // "ll"
substring(string, 4, 2);    // "ll"
substring(string, 0, -1);   // ""
substring(string, 2);       // "llo world"
substring(string, 'a');     // "hello world"
substring(string, 8, 20);   // "rld"

PEDAC

E:
  We are given an input string and two numbers that represent the starting and ending indices  (starting inclusive  and ending not inclusive)
  while start is < end and both within the str length boundaries return a substring from start (included) to end (not included)
  if the end is greater than the end but still within the boundaries then switch the values and do the same thing.
  if both are equal then return empty string
  if there is no end argument then include all values from the start to the rest of the string.
  if either start or end is greater then the str length then treat it as the string length
  if either start or end is 'NAN' then treat as zero

I:


DS: same as prior

A:
declare variable subStr
return empty string if both are equal.
if either start or end is NaN convert to 0
if there are no arguments then return the str
lets check our boundaries. If start or end is greater than the str length then set the value to the str length
if end is undefined then we shall iterate through str starting at the index of the starting place. Until the index is > than the size of the str.
reassign subStr to this value
if start is < end then leave as be, otherwise switch their values.
 iterate through and set the index to the start. iterate until the start is the same as the end
 reassugn subStr to this value

 return subStr

*/


function substring(str, start, end) {
  let subStr = '';
  // Default and adjust start and end values
  start = typeof start === 'number' ? start : 0;
  end = typeof end === 'number' ? end : str.length; // default to length if end is undefined

  // Correct negative indices
  if (start < 0) start = 0;
  if (end < 0) end = 0;

  // Correct out of bounds indices
  if (start > str.length) start = str.length;
  if (end > str.length) end = str.length;

  // Swap if start is greater than end
  if (start > end) {
      [start, end] = [end, start]; // Swap start and end
  }

  // Early return if start equals end
  if (start === end) {
      return '';
  }

  // Build substring
  for (let index = start; index < end; index++) {
      subStr += str[index];
  }

 return subStr
}
// In a future type problem I would break the guard clauses into it's own separate function.
substring(string, 2, 4);    // "ll"
substring(string, 4, 2);    // "ll"
substring(string, 0, -1);   // ""
substring(string, 2);       // "llo world"
substring(string, 'a');     // "hello world"
substring(string, 8, 20);   // "rld"


/*


Code Review: Rot13 Cipher

After completing this practice problem, post your solution as a Code Review in this lesson's forums.

Rot13 ("rotate by 13 places") is a letter-substitution cipher that translates a String into a new String:

For each character in the original String:

    If the character is a letter in the modern English alphabet, change it to the character 13 positions later in the alphabet. Thus, a becomes n.
     If you reach the end of the alphabet, return to the beginning. Thus, o becomes b.
    Letter transformations preserve case. A becomes N while a becomes n.
    Don't modify characters that are not letters.

Write a Function, rot13, that takes a String and returns that String transformed by the rot13 cipher.

console.log(rot13('Teachers open the door, but you must enter by yourself.'));

// logs:
Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

It's worth noting that rot13 applied twice results in the original string:

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));

// logs:
Teachers open the door, but you must enter by yourself.

This happens since there are 26 characters in the modern English alphabet: 2 sets of 13.

PEDAC

E: We are given an input str.
   we want to take whatever alpha character we are at with each index and move it 13 places to the right.
   when a character surpasses the last character 'z' or 'Z' we shall loop back over the initial alphabet.
   upper case and lower case characters will keep their case even when looped over.
   If there is a non alpha character then leave as be.
   given that there are 26 letters and we move 13 places. If the method is invoked twice on the same string the original value will be returned.

I:


DS: we are given  a string and we output a string
    possilbe logic to simply reassign string chars and add to new output str



A:
declare var rotatedStr
we need to deal with both upper and lower case letter separately. However they will have  similar logic.
first we need to loop the str.length amount of times to deal with each individual char.
Now we have 3 conditions. When a char has an upper case ascii range, a lower case asci range and other ranges.
for our first 2 conditions we check that the str index converted to ascii is within the range for upper (65-90) and the second condition will check for lower
(97-122). for both cases we share the same logic. if the ascii value +13 is <= 90 for uppercase and <= 122 for lower case then simply add the str to  rotatedStr
However if they are greater than these amounts then we must then subtract 26 from each value and then add the string to the rotatedStr var.
for the final case simply add the str index value to rotatedStr

lets split up the functionality of the upper case and lower case logic

return rotatedStr

*/



let rot13 = function(str) {
  let rotatedStr = ''
  for (let index = 0; index < str.length; index++) {
    let asciiValue = str[index].charCodeAt(0);
    if  (asciiValue >= 65 && asciiValue <= 90) {
      asciiValue += 13
      if (asciiValue > 90) {
        asciiValue -= 26
        rotatedStr += String.fromCharCode(asciiValue)

      } else
      rotatedStr += String.fromCharCode(asciiValue)
    } else if (asciiValue >= 97 && asciiValue  <= 122) {
      asciiValue += 13
      if (asciiValue > 122) {
        asciiValue -= 26
        rotatedStr += String.fromCharCode(asciiValue)
      } else
      rotatedStr += String.fromCharCode(asciiValue)
    } else
    rotatedStr += str[index]
  }
 return  rotatedStr
}

function uppercaseRotate(asciiValue) {
  asciiValue += 13;
  if (asciiValue > 90) {
      asciiValue -= 26;
  }
  return String.fromCharCode(asciiValue);
}

function lowercaseRotate(asciiValue) {
  asciiValue += 13;
  if (asciiValue > 122) {
      asciiValue -= 26;
  }
  return String.fromCharCode(asciiValue);
}

function splitRot13(str) {
  let rotatedStr = '';
  for (let index = 0; index < str.length; index++) {
      let asciiValue = str[index].charCodeAt(0);
      if (asciiValue >= 65 && asciiValue <= 90) {
          rotatedStr += uppercaseRotate(asciiValue);
      } else if (asciiValue >= 97 && asciiValue <= 122) {
          rotatedStr += lowercaseRotate(asciiValue);
      } else {
          rotatedStr += str[index];
      }
  }
  return rotatedStr;
}
console.log(rot13('Teachers open the door, but you must enter by yourself.'));  // Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(splitRot13('Teachers open the door, but you must enter by yourself.'))


