//Rewrite the following code using classic JavaScript syntax. That is, write it without using any of the shorthand notations described in the previous assignment.
/*
function foo(bar, qux, baz) {
  return {
    bar,
    baz,
    qux,
  };
}
*/

function foo(bar, qux, bax) {
  return {
    bar: bar,
    baz: baz,
    qux: qux,
  };
}


//Rewrite the following code using classic JavaScript syntax:
/*
function foo() {
  return {
    bar() {
      console.log("bar");
    },
    qux(arg1) {
      console.log("qux");
      console.log(arg1);
    },
    baz(arg1, arg2) {
      console.log("baz");
      console.log(arg1);
      console.log(arg2);
    },
  };
}
*/

function foo() {
  return {
    bar: function() {
      console.log('bar')
    },
    qux: function(arg1) {
      console.log('qux');
      console.log(arg1);
    },
    baz: function (arg1, arg2) {
      console.log("baz");
      console.log(arg1);
      console.log(arg2);
    },
  };
}


//Rewrite the following code using classic JavaScript syntax:
/*
function foo(one, two, three) {
  return {
    bar: one,
    baz: two,
    qux: three,
  };
}

let { baz, qux, bar } = foo(1, 2, 3);
*/



function foo(one, two, three) {
  return {
    bar: one,
    baz: two,
    qux: three,
  };
}

//let bar = obj.bar;
//let baz = obj.baz
//let qux = obj.qux


// Rewrite the following code using classic JavaScript syntax:
/*
function foo([ one, , three ]) {
  return [
    three,
    5,
    one,
  ];
}

let array = [1, 2, 3];
let result = foo(array);
let [ bar, qux, baz ] = result;
*/

function foo(arr) {
  return [
    arr[2],
    5,
    arr[0],
  ];
}


//let bar = result[0]
//let qux = result[1]
//let baz = result[2]


//Rewrite the following code using classic JavaScript syntax:

function product(num1, num2, num3) {
  return num1 * num2 * num3;
}

let array = [2, 3, 5];
//let result = product(...array);

// answer
//let result = product(array[0], array[1], array[2])



//Rewrite the following code using classic JavaScript syntax:
/*
function product(...numbers) {
  return numbers.reduce((total, number) => total * number);
}

let result = product(2, 3, 4, 5);
*/

function product () {
  let args = Array.from(arguments);
  return args.reduce((total, number) => total * number);
}

let result = product(2, 3, 4, 5);


//Replace the word HERE in the following code so the program prints the results shown:

const HERE = { foo: 42, bar: 3.1415, qux: "abc" };

// answer
const  {foo, ...rest} = { foo: 42, bar: 3.1415, qux: "abc" };
console.log(foo);         // 42
console.log(rest);        // { bar: 3.1415, qux: 'abc' }


// Rewrite the final line of code in the following snippet using classic JavaScript syntax:
const obj = {
  first: "I am the first",
  second: "I am the second",
  third: [1, 2, 3],
  rest: { a: 'a', b: 'b' },
};

const { first, second, ...rest } = obj;


// answer

const first = obj.first;
const second = obj.second;
const rest = {
  third: obj.third,
  rest: obj.rest,
}

// Using shorthand notation, what is the missing code?

function qux() {
  let animalType = "cat";
  let age = 9;
  let colors = ["black", "white"];
  // missing code
  return {
    type: animalType,
    age,
    colors,
  };

}

let { type, age, colors } = qux();
console.log(type);    // cat
console.log(age);     // 9
console.log(colors);  // [ 'black', 'white' ]


/*

Write a function that takes 5 string arguments, and returns an object with 3 properties:

    first: the first argument
    last: the last argument
    middle: the middle 3 arguments as a sorted array

After writing the function, write some code to call the function. The arguments you provide should come from an array. You should create local variables named first,
last, and middle from the return value.

Use shorthand syntax wherever you can.

*/


function qux(first, middle1, middle2, middle3, last) {
  return {
    first,
    last,
    middle: [middle1, middle2, middle3].sort(),
  };
}

let arr = ["Fluffy", "Pudding", "Mister", "Ben", "Butterscotch"];
let { firsts, last, middle } = qux(...arr);
