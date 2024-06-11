"use strict"

function log(input) {
  return console.log(input)
}




// 1. Logical Operation
//What will each line of the following code return? Don't run the code until after you have tried to answer.


(false && undefined); // left operand is falsy so it will short circuit out and be false
(false || undefined); //  left operand is falsy so we move on to the next value. undefined is also falsy so we return the final falsy value. undefined
((false && undefined) || (false || undefined)); // the parenthesis will evaluate to (false) and (undefined) false || undefined will be undefined
((false || undefined) || (false && undefined)); // -- (undefined || (false) -> undefined || false is the last falsy value. Therefore false is returned.
((false && undefined) && (false || undefined));// -- (false) && (undefined) -> false && undefined will be false
((false || undefined) && (false && undefined)); // (undefined) && (false) -> undefined && undefined is the first falsy value and therefore is returned
('a' || (false && undefined) || ''); // 'a' || (false) || ''  -> 'a' || false || ''   'a' will be the first truthy value it encounters and will short circuit out. 'a' is returned.
((false && undefined) || 'a' || ''); // (false) || 'a' || '' -> false || 'a' || '' false is falsy so we move to the next step which is 'a' and truthy. 'a' is returned
('a' && (false || undefined) && ''); // 'a' && (undefined && '') -> 'a' && undefined  'a' is truthy but undefined is falsy. Since it is && the last falsy value is returned.
((false || undefined) && 'a' && ''); // (undefined) && 'a' && '' falsy is the last value that is falsy and we are using the && operator. undefined is returned





//2.Conditional Loop

// The following program is expected to log each number between 0 and 9 (inclusive) that is a multiple of 3.
// Read through the code shown below. Will it produce the expected result? Why or why not?

let i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i)
  } else {
   // i+= 1 commenting this out to fix error
  }
  // adding i += 1 after conditional so both increment properly
  i+= 1
}

// answer
// no this problem is only incrementing the values when the conditional logic is false. Therefore on the first iteration when the logic is true (0 % 3 === 0 )
// we will be stuck on an infinite loop. To fix this simply set i to itself + 1 when the condition is true as well.



//3. Multiplication Table

// The following program is expected to log a multiplication table for the numbers from 1 to 10 to the console.
// Read through the code shown below. Will it produce the expected result? Why or why not?

function padLeft(number) {
  const stringNumber = String(number);
  switch (stringNumber.length) {
    case 1:  return `  ${stringNumber}`;
    case 2:  return ` ${stringNumber}`;
    default: return stringNumber;
  }
}

for (let i = 1; i < 10; i += 1) {
  let row = '';
  for (let j = 1; j <= 10; j += 1) {
    row += `${padLeft(i * j)} `;
  }

  console.log(row);
}


// answer
// This will onlby output the times tables from 1 - 9. That is because in the for loop the condition is only iterating whille i < 10. so when we get to 10 the iteration ceases.
// to fix this we want to make sure that is <= to 10 so we will also get that final iteration.


// 4. Selected Columns

// The getSelectedColumns function selects and extracts specific columns to a new array. Currently, the function is not producing the expected result.
// Go over the function and the sample runs shown below. What do you think the problem is?

function getSelectedColumns(numbers, cols) {
  var result = [];

  for (let i = 0, length = numbers.length ; i < length  ; i += 1) {

    for (let j = 0, length = cols.length; j < length; j += 1) {
      if (!result[j]) {
        result[j] = [];
      }

      result[j][i] = numbers[i][cols[j]];
    }
  }

  return result;
}

// given the following arrays of number arrays
const array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
const array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];

// `array1` in row/column format
// [[1, 2, 3],
//  [4, 5, 6],
//  [7, 8, 9]]

log(getSelectedColumns(array1, [0]));     // [[1]];            expected: [[1, 4, 7]]
log(getSelectedColumns(array1, [0, 2]));  // [[1, 4], [3, 6]]; expected: [[1, 4, 7], [3, 6, 9]]
log(getSelectedColumns(array2, [1, 2]));  // [[2, 2], [3, 3]]; expected: [[2, 2, 2], [3, 3, 3]]


