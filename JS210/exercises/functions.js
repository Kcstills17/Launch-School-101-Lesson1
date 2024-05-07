/* 1.
Local vs Global Part 1

What will the following code log to the console and why? Don't run the code until after you have tried to answer.
*/
var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);
// Will output This is global becauswe `var` variables are scoped at a function level. `myVar` in the function is not being logged so when the function is invoked
// we do not see it. And when we  `console.log(myVar);` in the outer scope it is unaffected by the `myVar` in the innerscope.

/*
2. Local vs Global Part 2

What will the following code log to the console and why? Don't run the code until after you have tried to answer.
*/

var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();
// The output will be `'This is local'` That is because due to the lexical scoping of JS we determine we determine the scope by the function of the program. Here we have
// `myVar` in the global scope and within the scope of the function `someFunction()`. There is a log within this function and this `myVar` is not influenced by the outer
// one because it uses the `var` variable typing which is function scoped. in the outerscope we invoke `somefunction()'; Which will log the result of the function scoped
// `myVar`


/* 3.
Local vs Global Part 3

What will the following code log to the console and why? Don't run the code until after you have tried to answer.
*/

var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);

  // `"this is local"` Will be output. Here the key difference is within the function `myVar` is globally scoped. Therefore it can search outside of the function and find the
  // outer scoped `myVar`. Becasuse of this ` myVar = 'This is local';` is actually reassining the value of the globally scoped `myVar`. Therefore When
  // `console.log(myVar);` is logged the reassignment is output.

  /* 4.
Variable Lookup

What will the following code log to the console and why? Don't run the code until after you have tried to answer.
*/


var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();
// The output is `"This is global"`. Within the function there is no variable with the name `myVar` and when it cannot find that name within the scope it will branch out to
// the main scope and find the globally scoped `myVar`. Thus its value is outpt.

/* 5.
Variable Scope

What will the following code log to the console and why? Don't run the code until after you have tried to answer.
*/

function someFunction() {
   myVar = 'This is global';
}

someFunction();
console.log(myVar);

/* `"This is global"` is output. Notice that on line 2 there is no variable declaration for myVar (i.e., there is no var keyword before myVar). As a result of this,
JavaScript looks in the outer scope for the declaration. Since it doesn't exist, JavaScript binds myVar to be a "property" of the global object.
This is "almost" the same as if myVar was globally declared. We will discuss more about why this is "almost"—but not "exactly"—the same in a later
 course when we cover the global / window object. */


 /* 6.
Arguments Part 1

What will the following code log to the console and why? Don't run the code until after you have tried to answer.
*/

let a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);
console.log(a);

/* The output of `a` is `7`. Although we pass in the value that `a` points to. The paramter of a function in js is locally scoped and does not affect a primitive type value
like `7` in any way. This is an example of pass by value. It points to a new address in memory that is the same value.  So when we log `a` we will get `7`. */

/* 7.
Arguments Part 2

What will the following code log to the console and why? Don't run the code until after you have tried to answer.*/

let b = 7;

function myValue(b) {
  b += 10;
}

myValue(b);
console.log(b);

/* The output is `7`. Here we have a globally scoped variable `let b = 7`, we then have a function `myValue` which uses the same parameter variable `b`
These do not refer to the same values as this shows variable shadowing and the param refers to the local scope of the function. This function increments the passed
in argument and sets the value by 10. We then invoke the method by passing in the outer scoped `b`  `myValue(b);` and then log the outer scope `b` `console.log(b);`.
This shows how even though these variables all share the same name, due to scoping rules they are not the same and point to different values.  */


/* 8.
Arguments Part 3

What will the following code log to the console and why? Don't run the code until after you have tried to answer.*/

let arr = [1, 2, 3];

function myValue(b) {
  b[2] += 7;
}

myValue(arr);
console.log(arr);

/* This will output `[1, 2, 10]`. Here we have `let arr = [1, 2, 3];` which defined the variable `arr` in the global scope. We then have the function `myValue` which
passes in an array value and modifies the 3rd index by incrementing it and settting it += 7. There is a key note here. While the number itself is primitive and cannot be
modified we are therefore reassigning that value to another number. However the object array is being mutated because of this action. This demonstrates the concept of
pass by referenve. Once we invoke the method this mutating action has already occured. And the `arr` object outputs this change once we log the object. */


/* 9.
Variable Declarations

What will the following code log to the console and why? Don't run the code until after you have tried to answer.*/

console.log(c);

var c = 1;

/* The output is `undefined`. This can be explained through the concept of hoisting. Here we have a JS declaration and expression occuring at the same time with the line
`var c = 1;` With hoisting the declaration is raised to the top of the program but not the expression. So based on that it would look like this
var c
console.log(c);
c = 1;
Becuase the expression is not hoisted there is no assignemnt that can occur prior to the logging. Therefore we output `undefined`*/

/* 10.

Function Declarations

What will the following code log to the console and why? Don't run the code until after you have tried to answer.*/

logValue();

function logValue() {
  console.log('Hello, world!');
}

/* the output will be `"Hello, world!"` . Here we have the `logValue()` function being invoked prior to it being defined. However due to the rules of hoisting the function
declaration and its body will be hoisted to the top of the program. Because of this the body of the function `console.log('Hello, world!'); will be able to be output
no problem. Here is what the code will look like after hoisting.

function logValue() {
  console.log('Hello, world!');
}

logValue();
*/

// Further Exploration

// Let's refactor the code a bit. What does it log now? What is the hoisted equivalent of this code?

var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);

/* The output will be `string`. Here we have `var logValue = 'foo';` which defines the variable `logValue` and assigns it to `'foo'` in the global scope. We also have
a function of the same name `logValue();` which ouptuts a log of the string `'Hello, world''`finally we log the type of value that `logValue` is.
Hoisting is the main component that determines this output. With hoisting the code will look like this

function logValue() {
  console.log('Hello, world!');
}
var logValue;  // This is redundant and has no effect because `logValue` is already declared as a function.
logValue = 'foo';  // This initialization changes `logValue` from a function to a string.
console.log(typeof logValue);

Now looking at this in this order after hoisting. `logValue` is assigned to the function declaration first. However following that we then reassign `logValue` to the
string primitive `'foo'`. Therefore when we log the type of `logValue` the `string` primitive type is output.  */


