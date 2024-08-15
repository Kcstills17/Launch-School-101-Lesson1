

function log(input) {
    return console.log(input); 
}

/* 

Rotation Part 1

Write a function that rotates an array by moving the first element to the end of the array. Do not modify the original array.

    If the input is not an array, return undefined.
    If the input is an empty array, return an empty array.

Understand the Problem: 
we are to move the first element of an input array to the end of the array without mutating the original array 
we can assign the first element to a variable and assign the remaining new array to reference a new variable 
set the first element variable to be the last position of the new array 


Rules: 
Guard clauses: 
If the input is not an array we will return undefined
If the input is an empty array return an empty array 
Check to make sure the original array is not modified 
if the input is an array and a length of 1 then return a copy of that array 


Examples/test logic 
let arr = [1, 2, 3]





DS: create a new array to not modify the input array and then use that array to return. 


Algorithm: 
1. Guard Clause: if invalidInput (with an argument of the input) is not valid then return the result of invoking invalid input

1. initialize firstvalue to the first input value of the input array 
2. initialize remainingArr to a reference a copy of the input array sliced from position 1 forward to the entire array. 
3. set a new array value at position remainingArr length. Set this value to firstValue
4. return remainingArr 


invalidInput algo: 
1. if the input is not an array 
    1. regturn undefined 
2. if the input has a length of 0 return []
3. if the input has a length of 1 return a copy of the input 
4. return 'valid'


*/ 

function invalidInput(input) {
    if (!Array.isArray(input)) return;
    if (input.length === 0) return [];
    if (input.length === 1) return input.slice();
    return 'valid';
}

function rotateArray(input) {
   if (invalidInput(input) !== 'valid') {return invalidInput(input)}
   let firstValue = input[0]; 
   let remainingArr = input.slice(1); 
   remainingArr[remainingArr.length] = firstValue
   return remainingArr
}

rotateArray([7, 3, 5, 2, 9, 1]);       // [3, 5, 2, 9, 1, 7]
rotateArray(['a', 'b', 'c']);          // ["b", "c", "a"]
rotateArray(['a']);                    // ["a"]
rotateArray([1, 'a', 3, 'c']);         // ["a", 3, "c", 1]
rotateArray([{ a: 2 }, [1, 2], 3]);    // [[1, 2], 3, { a: 2 }]
rotateArray([]);                       // []

// return `undefined` if the argument is not an array
rotateArray();                         // undefined
rotateArray(1);                        // undefined


// the input array is not mutated
const array = [1, 2, 3, 4];
rotateArray(array);                    // [2, 3, 4, 1]
array;                                 // [1, 2, 3, 4]




/* 



2. Rotation Part 2

Write a function that rotates the last n digits of a number. For the rotation, rotate by one digit to the left, moving the first digit to the end.


Understand the Problem: 
n is the 1 based indexing value that we are sequencing from the right side of our input. 
we will get that value and shift it to the end of the digits input. 
This will shift all digits input values to the left as a result. 



Rules: 
only postive integers for n 
if n is 0 then return the input digits 
digits will always be a positive sequence of integers. 



Patterns/Sequences: 
last n digits start from the right. as 1 based count 
735291, 1 === 735291 
735291, 2 === 735219  
735291, 3 === 735912
735291. 4 ===  732915 
735291, 5 === 752913 
735291, 6 === 352917 

DS: 
an array to store the string versions of our digits.  reverse this 
remove the value that matches n - 1  and store in a variable 
reverse the array back to normal 
append the saved value. 
convert back into string and then finally into a number 


Algorithm: 

1. Guard clause: if n is 0 then return digits 
735291, 3 
19537   2 saved value 
73591
735912 

1. initialize reverseStrDigits to the result of converting the digits into string and splitting by each character. FInally reverse this array 
2. initialize savedValue to empty str 
3. create a copy of reverseStringDigits name reverseArrCopy 
2. iterate through from reverseStringDigits from index 0 until past the length of the array
    1. if the index + 1 matches n. then delete the value ar reverseArrCopy and reassign savedValue to the first index of this value (should be the only index )
3. initialize removedValueArr to the result of reversing reverseArrCopy back to it's oriinal order (shifted to the left to account for removed value)
4. append savedValue to the end of removedValueArr 
5. convert the value into string and then convert into a number. Return this value 





*/ 

