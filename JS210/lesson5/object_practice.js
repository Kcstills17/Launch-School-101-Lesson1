//Write a function named objectHasProperty that takes two arguments: an Object and a String.
//The function should return true if the Object contains a property with the name given by the String, false otherwise.
const log = console.log
function objectHasProperty(obj, key) {
  return key in obj
};

let pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

objectHasProperty(pets, 'dog');       // true
objectHasProperty(pets, 'lizard');    // false
objectHasProperty(pets, 'mice');      // true



//Write a function named incrementProperty that takes two arguments: an Object and a String. If the Object contains a property with the specified name,
// the function should increment the value of that property. If the property does not exist, the function should add a new property with a value of 1.
// The function should return the new value of the property.

let incrementProperty = function(obj, propertyName) {
  if (propertyName in obj) {
    obj[propertyName] += 1;
  } else {
    obj[propertyName] = 1;
  }
  return obj[propertyName];
};

let wins = {
  steve: 3,
  susie: 4,
};

incrementProperty(wins, 'susie');   // 5
wins;                               // { steve: 3, susie: 5 }
incrementProperty(wins, 'lucy');    // 1
wins;                               // { steve: 3, susie: 5, lucy: 1 }



//Write a function named copyProperties that takes two Objects as arguments. The function should copy all properties from the first object to the second.
//The function should return the number of properties copied.

let copyProperties = function(obj1, obj2) {
  count = 0

  for (let property in obj1) {
    obj2[property] = obj1[property]
    count += 1
  }
 return count
}

let hal = {
  model: 9000,
  enabled: true,
};

let sal = {};
copyProperties(hal, sal);  // 2
sal;                       // { model: 9000, enabled: true }



//Write a function named wordCount that takes a single String as an argument. The function should return an Object that contains the counts of each word
//that appears in the provided String. In the returned Object, you should use the words as keys, and the counts as values.



function wordCount(str) {
  const wordCounts = {};
  const words = str.split(' ');

  words.forEach(word => {
    if (wordCounts[word]) {
      wordCounts[word] += 1; // Increment count if the word is already in the object
    } else {
      wordCounts[word] = 1; // Initialize count if the word is new to the object
    }
  });

  return wordCounts;
}
wordCount('box car cat bag box');  // { box: 2, car: 1, cat: 1, bag: 1 }


//What side effects are present in the foo function in the following code?

const bar = 42;
let qux = [1, 2, 3];
let baz = 3;

function foo(arr) {
  let value = arr.pop();
  console.log(`popped ${value} from the array`);
  return value + bar + baz;
}

foo(qux);

// 1. the passed in array is mutated through the use of `arr.pop()`.
// 2. the console.log statement logs an output even though the goal of the function is to return the value `value + bar + baz`

//Which of the following functions are pure functions?
//Function 1

function sum(a, b) {
  console.log(a + b);
  return a + b;
}
// This is not a pure function. It has the side effect of the console.log statement.

//Function 2

function sum(a, b) {
  a + b;
}
// This is a pure function. Even though undefined is returned it is a consistent return value with no side effects.

//Function 3

function sum(a, b) {
  return a + b;
}
// This is a pure function. It is based off of the arguments passed in, has a return value, and no forseeable side affects.
//Function 4

function sum(a, b) {
  return a + b + Math.random();
}
// This is not a pure function.   `Math.random()` mutates an outer function and more importantly means we will not have a consistent return value.

//Function 5

function sum(a, b) {
  return 3.1415;
}
// This is not a pure function because the return value has no connection to the passed in arguments.


//The Math methods that deal with angle measurements all expect and return values in radians instead of degrees. Mathematically, radians are easier to work with,
//so nearly all languages use radians for circle and arc calculations. Use the Math.PI property to create a function that converts radians to degrees.

//  	1 Radian is about 57.2958 degrees

function radianToDegrees(r) {
  return (r * 180) / Math.PI
}

console.log(radianToDegrees(1));

/*
To convert a positive integer to a negative integer, you can just place a minus sign in front of the variable that contains the integer. However,
if you don't know whether the original value is negative you may inadvertently convert your variable to the wrong value. You can use the Math.abs
method to simplify matters by forcing a value positive. For this problem, create a variable with a value of -180, then use Math.abs to log the positive
value of the variable. */

let negativeVar = -180
console.log(Math.abs(negativeVar))


/*
Math.random returns a random floating-point number between 0 and 1, excluding the exact value of 1. This isn't helpful on its own, since you usually want
a random integer between two other integer values. Create a function that takes two arguments, a minimum and a maximum value, and returns a random integer
between those numbers (including both of the numbers). Your solution should handle the scenario that the user inadvertently swaps the positions of the min
and max values or the scenario that the min and max values are equal. You may assume that the user always provides the min and max values.

*/

