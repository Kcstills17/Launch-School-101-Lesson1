"use strict"
let rlSync = require('readline-sync');

function log(input)  {
  return console.log(input);
}

/*


1.Cute Angles

Write a function that takes a floating point number representing an angle between 0 and 360 degrees and returns a string representing
 that angle in degrees, minutes, and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes,
  and a double quote (") to represent seconds. There are 60 minutes in a degree, and 60 seconds in a minute.

Note: You can use the following constant to represent the degree symbol:

PEDAC
E:
we are given an input that is a floating point numnber and represents an angle between 0 and 360 degrees
the output is a string that represents the angle in degrees, minutes. and seconds.
they are represented by °, ', and " respectively.
There are 60 minutes in a degree and 60 seconds in a minute.

const DEGREE = '\u00B0';

Examples:
*/
const DEGREE = '\u00B0';
const MINUTES_PER_DEGREE = 60;
const SECONDS_PER_MINUTE = 60;
const SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE;

function dms(degreesFloat) {
  const degreesInt = Math.floor(degreesFloat);
  const minutes = Math.floor((degreesFloat - degreesInt) * MINUTES_PER_DEGREE);

  const seconds = Math.floor(
    (degreesFloat - degreesInt - (minutes / MINUTES_PER_DEGREE)) *
    SECONDS_PER_DEGREE
  );

  return `${String(degreesInt) + DEGREE + padZeroes(minutes)}'${padZeroes(seconds)}"`;
}

function padZeroes(number) {
  const numString = String(number);
  return numString.length < 2 ? (`0${numString}`) : numString;
}

// All test cases should return true
//console.log(dms(30) === "30°00'00\"");
//console.log(dms(76.73) === "76°43'48\"");
console.log(dms(254.6) === "254°35'59\"");
//console.log(dms(93.034773) === "93°02'05\"");
//console.log(dms(0) === "0°00'00\"");
//console.log(dms(360) === "360°00'00\"" || dms(360) === "0°00'00\"");




/*
2. Combining Arrays

Write a function that takes two arrays as arguments and returns an array containing the union of the values from the two.
 There should be no duplication of values in the returned array, even if there are duplicates in the original arrays. You may assume that both arguments will always be arrays.

Example:
P:
given two arrays for the input.
Return a new array thay is the unioin of the values from the two arrays
There will be no duplication of values in the returned array.  (aka if both arrays have the same value only 1 should appear in the new array)
Assume both arguments are always arrays

A:
We use the same logic for both arrays. iterate through and check to see if the current value already exists in the new array. If so we skip, otherwise we append to the new array.
this logic can be in a separate function addValues().
initialize mergedArr to an empty arr
invoke addValues on each arrays and pass in mergedArr as the array that will be added to.

*/

let addValues = function(arr, resultArr) {
  arr.forEach(function(elem) {
    if (resultArr.indexOf(elem) === -1) {
      resultArr.push(elem)
    }
  })
  return resultArr
}


let union = function(arr1, arr2) {
  let mergedArr = []
  addValues(arr1, mergedArr)
  addValues(arr2, mergedArr)
  return mergedArr
}

union([1, 3, 5], [3, 6, 9]);    // [1, 3, 5, 6, 9]


/*

3. Halvsies

Write a function that takes an array as an argument and returns an array that contains two elements, each of which is an array.
Put the first half of the original array elements in the first element of the return value, and put the second half in the second element.
If the original array contains an odd number of elements, place the middle element in the first half array.


P:
We are given an array input.
our output is two arrays which represents the input array being split in two.
if the values are even we simply have the first half values in the first array and the second half values in the second.
if there is an odd amount of elements. the middle element will go in the first half array. e.g. [6] -> [[6], []]

A:
initialize resultArr
if the input is empty then return an empty array
given that we are creating two arrays based on a halfway point we will declare halfWayPoint to the result of dividing the length of the input array by 2.
when the input array length is even then we will set the logic of incrementing through a loop to if the index is smaller than the halfwaypoint then we add to firsHalf.
if it is odd we will use the logic that if it is smaller or equal then we will add to firstHalf

iterate through a loop starting at 0 until you are greater than the length of the input array.
if the current index is smaller or equal to the halfPoint this will be appended to firstHalf.
otherwise append to lastHalf.
push both these arrays to resultArr and return the value


Examples:


*/