function rotateRightmostDigits(digits, n) {
    if (n === 0 ) { return digits}; 
    let savedValue = ''
    let reverseStrDigits = String(digits).split('').reverse()
    let reverseArrCopy = reverseStrDigits.slice()

    for (let i = 0; i <= reverseStrDigits.length; i += 1) {
        if (i + 1 === n) {savedValue = (reverseArrCopy.splice(i, 1))[0]}; 
    }
    let removedValueArr = reverseArrCopy.reverse()
    removedValueArr.push(savedValue)
    return Number(removedValueArr.join(''))
}
rotateRightmostDigits(735291, 0) // 735291 
rotateRightmostDigits(735291, 1);      // 735291
rotateRightmostDigits(735291, 2);      // 735219
rotateRightmostDigits(735291, 3);      // 735912
rotateRightmostDigits(735291, 4);      // 732915
rotateRightmostDigits(735291, 5);      // 752913
rotateRightmostDigits(735291, 6);      // 352917




/* 
3. Rotation Part 3

Take the number 735291 and rotate it by one digit to the left, getting 352917. Next, keep the first digit fixed in place and rotate the remaining digits to get 329175.
 Keep the first two digits fixed in place and rotate again to get 321759. Keep the first three digits fixed in place and rotate again to get 321597. Finally,
  keep the first four digits fixed in place and rotate the final two digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a function that takes an integer as an argument and returns the maximum rotation of that integer. You can (and probably should) use the rotateRightmostDigits function
 from the previous exercise.

Understand The Problem: 
our first number in the index will be our original number that we rotate each digit until we reach this digit again. 
if the current next number to roate is not the original number value then we will contiunue to roatate. 
Otherwise we will finish the problem 


Rules: 
always will be an integer input. 
never will not be 1 input 
don't have to deal with empty values 


Pattern/Sequence: 
735291 -> 352917   // 7 shifted to left   idx 0  set originalNumber to this value 
352917 -> 329175   // 5 shifted to left (ignoring fixed first digit) idx 1 === 7 no so shift 
329175 -> 321759  // 9 shifted to the left (ignoring fixed two digits)  idx 2 === 7 ? no so shift 
321759 -> 321597 // 7 shifted to the left (ignoring fixed three digits)  idx 3 === 7 ? no so shift 
321597 -> 321579  // 9 shifted to the left (ingoring fixed four digits) idx 4 === 7 ? no so shift 
321579 // idx 5 === 7 ? yes so return out //  now we have reached the original first number again. We stop here at our maximum rotation. 

DS: 
will have to convert the input to string 
can then split the input into a first and second string based on the current index that we are rotating 
we can then modify the second string to rotate the current index and preepend the first index 
repeat this process unitil we reach the original number and convert back to a number 


Algorithm: 
1. if the input has one digit then return the input 
1. convert the input to string 

2. invoke rotateNdigit passing in 0 as the argument on the digitStr  and digitStr
3. initialize a currentDigits to out digitStr 
4. loop through from index 1 up the length of currentDigits 
    1. invoke rotateNDigit and pass in the current index and currentDigits. once the loop is complete we will reach the original number once more 
5. return currentDigits converted to a number 



    rotateNdigits(n, str)
1. initialize firstHalf to the result of slicing str from index 0 until n 
2. initialize secondHalf to the result of subtracting n from the length of str 
3. initialize rotatedSecondHald to the result of splciing secondHalf from index 1 onwards and adding secondHalf index 0 to the end 
4. return the result of adding firstHalf to rotatedSecondHalf
*/ 

