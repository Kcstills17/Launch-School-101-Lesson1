"use strict"

function log(input) {
  return console.log(input)
}


/*

1. Defaults

The processOrder function shown below accepts the following arguments: price, quantity, discount, serviceCharge and tax.
Any arguments other than price may be omitted when calling the function, in which case, default values will be assigned.

function processOrder(price, quantity, discount, serviceCharge, tax) {
  if (!quantity) {
    quantity = 1;
  }

  if (!discount) {
    discount = 0;
  }

  if (!serviceCharge) {
    serviceCharge = 0.1;
  }

  if (!tax) {
    tax = 0.15;
  }

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

processOrder(100);      // 126.5

This function uses conditional statements to test whether arguments have been omitted. When an argument is omitted,
 JavaScript automatically initializes it to a value of undefined. The function takes advantage of this behavior by setting undefined arguments to a default value.

The following variation of the processOrder function has the same behavior as the first:

function processOrder(price, quantity, discount, serviceCharge, tax) {
  quantity = quantity || 1;
  discount = discount || 0;
  serviceCharge = serviceCharge || 0.1;
  tax = tax || 0.15;

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

However, both of these solutions have a limitation that can lead to an incorrect result for certain inputs. What is this limitation and how does it affect the result?

The issue is that when 0 is passed in as one of the conditional arguments that is a falsy value in JS. therefore that is evaluated to false. And we wont get the correct value
passed in .


*/

/*



Equal

Read through the following code. Currently, it does not log the expected result. Explain why this happens, then refactor the code so that it works as expected.
*/
const person = { name: 'Victor' };
const otherPerson = person;

console.log(person === otherPerson);    // false -- expected: true

// Answer
// This logs false because it is using the strict operator to see if `person` and `otherPerson` are refferring to the same object. They are two different objects so
// Therefore false is logged. To get true we can initialize otherPerson to the same value as person with cont otherPerson = person



//3. Amount Payable

//What does the following code log? Why is this so?

let startingBalance = 1;
const chicken = 5;
const chickenQuantity = 7;

function totalPayable(item, quantity) {
  return startingBalance + (item * quantity);
}

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity));

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity));

//Answer
// The program logs 40 and then 45. The function totalPayable' will use the value of startingBalance at the time of execution.
// This is an example of closure. That is, the function has access to all of the variables and functions in its outer scope. WhentotalPayable` executes,
//  the function will look up the values of all variables at the time of execution.



// 4. Caller

// The doubler function in the code below takes two arguments: a number to double and return, and a string containing the name of the function's caller.

function doubler(number, caller) {
  console.log(`This function was called by ${caller}.`);
  return number + number;
}

doubler(5, 'Victor');                   // returns 10
// logs:
// This function was called by Victor.

// Write a makeDoubler function that takes a caller name as an argument, and returns a function that has the same behavior as doubler, but with a preset caller.

// Example:

// const doublers = makeDoubler('Victor');
// doublers(5);                             // returns 10
// logs:
// This function was called by Victor.

/*
Solution

This solution leverages that functions in JavaScript are first-class objects. It satisfies the requirement that makeDoubler must take a caller name
 and it returns a variation of the doubler function.

function makeDoubler(caller) {
  return number => {
    console.log(`This function was called by ${caller}.`);
    return number + number;
  };
}

const doubler = makeDoubler('Victor');
doubler(5);                             // returns 10
// logs:
// This function was called by Victor.

Notice that the returned anonymous function expression assigned to the doubler variable still retains access to the caller variable in its closure,
 even after the makeDoubler function returns.

*/



// 5. What's My Value?

// What will the following program log to the console? Can you explain why?

const array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges'; // creates an array property '3.4': 'Oranges'
console.log(array.length); // 3 (arrays do not count properties as apart of their length)
console.log(Object.keys(array).length); // when searching for an objects keys within an array properties are included. Therefore 4 is logged
log(array)

array[-2] = 'Watermelon'; // creates a new array property '-2': 'Watermelon'
log(array)
console.log(array.length); // 3 (once again properties are not included in array lengths)
console.log(Object.keys(array).length) // 5 (we have added a new property so when we search the Object keys array length we now have an extra value. )

// So in summary  non positive integer property values that arr added to arrays are not apart of standard array lengths.
//  However when searching the Object keys of an array you do include  those properties.


// 6. Length

// Read through the code below. What values will be logged to the console? Can you explain these results?

const languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages); // 'Javascript, 'Ruby', Python
console.log(languages.length); // 3

languages.length = 4; // adds an empty item to the array to satisfy setting the array length to 4.
console.log(languages); //  'Javascript, 'Ruby', Python, 1 empty item
console.log(languages.length); // 4

languages.length = 1; // removes any extra values outside of the first index value of the array
console.log(languages); //  'Javascript'
console.log(languages.length); // 1

languages.length = 3; // since we now only have 1 item in the array. Setting the length to 3 now will add 2 empty slots.
console.log(languages); // 'Javascript', 2 empty items
console.log(languages.length); // 3

languages.length = 1; // we set the array length back to 1 which just leaves 'Javascript' as the one item in the array
languages[2] = 'Python'; // we create a new value at index 3 in the array and set to 'Python'. However there is only 1 element and this is at the 3rd place. Therefore an empty element is created between at index 1
console.log(languages); // 'Javascript'. 1 empty item, 'Python'
console.log(languages[1]); // this is an empty item. So when we try to access it we will log undefined in this case.
console.log(languages.length); // 3



// 7. The Red Pill

// Read through the code below and determine what will be logged. You may refer to the ASCII Table to look up character code values.

function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne(...args) {
    let result = '';
    for (let i = 0; i < args.length; i += 1) {
      result += String.fromCharCode(args[i]);
    }

    log(result); // Matrix!
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101)); // Welcome
    anotherOne(116, 111); // to
  }

  anotherAnotherOne(); // Welcome (new line) To
  anotherOne(116, 104, 101); // the
  return anotherOne; // Matrix
}

one()(77, 97, 116, 114, 105, 120, 33);

/*
The trick to solving this problem is to follow the sequence of function calls. The call to the one function may look confusing,
but it is actually just two successive function calls (because the one function returns the anotherOne function).
 Notice that when the anotherOne function is returned, it still has access to the log function that is declared in its enclosing scope (closure) inside the one function.

This code has a total of eight function calls:

1: one();
2: anotherAnotherOne();                         // Welcome
3: anotherOne(116, 111);
4: log(result);                                 // to
5: anotherOne(116, 104, 101);
6: log(result);                                 // the
7: anotherOne(77, 97, 116, 114, 105, 120, 33);
8: log(result);                                 // Matrix!
*/