function randomize(min, max) {
  if (max < min) {
  [min, max] = [max, min]
  } else if (min === max ) {
    return max;
  }
  return Math.floor((Math.random() *  (max - min + 1) + min))
}


log(randomize(1, 5))


let today = new Date()
//log(today)


//Log a string, "Today's day is 5", that tells the current day of the week as a number between 0 and 6 (Sunday is 0, Saturday is 6).
// Use the getDay method to obtain the number of the day of week.

//The getDay method, like many of the get methods on the date object, returns a zero-based index of the current day of week instead of the day name.
// This enables support for multiple locales and formats. Modify the output message of the previous problem to show the 3-letter day name abbreviation.
//You may use the following array:
let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];



//log(`Today's day is ${daysOfWeek[today.getDay()]}`)


//Let's add the calendar date (the day of month) to our log message: "Today's date is Mon, the 6th". Use the getDate method to obtain the current day of month.
//Don't worry about using different suffixes for numbers that end with 1, 2, or 3 just yet; we'll deal with that in the next problem.

dayOfMonth = today.getDate();



//log(`Today's day is ${daysOfWeek[today.getDay()]} the ${dayOfMonth}`)


//Ideally, the suffix on the day number needs to adjust to the proper suffix for days like the 1st, 22nd, and 3rd. Write a function named dateSuffix that takes the day
//of month as a numeric value and returns the formatted day of month and suffix. Make sure you use the correct suffixes.

let dateSuffix = function(date) {
  let digit = String(date);
  if (digit.endsWith('11') || digit.endsWith('12') || digit.endsWith('13')) {
    return digit.concat('th')

  } else if (digit.endsWith('1')) {
    return digit.concat('st')

  } else if (digit.endsWith('2')) {
    return digit.concat('nd')
  } else if (digit.endsWith('3')) {
    return digit.concat('rd')
  } else
  return digit.concat('th')

}


//log(dateSuffix(112));




//log("Today's date is " + daysOfWeek[today.getDay()] + ', the ' + dateSuffix(today.getDate()));


//Change your output to include the value from the getMonth method. Thus, the logged string will read "Today's date is Mon, 11 6th",
//  where 11 is the month number returned by getMonth.
let month = today.getMonth() ;

let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

//log("Today's date is " + daysOfWeek[today.getDay()]  + ', '  + months[month] + ' ' + dateSuffix(today.getDate()));



//Our call to console.log is getting cluttered. Let's clean things up a bit and refactor the code into a few formatting functions that we can call
// from anywhere in our code. Create formattedMonth and formattedDay functions to format the month and day, then write a formattedDate function that pulls
//everything together and logs the fully formatted date.
function formattedMonth(date) {
  let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return months[date.getMonth()];
}

//log(formattedMonth(today))

function formattedDay(date) {
  let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return daysOfWeek[date.getDay()];
}

log(formattedDay(today))

function formattedDate(date) {
  let day = formattedDay(date)
  let month = formattedMonth(date);


 log(`Todays date is ${day}, ${month} ${dateSuffix(date.getDate())}`)
}


formattedDate(today)



//Create a new date object variable named tomorrow that contains a Date object. Initialize the variable by setting it to the value of today.
//You can get the value of today using the getTime method. Next, change the date on the tomorrow object to the day after today: you should use setDate
//to change the date. Finally, log the tomorrow object with your formattedDate function.

let tomorrow = new Date(today.getTime())
 tomorrow.setDate(tomorrow.getDate() + 1)
log(formattedDate(tomorrow))



//Finally, write a function named formatTime that takes a date object as an argument and returns a string formatted with the hours and minutes as "15:30".
//Make sure you handle the case where the hours or minutes has only one digit: you need to pad the value with a leading zero in such cases, e.g., "03:04".
//You can use the getHours and getMinutes methods to obtain the hours and minutes.

/* PEDAC

Explicit:
input is a date object
output is a string formatted in hours and minutes.  e.g. ('18:25')
must deal with cases where the hours or minutes are noly 1 digit. When that is the case you can pad the value wih leading zeros ('00:04)
you can use the getHours and getMinutes methodds to get the hours and minutes


DS: input date object
   output modified string
   use a string to modify values


A:
declare timeFormatted to an empty string
declare variables hour and minutes. this will convert the date object into the number that matches those values.
if hour < 10 then prepend a '0' to timeFormatted then append a string version of hour to timeFormatted
 otherwise just append a string version of  hour to timeFormatted
append the ':' in between.
 if time < 10 then append a '0'
 append a '0' to the end of timeFormatted and then a string version of the hour
 otherwise append a string version of the hour to timeFormatted
 return timeFormatted

*/


