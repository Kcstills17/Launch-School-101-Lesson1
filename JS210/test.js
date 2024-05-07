let numerator = 10;
console.log(numerator);

const DENOMINATOR = 2;
console.log(DENOMINATOR);


// Declare a variable named answer and set it to the result of numerator divided by DENOMINATOR. Log the value of answer (it should be 5).//

  let answer = numerator / DENOMINATOR ;
  console.log(answer);


  let incrementer = 1;

  let start = incrementer;
  console.log(start);

  let end;
  let difference;

  incrementer += 1;
  incrementer += 1;
  incrementer += 1;
  console.log(incrementer);

  incrementer++
  ++incrementer
  console.log(incrementer);

// Set the value of end to incrementer and the value of difference to end minus start. Log the value of end, which should be 6. Log the value of difference, which should be 5.//

end = incrementer;
difference = end - start;
console.log(end);
console.log(difference);

 // Declare a variable named answer and initialize it to the result of 11 plus 31 multiplied by 3 as one statement,
 // then log the result. Your result should be 126. If you get a different result, you may need to use some parentheses to change the order of operations:
 // you want to perform the addition first, then the multiplication.

  answer = (11 + 31) * 3;
  console.log(answer);

  // The result of the following calculation is a string. Using type coercion, correct the calculation to produce the numeric result instead.

let x = '13';
let y = 9;
//x = Number(x);

console.log(x * y);

let npa = 212;
let nxx = 555;
let num = 1212;

console.log(String(npa) + String(nxx) + String(num));

//The toString method is yet another way to convert values to strings. Try using toString to convert a boolean and an array to a String. Did you get the result you expected?

let bool = true;
bool = bool.toString();
let arr = [1, 2, 3];
arr = arr.toString();
console.log(bool);
console.log(arr);


// Set a variable, apples, to 3. Set a second variable, bananas, to 5. Write a conditional using == that checks whether apples is equal to bananas. Log a message if true.

let apples = 2;
let bananas = 3;

if (apples === bananas) {
  console.log("apples are the same type and amount as bananas");
} else if (apples == bananas) {
  console.log("apples are not the same type as bananas but are the same amount")
 } else {
  console.log("apples and bananas are not the same amount or class.")
};





// Set the value of apples to 3 and bananas to undefined. Set a variable named eitherOr to the value of apples or bananas.
//  This works the same as the previous problem, where you write the comparison as the assignment of the variable. Log the value of eitherOr.

apples = 3
bananas = undefined
let eitherOr = apples || bananas ;

console.log(eitherOr);

// Concatenate two or more strings, one with your first name and one with your last, to create a string with your full name as its value. For example, if your
//  name is John Doe, think about how you can put 'John' and 'Doe' together to get 'John Doe'.

let first_name = 'zane'
let last_name = 'lee'
let name = first_name + ' ' + last_name

console.log(name);


/* Using arithmetic operators, get the individual digits of a 4-digit number like 4936:

    thousands place is 4
    hundreds place is 9
    tens place is 3
    ones place is 6
*/
function extractDigits(number) {
  let digits = [];
  for (let index = 0; index < 4; index++) {
    // Get the rightmost digit
    let digit = number % 10;
    digits.push(digit);

    // Remove the rightmost digit
    number = Math.floor(number / 10);
  }
   return digits.reverse(); // Reverses the array to show digits from left to right
}

// Example usage
 number = 4936;
let  digits = extractDigits(number);
digits.forEach(num => {
  console.log(num);
});


console.log(Number('5') + 10);

// Use the template literal syntax along with the expression Number('5') + 10 to log the following sentence to the console  The value of 5 + 10 is 15.



let str_digit = '5'
let num_digit = 10

console.log(`The value of ${str_digit} + ${(num_digit)} is ${Number(str_digit) + num_digit}`)


let foo = ['a', 'b', 'c'];
console.log(foo.length);  // => 3
console.log(foo[2]);

//  Create an object named pets that contains a list of pet names and the type of animal. For instance:

pets = {
  'naruto' : 'きつね',
  'kiba' : 'いぬ',
  'usagi' : 'うさぎ'
};

console.log(pets);


/* Write a program named greeter.js that greets 'Victor' three times. Your program should use a variable and not hard code the string value 'Victor'
 in each greeting. Here's an example run of the program:

$ node greeter.js
Good Morning, Victor.
Good Afternoon, Victor.
Good Evening, Victor.
*/


function greeter(name) {
  console.log(`Good Morning, ${name}.`)
  console.log(`Good Afternoon, ${name}.`)
  console.log(`Good Morning, ${name}.`)
};

greeter('Victor')
greeter('かおり')

/* Write a program named age.js that includes someone's age and then calculates and reports the future age in 10, 20, 30 and 40 years.
 Below is the output for someone 20 years old.

You are 20 years old.
In 10 years, you will be 30 years old.
In 20 years, you will be 40 years old.
In 30 years, you will be 50 years old.
In 40 years, you will be 60 years old.
*/

function age(user_age) {
  console.log(`You are are ${user_age} years old.`)
  console.log(`In 10 years, you will be ${user_age + 10} years old.`)
  console.log(`In 20 years, you will be ${user_age + 20} years old.`)
  console.log(`In 30 years, you will be ${user_age + 30} years old.`)
};


