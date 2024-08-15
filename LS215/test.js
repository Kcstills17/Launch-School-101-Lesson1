function log(input) {
    return console.log(input)
}


/* 
PEDAC 
E: 
input is an object that contains  5 keys from student1 to student5 
Each value corresponding with each student is another object which contains id:value 
and scores which has another object as a value. this object has two properties, exams and exercises 
which each value is an array of numbers. 

we are to calculate each student's average exam and exercise score 
The weight for the exam average is .65 so that will be multiplied by the exam average 
The weight for the exercise average is .35 so that will be multiplied by the exercise average 
add these two values together to get our final score 
Round this value to the nearest integer 
get the corresponding grade for this score. 
combine the final grade with the grade in this format '85 (B)'

The final output will return an object that contains two keys
studentGrades: 
exams: 

the value of studentGrades will be an array of string values that represents the combination 
of the total score and grade for each student. (['99 (A)'. '73 (C)', ...]

the value of exams is an array  of objects. Each object  represents a particular 
exam (of which there are 4) and each object contains a property for an average:, minimum:, and maximum: 

I: 
the average score of each exam can be left in it's normal number result form. No rounding needed 


DS: input is an object that contains information about our 5 students' grades. 
output: a new objecyt that contains  keys for studentGrades and exams. 
And each including an array of information about each 


A: 
We will break down this logic into multiple sections 



Get test average 
we can iterate through  and get each element of our exam or exercises. 
then divide by the size of the array. 
we will use this value as our average 

Get exercise Average 
Repeat previous logic without dividing. return value 

get total grade 
initialize  examwWeight to .65 and initialize exerciseWeight to .35 
initialize totalExamResulit to the product of examWeight and our average exam score 
initialize totalExerciseResult to the product of exerciseWeight and the average of the exercise score 
get the totalScore value by adding the previous two values and rounding to the nearest number 


function totalGrade(examAverage, exerciseAverage) {
let examWeight = .65
let exerciseWeight = .35
let totalExamScore = examAverage * examWeight 
let totalExerciseScore = ExerciseAverage * exerciseWeight 

return Math.round(totalExamScore + totalExerciseScore)
}

get score with letter grade 
Here we will have our total grade to use. 
passing in the toral grade we will append a parenthesis with the corresponding letter grade 
if the grade is between 90-100 append ('A')
if the grade is between 80-89 append ('B')
if the grade is between 70-79 append ('C')
if the grade is between 60-69 append ('D)
else append ('F')

Get all exam arrays 
Now our studentGrades are handled. But we have to get our exam averages, minimum, and maxium value 
to get all of the array values we need we will initialize an empty array called examsArr 
we will access each student  object and get all the way until we reach the .exams value 
append each array to our examsArr  

get specifc exam array 
to get any particular exam we must utilize our array of total exams and specify an index to access for each array and return that value 
doing do will give us an array totalling all values at that index (or all scores of that exam)


get exam average 
to get an exams average  we want to take the particular array and reduce the values. 
then divide by the length of the array. return that value 

get exam maxium and minum value 
return the largest value of the array to get maximum 
return smallest value of the array to get minimum 



Main function 
initialize studentsAverageData to an object that has the keys studentGrades and Exams. set both to 0 for now 

initialize allExams to the result of invoking allExamsScores and passing in studentScores 
initialize allExercises to the result of invoking allExerciseScores and passing in studentScores 

iterate through allExams and get each studentExam. 
for each iteration 
initialize examAverage to the result of getExamAverage. pass in allExams 
initialize exerciseAverage to the result of getExerciseAverage. Pass in allExercises
initialize totalScore to the result of invoking totalGrade. pass in both previous averages 
initialize gradeLetter to invoking getGradeletter. Pass in total score 













*/

let studentScores = {
    student1: {
      id: 123456789,
      scores: {
        exams: [90, 95, 100, 80],
        exercises: [20, 15, 10, 19, 15],
      },
    },
    student2: {
      id: 123456799,
      scores: {
        exams: [50, 70, 90, 100],
        exercises: [0, 15, 20, 15, 15],
      },
    },
    student3: {
      id: 123457789,
      scores: {
        exams: [88, 87, 88, 89],
        exercises: [10, 20, 10, 19, 18],
      },
    },
    student4: {
      id: 112233445,
      scores: {
        exams: [100, 100, 100, 100],
        exercises: [10, 15, 10, 10, 15],
      },
    },
    student5: {
      id: 112233446,
      scores: {
        exams: [50, 80, 60, 90],
        exercises: [10, 0, 10, 10, 0],
      },
    },
  };
  
  function getExamAverage(exams) {
    return exams.reduce((sum, score) => sum + score, 0) / exams.length;
}

function getExerciseTotal(exercises) {
    return exercises.reduce((sum, score) => sum + score, 0);
}

function calculateFinalGrade(examAverage, exerciseTotal) {
    return Math.round(examAverage * 0.65 + exerciseTotal * 0.35);
}

function getLetterGrade(grade) {
    if (grade >= 93) return 'A';
    if (grade >= 85) return 'B';
    if (grade >= 77) return 'C';
    if (grade >= 69) return 'D';
    if (grade >= 60) return 'E';
    return 'F';
}

function getStudentGrades(scores) {
    return Object.values(scores).map(student => {
        let examAverage = getExamAverage(student.scores.exams);
        let exerciseTotal = getExerciseTotal(student.scores.exercises);
        let finalGrade = calculateFinalGrade(examAverage, exerciseTotal);
        let letterGrade = getLetterGrade(finalGrade);
        return `${finalGrade} (${letterGrade})`;
    });
}

function getExamStats(scores) {
    let exams = Object.values(scores).map(student => student.scores.exams);
    let transposedExams = exams[0].map((_, colIndex) => exams.map(row => row[colIndex])); // this gives us each array of column elements

    return transposedExams.map(examScores => {
        let average = (examScores.reduce((sum, score) => sum + score, 0) / examScores.length).toFixed(1);
        let minimum = Math.min(...examScores);
        let maximum = Math.max(...examScores);
        return { average: parseFloat(average), minimum, maximum };
    });
}

function generateClassRecordSummary(scores) {
    return {
        studentGrades: getStudentGrades(scores),
        exams: getExamStats(scores)
    };
}


log(generateClassRecordSummary(studentScores))
  
 

 /* 


 // returns:
{
  studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
  exams: [
    { average: 75.6, minimum: 50, maximum: 100 },
    { average: 86.4, minimum: 70, maximum: 100 },
    { average: 87.6, minimum: 60, maximum: 100 },
    { average: 91.8, minimum: 80, maximum: 100 },
  ],
}

*/ 
