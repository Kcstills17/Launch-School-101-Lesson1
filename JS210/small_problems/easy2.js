"use strict"
let rlSync = require('readline-sync');

function log(input)  {
  return console.log(input);
}



/*

Ddaaiillyy ddoouubbllee

Write a function that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate
 characters collapsed into a single character.

 algo

 we are given an input string. We are to remove any consecutive same string from the output. Which is a new string.
 initialize and declare newString to the first string index value
 We need to check that the last index value string is not equal to the current string.
 to account for the first  value not having a previous string value that is why we set newString to the first index value.
  exit the loop and return  newString
*/



let crunch = function(str) {
  if (str === '') {
    return '';
  }

  let newString = str[0];
  for (let i = 1; i < str.length; i++) {
    if (str[i] !== str[i - 1]) {
      newString += str[i];
    }
  }
  return newString;
}

crunch('ddaaiillyy ddoouubbllee');    // "daily double"
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
crunch('a');                          // "a"
log(crunch(''));                           // ""


/*

2. Bannerizer

Write a function that will take a short line of text, and write it to the console log within a box.

Examples:

logInBox('To boldly go where no one has gone before.');

will log on the console:

+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

logInBox('');
+--+
|  |
|  |
|  |
+--+

You may assume that the output will always fit in your browser window.
*/

let logInBox = function(str) {
  let beginAndEndSymbol = '+'
  let separator = '-'
  let middleSymbol = '/'
  let startAndFinish = `${beginAndEndSymbol}${beginAndEndSymbol.padStart(str.length +  4  , separator)} `
  let contents =  `${middleSymbol}  ${str} ${middleSymbol}`
  let padding = `${middleSymbol} ${''.padStart(str.length + 2, ' ')}${middleSymbol}`
  log(startAndFinish)
  log(padding)
  log(contents)
  log(padding)
  log(startAndFinish)
}


logInBox('To boldly go where no one has gone before.')


/*


3. Stringy Strings

Write a function that takes one argument, a positive integer, and returns a string of alternating '1's and '0's,
always starting with a '1'. The length of the string should match the given integer.


stringy(6);    // "101010"
stringy(9);    // "101010101"
stringy(4);    // "1010"
stringy(7);    // "1010101"


*/

let stringy = function(num) {
  let binary = '1'
  for (let i = 1; i < num; i++) {
   if (binary[i - 1] === '1') {
    binary += '0'
  } else {
    binary += '1'
  }

}
return binary
}

stringy(6);    // "101010"
stringy(9);    // "101010101"
stringy(4);    // "1010"
stringy(7);    // "1010101"

/*

4. Right Triangles

Write a function that takes a positive integer, n, as an argument and logs a right triangle whose sides each have n stars.
The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle,
and the other end at the upper-right.

Examples:

triangle(5);

    *
   **
  ***
 ****
*****

triangle(9);

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********
*/

let triangle = function(num) {
  let star_count = 1
  for (let i = num; i >= 1; i-= 1) {
    let spaces = ' '.repeat(i)
    let stars = '*'.repeat(star_count)
    log(`${spaces}${stars}`)
    star_count += 1
  }
}

//triangle(5)
//triangle(9)


/*

5. Madlibs

Madlibs is a simple game where you create a story template with "blanks" for words. You, or another player,
 then construct a list of words and place them into the story, creating an often silly or funny story as a result.
Create a simple madlib program that prompts for a noun, a verb, an adverb, and an adjective, and injects them into a story that you create.


Example:

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

// console output
Do you walk your blue dog quickly? That's hilarious!
*/


let madLibs = function() {
 let noun = rlSync.question('Enter a noun\n')
 let verb = rlSync.question('Enter a verb\n')
 let adjective = rlSync.question('Enter an adjective \n')
 let adverb = rlSync.question('Enter an adverb \n')
   return `Do you ${verb} your ${adjective} ${noun} ${adverb}?`
}

//madLibs()


/*

6. Double Doubles

A double number is an even-length number whose left-side digits are exactly the same as its right-side digits.
 For example, 44, 3333, 103103, and 7676 are all double numbers, whereas 444, 334433, and 107 are not.

Write a function that returns the number provided as an argument multiplied by two, unless the argument is a double number;
 otherwise, return the double number as-is.


 PEDAC

 explicit: we are given a number.
 When a double number (even digit argument whose left side digits are the same as the right side digits ) is the argument we return the argument.
 Otherwise we double the value of the argument.

 ds: input is a number and so is the output

 A:
 to determine if the argument is a double number we will convert the value to string. Then we will get the string length. We will initialize and declare
 two new variables firstHalf  and SecondHalf.
 Now we will do a for loop starting from 1.  if the current index is smaller or equal to the input length / 2 then append the value to firstHalf.
 Otherwise append to secondHalf.
 if the strNum length is even and first half is the same value as the second value then return the argument, otherwise return the argument * 2
 */




function twice(num) {
  let strNum = String(num)
  let halfPoint = strNum.length/2
  let [firstHalf, secondHalf] = ['', '']

  for (let i = 0; i < strNum.length; i++) {

    if (i < halfPoint) {

      firstHalf += (strNum[i])
    } else {

      secondHalf += (strNum[i])
    }
  }

 if (strNum.length % 2 == 0 && firstHalf === secondHalf) {
return num
 } else
 return num * 2
}