age(27);



 foo = 'bar';
{
   foo = 'qux';
}

console.log(foo);

let rlSync = require('readline-sync');

 //first_name = rlSync.question('What is your first name?\n');
 //last_name = rlSync.question("What is your last name?\n")


//console.log(`Hello ${first_name + ' ' + last_name}!`)


/*  Write a program that uses a multiply function to multiply two numbers and returns the result.
Ask the user to enter the two numbers, then output the numbers and result as a simple equation.

$ node multiply.js
Enter the first number: 3.141592653589793
Enter the second number: 2.718281828459045
3.141592653589793 * 2.718281828459045 = 8.539734222673566
*/


function get_Num(prompt) {
  let rlSync = require('readline-sync');
  return parseFloat(rlSync.question(prompt));
};

let multiply = (a, b) => a * b;

// Interactively ask for numbers
//let left = get_Num("Enter the first number: ")
//let right = get_Num("Enter the second number: ")
//console.log(`${left} * ${right} = ${multiply(left, right)}`);


/* In the code shown below, identify the following items:

    the function arguments
    the function body
    the function declaration
    the function invocation
    the function name
    the function parameters
    the function return value
    the names of all variables in this program

function multiplyNumbers(num1, num2, num3) {
  let result = num1 * num2 * num3;
  return result;
}

let product = multiplyNumbers(2, 3, 4); */


/* ANSWERS
function arguments = 2, 3, 4,
function body =  let result = num1 * num2 * num3;
return result;

function declaration = function multiplyNumbers ... }
function invocation = multiplyNumbers(2, 3, 4);
function name = multiplyNumbers
function parameters = (num1, num2, num3)
function return value = the return value of the local param result
all variable names = result, num1, num2, num3, product */



/* Identify all of the variables named on each line of the following code. You may assume that question is the name
of a built-in function in JavaScript (it is not, so this code won't work as written).

function multiply(left, right) {
  let product = left * right;
  return product;
}

function getNumber(prompt) {
  return parseFloat(question(prompt));
}

let left = getNumber('Enter the first number: ');
let right = getNumber('Enter the second number: ');
console.log(`${left} * ${right} = ${multiply(left, right)}`);
*/
/*
ANSWERS

line 2: product
line 3 : product
line 6: getNumber, prompt
line 7 : parseFloat, question, prompt
line 10 : left, getNumber
line 11: right, getNumber
iine 12: console, left, right 2x, multiply
*/

// Write a function, evenOrOdd, that determines whether its argument is an even number. If it is, the function should log 'even' to the console;
 // otherwise, it should log 'odd'. For now, assume that the argument is always an integer.

 let checkIfInteger = (arg) => Number.isInteger(arg);

  function evenOrOdd(num) {
  if (!checkIfInteger(num)) {
    console.log("choose a valid number")
    return
  };

  if (num % 2 === 0) {
    console.log('even')
  } else {
    console.log('odd')
  }

}
evenOrOdd(4);


/* Write a function that takes a string as an argument and returns an all-caps version of the string when the string is longer than 10 characters.
 Otherwise, it should return the original string. Example: change 'hello world' to 'HELLO WORLD', but don't change 'goodbye'*/

 function caps(str) {
  if (str.length >= 10) {
    return str.toUpperCase();
  }else {
   return str
  }

 };

 caps('existential');
 caps('zane');


 /* Write a function that logs whether an integer is between 0 and 50 (inclusive), between 51 and 100 (inclusive), greater than 100, or less than 0.

numberRange(25);
numberRange(75);
numberRange(125);
numberRange(-25);

Expected Output

25 is between 0 and 50
75 is between 51 and 100
125 is greater than 100
-25 is less than 0
*/



function betweenNumbers(num) {
  if (num >= 0 && num <= 50) {
    console.log(`${num} is between 0 and 50`);
  } else if (num >= 51 && num <= 100) {
    console.log(`${num} is between 51 and 100`);
  } else if (num > 100) {
    console.log(`${num} is greater than 100`);
  } else {
    console.log(`${num} is less than 0`);
  }
}

betweenNumbers(0);
betweenNumbers(30);
betweenNumbers(74);
betweenNumbers(103);
betweenNumbers(-23);



console.log(false ?? null);
console.log(true ?? (1 + 2));
console.log((1 + 2) ?? true);
console.log(null ?? false);
console.log(undefined ?? (1 + 2));
console.log((1 + 2) ?? null);
console.log(null ?? undefined);
console.log(undefined ?? null);



function show(foo = undefined, bar = null) {
  console.log(`foo is ${foo ?? 3}, bar is ${bar ?? 42}`);
}

show(5, 7);
show(0, 0);
show(4);
show();


function sum (arr) {
  total = 0
  for (let index = 0; index < arr.length;  index++  ) {
     total += arr[index]
  }
  return   total
};



function average(arr) {
  total = sum(arr)
  return total / arr.length;
};

average([2, 2, 3, 3.5, 1.8, 3.1, 4.2, 5.6]);


function capitalize(word) {
  return word[0].toUpperCase() + word.slice(1);
}

function exclaim(word) {
  return word += '!!!';
}

let word = 'hello';
let capitalizedWord = capitalize(word);
let exclaimedWord = exclaim(capitalizedWord);

console.log(word);
console.log(capitalizedWord);
console.log(exclaimedWord);
