"use strict"

function log(input) {
  return console.log(input)
}


//1. Read through the code shown below. What does it log to the console at lines 13 and 18?

let myArray = [1, 2, 3, 4];
const myOtherArray = myArray;

myArray.pop();
console.log(myArray);
console.log(myOtherArray);
// This will log [1, 2, 3] as on line 2 the array `myOtherArray` is initialized to the same object array as `myArray` so when the mutating method `pop()` is invoked on that
// object this is reflected in `myOtherArray` as well.
myArray = [1, 2];
console.log(myArray);
console.log(myOtherArray);
// This will log [1, 2, 3] as now `myArray` has been assigned to another array object and no longer points to the same object as `myOtherArray`.


/*
2. Array Copy Part 2

In the previous exercise, the value of the reference gets copied. For this exercise, only the values of the array should be copied,
but not the reference. Implement two alternative ways of doing this.

Here is the code from the previous exercise:

let myArray = [1, 2, 3, 4];
const myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);
*/



let array = [1, 2, 3, 4]

let copyValues = array.slice(0)
array[0] = 4
log(array) // the original array has been modified
log(copyValues) // even though the original array was modified the new array has a new copy and has it's own copy of it's values.

let newArray = array.map((num) => num )

array[0] = 1
log(array)
log(newArray) // map returns a new array object that has it's own copies of the array values


/*


3.Array Concat Part 1

In this exercise, you will learn more about Arrays by implementing your own version of the Array.prototype.concat method.
 Write a function that returns a new array composed of all values from the first array argument and the second array or value argument.
 Take note of the following specifications when writing your concat function.

    The first argument will always be an array.
    The second argument can be either an array or another value.
    The function should return a new array.
    The elements in the new array should be in the same order as they appear in the arguments.
    The function should copy any object references from the arguments into the new array — i.e., if you make a change to a reference object
    from one of the arguments after calling concat, those changes should show up in the output array as well.
    The function should copy the values of primitives (e.g., strings, numbers, and booleans).

Examples:

function concat(array1, secondArgument) {
  // ...
}

concat([1, 2, 3], [4, 5, 6]);          // [1, 2, 3, 4, 5, 6]
concat([1, 2], 3);                     // [1, 2, 3]
concat([2, 3], ['two', 'three']);      // [2, 3, "two", "three"]
concat([2, 3], 'four');                // [2, 3, "four"]


const obj = { a: 2, b: 3 };
const newArray = concat([2, 3], obj);
newArray;                              // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
newArray;                              // [2, 3, { a: "two", b: 3 }]

const arr1 = [1, 2, 3];
const arr2 = [4, 5, obj];
const arr3 = concat(arr1, arr2);
arr3;                                  // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
obj.b = 'three';
arr3;                                  // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

arr3[5].b = 3;                         // or, `arr3[5]['b'] = 3;`
obj;                                   // { a: "two", b: 3 }

If you are using the Chrome DevTools console, it is important to be aware that the value of any array/object nested within another array/object will not be
evaluated until after all code has been executed:

Chrome console example

This can cause some of the objects in the test cases to appear as if they have been mutated before they really have been. If you experience this issue,
just add another line (right after the line logging the array in question) to log the nested object directly:

console.log(newArray);       // [2, 3, { a: "two", b: 3 }] -- displayed value
console.log(newArray[2]);    // { a: 2, b: 3 }             -- actual value


A;
First initialize and declare concatArr to an empty array
since we know we want to add all of the elements from the first input array first we can iterate through a loop until we reach an index greater than the first input size
and append each value to the new array.

now for the second argument it can be many different types. it is important to note that all changes to references in the argument must be reflected in the concatted array.
We must check if the object is an array. Because if so we will make another loop and add those values to concatArr.
else we will simply add that primitive/object to concatArr
*/



let concat = function(arr1, arg2) {
  let concatArr = [];
  for (let i = 0; i < arr1.length; i++) {
    concatArr.push(arr1[i])
  }
  if (Array.isArray(arg2)) {
    for (let i = 0; i < arg2.length; i++) {
      concatArr.push(arg2[i])
    }

  } else {
    concatArr.push(arg2)
  }
  return concatArr
}

