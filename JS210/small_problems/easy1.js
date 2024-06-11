// 1. Odd Numbers
//  Log all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

let num = 1 ;

while (num < 100) {
 // console.log(num)
  num += 2;
}


// 2. Even Numbers
// Log all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

num = 0;

for (let i = 0; i < 100; i+= 2 ) {
  num += 2;
  //console.log(num)
}



// 3.How Big is the Room

// Build a program that asks the user to enter the length and width of a room in meters, and then logs the area of the room to the console
//  in both square meters and square feet.

// Note: 1 square meter == 10.7639 square feet

// Do not worry about validating the input at this time. Use the readlineSync.prompt method to collect user input.

// Example:
/*
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.00 square meters (753.47 square feet).
*/


const RLSYNC = require('readline-sync');


let howBigIsRoom = function() {
  const length = Number(RLSYNC.question('Enter the length of the room in meters\n'))
  const width = Number(RLSYNC.question('Enter the width of the room in meters\n'))
  const [area, sqFeet] = [length * width, (length * width) * 10.7639]
  console.log(`The aread of the room is ${area} square meters (${sqFeet} square feet)`)
}

//howBigIsRoom()



/* 4. Tip Calculator

Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip,
 and then log both the tip and the total amount of the bill to the console. You can ignore input validation and assume that the user will put in numbers.

Example:

What is the bill? 200
What is the tip percentage? 15

The tip is $30.00
The total is $230.00

*/

let calculateTip = function() {
  let bill = Number(RLSYNC.question('What is the bill?\n'))
  let tipPercentage = Number(RLSYNC.question('What is the tip percentage?\n'))
  let percentageTotal = ( (tipPercentage / 100) * 200)
  let billTotal = (bill + percentageTotal)

  console.log(`The tip is $${String(percentageTotal)}\n`)
  console.log(`The total is $${String(billTotal)}`)

}


//calculateTip()



/* 5. Sum or Product of Consecutive Integers

Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or the product of all numbers
 between 1 and the entered integer, inclusive.

Examples:

Please enter an integer greater than 0: 5
Enter "s" to compute the sum, or "p" to compute the product. s

The sum of the integers between 1 and 5 is 15.

Please enter an integer greater than 0: 6
Enter "s" to compute the sum, or "p" to compute the product. p

The product of the integers between 1 and 6 is 720.

*/

let factorial = function(num) {
  if (num === 1 || num === 0 ) {
    return num
  }
  return factorial((num - 1)) * num

}

let sum = function(num) {
if (num === 0 ) {
  return 0
}
return sum(num - 1 )  + num
}

let calculateSumOrProduct = function() {
  const NUMBER = Number(RLSYNC.question('Please enter an integer greater than 0\n'))
  const OPERATION = RLSYNC.question('Enter "s" to compute the sum, or "p" to compute the product.').toLowerCase()

  if (OPERATION === 's') {
    console.log(`The sum of the integers between 1 and ${NUMBER} is ${sum(Number(NUMBER))} `)
  } else if (OPERATION === 'p') {
    console.log(`The product of the integers between 1 and ${NUMBER} is ${factorial(Number(NUMBER))} `)

  } else
  console.log('Invalid operation. Please enter "s" or "p".')



}


//calculateSumOrProduct()



/*
6. Short Long Short

Write a function that takes two strings as arguments, determines the length of the two strings, and then returns the result of concatenating the shorter string,
 the longer string, and the shorter string once again. You may assume that the strings are of different lengths.
*/

function shortLongShort(str1, str2) {
  if (str1.length < str2.length) {
  [shortStr, longStr] = [str1, str2]
  } else {
    [shortStr, longStr] = [str2, str1]
  }
   return shortStr.concat(longStr) + shortStr
}

(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
shortLongShort('abcde', 'fgh');    // "fghabcdefgh"
shortLongShort('', 'xyz');         // "xyz"




/* 7. Leap Years Part 1

In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100.
 If the year is evenly divisible by 100, then it is not a leap year, unless the year is also evenly divisible by 400.

Assume this rule is valid for any year greater than year 0. Write a function that takes any year greater than 0 as input and returns true if the year is a leap year
 or false if it is not a leap year.

 // logic  in order
 1. if evenly divisible by 400  is is a leap year
 2. if evenly divisible by 100 it is not a leap year
 3. if evenly divisible by 4 it is a leap year

*/

function isLeapYear(num) {
  if (num % 400 === 0 ) {
    return true
  } else if (num % 100 === 0) {
    return false
  } else if (num % 4 === 0 ) {
    return true
  }
  return false
}

isLeapYear(2016);      // true
isLeapYear(2016);      // true
isLeapYear(2015);      // false
isLeapYear(2100);      // false
isLeapYear(2400);      // true
isLeapYear(240000);    // true
isLeapYear(240001);    // false
isLeapYear(2000);      // true
isLeapYear(1900);      // false
isLeapYear(1752);      // true
isLeapYear(1700);      // false
isLeapYear(1);         // false
isLeapYear(100);       // false
isLeapYear(400);       // true


/*
8. Leap Years Part 2

This is a continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, they used the Julian Calendar. Under the Julian Calendar,
 leap years occur in any year that is evenly divisible by 4.

Using this information, update the function from the previous exercise to determine leap years both before and after 1752.

*/

let preGregorian = function(num) {
  if (num % 4 === 0) return true
  return false
}

let gregorian = isLeapYear


let determineLeapLogic = function(num) {
  if (num < 1752) {
  return  preGregorian(num)
  } else
  return gregorian(num)
}
determineLeapLogic(2016);      // true
determineLeapLogic(2016);      // true
determineLeapLogic(2015);      // false
determineLeapLogic(2100);      // false
determineLeapLogic(2400);      // true
determineLeapLogic(240000);    // true(determineLeapLogic(240001));    // false
determineLeapLogic(2000);      // true
determineLeapLogic(1900);      // false
determineLeapLogic(1752);      // true
determineLeapLogic(1700);      // true (Julian calendar rule)
determineLeapLogic(1);         // false
determineLeapLogic(100);       // true (Julian calendar rule)
determineLeapLogic(400);       // true (Julian calendar rule)


/*
9. Multiples of 3 and 5

Write a function that computes the sum of all numbers between 1 and some other number, inclusive, that are multiples of 3 or 5. For instance,
if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

*/

let multisum = function(num) {
  let total = 0
  for (let i = 1; i <= num; i++)
  if (i % 3 == 0 || i % 5 == 0 ) {
    total += i
  }
  return total
}

multisum(3);       // 3
multisum(5);       // 8
multisum(10);      // 33
multisum(1000);    // 234168


/*
10. UTF-16 String Value

Write a function that determines and returns the UTF-16 string value of a string passed in as an argument. The UTF-16 string value is the sum of the UTF-16 values
 of every character in the string. (You may use String.prototype.charCodeAt() to determine the UTF-16 value of a character.)

*/

let utf16Value = function(str) {
  total = 0
for (let i = 0; i < str.length; i++) {
  total += str[i].charCodeAt()
}
return total
}
utf16Value('Four score');         // 984
utf16Value('Launch School');      // 1251
utf16Value('a');                  // 97
utf16Value('');                   // 0

// The next three lines demonstrate that the code
// works with non-ASCII characters from the UTF-16
// character set.
const OMEGA = "\u03A9";             // UTF-16 character 'Ω' (omega)
utf16Value(OMEGA);                  // 937
utf16Value(OMEGA + OMEGA + OMEGA);  // 2811