let addCorrectElements = function(arr, half, first, last) {
for (let i = 0; i < arr.length; i++) {
  if(arr.length % 2 === 0) {
    if (i < half) {
      first.push(arr[i])
    } else {
      last.push(arr[i])
    }
  } else {
    if (i <= half) {
      first.push(arr[i])
    } else {
      last.push(arr[i])
    }
  }
}
}

function halvsies(arr) {
  let halfpoint = (Math.floor(arr.length / 2 ))
  let [firstHalf, lastHalf] = [[], []]
  let resultArr = []
  addCorrectElements(arr, halfpoint, firstHalf, lastHalf)
  resultArr.push(firstHalf, lastHalf)
  return resultArr
}

halvsies([1, 2, 3, 4]);       // [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]);    // [[1, 5, 2], [4, 3]]
halvsies([5]);                // [[5], []]
halvsies([]);                 // [[], []]



/*
4. Find the Duplicate

Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once),
determine which value occurs twice. Write a function that will find and return the duplicate value that is in the array.

P:
we are given an input array
each value occurs one time in the array except for one exception.
The output is to return that one duplicate value

initialize checkArr to an empty arr.
iterate through a loop from 0 until greater than the length of the arr.
if checkArr does not include the value at the current index append it to checkArr
if it does. Break out of the loop and return that valuee

Examples:
*/

let findDup = function(arr) {
  let checkArr = []
  for (let i = 0; i < arr.length; i++) {
   if (!checkArr.includes(arr[i])) {
      checkArr.push(arr[i])
    } else {
      return arr[i]
    }
  }

}

log(findDup([1, 5, 3, 1]));                                // 1
log(findDup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
         38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
         14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
         78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
         89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
         41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
         55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
         85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
         40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7, 34, 57, 74, 45, 11, 88, 67,  5, 58]));    // 73




          /*


5. Combine Two Lists

Write a function that combines two arrays passed as arguments, and returns a new array that contains all elements from both array arguments,
with each element taken in alternation.

You may assume that both input arrays are non-empty, and that they have the same number of elements.

P:
We are given two arrays as an input
output is a new array thay contains all elements from the two arrays in alternating order (starting with the 1st list)
in this case all tests are non empty and the same size

A:
initialize and declare resultArr to an empty array
iterate through a loop setting the index to 0 until it is greater than either of the argument arrays.
at each iteration first push the current index from arr1 to the resultArr and then the current index value at arr2 to resultArr
finish the loop and return resultArr

Example:
*/

let interleave = function(arr1, arr2) {
  let resultArr = [];

  for (let i = 0; i < arr1.length; i++) {
    resultArr.push(arr1[i])
    resultArr.push(arr2[i])
  }
  return resultArr;
}
interleave([1, 2, 3], ['a', 'b', 'c']);    // [1, "a", 2, "b", 3, "c"]


/*


6. Multiplicative Average

Write a function that takes an array of integers as input, multiplies all of the integers together, divides the result by the number of entries in the array,
 and returns the result as a string with the value rounded to three decimal places.

 P:
 we are given an array of integers as input
 our output is a string resulting from multiplying all of the values of the array, dividing by the total number of values in the array. Then returning the result rounded to 3
 decimal places

 A:

 we will store a result of multiplying each value from our input list into a product at each iteration. each new value will be times  the product.
 initiailize mean to the result of dividing the product by the total amount of elements in the list.
 once we have finished the iteration we will format the sum to have 3 decimal places and to be a string.
 return this result

Examples:
*/

function showMultiplicativeAverage(arr) {
  let product = arr.reduce((accumulator, element) => accumulator * element, 1)
  let mean = product / arr.length
  return mean.toFixed(3)

}


