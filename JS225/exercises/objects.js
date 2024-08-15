function log(input) {
    return console.log(input)
}
//The code below is expected to output the following when run:

 const helloVictor = createGreeter('Victor');
 helloVictor.greet('morning');
//= Good Morning Victor

function createGreeter(name) {
  return {
    name,
    morning: 'Good Morning',
    afternoon: 'Good Afternoon',
    evening: 'Good Evening',
    greet(timeOfDay) {
      let msg = '';
      switch (timeOfDay) {
        case 'morning':
          msg += `${this.morning} ${name}`; // change to add 'this' keyword 
          break;
        case 'afternoon':
          msg += `${afternoon} ${name}`;
          break;
        case 'evening':
          msg += `${evening} ${name}`;
          break;
      }

      console.log(msg);
    },
  };
}

//However, it instead results in an error. What is the problem with the code? Why isn't it producing the expected results?

// answer: the issue is the fact that in the switch statement within the greet() function, we attempt to interpolate the variable morning with the passed in argument of name. 
// using name is no issue as the function still has access to the main function argument that is passed in. However the morning variable is a value corresponding with a property in 
// an object. This is outside of the current scope. we can fix this by using this.morning which will allows us to access that object property value. 


// 2. A grocery store uses a JavaScript function to calculate discounts on various items. 
// They are testing out various percentage discounts but are getting unexpected results. Go over the code, and identify the reason why they
//  aren't getting the expected discounted prices from the function. Then, modify the code so that it produces the correct results.

const item = {
    name: 'Foo',
    description: 'Fusce consequat dui est, semper.',
    price: 50,
    quantity: 100,
    discount(percent) {

      const discount = this.price * percent / 100;
      let newPrice = this.price - discount;  // changed this to newPrice to avoid mutating the current object's price property. 
  
      return newPrice;
    },
  };
  
 item.discount(20)  // should return 40
//= 40
 item.discount(50) // should return 25
//= 20
 item.discount(25) // should return 37.5
//= 15


// answer: the issue is that we are continously changing the property value of price in our object item with each discount we are creating. since the effects are mutating one object 
// each discount has the unintended result of working from a lower initial price (it should stay at 50). 
// to fix this we simply make sure not to modify the price property value and instead use a local variable in the function to return and reflect the changes. 



/*3. Testing Object Equality

In JavaScript, comparing two objects either with == or === checks for object identity. In other words, the comparison evaluates as true
 if it's the same object on either side of == or ===. This is a limitation, in a sense, because sometimes we need to check if two objects have the same key/value pairs.
  JavaScript doesn't give us a way to do that.

Write a function objectsEqual that accepts two object arguments and returns true or false depending on whether the objects have the same key/value pairs.

a: 
if the two objects converted to an array contain different lengths. return false 
convert each argument into an array of keys and values 
if each property value matches the current index then return true 
else false 


*/ 

function objectsEqual(objOne, objTwo){
    if (Object.entries(objOne).length !== Object.entries(objTwo).length) return false;
    let arrOne = Object.entries(objOne).sort()
    let arrTwo = Object.entries(objTwo).sort()
    for (let i = 0; i < arrOne.length; i += 1) {
        if (arrOne[i][0] !== arrTwo[i][0] || arrOne[i][1] !== arrTwo[i][1]) {
            return false; 
        }
    }
    return true; 
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({a: 'foo', b: 'bar'}, {b: "bar", a: 'foo'}));  // true
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false


