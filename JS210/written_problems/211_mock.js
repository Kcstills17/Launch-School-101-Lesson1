/*

Question 1
Examine the code below. What structure does {...} define? Explain with reference to this structure why line 9, console.log(a),
 outputs 5 but line 10, console.log(b), throws a ReferenceError exception. What underlying principle about the structure does this demonstrate?

let a = 10

{
  a = 5;
  let b = 15;
}

console.log(a);  // 5
console.log(b);  // Uncaught ReferenceError: b is not defined


answer:
on line a we initialize and define a globally scoped variable `a` and assign it to the number value `10`.
the structure from 9-12 defines a block. and within this structure on line 10  is a reassignment of the previously scoped `a` to the number `5`.
on line 11 thew block scoped `b` is initialized and defined to the number `15`.

we exit the block and on line 14 we output the value of `a` with `console.log(a)`. since the globally scoped variable was accessed and reassigned within our block earlier, we
can output the result of that reassignment here  in the global scope (which is `5`)
on line 15 we have a referenceError because we have a block scopepd variable `b` initialized in our block. When we attempt to access it outside of the block it is no longer
within scope. Therefore the referenceError.

The major concept at play here is variable scoping rules and where and how variables are defined can lead to much different results.




2. Explain why the following code outputs Xyzzy with precise language. What is the underlying concept?

let a = 'Xyzzy';

function myValue(b) {
  b[2] = '-';
}

myValue(a);
console.log(a);



On line 35 `a` is initialized and defined to the string value `'Xyzzy'' with the keyword `let` which will block scope it to the global level.
on line 37-39 we have the function declaration `myValue(a)` which takes one parameter
on line 41 we pass in the value of `a`, which is still `'Xyzzy'`
we then output the result on line 42 with `console.log(a)`
Returning to the contents of the function `myValue()` we pass in the value `'Xyzzy'` and set the third index position `b[2]` which is `'z'` and set it the the value `'-'`.
This has no effect as strings are immutable in javascript.
Also nothing is returned explicitly which will return `undefined.`
The output on line 42 will still result in `Xyzzy` is because strings are immutable and cannot be modified.  within the function when we modify `'z`' this reassigns that value,
however the string that the argument is assigned to cannot be modified due to it's immutability.

The concept demonstrated is pass by value  and in this specific case, the immutabililty of strings.


Question 3
Explain why the line console.log(sentence) outputs hello world rather than HELLO WORLD. What does this demonstrate about what happens on line 2?

function shout(string) {
  return string.toUpperCase();
}

let sentence = 'hello world';
shout(sentence);
console.log(sentence);         // hello world


answer

on line 62-64 we initialize a function declaration `shout(string)` which takes one parameter. On line 66 we declare and initialize the globally scoped variable `sentence` to the
string value `'hello world'`. On line 67 we pass the string value from `sentence` into the `shout()` function. Jumping back into the contents of `shout()` we pass in
our string argument `'hello world'` and return `string.toUpperCase()` This function will return a copy of the passed in string with all uppercase values, `'HELLO WORLD`'
On line 68 we output the value of sentence with `console.log(sentence) however we still output `'hello world'`. This is because strings are immutable and cannot be modified.
In the case of `shout()` we utilize pass by value and create a copy of the passed in string with the requisite upper case values. So the demonstrated concept in the second line
of the code is pass by value  when working with strings.



Question 4. What happens when you run the following code? Why?

const NAME = 'Shali';
console.log('Good Morning, ' + NAME);
console.log('Good Afternoon, ' + NAME);
console.log('Good Evening, ' + NAME);

NAME = 'Moro';
console.log('Good Morning, ' + NAME);
console.log('Good Afternoon, ' + NAME);
console.log('Good Evening, ' + NAME);

You will have the following results
`'Good Morning, Shali'`
`'Good Afternoon, Shali'`
`'Good Evenining, Shali'`


when you attempt to reassign `NAME` to the string `'Moro'` you will get a typeError as constant's cannot be changed once they have been declared.
the code will cease running after this error.



Question 5
Take a look at this code snippet:

let foo = 'bar';
{
  let foo = 'qux';
}

console.log(foo);
What does this program log to the console? Why?

This code will output `'bar'`. This is because on line 1, the block scoped `foo` is scoped to the global level and assigned to `'bar'`.  on line 2-4 there is a block
and within this block is a block scoped variable `foo` assigned to the string `'qux'`. We exit this block and lose access to this `foo` back in the global scope once we are
outputting `foo` on line 7 with `console.log(foo)`. This will output the globally accessed `foo` which is assigned to `'bar'`. Therefore, `'bar'` is output.



Question 6
Will this program produce an error when run? Why or why not?

const FOO = 'bar';
{
  const FOO = 'qux';
}

console.log(FOO);


This will not result in an error. Although we have what appears to be the constant being assigned and then reassigned with `const FOO = `'bar`' on line 1 and then
`const FOO = `'qux`` on line 3. That is not the case. On line 1 we declaring `FOO` with a blocked scope variable to the global scope. And on line 3 we are declaring `FOO` to a
block scoped variable in the block declared from line 2-4. Therefore on line 7 `console.log(FOO)` will output the globally scoped `FOO` it has access to and we will have no errors
because each `FOO` has zero access to one another and will not cause any typeErrors.


Question 7
What does this code log to the console? Does executing the foo function affect the output? Why or why not?

let bar = 1;
function foo() {
  let bar = 2;
}

foo();
console.log(bar);



answer:
THe console output `console.log(bar) will output  `1`. The result of the function declaration `foo()` will not affect the output. Here's why

On line 1 the globally scoped variable `bar` is initialized and declared to the number value `1`.

On line 2-4 is the function definition `foo()`. Within the function we declare the block scoped variable `bar` to the function level and assign it to the value `2`.
No value is explicitly returned, therefore `undefined` will be returned.

We exit the function body and on line 6 we invoke `foo()`

On line 7 we output `bar` and since we are in the global scope we will access the globally scoped `bar` which will output `1.



Question 8
What does this code log to the console? Does executing the foo function affect the output? Why or why not?

let bar = 1;
function foo() {
  bar = 2;
}

foo();
console.log(bar);

answer:
The output `console.log(bar)` will log `2`. Executing the function does affect the output, here's why.

On line 1 the globally scoped `bar` is initialized and declared to the number `1`.

On line 2-4 is the function declaration `foo()`.

On line 6 we invoke `foo()`. Within the contents of  the function `foo()`'s body we reassign the globally scoped `bar` to the number `2`.

Therefore on line 7 when we output bar` 2 is the value that is output.  This only occurs because we invoke `foo()`, otherwise we will output `1`.



Question 9
What does this code log to the console and why?

if (true) {
  var grade = 3;
  console.log(grade);
}

function test() {
  var grade = 4;
  console.log(grade);
}

test();

function review() {
  console.log(grade);
}

review();

answer:
The output will be
3
4
3
Here's why

on line 1- 4 is a block that represents an if statmenet. the logic is `if(true)`
the function scoped variable `var` is initialized and declared to the value `4` on line 2.
Because this is function scoped and there is no outer function, this variable is also available in the global scope.
On line 3 we  output the value of `grade` with `console.log(grade)`.
Since the conditional is using the boolean value `true` as the condition and `true` is always truthy, the block is executed.
This will log our first value `3`.


On line 6-9 we have the function declaration `test()`. On line 11 we invoke `test()`
Within the body of `test()` on line 7,  we initialize and declare the function scoped variable `grade` and assign it to the value `4`.
On line 8 we output the value of `grade` with `console.log(grade)`.
Since we invoked the function `test()` on line 6 we will log our next value. This will be `4` .

On line 13-15 we have the function declaration `review()`.  On line 17 we invoke the function `review()`.
On line 14 we have the line `console.log(grade)`. There is no variable `grade` defined within the function. So we use Javascript's lexical scoping to return into the higher
global scope. Because the function scoped `grade` on line 2 that is set to the value `3` is accesible in the global scope, that is the value that will be logged.

so that explains how our logged values are
3
4
3




Question 10
What is the output and why?

function ride() {
  bike = 'Schwinn';
  console.log(bike);
}

if (true) {
  console.log(bike);
}

ride();

answer:

This will result in a referenceError. Here's why

On line 1-4 there is the function declaration `ride()`.

On line 6-8 is an if statement block. The condition is the boolean value `true`, which is always truthy, and therefore will execute.
On line 7 we attempt to log `bike` with `console.log(bike)`. There is no `bike` variable that has been defined, however, so here is where our referenceError will occur.

On line 10 we invoke `ride()` which contents' will initialize and declare a global variable `bike` to the string value `'Schhwinn'` on line 2.
On line 3  we have `console.log(bike) which should log `'Schwinn'` if there are no other issues.

so because the if statement executes before the `ride()` function is invoked and declares a global variable for `bike` we will encounter a referenceError

Question 11. What is the output and why?

function ride() {
  bike = 'Schwinn';
  console.log(bike);
}

ride();

if (true) {
  console.log(bike);
}


answer:

This will output
`'Schwinn'
`'Schwinn'`
Here's why

On line 1-4 we have the function declaration `ride()`.
On line 6 we invoke the `ride()` function.
within the ride()` body on line 2 we initialize and declare the global variable `bike` to the string value `'Schwinn'`.
On line 3 we output `'Schwinn'` with `console.log(bike)`. That is our first output

On line 8-10 is the if statement block `if(true) {...}` The condition uses the boolean value `true` which is always be truthy. The block will therefore execute.
On line 9 we log `console.log(bike)`. Since there is a global variable `bike` assigned to `'Schwinn'`. That will be output here as well.

So we output `'Schwinn'` twice.


Question 12

What sequence of numbers will be logged to the console and why? Explain with precise language.

for (let i = 0; i <= 10; i += 2) {
  console.log(i);
}
The sequence of numbers will be
0
2
4
6
8
10

Here's why
We have a `for` loop. In this loop we have the block scoped `i` set to `0` `let i = 0;` In the loop this represents the current value that we will use to step through
 the loop with.

Following that we have our condition `i <= 10`. At every iteration we will use our current loop value to see if it is truthy or not with this expression. If it is truthy we
continue along to the next iteration, if it is not we cease the iteratrion.

The final aspect of the loop is our incrementing logic `i += 2`. Whenever the current value is truthy and passes our condition, we will set the value to its current value
+ 2 for the coming iteration. This will continue until the condition evaluates to false.

Here in this case we start with `0` and continue looping through until we are greater than `10` (since the condition is `i <= 10), logging the value at the end of each iteration
. Once we surpass 10, the condition evaluates to  false,  we exit the loop, and cease the execution of the code.



Question 13. The following code results in an infinite loop. Explain why and then explain what can be done to solve this.

for (let i = 0; ; i += 1) {
  console.log("and on");
}

answer:

Here we have an infinite loop because there is no set condition to break out of the loop.
The current value of `i` will continue to increment endlessly, and because there is no condition to check if the value is falsy, we will never exit.

To fix this we can simply add a condition. For example if we want to log `'and on'` 5 times we can use the condition `(i < 5)`


for (let i = 0; i < 5; i += 1) {
  console.log("and on");
}

Question 14. What is the difference between the following two code snippets? Explain each code snippet in detail.

let counter = 0;

while (counter > 0) {
  console.log('Woooot!');
  counter -= 1;
}

let counter = 0;

do {
  console.log('Woooot!');
  counter -= 1;
} while (counter > 0);

answer:
In the first snippet  no code will be logged.
In the second snippet '`Woooot!'` will be logged once.

here's why

snippet 1:
the globally scoped variable `counter` is initialized and declared to the value `0` on line 1.

from line 3-6 contains the `while` loop block.
The condition is `(counter > 0). `counter` is set to `0` so this condition evaluates to false. Therefore the code exits out of the loop before executing even once.
Thus, nothing is logged, despite  having the code on line 4 `console.log('Woooot!')`

snippet 2:
the globally scoped variable `counter` is initialized and declared to the value `0` on line 1.
line 3-6 contains the `do while` loop block.
The condition is `while (counter > 0)`. `counter` is set to `0` however, a `do while` loop will always execute at least once, even if the condition is falsy on the first iteration.
line 4 logs ` console.log('Woooot!');` which will output `'Woooot!'`.
line 5 decrements counter to the value `-1`.
the condition is checked and we see that counter < 0 since counter is `-1`.
the code then exits the loop and ceases.

Overall:
Here we can see through how `while` loops and `do while` loops operate differently, causes us to have slightly different results, with otherwise identical code.



Question 15
Take a look at the code below. Without running it, determine what it will log to the console.

let animal = 'horse';

switch (animal) {
  case 'duck':
    console.log('quack');
  case 'squirrel':
    console.log('nook nook');
  case 'horse':
    console.log('neigh');
  case 'bird':
    console.log('tweet tweet');
  default:
    console.log('*cricket*');
}

answer:

what will be logged is
`'neigh'`
`'tweet tweet'`
`'*cricket*'`

This is our output because of how switch statements operate. They do not automatically exit out of the statement once the specific case condition evaluates to true.
It will simply execute every other case following the truthy value here. In this case, that being the value of `animel` or `'horse'`.

To fix this we can add a `break` keyword following our truthy expression logic. which will cease the code at that point
```js
case 'horse':
    console.log('neigh');
    break
    rest of code..
...



Question 16. What does this code output and why?

if (false || true) {
  console.log('Yes!');
} else {
  console.log('No...');
}

answer:

the codw will outut `'Yes!'`.
Here's why

we have a `if` condition block.
on line 1 the logic is `(if false || true)`.
With the `||` operator it is evaluated from left to right and will return true if any value is truthy, and false if both are falsy.
Here the second operand is `true`, which is truthy. Therefore, the block will execute the `if` branch and log `'Yes!'`.


Question 17

What does this code output and why?

let sale = true;
let admissionPrice = !sale ? 5.25 : 3.99;

console.log('$' + admissionPrice);

answer:
On line 1 the globally scoped variable `sale` is initialized and declared to the boolean value `true`.
On line 2 the globally scoped variable `admissionPrice` is initialized and declared to the ternary expression `!sale ? 5.25 : 3.99;`.
looking at the ternary we have `!sale` the `!` will reverse our boolean value from `true` to `false`.
Therefore the ternary expression looks like this now `false ? 5.25 : 3.99`
A ternary expression will check to see if the given value is truthy and if so it will return the first value. Otherwise it will return the second.
Here `false` is falsy and therefore we will return the value `3.99`.

Finally we log the result of `console.log('$' + admissionPrice);`
since we know `admissionPrice`is set to `3.99` our logging will output
`'$3.99`


Question 18. What is the output and why?

function multiplesOfThree() {
  let divisor = 1;

  for (let dividend = 3; dividend <= 30; dividend += 3) {
    console.log(dividend + ' / ' + divisor + ' = 3');
    divisor += 1;
  }
}

multiplesOfThree;

answer:

There is no output

On line 1-8 we have the function declaration `(multiplesOfThree)`.
On line 10 we have the variable `multiplesOfThree` but the function `multiplesOfthree()` being invoked. \
Because of this the body of the function is not executed and the logs resulting from the loops within the function are not executed.



Question 19

What is the output and why?

console.log(greeting);

var greeting = 'Hello world!';

answer:
`undefined` is output.

On line 1 we have `console.log(greeting)

and on line 3 we have the function scoped variable `greeting` assigned to the string `'Hello world!'`.

Because the keyword `var` is used, with the concept of hoisting we will hoist the variable name `greeting` to the top of the program. The value assigned is not hoisted up though.
therefore when we log the `greeting` on line 1, we will not have a ReferenceError, but no value will be assigned.
so `undefined' is output.


Question 20.

What is the output and why?

console.log(greeting);

let greeting = 'Hello world!';

answer:

This will result in a ReferenceError

On line 1 we have `console.log(greeting)`.

On line 2 we initialize the globally scoped variable `gretting` and declare it to the string value `'Hello world'`.

this code will result in a ReferenceError as on line 1 when we attempt to log `greeting` there is no variable by that  name that is within scope at that point.
Line 2 will create a globally scoped variable, but the error would have already occured prior to this.


Question 21. What will the following code log to the console and why? Don't run it until you have tried to answer.

if (true) {
  let myValue = 20;
}

console.log(myValue);


Answer:

The code will run into a ReferenceError.
Here's why

On line 1-3 an if statement block is defined. the condition is `if(true) {...}` The boolean `true` is always truthy, therefore the if statement will execute.
On line 2 the block scoped variable `myValue` is initialized and declared to the number value `20`.
On line 5, back in the global scope we attempt to log `myValue` with `console.log(myValue)`.
This will result in our ReferenceError as this attempts to find `myValue` in the global scope. There is none, `myValue` within our if statmenet is block scoped and not accessible.
This results in the ReferenceError



Question 22.
What will the following code log to the console and why? Don't run it until you have tried to answer.

function myFunction() {
  let a = 1;

  if (true) {
    console.log(a);
  }
}

answer:

There will be nothing output in this code

from line 1-7 we have the function declatation `myFunction()`.
The content of the function's body, however, does not matter as the code is never invoked.
Since the function is the only present content of the code. Nothing is output.


Question 23.
What will the following code log to the console and why? Don't run it until you have tried to answer.

function myFunction() {
  let a = 1;

  if (true) {
    console.log(a);
    let a = 2;
    console.log(a);
  }
}
myFunction();


answer:

The code will result in a reference error

On lines 1-10 we have the function declaration `myFunction()`.
On line 11 `myfunction()` is declared.

The `let` keyword will result in block scoped variables. If in the global scope, it will be accessible there.
On line 1 the block scoped variable `a` is initialized and defined to the number value `1`

On lines 4-9 the if conditional block is defined. The condition `if(true) {...}` is used. `true` will always be a truthy value. Therefore this if statement will execute.
On line 5 we have the code `console.log(a)`. This will result in our ReferenceError as we are attempting to find the variable `a` in the current block.
This error will occur because `a` in the outer scope is being shadowed by `a` that will be declared on the next line. Even though it technically has not been initialized
it does exist due to the temporal dead zone.  so when we try to acceess this `a` with no value we will get an error because it has not been declared.
So the code results in  a ReferenceError.


Question 24.
 What will the following code log to the console and why? Don't run it until you have tried to answer.

let a = 5;
let b = false;

if (a > 4) {
  let b = true;
}

console.log(b);


answer:
The code will log `false`

The keyword `let` makes a variable block scoped, and when it is declared in the global scope, it is accessible in the global scope
On line 1 the globally scoped variable `a` is initialized and declared to the number value `5`.
On line 2 the globally scoped variable `b` is initialized and declared to the boolean value `false`.

on line 4-6 is an if statement block `if (a > 4) {...}`. THe condition is evaluating whether `a`,  which is set to `5`, is greater than 5. This will evaluate to true. The if statement will execute e
On line 5 we initialize and declare a block scoped variable `b` to the boolean value `true`.
we exit the block and on line 7 we log `console.log(b`).
This is back in the global scope so the accessible global variable `b` which is assigned to `false` will be output.

Therefore the code results in logging `false`.



Question 25.
Launch School Reference
What will the following code log to the console and why? Don't run it until you have tried to answer.

let a = 1;

function myFunction() {
  console.log(a);
}

myFunction();

answer:

This will output the value `1`

the `let` keyword makes the variable block scoped. When in the global scope, the given variable will be availble globally
On line 1 the globally scoped variable `a` is initialized and declared to the number value `1`.

On lines 3-5 is the function declaration `myFunction()`
On line 5 `myFunction()` is invoked

Within the body of `myFunction()` on line 4 is the code `console.log(a)`.
There is no variable `a` declared within the function so Javascript will lexically search into the global scope and find the globally scoped value `a`.

this variable is assigned to `1` so the result of invoking `myFunction() will output the number value `1`


Question 26
What will the following code log to the console and why? Don't run it until you have tried to answer.

let a = 1;

function myFunction(a) {
  console.log(a);
}

let b = 2;

myFunction(b);


answer:
The code will output the number `2`.

The `let` keyword will make a variable block scoped. When in the global scope, the value will be accessible globally.
 On line 1 the globally scoped variable `a` is initialized and declared to the number value `1`

 On lines 3-5 is the function declaration `myFunction(a)` which takes one parameter.

 On line 7 the globally scoped variable `b` is initialized and declared to the number value `2`.

 On line 9 `Myfunction(b)` is invoked with the value of `b` (which is `2`)  being passed in as an argument.

 Returning to the body of `myFunction()`
 On line 4 we have the code `console.log(a)`. `a` is referring to the passed in value of `2`.
 Therefore we will output the value `2` when we invoke `myFunction(b)`


 Question 27
Launch School Reference
What will the following code log to the console and why? Don't run it until you have tried to answer.

const a = 1;

function myFunction() {
  a = 2;
}

myFunction(a);

*/