function rotateNDigits(str, n) {
    let firstHalf = str.slice(0, n); 
    let secondHalf = str.slice(n); 
    let rotatedSecondHalf = secondHalf.slice(1) + secondHalf[0]
    return (firstHalf + rotatedSecondHalf)
}



function maxRotation(digits) {
    let digitStr = String(digits); 
    if (digitStr.length === 1) {return digits};
    let currentDigits = rotateNDigits(digitStr, 0)

    for (let i = 1; i < currentDigits.length; i += 1) {
        currentDigits = rotateNDigits(currentDigits, i)
    }
    return Number(currentDigits)


}

maxRotation(735291);          // 321579
maxRotation(3);               // 3
maxRotation(35);              // 53
maxRotation(105);             // 15 -- the leading zero gets dropped
maxRotation(8703529146);      // 7321609845




/* 


5. Word to Digit

Write a function that takes a sentence string as an argument and returns that string with every occurrence of a "number word" —
 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' — converted to its corresponding digit character.

Understand the Problem: 
whenever there is a number word (english word for a digit) we want to replace it with the string digit 

Rules: 
String can include non alphanumeric characters (such as spaces and sentence enders)
This will be modified as words. The words must account for excess characters when a number word is present (e.g. two.)
input will always be string of words. 
if there are no word number words present return the input 
We are dealing with only lower case words 

Patterns: 

DS: 
an object to pair each word number with its digit string 
iterate through and get each word from the setence. 
modify the string based on matching key:value pairs in the object 

Algorithm: 
guardcluase: if the input is empty then return an empty string 
1. initialize const numberObj which will contain all word numbers for keys and all digits as value from 0-9 
2.  iterate through all keys in our obj 
    1. initialize regex to match the current key and check for all occurences 
    2. reassign str to replace any occurrences of the current key with it's corresponding value pair 
3. return str 




*/ 

function wordToDigit(str) {
    if (str.length === 0 ) {return str}; 

    const numberObj = {'one': '1', 'two': '2', 'three': '3', 'four': '4', 'five': '5', 'six': '6', 'seven': '7', 'eight': '8', 'nine': '9'}; 
    for (key in numberObj) {
        let regex = new RegExp(`\\b${key}\\b`, 'g');
        str = str.replace(regex, numberObj[key]); 
    }
    return str; 
    }


wordToDigit('what is your weight? eight? ')
wordToDigit('Please call me at five five five one two three four. Thanks.');
// "Please call me at 5 5 5 1 2 3 4. Thanks."

wordToDigit('I love the number four, but my favorite number is seven. Is your favorite number eight?')



/* 



6. Fibonacci Number Location By Length

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first two numbers are 1 by definition, and each subsequent number is the sum
 of the two previous numbers. Fibonacci numbers often appear in mathematics and nature.

Computationally, the Fibonacci series is a simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
 354,224,848,179,261,915,075—that's enormous, especially considering that it takes six iterations just to find the first 2-digit Fibonacci number.

Write a function that calculates and returns the index of the first Fibonacci number that has the number of digits specified by the argument.
 (The first Fibonacci number has an index of 1.)

You may assume that the argument is always an integer greater than or equal to 2.

JavaScript's normal Number type can represent integers accurate up to the value of Number.MAX_SAFE_INTEGER, which is the 16-digit value 9007199254740991.
 Any integer larger than that value loses accuracy. For instance, the following code outputs 1, not 2 as you may expect:

console.log(Number.MAX_SAFE_INTEGER + 2 - Number.MAX_SAFE_INTEGER);

We'll be working with much larger numbers in this problem. Fortunately, JavaScript now supports a BigInt type that lets you work with massive integers,
 limited only by the amount of memory available to your program, and the time you can devote to waiting for an answer.

To use BigInt integers in your solution, simply append the letter n to any numbers you use in your solution: 1n, 1234567890123456789012345678901234567890n, and so on.
 JavaScript will take care of the rest.

 Understand the Problem: 
 We are to use the fibonacci sequence and take an input that represents the number of digits that the value of our output should have. 
 The output is the first index of the fibonacci sequence that has the input amount of digits. 

 Rules: 
 we will return a bigInt number.
 input will always be a positive integer >= 2 

 Patterns: 

 DS: 

 Algorithm: 




*/ 
function findFibonacciIndexByLength(bigInt) {

}
findFibonacciIndexByLength(2n) === 7n;    // 1 1 2 3 5 8 13
findFibonacciIndexByLength(3n) === 12n;   // 1 1 2 3 5 8 13 21 34 55 89 144
findFibonacciIndexByLength(10n) === 45n;
findFibonacciIndexByLength(16n) === 74n;
findFibonacciIndexByLength(100n) === 476n;
findFibonacciIndexByLength(1000n) === 4782n;
findFibonacciIndexByLength(10000n) === 47847n;

