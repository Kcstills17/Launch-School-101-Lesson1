//1. Is JavaScript a garbage-collected language, and if so, what does this entail?
// Yes. This means that JS, not the developer, handles memory deallocation.


// 2. Consider the code below:

let myNum = 1;

function foo() {
  let myArr = ['this is an array'];
  // what is eligible for GC here?
}

foo();

// what is eligible for GC here?

// more code

// Are either of the values 1 or ['this is an array'] eligible for garbage collection on line 11? What about on line 16?


//Write a function named greet that takes two arguments and logs a greeting:

function greet(arg1, arg2) {
    let captalizedFirstLetter = arg1[0].toUpperCase();
    console.log(captalizedFirstLetter + arg1.slice(1) + ',' + ' ' + arg2 + '!')
}

greet('howdy', 'Joe');
//Howdy, Joe!
greet('good morning', 'Sue');
// Good morning, Sue!


// we now want to be able to supply any operation, not just subtraction. Implement makePartialFunc below.

function makePartialFunc(func, b) {
  // implement this function...
  return function(a) {
    return func(a, b)
  }
}

function multiply(a, b) {
  return a * b;
}

function divide(a, b) {
  return a / b;
}

let multiplyBy5 = makePartialFunc(multiply, 5);
let divideBy2 = makePartialFunc(divide, 2);

console.log(multiplyBy5(100)); // 500
console.log(divideBy2(100)); // 50

//multiplyBy5 retains access to func and b long after makePartialFunc has finished execution. What makes this possible?

// answer: due to the closures made at the outer functions' definitions. This allows those values to still be referenced post execution.


let subjects = {
    English: ['Bob', 'Tyrone', 'Lizzy'],
    Math: ['Fatima', 'Gary', 'Susan'],
    Biology: ['Jack', 'Sarah', 'Tanya'],
  };
  
  function rollCall(subject, students) {
    console.log(subject + ':');
    students.forEach(function(student) {
      console.log(student);
    });
  }
  
  function makeMathRollCall() {
    // implement this function...
    return function(student) {
        return rollCall('Math', student)
    }  }
  
  let mathRollCall = makeMathRollCall(subjects);
  mathRollCall(subjects['Math']);
  // => Math:
  // => Fatima
  // => Gary
  // => Susan
  
  //Implement makeMathRollCall such that it returns a partially applied rollCall function, with the subject as 'Math'.
  
  