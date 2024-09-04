function log(input) {
    return console.log(input); 
}


// 1. What is This

// Read the following code carefully. What do you think is logged on line 16. Try to answer the question before you run the code.

const person = {
  firstName: 'Rick ',
  lastName: 'Sanchez',
  fullName: this.firstName + this.lastName,
};

console.log(person.fullName);
// will log Nan as 'this' is set to undefined in the global object. It is still set to the global object here which will just result in adding undefined + undefined which is NaN




// 2  The Franchise
/* 
The method franchise.allMovies is supposed to return the following array:

[
  'How to Train Your Dragon 1',
  'How to Train Your Dragon 2',
  'How to Train Your Dragon 3'
]

Explain why this method will not return the desired object. Try fixing this problem by taking advantage of JavaScript lexical scoping rules.
*/ 
const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    let self = this; // change 
    return [1, 2, 3].map(function(number) {
      return `${self.name} ${number}`; // use self context now to get name properties from the current context. 
    });
  },
};
log(franchise.allMovies())
// the error is because 'this' is set to the global object which will be set to undefined here. 
// to fix this using lexical scoping, within the allMovies() method we can initialize self to this. Which will set the current execution to the current object using self 
// now we access self.name instead of this.name to use the current property name. 


// 3. same as previous queston but use a hard bind with a anonymous function. At the end of the expression invoke .bind(this) 



// 4. Our very own bind()
// Function.prototype.bind is a method on all function objects that allows us to hard-bind a function to a particular object. The way this works is that you pass a context object to the bind method and it returns a new function that is essentially the same function but hard-bound to the context object supplied.
// nCreate a function myBind, that accepts two arguments: 1) The function to bind, 2) The context object, and returns a new function that's hard-bound to the passed in context object.


function myBind(func, context) {
    return function() {
        return func.apply(context)
    }
}



// 5. myBind() Improved

//Our earlier implementation of the Function.prototype.bind was simplistic. Function.prototype.bind has another trick up its sleeve besides hard-binding functions to context objects. It's called partial function application. Read this assignment and the MDN documentation to learn more about partial function application.

//Alter the myBind function written in the previous exercise to support partial function application of additional arguments to the original function.



function myBind(func, ctx, ...partialArgs) {
    return function(...args) {
      const fullArgs = partialArgs.concat(args);

      return func.apply(ctx, fullArgs);
    };
  }






// 6. myFilter()
// In this exercise we'll update the implementation of myFilter by adding the functionality of accepting an optional thisArg just like the original Array.prototype.filter.

function myFilter(array, func, thisArg) {
    const result = [];
  
    array.forEach(value => {
      if (func.call(thisArg, value)) {
        result.push(value);
      }
    });
  
    return result;
  }



// 7. Garbage Collection

// Read the following code carefully. Will the JavaScript garbage collection mechanism garbage collect the array assigned to the variable array after the function pushIt
//  is called on line 11?

function makeArrays() {
  let array = [];

  return () => {
    array.push('');
    return array;
  };
}

const pushIt = makeArrays();
pushIt();
// more code
// Answer: No since this function can be called multiple times and the function is modifying and returning an array. We must keep the array until the program finishes. 


/* 


8. Make a Stack

A stack is a compound data type like an array. The difference between an array and a stack is that in an array you can insert and remove elements in any order you want,
 but a stack has a rule whereby you can only add new elements at the end and remove the last inserted element.

Create a function newStack, that, when called, returns a stack object with three methods: push, pop, and printStack. push takes a value and appends it to the stack.
 pop removes and returns the last element from the stack. printStack logs each remaining element of the stack on its own line, starting with the item that was least recently
  added to the stack and ending with the most recently added item that is still on the stack.

Internally, use an array to implement the stack. Make sure that the array is not accessible from outside the methods.
*/ 

function newStack() {
    const currentStack = []; 
   return {
    currentStack, 
    push(val) {
       return currentStack[currentStack.length]  = val; 
    }, 
    pop() {
       return  currentStack = currentStack.length - 1; 

    }, 
    printStack() {
        log(currentStack)
    }

   }
}