concat([1, 2, 3], [4, 5, 6]);          // [1, 2, 3, 4, 5, 6]
concat([1, 2], 3);                     // [1, 2, 3]
concat([2, 3], ['two', 'three']);      // [2, 3, "two", "three"]
concat([2, 3], 'four');                // [2, 3, "four"]



/*


4.  Array Concat Part 2

The concat function from the previous exercise could only concatenate a maximum of two arrays.
For this exercise, you are going to extend that functionality. Refactor the concat function to allow for the concatenation of two or more arrays or values.

Examples:

concat([1, 2, 3], [4, 5, 6], [7, 8, 9]);    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
concat([1, 2], 'a', ['one', 'two']);        // [1, 2, "a", "one", "two"]
concat([1, 2], ['three'], 4);               // [1, 2, "three", 4]




a: this is similar to the last problem except now we must account for more than two arrays to concatenate. So we have allow an n amount of arguments. And with that comes
making sure to check if every non 1st argument is an array or not.
first array logic will be the same.
second arg logic is mostly the same except we are extending that logic to each argument being passed in.
*/




let newConcat = function(arr1, ...arg) {
  let concatArr = [];
  for (let i = 0; i < arr1.length; i++) {
    concatArr.push(arr1[i])
  }
  if (Array.isArray(arg)) {
    for (let i = 0; i < arg.length; i++) {
      concatArr.push(arg[i])
    }

  } else {
    concatArr.push(arg)
  }
  log(concatArr)


}


newConcat([1, 2, 3], [4, 5, 6], [7, 8, 9]);    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
newConcat([1, 2], 'a', ['one', 'two']);        // [1, 2, "a", "one", "two"]
newConcat([1, 2], ['three'], 4);               // [1, 2, "three", 4]


/*
5. Array Pop and Push

In this exercise, you will implement your own version of two Array methods: Array.prototype.pop and Array.prototype.push.
The pop method removes the last element from an array and returns that element. If pop is called on an empty array, it returns undefined.
The push method, on the other hand, adds one or more elements to the end of an array and returns the new length of the array.


Examples:

// pop
const array1 = [1, 2, 3];
pop(array1);                        // 3
console.log(array1);                // [1, 2]
pop([]);                           // undefined
pop([1, 2, ['a', 'b', 'c']]);      // ["a", "b", "c"]

// push
const array2 = [1, 2, 3];
push(array2, 4, 5, 6);              // 6
console.log(array2);                // [1, 2, 3, 4, 5, 6]
push([1, 2], ['a', 'b']);          // 3
push([], 1);                       // 1
push([]);                          // 0


A: pop

if  the passed in value is empty then return undefined
otherwise we will capture the last element of the object in  a new variable finalElement.
remove the last element of the object (and make sure to mutate)
return finalElement

A: push

we will add each passed in argument at the position of the current length  as the index. if the argument is an array then we will iterate through a loop and pass in each element
otherwise just pass in the argument. account for a n amount of arguments.
we then will return the length of the passed in array
*/


function pop(arr) {
  if (arr.length === 0 ) {
    return undefined
  }
  let finalElement = arr[arr.length - 1]
  arr.length = arr.length - 1
  return finalElement
}
log("------------------")
const array1 = [1, 2, 3];
pop(array1);                        // 3
console.log(array1);                // [1, 2]
pop([]);                           // undefined
pop([1, 2, ['a', 'b', 'c']]);      // ["a", "b", "c"]



function push(arr, ...arg) {
  if (Array.isArray(arg)) {

    for (let i = 0; i < arg.length; i++) {
      arr[arr.length] = arg[i]
    }
  } else {
    arr[arr.length] = arg
  }
   return arr.length

}

const array2 = [1, 2, 3];
push(array2, 4, 5, 6);              // 6
console.log(array2);                // [1, 2, 3, 4, 5, 6]
push([1, 2], ['a', 'b']);          // 3
push([], 1);                       // 1
push([]);                          // 0



