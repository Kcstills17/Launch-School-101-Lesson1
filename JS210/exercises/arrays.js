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

copyValues = array.slice(0)
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
if the array is empty return an empty array
declare variable firstValue and set to the first index of the input arr
iterate through a loop that starts at zero until the index is greater than the length of the input arr.
take the current position of the input array at index and set it to shift over one position to the right (array at index + 1)
This will essentially remove the first index and cause an undefined value to be inserted since there is no value at the out of bound arr position.
remove the last element from the array
return firstValue

A: unshift





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