twice(37);          // 74
twice(44);          // 44
twice(334433);      // 668866
twice(444);         // 888
twice(107);         // 214
twice(103103);      // 103103
twice(3333);        // 3333
twice(7676);        // 7676


/*


7. Grade Book

Write a function that determines the mean (average) of the three scores passed to it, and returns the letter associated with that grade.

Numerical score letter grade list:

    90 <= score <= 100: 'A'
    80 <= score < 90: 'B'
    70 <= score < 80: 'C'
    60 <= score < 70: 'D'
    0 <= score < 60: 'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

*/

function getGrade(grade1, grade2, grade3) {
  let score = Math.round(((grade1 + grade2 + grade3) / 3))
  if (score >= 90 && score <= 100) {
    return 'A';
  } else if (score >= 80) {
    return 'B';
  } else if (score >= 70) {
    return 'C';
  } else if (score >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

log(getGrade(95, 90, 93));    // "A"
log(getGrade(50, 50, 95));    // "D"

/*

8. Clean Up the Words

Given a string that consists of some words and an assortment of non-alphabetic characters, write a function that returns that string with all
 of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space
  in the result (i.e., the result string should never have consecutive spaces).

  E:
  input is a string. Output is a string
  all string values that are not alpha characters are to be converted into spaces.
  There should never be consecutive spaces  (even with consecutive non alphan characters)


  A:
  declare and iterate the variable newString
  iterate through a loop starting with 0. until you reach the length of the str.  we will have 3 conditions
  first check to see if the value is an alpha char. if so append to newString
  now we have to check for non  AN chars but we have to be aware of our rule that we cannot have consecutive spaces. so our second condition will be that
  as long as the str value at the previous index does  NOT match a non alpha char and the value at the current index is a non alphachar we
  will add a space to newString. to deal with the first index which will not have a previous one we will also make sure the index is > 0
  Otherwise we will skip the value to avoid dup. spaces.
  return newString

  create a sub function alphat hat will check each char by their ascii value and return whether or not it is an alpha code or not.



  */
 let alpha= function(char) {

  const asciiCode = char.charCodeAt(0);
  return (asciiCode >= 97 && asciiCode <= 122)
 }


 let cleanUp = function(str) {
  str = str.toLowerCase();
  let newString = '';
  for (let i = 0; i < str.length; i++) {
    if (alpha(str[i])) {
      newString += str[i];
    } else if (i > 0 && alpha(str[i - 1])) {
      newString += ' ';
    }
  }
 return newString
}

cleanUp("---what's my +*& line?");    // " what s my line "


/*


9. What Century is That

Write a function that takes a year as input and returns the century. The return value should be a string that begins with the century number,
 and ends with 'st', 'nd', 'rd', or 'th' as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901 - 2000 comprise the 20th century.


PEDAC:

P;
we are given a number as an input which represents a given year.
we are to output a string which represents which century we have.
each century must end with the appropriate representation ('st', 'th', 'rd' ) etc.


A:

we have two main logics that must be achieved. The number that is the current century. every 100 years progresses one century.
e.g. (1 is century 1. 101 is century 2, etc).
we must also get the correct forms that matches each number. These will be split up into two helper functions.
initialize givenCentury to the result of invoking centuryLogic on the argument. pass this result into centuryForm and declare as properForm
return a string of  givenCentury + properForm


centuryLogic:
will take an input numbeer.
dividing each argument by 100 to get the given century makes sernse, however, since 0-99 is technically the first century. This logic would require us to round up by 1 for each
result. So we will round to the next largest number for the argument divided by 100.
return that result

centuryForm:
take a number as an argument
convert into a string and declare as digitStr
for this we need to check for what digit we are ending with to determine it's form.
if the value ends in 11, 12 or 13 then we will append 'th'.
if the value ends with 1 we will apend st
if the value ends witr 2 we will append nd
if the value ends with 3 we will apped rd.
else we return


Examples:

century(2000);        // "20th"
century(2001);        // "21st"
century(1965);        // "20th"
century(256);         // "3rd"
century(5);           // "1st"
century(10103);       // "102nd"
century(1052);        // "11th"
century(1127);        // "12th"
century(11201);       // "113th"
*/

let centuryLogic = function(num) {
  return (Math.ceil(num/100))

}

centuryLogic(11201)


let centuryForm = function(num) {
  let strDigits = String(num)
  let lastDigit = strDigits.slice(-1)
  let lastTwoDigits = strDigits.slice(-2)
  if (lastTwoDigits === '11' || lastTwoDigits ==='12' || lastTwoDigits === '13') {
    return ('th')
  } else if (lastDigit === '1') {
    return ('st')
  } else if (lastDigit === '2') {
    return ('nd')
  } else if (lastDigit === '3') {
    return ('rd')
  } else {
    return ('th')
  }
}



let century = function(num) {
  let givenCentury = centuryLogic(num)
  let properForm = centuryForm(givenCentury)
  return `${givenCentury}${properForm}`

}

century(2000);        // "20th"
century(2001);        // "21st"
century(1965);        // "20th"
century(256);         // "3rd"
century(5);           // "1st"
century(10103);       // "102nd"
century(1052);        // "11th"
century(1127);        // "12th"
century(11201);       // "113th"