/*

6. Array and String Reverse

In this exercise, you will implement your own version of the Array.prototype.reverse method. Your implementation should differ from the built-in method
in the following two ways:

    It should accept either a string or an array as an argument.
    It should return a new string or array.

    A:
    the input can be a string or an array and both must be acounted for. First we check if the value is an array. if so
    declare the variable reversedArr to an empty arr
    iterate through a loop and set the index to the size of the arr - 1. iterate until the index is > -1
    append the current index value of the array to reversedArr and
    outside of the loop return the array

    if the argument is a string
    declare reversedStr
    follow the same loop logic
    add the value of the current string index to reversedStr

    outside of the loop return reversedStr




*/

function reverse(inputForReversal) {
  if (Array.isArray(inputForReversal)) {
    return reverseArr(inputForReversal)
  } else
  return reverseStr(inputForReversal)

}

function reverseArr(arr) {
  let reversedArr = [];
  for (let i = arr.length - 1 ; i >  -1; i--) {
    reversedArr.push(arr[i])
  }
  return reversedArr
}

function reverseStr(str) {
  let reversedStr = ''
    for (let i = str.length - 1; i > -1; i--) {
      reversedStr += str[i]
    }
    return reversedStr
}

reverse('Hello');           // "olleH"
reverse('a');               // "a"
reverse([1, 2, 3, 4]);      // [4, 3, 2, 1]


/*
7. In this exercise, you will implement your own versions of the Array.prototype.shift and Array.prototype.unshift methods.
 These methods manipulate the contents of an array starting from the first index.

The shift method removes the first element from an array and returns that element; if the array is empty, shift returns undefined.
 The unshift method adds one or more elements to the start of an array and returns the new length of the array. Both methods mutate the original array.

Examples:

shift([1, 2, 3]);                // 1
shift([]);                       // undefined
shift([[1, 2, 3], 4, 5]);        // [1, 2, 3]

unshift([1, 2, 3], 5, 6);        // 5
unshift([1, 2, 3]);              // 3
unshift([4, 5], [1, 2, 3]);      // 3

const testArray = [1, 2, 3];
shift(testArray);                // 1
testArray;                       // [2, 3]
unshift(testArray, 5);           // 3
testArray;                       // [5, 2, 3]


A: shift
if the array is empty return undefined
declare variable firstValue and set to the first index of the input arr
iterate through a loop that starts at zero until the index is greater than the length of the input arr.
take the current position of the input array at index and set it to shift over one position to the right (array at index + 1)
This will essentially remove the first index and cause an undefined value to be inserted since there is no value at the out of bound arr position.
remove the last element from the array
return firstValue

A: unshift
initialize and declare newLength
iterate throguh a loop. initialize the index to the size of the array - 1. Iterate through the loop while the index is >= 0
set the current array at the index value + 1 to the current index value

now the first two indexes should be the same values. Set the first index to the passed in argument.
return the mutated arrays size




*/


let shift = function(arr) {
  if (arr.length === 0 ) {
    return undefined
  }
  let firstValue = arr[0]
  for (let i = 0; i < arr.length; i++) {
    arr[i] = arr[i +1]
  }
  arr.length = arr.length - 1
  return firstValue
}



shift([1, 2, 3]);                // 1
shift([]);                       // undefined
shift([[1, 2, 3], 4, 5]);        // [1, 2, 3]

let unshift = function(arr, ...arg) {
  // Shift original elements to the right by arg.length positions
  for (let i = arr.length - 1; i >= 0; i--) {
      arr[i + arg.length] = arr[i];

  }

  // Insert each new element from arg into the beginning of arr
  for (let j = 0; j < arg.length; j++) {

      arr[j] = arg[j];
  }
   return arr.length

};


unshift([1, 2, 3], 5, 6);        // 5
unshift([1, 2, 3]);              // 3
unshift([4, 5], [1, 2, 3]);      // 3





