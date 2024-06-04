"use strict"
let rlSync = require('readline-sync');

function log(input)  {
  return console.log(input);
}



/*


1.How Old is Teddy?

Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between 20 and 200 (inclusive).

Example Output:

Teddy is 69 years old!

*/


function howOld(min, max ) {
  let age = Math.floor( Math.random() * (max - min) + min);
  return `Teddy is ${age} years old!`
}

(howOld(20, 200))


/*


2. Searching 101

Write a program that solicits six numbers from the user and logs a message that describes whether the sixth number appears among the first five numbers.

Examples:

Enter the 1st number: 25
Enter the 2nd number: 15
Enter the 3rd number: 20
Enter the 4th number: 17
Enter the 5th number: 23
Enter the last number: 17

The number 17 appears in [25, 15, 20, 17, 23].

-----

Enter the 1st number: 25
Enter the 2nd number: 15
Enter the 3rd number: 20
Enter the 4th number: 17
Enter the 5th number: 23
Enter the last number: 18

The number 18 does not appear in [25, 15, 20, 17, 23].
*/


function check6th() {
let first = rlSync.question('Enter the 1st number\n')
let second = rlSync.question('Enter the 2nd number\n')
let third = rlSync.question('Enter the 3rd number\n')
let fourth = rlSync.question('Enter the 4th number\n')
let fifth = rlSync.question('Enter the 5th number\n')
let last = rlSync.question('Enter the last number\n')
let array = [first, second, third, fourth, fifth]
if (includeValue(array, last)) {
  log(`The number ${last} appears in ${array}`)
} else
log(`The number ${last} does not appear in ${array}`)


}

function includeValue(arr, value) {
return arr.includes(value)

}

//check6th()


/*


3. When Will I Retire

Build a program that logs when the user will retire and how many more years the user has to work until retirement.

Example:

What is your age? 30
At what age would you like to retire? 70

It's 2017. You will retire in 2057.
You have only 40 years of work to go!
*/

let retireGoal = function() {
  let age = Number(rlSync.question('What is your age?\n'))
  let year = new Date().getFullYear()
  let retireAge = Number(rlSync.question('At what age would you like to retire? \n'))
  let yearsTilRetirement =  retireAge - age

  log(`It's ${year}. you will retire in ${year + yearsTilRetirement}`)
  log(`You only have ${yearsTilRetirement} years of work to go`)


}


//retireGoal()



/*

4. Palindromic Strings Part 1

Write a function that returns true if the string passed as an argument is a palindrome, or false otherwise.
 A palindrome reads the same forwards and backwards. For this problem, the case matters and all characters matter.

P:
we are given a string input. we output a boolean value
are goal is to return true if the string is palindromic. (meaning it is the same word or series of characters normally or in reverse)
this problem is case sensitive. And all characters matter.


*/

function isPalindrome(str) {
  let arr = str.split('')
  let copyArr = arr.slice()
  return arr.reverse().join('') === copyArr.join('')

}

isPalindrome('madam');               // true
isPalindrome('Madam');               // false (case matters)
isPalindrome("madam i'm adam");      // false (all characters matter)
isPalindrome('356653');              // true



/*


Palindromic Strings Part 2

Write another function that returns true if the string passed as an argument is a palindrome, or false otherwise. This time, however,
your function should be case-insensitive, and should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the isPalindrome
function you wrote in the previous exercise.


Pedac
Given a string input.
Return a boolean value
our goal is to return true if the argument is a palindromic string.

Here we want to be case insensitive and ignore all non alphanumeric characters.

create a function alphaNumeric() that only selects alphanumeric values from the input str.
declare a variable alphaNums and initialize to this function
down case alphaNums to make sure case is not an issue. set alphaNums to this new value
return the result of comoaring alphaNums to alphaNums in reverse.
Examples:

*/

function alphaNumeric(str) {
  let newStr = ''
  let arr = str.split('')

  for (let i = 0; i < arr.length; i++) {
   let asciiCode = arr[i].charCodeAt()

    if ((asciiCode >= 97 && asciiCode <= 122) || (asciiCode >= 48 && asciiCode <= 57)) {
      newStr += str[i]
    }

  }
  return newStr
}



let isRealPalindrome = function(str) {
  let lowerCaseStr = str.toLowerCase()
  let alphaNums = alphaNumeric(lowerCaseStr)

  log(alphaNums.slice() === alphaNums.reverse)

}


isRealPalindrome('madam');               // true
isRealPalindrome('Madam');               // true (case does not matter)
isRealPalindrome("Madam, I'm Adam");     // true (only alphanumerics matter)
isRealPalindrome('356653');              // true
isRealPalindrome('356a653');             // true
isRealPalindrome('123ab321');            // false