/* 9. Don't Pollute My Window

Consider the following code:

const name = 'Naveed';
const greeting = 'Hello';

const greeter = {
  message: `${greeting} ${name}!`,
  sayGreetings() {
    console.log(this.message);
  }
};

Note that the message property uses the result of interpolation as its value. As a result, we have two global variables: name, and greeting that pollute the global scope.
As we already know, we should limit the use of global variables as much as we can. Here we can avoid using the global variables by simply setting the message property
 to the value "Hello Naveed!". But let's pretend that we must use variables and interpolation to accomplish this. Can you think of a way to refactor this code so we don't 
 have any other variables in the global scope besides greeter?
 */ 


 const greeter = {
    message: (() => {
      const name = 'Naveed';
      const greeting = 'Hello';
  
      return `${greeting} ${name}!`;
    })(),
  
    sayGreetings() {
      console.log(this.message);
    }
  };
  


  /* 
  10. School Improved

In an earlier exercise, we created a school object. It works, however, it can still be improved. The following are improvements for you to implement in the solution provided:

    Make the list students private. Right now, anyone can gain access to it and manipulate it.
    Make the constraint for allowed values for years a private variable. As a private variable it avoids an unnecessary statement in the addStudent
     method and at the same time makes the code more declarative.
    Make the getCourse function accessible in the addGrade method also. As it is, only the courseReport method has access.


    */ 



    function createStudent(name, year) {
    
        return { 
            name, 
            year, 
            course: [], 
            info() {
                log(`${name} is a ${year} year student.`)
            }, 
            
            listCourses() {
                return this.course 
            }, 
            addCourse(obj) {
                this.course.push(obj)
            }, 

            addNote(code, note) {
                for (obj of this.course) {
                    if (obj.code === code) {
                        if (obj.note) {
                            obj.note += `; ${note}`
                        } else {
                            obj.note = `${obj.name}: ${note}`
                        }
                    }
                
                }
            }, 

            viewNotes() {
                for (obj of this.course) {
                    log(obj.note)
                }
            }, 

            updateNote(code, newNote) {
                for (obj of this.course) {
                    if (code === obj.code) {
                        obj.note = `${obj.name}: ${newNote}`
                    }
                }
            }


        }
       
    }



function createSchool() { 
    const students = []
    const validYears = ['1st', '2nd', '3rd', '4th', '5th']
    function getCourse(student, courseName) {
        return student.listCourses().filter(({name}) => name === courseName)[0];
      }
    return {

        addStudent(student) {
            if (validYears.includes(student.year)) {
                let newStudent =  createStudent(student.name, student.year)
                this.students.push(newStudent)
            } else 
            return 'Invalid Year'

        }, 

        selectStudent(student) {
        let selectedStudent =  this.students.find((s) => s.name === student.name);
        if (selectedStudent) return selectedStudent; 
        return false; 
        }, 

        enrollStudent(student, course ) {
            student = this.selectStudent(student)
            if (student) {student.addCourse(course)}

        }, 

        addGrade(student, courseName, grade) {
            const course = getCourse(student, courseName);
      
            if (course) {
              course.grade = grade;
            }
          },

          
        getReportCard(student) {
            student = this.selectStudent(student)
            log(`${student.name}'s report card`)
            student.course.forEach((s) => log(`${s.name}: ${s.grade}`))

        }, 
        
        courseReport(course) {
            let studentScores = [];
            for (student of this.students) {
              for (c of student.course)  {
                if (c.name === course && Number.isInteger(c.grade)) {
                    studentScores.push([student.name, c.grade])
                }
              }
            }
            this.logCourseScoresAndAvg(studentScores, course)
        }, 

        logCourseScoresAndAvg(scores, course) {
            scores.forEach((score) => log(score[1]))
            let totalAverage = scores.reduce((accum, curr) => accum + curr[1], 0) / scores.length
            log(`=${course} Grades=`)
            scores.forEach((score) => log(`${score[0]}: ${score[1]}`))
            log(`Course Average: ${totalAverage}`)
        }
    }

}