/* 
4. Student

Create an object factory for a student object. The student object should have the following methods and it should produce the expected results demonstrated in the sample code:

    info: Logs the name and year of the student.
    addCourse: Enrolls student in a course. A course is an object literal that has properties for its name and code.
    listCourses: Returns a list of the courses student has enrolled in.
    addNote: Adds a note property to a course. Takes a code and a note as an argument. If a note already exists, the note is appended to the existing one.
    updateNote: Updates a note for a course. Updating a note replaces the existing note with the new note.
    viewNotes: Logs the notes for all the courses. Courses without notes are not displayed.

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

let foo = createStudent('Foo', '1st');
foo.info();

// "Foo is a 1st year student"

foo.listCourses();
// [];
log(foo.listCourses())

foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });



// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
// "Advance Math: Difficult subject"


foo.updateNote(101, 'Fun course');
foo.viewNotes();

// "Math: Fun course"
// "Advanced Math: Difficult subject"




/* 
5. School 

Create a school object. The school object uses the same kind of student object as the previous exercise. 
It has methods that use and update information about the student. Be sure to check out the previous exercise for the other arguments that might be needed by the school object.
 Implement the following methods for the school object:

    addStudent: Adds a student by creating a new student and adding the student to a collection of students. The method adds a constraint that the year can only be any
     of the following values: '1st', '2nd', '3rd', '4th', or '5th'. Returns a student object if year is valid otherwise it logs "Invalid Year".
    enrollStudent: Enrolls a student in a course.
    addGrade: Adds the grade of a student for a course.
    getReportCard: Logs the grades of a student for all courses. If the course has no grade, it uses "In progress" as the grade.
    courseReport: Logs the grades of all students for a given course name. Only student with grades are part of the course report.

To test your code, use the three student objects listed below. Using the three student objects, produce the following values 
from the getReportCard and courseReport methods respectively.

*/ 


function createSchool() { 
    return {
        students: [], 

        addStudent(student) {
            if (['1st', '2nd', '3rd', '4th', '5th'].includes(student.year)) {
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

        addGrade(student, course, grade = 'In Progress') {
          
           student = this.selectStudent(student)
           let courses = student.course; 
           
    
           for (c of courses) {
            if (c.name === course)
            c.grade = grade 
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


let mySchool = createSchool()
let paul = createStudent('paul', '3rd')
let mary = createStudent('Mary', '1st')
let kim = createStudent('Kim', '2nd')
let students = [paul, mary, kim]
students.forEach((student) => mySchool.addStudent(student))
mySchool.enrollStudent(paul,{ name: 'Math', code: 101 } )
mySchool.enrollStudent(paul, {name: 'Science', code: 102})
mySchool.enrollStudent(mary, {name: 'Math', code: 101})
mySchool.enrollStudent(mary, {name: 'Science', code: 102})
mySchool.enrollStudent(kim, {name: 'Math', code: 101})
mySchool.enrollStudent(kim, {name: 'Science', code: 102})

mySchool.addGrade(paul,'Math', 95 )
mySchool.addGrade(paul, 'Science', 89)
mySchool.addGrade(mary,'Math', 99 )
mySchool.addGrade(mary, 'Science', 97)
mySchool.addGrade(kim,'Math', 82 )
mySchool.addGrade(kim, 'Science')
mySchool.getReportCard(paul)
mySchool.courseReport('Science')







/*
console.log(paul);
// {
//   name: 'paul',
//   year: '3rd',
//   courses: [
//     { name: 'Math', code: 101, grade: 95, },
//     { name: 'Advanced Math', code: 102, grade: 90, },
//     { name: 'Physics', code: 202, }
//   ],
// }

console.log(mary);
// {
//   name: 'Mary',
//   year: '1st',
//   courses: [
//     { name: 'Math', code: 101, grade: 91, },
//   ],
// }

console.log(kim);
// {
//   name: 'Kim',
//   year: '2nd',
//   courses: [
//     { name: 'Math', code: 101, grade: 93, },
//     { name: 'Advanced Math', code: 102, grade: 90, },
//    ],
// }

//getReportCard output

 school.getReportCard(paul);
//Math: 95
//Advanced Math: 90
// Physics: In progress

//courseReport output

 school.courseReport('Math');
// =Math Grades=
//Paul: 95
// Mary: 91
// Kim: 93
// ---
// Course Average: 93

school.courseReport('Advanced Math');
//=Advanced Math Grades=
//Paul: 90
//Kim: 90
//---
// Course Average: 90

school.courseReport('Physics');
// undefined

*/ 