/*


8. Array Slice and Splice

In this exercise, you will implement your own versions of the Array.prototype.slice and Array.prototype.splice methods according to the following specifications.

The slice function takes three arguments: an array, and two integers representing a begin and an end index. The function returns a new array containing the
 extracted elements starting from begin up to but not including end. slice does not mutate the original array.

The splice function changes the contents of an array by deleting existing elements and/or adding new elements. The function takes the following arguments: an array,
a start index, a deleteCount, and zero or more elements to be added. The function removes deleteCount number of elements from the array, beginning at the start index.
If any optional element arguments are provided, splice inserts them into the array beginning at the start index. The function returns a new array
 containing the deleted elements, or an empty array ([]) if no elements are deleted. splice mutates the original array.

Additional specifications:

slice:

    The values of begin and end will always be integers greater than or equal to 0.
    If the value of begin or end is greater than the length of the array, set it to equal the length.

splice:

    The values of start and deleteCount will always be integers greater than or equal to 0.
    If the value of start is greater than the length of the array, set it to equal the length.
    If the value of deleteCount is greater than the number of elements from start up to the end of the array, set deleteCount to the difference between the array's
    length and start.
    Takes optional arguments for elements to add to the array; denoted by the rest parameter ...args. If no elements to add are provided, splice only removes elements
  from the array.

Examples:

function slice(array, begin, end) {
  // ...
}

slice([1, 2, 3], 1, 2);               // [2]
slice([1, 2, 3], 2, 0);               // []
slice([1, 2, 3], 5, 1);               // []
slice([1, 2, 3], 0, 5);               // [1, 2, 3]

const arr1 = [1, 2, 3];
slice(arr1, 1, 3);                     // [2, 3]
arr1;                                  // [1, 2, 3]

function splice(array, start, deleteCount, ...args) {
  // ...
}

splice([1, 2, 3], 1, 2);              // [2, 3]
splice([1, 2, 3], 1, 3);              // [2, 3]
splice([1, 2, 3], 1, 0);              // []
splice([1, 2, 3], 0, 1);              // [1]
splice([1, 2, 3], 1, 0, 'a');         // []

const arr2 = [1, 2, 3];
splice(arr2, 1, 1, 'two');             // [2]
arr2;                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
splice(arr3, 1, 2, 'two', 'three');    // [2, 3]
arr3;                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
splice(arr4, 1, 0);                    // []
splice(arr4, 1, 0, 'a');               // []
arr4;                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
splice(arr5, 0, 0, 'a');               // []
arr5;                                  // ["a", 1, 2, 3]



A: slice:
The function will take 3 input's the array and an integer representing the start and end value
so if begin or end is greater than the length of the array. if either the begin or end is greater than the length of the array then set that value to the length


if start is the size of the length or if end is 0 then return an empty array.

Otherwise we can set an index to the size of start + 1. Iterate until the index is the size of end. and increment the loop.


A: splice
We will utilize our helper function from before to check if start is greaterthan the size of the arr.length. if so set it to the length size.
if the deleteCount is higher  than the value of the start up to the end of the array. than we will set that value to the difference between the arr length and the start.
initialize deletedValuesArr to an empty arr
iterate through a loop and set the index to the start value. iterate until the index is equal to the index + the end value. increment by 1
at each iteration set the value of the index of the input arr to append to deletedValuesArr


*/

let arr = [1, 2, 3, 4, 5]

log(arr.splice(2, 9))
function setStartAndEnd(arr, value) {
  if (value > arr.length) {

    value = arr.length
  }

  return value
}

function slice(arr, start, end) {
  let slicedArr = []
  start = setStartAndEnd(arr, start)
  end = setStartAndEnd(arr, end)


  if (start === arr.length || end === 0) {
    return [];
  }
  for (let i = start ; i < end; i++) {
    slicedArr.push(arr[i])

  }
  return slicedArr

}

slice([1, 2, 3], 1, 2);               // [2]
slice([1, 2, 3], 2, 0);               // []
slice([1, 2, 3], 5, 1);               // []
slice([1, 2, 3], 0, 5);               // [1, 2, 3]

