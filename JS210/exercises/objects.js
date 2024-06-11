"use strict"

function log(input) {
  return console.log(input)
}




/*


1.Literal

Identify the bug in the following code. Don't run the code until after you've tried to answer.
*/
const myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1];
//myObject[a];
myObject.a;
// The bug lies on line 25. Where we attempt to use bracket notation to access the key  `a`. however in order to do so we must make the key a string. if the operand is a string
// like in this example it will look up that variable (and convert to  a string if neccessary/possible.) Here that vatiable does not exist so we get a referenceError.



/*


2. Literal Method

In the following code, a user creates a person object literal and defines two methods for returning the person's first and last names.
What is the result when the user tries out the code on the last line?
*/

const person = {
  firstName() {
    return 'Victor';
  },
  lastName() {
    return 'Reyes';
  },
};

console.log(`${person.firstName} ${person.lastName}`);


//  functions are first class objects. and without calling them with parenthesis there will be no execution. Therefore for each interpolation
// just the contents of the function body will be logged.



/*


3. Mutation

What will the following code log to the console and why? Don't run the code until after you have tried to answer.
*/
const array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
const array2 = [];

for (let i = 0; i < array1.length; i += 1) {
  array2.push(array1[i]);
}

for (let i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  }
}

console.log(array2);

// `array2` will output an array of values that are the same as `array1 but `array2` will have no uppercased values. In the second iteration  `array1` is mutated  so that values
// start with 'C' are then the value will be reassined to the same word uppercased. Modifying the array object that contains it. `array2` is a separate copy so this result does
// not affect it in any way.

/*
Further Exploration

    What would happen if an object literal was part of the array1 elements pushed to array2? Would changes made to the object literal in array1 be reflected in array2?
    How would you change the code so that any changes made to array1 in the second for loop get reflected to array2?

    1. yes the changes to that object would be reflected since objects are mutable and therefore the changes to that object would be the same object in both cases.
    2. so make the changes reflect instead of creating a copy of arr1. you can initialize  arr2 to the same array object as arr1.
*/


/*


4.Dynamic

What will the following code log to the console and why? Don't run the code until after you have tried to answer.

*/
 const myObj = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

const prop2 = '456';
myObj['prop2'] = '456';
myObj[prop2] = '678';

console.log(myObj[prop2]);
console.log(myObj.prop2);
console.log(myObj)

/*
we have our obj  `myObj` which has 3 key-value pairs. prop1 and prop2 have variable keys where as `prop 3` is a string. On line 109 `prop2` is set to  a constant with
a value  str of `456`. On line 110 bracket notation is used `myObj['prop2']  = '456'. It is key to note when using the string value here we are directly modifying the value
of the key `prop2` in `Obj`.
on line 111 we use bracket notation once more `myObj[prop2] = '678'` however there is a key difference in the logic. Now we are creating a new key value pair. we accessing
the `prop2` variable in the bracket like this it is now referring to it's string value `456`. Now a new pair  with a key `456` and a value `'678'` has been created.

This is reflected in our logs. On line 113 we use bracket notation with a variable name `console.log(myObj[prop2]);` with this format we access the string variable of `prop2`
and get its value which is logged `678`.
On line 114 we use dot notation `console.log(myObj.prop2);` and here we use the `prop2` variable name as the key insteaf and log the output of it's value which is '`456'`


*/

/*


5. What will the following code log to the console and why? Don't run the code until after you have tried to answer.

*/

const myArray = ['a', 'b', 'c'];

console.log(myArray[0]);
console.log(myArray[-1]);

myArray[-1] = 'd';
myArray['e'] = 5;
myArray[3] = 'f';

console.log(myArray[-1]); // 'd'
console.log(myArray['e']); // 5
console.log(myArray); // ['a', 'b', 'c', 'f', -1: 'd'; 'e': 5]

// a
// undefined

// array property for -1: 'd'
// array property for 'e': 5
// end of array index 3: 'f'
//

/*
6.
 A user wrote a function that takes an array as an argument and returns its average. Given the code below, the user expects the average function to return 5.
 Is the user's expectation correct? Why or why not?

*/
const myArr = [5, 5];
myArr[-1] = 5;
myArr[-2] = 5;

