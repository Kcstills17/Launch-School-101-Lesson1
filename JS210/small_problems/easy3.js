
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


5. Palindromic Strings Part 2

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
  let reverseChars = alphaNums.split('').reverse().join('')

  return alphaNums.slice() === reverseChars
}


isRealPalindrome('madam');               // true
isRealPalindrome('Madam');               // true (case does not matter)
isRealPalindrome("Madam, I'm Adam");     // true (only alphanumerics matter)
isRealPalindrome('356653');              // true
isRealPalindrome('356a653');             // true
isRealPalindrome('123ab321');            // false





/*


6.  Palindromic Number

Write a function that returns true if its integer argument is palindromic, or false otherwise. A palindromic number reads the same forwards and backwards.

P:
given a integer as an input. return a boolean value
we are to check to see if the number is a palindromic value or not.


A:
convert the input into a string
initialize as stringDigits
initialize reverseDigits to the result of splitting  stringDigits into an array of characters. reversing the array  and converting the array back into a string.
return the result of comparing stringDigits with reverseDigits

Examples:

*/

let isPalindromicNumber = function(num) {
  let stringDigits = String(num)
  let reverseDigits = stringDigits.split('').reverse().join('')
  return stringDigits === reverseDigits
}


isPalindromicNumber(34543);        // true
isPalindromicNumber(123210);       // false
isPalindromicNumber(22);           // true
isPalindromicNumber(5);            // true


/*


7.Running Totals

Write a function that takes an array of numbers and returns an array with the same number of elements,
but with each element's value being the running total from the original array.


P:
we are given an array of numbers
we are to return a new array with the same amount of array values
each array value in the neew array should be the result of the total of all array values up to the current position.
e.g. array [2, 5]. in the new array the first position will be [2] since 2 is the only value apart of the total. the second position will be [2, 7] as the 5 will be added
to the total of 2.
return an empty array when the input is empty.
Examples:

*/

let runningTotal = function(arr) {
  let runningArr = []
  if (arr.length === 0) {
    return runningArr
  } else {
    let total = 0;
    for (let i = 0; i < arr.length; i++) {
      total += arr[i]
      runningArr.push(total)
    }
  }
  return (runningArr)
}

runningTotal([2, 5, 13]);             // [2, 7, 20]
runningTotal([14, 11, 7, 15, 20]);    // [14, 25, 32, 47, 67]
runningTotal([3]);                    // [3]
runningTotal([]);                     // []


/*


8. Letter Swap

Given a string of words separated by spaces, write a function that swaps the first and last letters of every word.

You may assume that every word contains at least one letter, and that the string will always contain at least one word.
You may also assume that each string contains nothing but words and spaces, and that there are no leading, trailing, or repeated spaces.

P:
we are given an input str
we return a new str that is the result of swapping the first and last letter of every word in the input.
if the word is 1 character long then that can be left alone.


A:
declare strArr as a result of splitting the input by spaces to get each word.
initialize swappedStr to empty str.
initiialize first and last to empty str as well
set slicedWord to an empty str
iterate through the array and get an element for each word
if the word is the length of 1 then leave alone. otherwise
set first to the first index of the current word
set last to the last index of the current word
set slicedWord to the result of slicing through the current word skipping over the first and last word.
prepend last to slicedWord and append first to the end of sliced word.
append slicedWord to swappedStr

return swappedStr


*/

let swap = function(str) {
  let strArr = str.split(' ')
  let [first, last, slicedWord, swappedStr] = ['', '', '', '']

  strArr.forEach(word => {
    if (word.length === 1) {
      swappedStr += word
      swappedStr += ' '

    } else {
      first = word[0]
      last = word[word.length - 1]
      slicedWord = word.slice(1, word.length - 1)
      slicedWord = last + slicedWord
      slicedWord += first
      swappedStr += slicedWord
      swappedStr += ' '
    }
  });

  return swappedStr

}

swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
swap('Abcde');                          // "ebcdA"
swap('a');                              // "a"



/*


9. Letter Counter Part 1

Write a function that takes a string consisting of one or more space separated words and returns an object that shows the number of words of different sizes.

Words consist of any sequence of non-space characters.

Examples:

*/


function wordSizes(sentence) {
  // Object to store the counts of words of each length
  let counts = {};

  // Split the sentence into words, considering punctuation as delimiters too
  let words = sentence.split(' ')

  // Check if words array is not null (i.e., sentence wasn't empty or didn't only have punctuation)
  if (words) {
    for (let word of words) {
      let length = word.length;
      // Increment the count for the current word length, or initialize it if it doesn't exist yet
      counts[length] = (counts[length] || 0) + 1;
    }
  }

  return counts;
}

// T

//wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
//wordSizes("What's up doc?");                              // { "2": 1, "4": 1, "6": 1 }
//wordSizes('');
                                      // {}





/*


10. Letter Counter Part 2

Modify the wordSizes function from the previous exercise to exclude non-letters when determining word size. For instance, the word size of "it's" is 3, not 4.


A:

here we need to discard all non letters for each of our words. We still want to include spaces so we can utilize the previous letter counter function. In this case we
can initialize a newStr and append to that all chars that matches an alpha char and spaces. To simplify this further we can downcase all letters so we only have to worry about
those values, since we are case insensitive.
invoke wordSizes on newString
Examples:

*/

let newWordSizes = function(str) {
  if (str === '') {
    return wordSizes(str)
  }

  let newStr = ''
  str = str.toLowerCase()
  for (let i = 0; i < str.length; i++) {
    if ((str[i].charCodeAt() >= 97 && str[i].charCodeAt() <= 122) || str[i].charCodeAt() === 32 ) {

      newStr += str[i]
    }
  }

  log(wordSizes(newStr))
}

newWordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 2 }
newWordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 3 }
newWordSizes("What's up doc?");                              // { "5": 1, "2": 1, "3": 1 }
newWordSizes('');                                            // {}




function ride() {
  bike = 'Schwinn';
  console.log(bike);
}

ride();

if (true) {
  console.log(bike);
}