/*
set start to the array length if it is greater than the array length or keep as start otherwise
set deletecount to the array length - start if it is greater than the difference between array length and the start; otherwise keep as deleteCount
since we are going to be essentially replacing elements at first we need to have a copy of our input array to keep up with the values we will replace.
make a copy of the input array and initialize it as arrayCopy
declare a constant elementCount to be the size of the length of the passed in arguments.
declare a constant newLength which will be rhe result of adding the array length and elementCount and then subtracting the deleteCount. This will be essentially the amount of new
values we will be adding
set the array length to the newLength value


Iterate through a loop and set the index to 0. iterate until the index is greater than elementCount. Increment by 1
within this loop set the place of the index value + 1 at in the current array to the current index value of within the argument.
This will insert any new elements into the original array

Now we have to place back our values that we replaced from the original array. We can do that by using the arrayCopy
initialize copyBackCount to the result of taking the length of arrayCopy and subtracting the sum of start and deleteCount. This will give us the position that is where
we left off after adding our new values (or if we added none)
now  loop and set the index to 0. loop until the index is greater than the copyBackCount. Increment by 1
The postion we are placing back into the original array will be set by the array at index value  start + elementCount  + index  which will be set to equal
arrayCopy at index value start + delete + index.

Finally we will return an array of the values we have removed which can be done by slicing the ArrayCopy and having a start position of start, and an end position of
start + deleteCount


*/

function splice(array, start, deleteCount, ...args) {
  start = start > array.length ? array.length : start;
  deleteCount = deleteCount > (array.length - start) ? array.length - start : deleteCount;

  const arrayCopy = slice(array, 0, array.length);
  const elementCount = args.length;
  const newLength = array.length + elementCount - deleteCount;

  array.length = newLength;



  for (let i = 0; i < elementCount; i += 1) {

    array[start + i] = args[i];

  }

  let copyBackCount = arrayCopy.length - (start + deleteCount);
  for (let i = 0; i < copyBackCount; i += 1) {
    log(i)
    array[start + elementCount + i] = arrayCopy[start + deleteCount + i];
  }

  return slice(arrayCopy, start, start + deleteCount);
}
/*
splice([1, 2, 3], 1, 2);              // [2, 3]
splice([1, 2, 3], 1, 3);              // [2, 3]
splice([1, 2, 3], 1, 0);              // []
splice([1, 2, 3], 0, 1);              // [1]
splice([1, 2, 3], 1, 0, 'a');         // []
*/


/*
9.Array Comparison

The array comparison function that we implemented in the Arrays lesson (Alternate link if the previous link doesn't work) implicitly assumed
that when comparing two arrays, any matching values must also have matching index positions. The objective of this exercise is to reimplement the function so that
two arrays containing the same values—but in a different order—are considered equal. For example, [1, 2, 3] === [3, 2, 1] should return true.

Examples:

function areArraysEqual(array1, array2) {
  // ...
}

areArraysEqual([1, 2, 3], [1, 2, 3]);                  // true
areArraysEqual([1, 2, 3], [3, 2, 1]);                  // true
areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']);      // true
areArraysEqual(['1', 2, 3], [1, 2, 3]);                // false
areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]);            // true
areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]);            // false
areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]);            // false
areArraysEqual([1, 1, 2], [1, 2, 2]);                  // false
areArraysEqual([1, 1, 1], [1, 1]);                     // false
areArraysEqual([1, 1], [1, 1]);                        // true
areArraysEqual([1, '1'], ['1', 1]);                    // true


A:
if both arrays are not the same length then return false
some arrays have the same size but include different counts of particulat values. This would result in being false
iterate through  a loop. set index to 0. iterate until index is greater than arr2.length. increment by 1
at each iteration compare the result of the count of occurences at arr1 with the value of the current index of arr1 with the count of occurrences at arr2 with the value of the current index of arr1
if any value returns false.
return false.
otherwise return true

to get the count of occurrences. you take an input array and value
iterate through a loop and get a count and current value. set the count  to start at 0. if the current index value matches the count then increment the count by 1.
otherwise leave the count.
return the result of the count

*/

function countOccurrences(array, value) {
  return array.reduce((count, current) => (current === value ? count + 1 : count), 0);
}




function areArraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) {
    return false
  }
  for (let i = 0; i < arr2.length; i++) {
    if (countOccurrences(arr1, arr1[i]) !== countOccurrences(arr2, arr1[i])) {
      return false;
    }
  }
return true

}


console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(areArraysEqual([1, 1], [1, 1]));                        // true
console.log(areArraysEqual([1, '1'], ['1', 1]));                    // true