showMultiplicativeAverage([3, 5]);                   // "7.500"
showMultiplicativeAverage([2, 5, 7, 11, 13, 17]);    // "28361.667"



/*

7. Multiply Lists

Write a function that takes two array arguments, each containing a list of numbers, and returns a new array that contains the product of each pair of numbers
from the arguments that have the same index. You may assume that the arguments contain the same number of elements.


P:
We are given two input arrays.
the output is a new array which is the result of a product betweeen the index values at equal positions of both arrays. e.g. arr1[0] * arr2[0]
the tests will always have the same amount of elements

A:
iterate through arr1. We are going to be returning a brand new array of values. initiailize this array as productArr
get each index from list. multiply the value at the current index from arr1 and arr2 and return that at each iteration.
return productArr

Example:
*/

function multiplyList(arr1, arr2) {
  let productArr = arr1.map(function(element, idx) {
    return element * arr2[idx]
  })
  return productArr
}

multiplyList([3, 5, 7], [9, 10, 11]);    // [27, 50, 77]


/*
8. Digits List

Write a function that takes one argument, a positive integer, and returns a list of the digits in the number.

P :
input is a integer
output is an array that is a result of taking each individ. number from the input and adding to the list,

A:

initialize and declare digitStr as as a result of converting the input number into strings.
split the string apart by each digit. initiailzie this as strArr
iterate through each digit and convert to a number. return this array


Examples
*/

let digitList = function(number) {
  let digitStr = String(number)
  let numArr = digitStr.split('')
  return numArr.map(function(digit) {
    return Number(digit)
  })
}

digitList(12345);       // [1, 2, 3, 4, 5]
digitList(7);           // [7]
digitList(375290);      // [3, 7, 5, 2, 9, 0]
digitList(444);         // [4, 4, 4]


/*

9. How Many

Write a function that counts the number of occurrences of each element in a given array. Once counted, log each element alongside the number of occurrences.

Example:

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'suv', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

 let length = word.length;
      // Increment the count for the current word length, or initialize it if it doesn't exist yet
      counts[length] = (counts[length] || 0) + 1;

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
// suv => 1

P:
input is an array
output is several string outputs. Each line will reference a string value and the amount of times it occurs in the array. e.g. car => 4
it is case insensitive.

DS: Since we are dealing with occurences of values in an array. An object may be the best ds to store the string value and it's occurences

A:
initialize wordCount to an empty obj.
iterate through the input array and get each word.
initiailize and declare length to the length of the current word being iterate over.
set the current key- value pair in wordCount to 0 (for new encountered words) or to add plus 1 for future instaces.

iterate through wordCount and log key => value

*/

let countOccurrences = function(arr) {
  let wordCount = {};

  for (let i = 0; i < arr.length; i++) {
    let word = arr[i]
    wordCount[word] = (wordCount[word] || 0) + 1
  }

  Object.keys(wordCount).forEach(function(key) {
    log(`${key} => ${wordCount[key]}`)
  })

  }



const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'suv', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);


/*
Array Average

Write a function that takes one argument, an array containing integers, and returns the average of all the integers in the array,
rounded down to the integer component of the average. The array will never be empty, and the numbers will always be positive integers.

P:
we are given an input array of integers.
the output is a number that is the result of getting the mean average of all  values. Then rounding down to the nearest whole number.
we will not have an empty array case and only deal with positive integers.


A:
initialize and declare sum as a result of iterating through and accumulating the total of each value.
initiailze and declare mean as a result of dividing by the length of the array
return the result of rounding mean down to the nearest whole number

Examples:
*/
let average = function(arr) {
  let sum = arr.reduce((accumulator, element) => accumulator + element, 0)
  let mean = sum / arr.length
  return Math.floor(mean)

}

average([1, 5, 87, 45, 8, 8]);       // 25
average([9, 47, 23, 95, 16, 52]);    // 40