let formatTime = function(timeObj) {
  let timeFormatted = ''
  let hour = timeObj.getHours()
  let minutes = timeObj.getMinutes()
  if (hour < 10) {
    timeFormatted += '0'
    timeFormatted += String(hour)
  } else
  timeFormatted += String(hour)

  timeFormatted += ':'
  if (minutes < 10) {
    timeFormatted += '0'
    timeFormatted += String(minutes)
  } else
  timeFormatted += String(minutes)

  return timeFormatted

}

formatTime(today)
randomDay = new Date('January 5, 2005 01:12')
formatTime(randomDay)



/*
Write a function that takes two arguments, an array and an object. The array will contain two or more elements that, when combined with spaces,
produce a person's full name. The object will contain two keys, title and occupation, and suitable values for both items. Your function should log a
greeting to the console that uses the person's full name, and mentions the person's title and occupation.

Example:

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// console output
Hello, John Q Doe! Nice to have a Master Plumber around.

PEDAC

Explicit:
two arguments. An array that contains two or elements that when combined with spaces makes a person's full name.
and an object that has two keys for a title and occupation. And proper values for each key.
The output logs a string that outputs a message about the person's name (can be two elements for first and last, or more) and then says a message about the persons
title and occupation.

Implicit:
a middle name could be an additional array element.

DS: input array and objecctt
    output string
    can utilize splitting up the string and accessing object key values.


A:
for let's initialize var strName to the result of joining up the array with spaces.
now we simply have to interpolate string.
output a string that interpolates Hello, (strName and then !). Followed by Nice to have a (access the value of the title and then occupation here) around

*/


let object = {title: 'senior', occupation: 'software engineer'}
let myName = ['Michael', 'T', 'Turner']

function greetings(arr, job) {
  strName = arr.join(' ')

  log(`Hello, ${strName}! Nice to have a ${job['title']} ${job['occupation']} around`)
}


greetings(myName, object)




/*

Implement a function that takes a String as an argument and returns an object that contains a count of the repeated characters.

repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
repeatedCharacters('Pet');            // {}
repeatedCharacters('Paper');          // { p: 2 }
repeatedCharacters('Baseless');       // { s: 3, e: 2 }

Note that repeatedCharacters does a bit more than simply count the frequency of each character: it determines the counts, but only returns counts for characters
 that have a count of 2 or more. It also ignores the case.

PEDAC

Explicit:
the input takes a string.
output returns a object with a key of each unique string character and the value being it's occurrences in the input str
This object only adds keys and their frequency if the frequency is >= 2


Implicit:
If there are more than one of the same key than than there is only one of those added as the key and all of it's occurences are checked for the value.
If there are no characters with a count >= 2 than an empty object is returned
upper case and lower case values count the same. So must account for this. the hash values always use lower case letters.

DS: input is string
    Output is an object.
    iteration will be used to create the object.


A: We will need two loops. One for the initial iteration of characters and a second to compare each individual character to the above iteration.
   initialize counter to 0
   reassign str to the same str but all lowercase values.
   iterate through the first loop with outerIndex set to 0. Loop through until it is greater than the size of the str
    Now loop through once more with the innerIndex set to 0. The logic will be the same here.
    within this loop we will have our main logic. first we want to make sure that the current value is not already apart of our freqency object. So we will check to see if
    there is a key. If there is. Then we skip this current loop.
    within the inner loop compare the str value at index of the outer loop to each value of the index of the inner loop.
    if the value matches then increment the counter.
    if the counter is >= 2 then add the outer value index as the key and the counter as the value.
    in the outer index set the counter to 0 once more.

    return frequency



*/

function repeatedCharacters(str) {
  let frequency = {};
  str = str.toLowerCase();

  for (let outerIndex = 0; outerIndex < str.length; outerIndex++) {
    if (frequency[str[outerIndex]] === undefined) {  // Check if the character is not yet tracked
      let counter = 0;
      for (let innerIndex = 0; innerIndex < str.length; innerIndex++) {
        if (str[outerIndex] === str[innerIndex]) {
          counter++;  // Increment counter for each occurrence
        }
      }

      if (counter > 1) {  // Only add to frequency if it occurs more than once
        frequency[str[outerIndex]] = counter;
      }
    }
  }

  console.log(frequency);
}


repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
repeatedCharacters('Pet');            // {}
repeatedCharacters('Paper');          // { p: 2 }
repeatedCharacters('Baseless');       // { s: 3, e: 2 }
