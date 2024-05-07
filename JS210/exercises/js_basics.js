let log = function(val) {
  console.log(val)
}


// 2. Go over the following program. What does it log to the console at lines 7, 11, 15, and 19? Is it what you expected? Why or why not?

const myBoolean = true;
const myString = 'hello';
const myArray = [];
const myOtherString = '';

if (myBoolean) {
  console.log('Hello');
  // this should output the statement as myboolean is a boolean value.
}

if (!myString) {
  console.log('World');
  // mystring is a string value that will evaluate as true. the bang operator ! will reverse that and be a falsy value. No output
}

if (!!myArray) {
  console.log('World');
  // double !! wlil return the same boolean value. myarray is an object which will evalaluate to true. the statement is logged
}

if (myOtherString || myArray) {
  console.log('!');
  // the logic is read from L to R but both return a truthy value. it will be logged
}


//3. One of the ways to manage the flow of a program is through the use of conditionals. Go over the code below and specify how many unique execution paths are possible.
/*
  if (condition1) {
    //1, 2

    if (condition2) {
      // 1,
    } else {
      // 2,
    }
  }

  else {
    // 3, 4, 5
    if (condition4) {
      // 4
      if (condition5) {
      // 5
      }
    }
  }
*/
  const myName = 'Bob';
const saveName = myName;
myName.toUpperCase();
console.log(myName, saveName);

// 4. What does this code log? Can you explain these results?

// You will  get 'Bob Bob' as in JS strings are immutable.

//5. Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.
/*
Example

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 1.4105003956066297e+23
*/

/*
6.
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Please enter a phrase walk', (phrase1) => {
  console.log(`There are ${phrase1.length} characters in the phrase ${phrase1}`)
rl.question("Please enter a phrase: walk, don't run ", (phrase2) => {
  console.log(`There are ${phrase2.length} characters in the phrase ${phrase2}`)
    rl.close();
  });
});
*/

/*
7. Convert a String to a Number

For this exercise we're going to learn more about type conversion by implementing our own parseInt function that converts a string of numeric characters
 (including an optional plus or minus sign) to a number.

The function takes a string of digits as an argument, and returns the appropriate number. Do not use any of the built-in functions for converting a string to a number type.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

Examples:


PEDAC:

explicit:
input is a string of digits.
output is the digits converted into a number
do not worry about a leading + or - sign. Asssume all characters will be numeric.


DS:
input is string
output is a number

A:
In JS when you have a string if you are to multiply it by the conventions of JS it will convert the digit into a number.
to deal with 0 when the input is '0' we return 0.
othewrise we multiply the value by 1. W
*/

/*
let stringToInteger = function(digits) {
  if (digits === '0') return 0;
  return digits * 1;
}


stringToInteger('4321');      // 4321
stringToInteger('570');       // 570
stringToInteger('0');

*/

/*
8. Convert a String to a Signed Number

The previous exercise mimics the parseInt function to a lesser extent. In this exercise, you're going to extend that function to work with signed numbers.

Write a function that takes a string of digits and returns the appropriate number as an integer. The string may have a leading + or - sign;
if the first character is a +, your function should return a positive number; if it is a -, your function should return a negative number. If there is no sign,
return a positive number.

You may assume the string will always contain a valid number.

A:

since if the symbol is positive we can get out value by multiplying by one and if the symbol is negative we can get the value by multiplying by -1. This will be the main logic.
we will have an if condition that determined whether we need to add any logic or simply invoke the function stringToInteger on.
when we have a symbol as out first str value we do the following
declare a constant multiplier that will either have a value of 1 (if the symbol is +) or -1 (if the value is -).
now we initialize a new string that will remove the symbol from the string as numberString.
multiply numberString by multiplier.  and return that value.
otherwise return stringToInteger being invoked with the string argument passed in.


*/
//here is the solution ls had to the previous problem




const DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
};

function stringToInteger(string) {
  let value = 0;
  const numbers = stringToNumbers(string);

  for (let i = 0; i < numbers.length; i += 1) {
    value = 10 * value + numbers[i];

  }

  return value;
}

function stringToNumbers(string) {
  const result = [];

  for (let i = 0; i < string.length; i += 1) {
    result.push(DIGITS[string[i]]);
  }

  return result;
}




function stringToSignedInteger(string) {
  if (string[0] === '+' || string[0] === '-') {
    // Determine the sign multiplier based on the first character
    const multiplier = string[0] === '-' ? -1 : 1;
    // Extract the number part of the string skipping the first character
    const numberString = string.slice(1);
    return multiplier * stringToInteger(numberString);
  }
  return stringToInteger(string);
}

log(stringToSignedInteger('4321'));      // 4321
log(stringToSignedInteger('-570'));      // -570
log(stringToSignedInteger('+100'));      // 100


/*


Convert a Number to a String

In the previous two exercises, you developed functions that convert simple numeric strings to signed integers. In this exercise and the next,
you're going to reverse those functions.

You will learn more about converting strings to numbers by writing a function that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number.
Your function should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Examples:

integerToString(4321);      // "4321"
integerToString(0);         // "0"
integerToString(5000);      // "5000"

pedac

explicit:
input is a number
output is a string
cant use built in js methods to convert to a string ot expressions like '' + number
it deals only with positive integers or zero

implicit:


DS:
input is a number
output is string


a:
our logic will be split up into two main parts
first we will split up our input integer's digits and store them in an array
to do this we will create an empty array called digits
if the passed in value is just 0 then append '0' to digits
we will then push onto that digit the last digit by using the remainder operator and the operand of 10.
remove the last value from the past in integer and iterate until the integer is not > than 0
reverse the digits array

now we can utilize the constant DIGITS from before
initialize digitStr to an empty string
set digitArr to the splitDigits function with the passed in string as the argument.
iterate through a loop that sets an index and iterates until the size is greater than the length of digitArr
iterate through a loop of each key and object in the DIGITS object.

if the key[value] is equal to digitArr[index]
concatanete the key to the digitStr

return digitStr



*/


let splitDigits = function(number) {
  let digits = []
  if (number === 0) {
    digits.push(number)
    return digits
  }
  while (number > 0) {
    digits.push(number % 10); // Get the last digit
        number = Math.floor(number / 10); // Remove the last digit
  }
  return(digits.reverse())
};

let integerToString = function(number) {
  let digitStr = ''
  let digitArr = splitDigits(number)
  for (let i = 0; i < digitArr.length; i++) {
    for (let key in DIGITS) {
      if (digitArr[i] === DIGITS[key]) {
        digitStr += key
      }
    }
  }

 return digitStr
};


integerToString(4321);      // "4321"
integerToString(0);         // "0"
integerToString(5000);      // "5000"


/*

9. Convert a Signed Number to a String

In the previous exercise, you reimplemented a function that converts non-negative numbers to strings.
 In this exercise, you're going to extend that function by adding the ability to represent negative numbers.

You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as
 '' + number. You may, however, use the integerToString function from the previous exercise.

Examples:

signedIntegerToString(4321);      // "+4321"
signedIntegerToString(-123);      // "-123"
signedIntegerToString(0);         // "0"

*/


function signedIntegerToString(number) {
  let symbol = ''
  if (number > 0) {
     symbol = '+'
  } else if (number < 0) {
    number = Math.abs(number)
    symbol = '-'
  }

return symbol += integerToString(number)
};

signedIntegerToString(4321);      // "+4321"
signedIntegerToString(-123);      // "-123"
signedIntegerToString(0);         // "0"