function average(array) {
  let sum = 0;

  for (let i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / array.length;
}

console.log(average(myArr));
console.log(myArr)
console.log(myArr.length);

/*

An array property with a key of anything other than a non-negative integer is not counted as part of the array's length.
Therefore in the code above, the length of the array is 2, instead of 4 like the user expected. So the expression in the return statement
evaluates to 20 / 2 and the function returns 10.
*/

/*

7. The calculateBonus function calculates the bonus for a given salary. It makes use of two arguments for determining the bonus: a salary amount and a boolean switch.
If the boolean is true, the bonus should be half of the salary; otherwise the bonus should be 0. Fill in the blanks in the function so that it will work,
 then explain why it works.
*/

/*
function calculateBonus() {
  return _________[1] ? _________[0] / 2 : 0;
}
*/


// answer function calculateBonus() {
 // return arguments[1] ? arguments[0] / 2 : 0;
//}

 // console.log(calculateBonus(2800, true));               // 1400
 // console.log(calculateBonus(1000, false));              // 0
 // console.log(calculateBonus(50000, true));              // 25000

//Notice that while no "parameters" are explicitly defined for the calculateBonus function, there are still "arguments" that are available locally within the function.
// This is because all functions have an arguments object that is available locally. The arguments object contains an entry for every argument passed to the function.


/*



*/
function log(input) {
  return console.log(input)
};

/*

8.The End is Near But Not Here
The penultimate function takes a string as an argument and returns the next-to-last word in the string. The function assumes that "words" are any sequence of non-whitespace characters. The function also assumes that the input string will always contain at least two words. The penultimate function in the example below does not return the expected result. Run the code below, check the current result, identify the problem, explain what the problem is, and provide a working solution.
*/


function penultimate(string) {
  // my modified answer
  let array = string.split(' ')
  return array[array.length - 2 ]

}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"


/*
The problem is on line 11 we are intending to get the next to last valuee in our input string.
however when we split the string into an array (split by spaces) we then attempt to use bracket notation to access the second to last value by looping around the index.
This does not work this way in js. To accomplish this we can split the string up like we are doing and then access the index value of the array at the position of the array
length - 2 . We can then return that value to get the proper result.


*/


/*I


After Midnight Part 1

We can use the number of minutes before or after midnight to represent the time of day. If the number of minutes is positive, the time is after midnight.
 If the number of minutes is negative, the time is before midnight.

The timeOfDay function shown below takes a time argument using this minute-based format, and returns the time of day in 24-hour format ("hh:mm").
Reimplement the function using JavaScript's Date object.

Note: Disregard Daylight Saving Time, Standard Time, and other complications.


pedac
Explicit:
we are given a time argument based on minutes.
a string shall be returned in the ('hh-mm')
if the number is positive then the time is after midnight.
if it is negative it is before midnight.

Implicit:
time loops. there are 1440 minutes in a day so every 1440 minutes the time will loop completely. On the 1441 minute it will be ('00-01') and on the -1441 minute it will
be ('23-59')
it can loop as many times as possible.
0 will br at midnight exactly



DS
Input: date object
output: string
will use string manipulation to create output
Examples:


A:
initialize a const date object and pass in an argument of 0 to start it from jan 1, 1970. Named this referenceDate
we can adjust the minutes of rederenceDate by setting it's UTC minutes and passing in the input.

now we want to get both hours and minutes.
initialize the constant HOURS to getting the UTCHours from the referenceDate
initialize the constant MINUTES to getting the UTCMinutes from the reference date.
initialize formattedHours and formattedMinutes to make sure that if the size of the string is not 2 it will be appended with a '0'.
interpolate formattedHours then ':' followed by formattedMinutes
return this value.


*/
function timeOfDay(inputMinutes) {
  const referenceDate = new Date(0); // January 1, 1970, 00:00:00 UTC
  referenceDate.setUTCMinutes(inputMinutes); // Adjust minutes, handling overflow/underflow

  // Extract hours and minutes in UTC to avoid timezone issues
  const hours = referenceDate.getUTCHours();
  const minutes = referenceDate.getUTCMinutes();

  // Pad numbers to ensure two digits
  const formattedHours = String(hours).padStart(2, '0');
  const formattedMinutes = String(minutes).padStart(2, '0');

  `${formattedHours}:${formattedMinutes})`;
}


timeOfDay(0);          // "00:00"
timeOfDay(-3);         // "23:57"
timeOfDay(35);         // "00:35"
timeOfDay(-1437);      // "00:03"
timeOfDay(3000);       // "02:00"
timeOfDay(800);        // "13:20"
timeOfDay(-4231);      // "01:29"


/*



10. After Midnight Part 2

As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive,
the time is after midnight. If the number of minutes is negative, the time is before midnight.

The two functions below do the reverse of the previous exercise. They take a 24-hour time argument and return the number of minutes before or after midnight,
respectively. Both functions should return a value between 0 and 1439 (inclusive). Refactor the functions using the Date object.

PEDAC

Explicit
we are given a string which represents a 24 hour format for time.
we are to return a number (integer specifically) that represents either the time that has passed after midnight. Or the time remaining until midnight again.
the value should always be between 0 and 1439 inclusive.

Implicit:
'00:00' will return 0 for both functions

DS:
input: string representing 24H format
output: integer representing time until or after midnight

A:
so first we must create a new date object. we will initialize this as now and simply get a new date object at the current date
now we want to iterate through our passed in string argument and split it at the ':' value. So now we have our hour and minutes separated.
we will convert each to a number and initialize each numeric value as a constant. HOURS and MINUTES respectively.
now for our afterMidnight logic we simply need to return the value of multuplying HOURS by 60 and then add MINUTES return this value.
foer beforeMidnight we have the same logic however we subtract that total from 1440 and return that value.



Examples:
*/
function convertToTime(stringTime) {
  const now = new Date();
const [hours, minutes] = stringTime.split(':').map(Number);
return [hours, minutes]

}

let afterMidnight  = function(stringTime) {
  if (stringTime === '00:00') {
    return 0
  }
const [HOURS, MINUTES] = convertToTime(stringTime)
return (HOURS * 60 + MINUTES)
}

let beforeMidnight = function(stringTime) {
  if (stringTime === '00:00') {
    return 0
  }
const [HOURS, MINUTES] = convertToTime(stringTime)
return 1440 - (HOURS * 60 + MINUTES)


}

afterMidnight('00:00');       // 0
beforeMidnight('00:00');      // 0
log(afterMidnight('12:34'));       // 754 -- 754 minutes have passed since 00:00
log(beforeMidnight('12:34'));      // 686   -- 686 minutes remaining until midnight

/*
With date

function afterMidnight(str) {
  const midnight = new Date(0, 0, 0, 0, 0);
  const [hours, minutes] = str.split(":");
  const deltaTime = new Date(0, 0, 0, hours, minutes);
  return (deltaTime - midnight) / 60_000;
}

function beforeMidnight(str) {
  if (str === '00:00') return 0;
  return 1440 - Number(afterMidnight(str));
}


*/