// The last example may take a minute or so to run.

    function ffindFibonacciIndexByLength(target) {
        let twoNumBack = 1n; // Use BigInt to handle large Fibonacci numbers
        let oneNumBack = 1n;
        let currentNum = 2n;
        let iteration = 2;
    
        while (currentNum.toString().length < target) {
            currentNum = twoNumBack + oneNumBack;
            twoNumBack = oneNumBack;
            oneNumBack = currentNum;
            iteration++;
        }
    
        return iteration; // Return the position of the first Fibonacci number with the target length
    }


findFibonacciIndexByLength(2n) === 7n;    // 1 1 2 3 5 8 13
findFibonacciIndexByLength(3n) === 12n;   // 1 1 2 3 5 8 13 21 34 55 89 144
findFibonacciIndexByLength(10n) === 45n;
findFibonacciIndexByLength(16n) === 74n;
findFibonacciIndexByLength(100n) === 476n;
findFibonacciIndexByLength(1000n) === 4782n;
findFibonacciIndexByLength(10000n) === 47847n;


/* 
7.fibonacci (recurisve )

function sum(n) {
    if (n === 1) {
      return 1;
    } else {
      return n + sum(n - 1);
    }
  }
  
  A good recursive function has three primary qualities:
  
      It calls itself at least once.
      It has an ending condition — e.g., if (n === 1), in the sum function above.
      The results of each recursion are used in each step — e.g., n + sum(n - 1) uses sum(n - 1).
  
  Write a recursive function that computes the nth Fibonacci number, where nth is an argument passed to the function.
  
  NOTE: This exercise verges on the Advanced level of exercises, so do not be discouraged if you are not able to solve it on your own; recursion is tricky, and even experienced developers can have difficulty dealing with it.
  
  E*/ 

  function fibonacci(input) {
    if (input < 1 ) {return 0}; 
    if (input <= 2) {return 1}; 

    return fibonacci(input - 2)  + fibonacci(input - 1)
  }
  
  fibonacci(1);       // 1
  fibonacci(2);       // 1
  fibonacci(3);       // 2
  fibonacci(4);       // 3
  fibonacci(5);       // 5
  fibonacci(12);      // 144
  fibonacci(20);      // 6765
  
  


/* 
8. Fibonacci Numbers (Procedural)

In the previous exercise, we developed a recursive solution for computing the nth Fibonacci number. In a language that is not optimized for recursion, some (but not all) recursive functions can be extremely slow and may require massive quantities of memory and/or stack space. If you tested for bigger nth numbers, you might have noticed that getting the 50th fibonacci number already takes a significant amount of time.

Fortunately, every recursive function can be rewritten as a non-recursive (or procedural) function.

Rewrite your recursive fibonacci function so that it computes its results without using recursion.

Examples:

*/ 

function fibonacciTwo(input) {
    if (input <= 2) {return 1}
    let current = 2; 
    let oneBack = 1; 
    let twoBack = 1; 

    for (let i = 2; i < input; i += 1) {
        current = oneBack + twoBack
        twoBack = oneBack
        oneBack = current
      
    }
    return current; 
}
fibonacciTwo(8)
fibonacciTwo(20);       // 6765
fibonacciTwo(50);       // 12586269025
fibonacciTwo(75);       // 2111485077978050