/* answer
Solution

The problem is that the length variable is reassigned a new value in the second loop.
Discussion

The intention of declaring the variable length is to save on repetitive calls to the .length property. However,
we are declaring length with the var keyword, which gives it function scope. As a result, the two declarations of length only create one length variable that is used in both loops. Thus, on line 5, we're reassigning the same variable used on line 4.

To resolve this, we can declare the variables using let. Variables declared with let have block scope, so the length variable in the inner loop is different from
 the length variable in the outer loop.

 Switching to let prevents the loops from overwriting the same length variable and allows for proper iteration.
 This reinforces the importance of using block-scoped variables to avoid scoping conflicts in nested loops.

*/



// 5. Counter

// What will the following code snippets log?

/*
var counter = 5;
var rate = 3;
console.log('The total value is ' + String(counter * rate));

function counter(count) {
  // ...
}
*/
// function declaration counter is hoisted to the top of the program. counter is reassigned to 5. rate is initialized to 3.  the log then interpolates
// 'the total value is' + counter * rate then converted to string. which will be '15'




/*
function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

var counter = 5;
var rate = 3;
*/

// here the variavles counter and rate are hoisted above the console log statement. However the initialization is not hoisted. So when you convert the non initialized value to
// you get a Nan value. Therefore this is logged 'The total value is NaN'

/*
var counter = 5;
var rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));
*/

// The function is hoisted to the top of the code. counter and rate are initialized. the log gives the result of the text plus converting counter * rate to string. Which is 15./
// so we log The total value is 15

/*
let counter = 5;
let rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));
*/

//You can't declare a variable multiple times when one or more of those declarations use let or const. Since snippet 4 declares counter using let,
// it raises a SyntaxError. However, the error occurs on line 4 -- the function declaration -- from the original code. Since SyntaxErrors usually occur
//  during the creation phase, hoisting has no direct effect on the behavior.

// 6. Logger
// Read through the following code. Why will it log 'debugging'?

function debugIt() {
  const status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();

// a function debugIt() is initialzed. Within the body the const status is initialized to the string value 'debugging'. Further in the body a new function logger() is initialized
// within this function  a console.log() is invoked and passes in the const status. outside of logger() and back into debugIt() we finally invoke logger().
// so because  the logger() function outputs the value of status. Since logger() is invoked within debugIt() when we invoke debugIt() we always will log the value of status
// this demonstrates JS lexical scoping rules. As inner nested functions such as logger() has access to values initialized in a outer nested block (or function here) debugIt()



// 7. Invoice

// The invoiceTotal function in the code below computes the total amount for an invoice containing four "line items".
// How can you refactor the function so that it will work with invoices containing any number of line items?
/*
function invoiceTotal(amount1, amount2, amount3, amount4) {
  return amount1 + amount2 + amount3 + amount4;
}
*/

log(invoiceTotal(20, 30, 40, 50));          // works as expected
log(invoiceTotal(20, 30, 40, 50, 40, 40));  // does not work; how can you make it work?

// Here in this case the first case works because it has the proper amount of  arguments passed in. and the second has too many. So the extra arguments will not have any effect.
// a simple solution to fix this is to use the ...arg rest parameter. It will group all passed in parameters together in an array. Now we can pass in any specific amount of
// arguments and then reduce the total from this array. return the value that is the sum of this total.


function invoiceTotal(...amount) {
  let totalSum = amount.reduce(
    (accumulator, currentValue) => accumulator + currentValue
  );
  return  totalSum
}




//8. Product of Sums

// The productOfSums function shown below is expected to return the product of the sums of two arrays of numbers. Read through the following code.
//  Will it produce the expected result? Why or why not?

function productOfSums(array1, array2) {
  let result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  let sum
  for (let i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

   sum;
}

log(productOfSums([1, 2, 3], [1, 2, 3]))
// No this will result in a value of Nan
// There are two issues.  in the `total()` function `sum` is initialized but it not given a value. This will leave the value as undefined. Therefore in the loop undefined is
// having a value at the current array index added to it. Which results in NaN. Furthermore `total()` is not actually returning `sum` and is just implicitly returning
// undefined. To fix this we initialize `sum` to 0. And then return `sum`. now in `productOfSums` their are valid values passes in and we get the expected results.
