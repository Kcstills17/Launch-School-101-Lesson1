function log(input) {
    return console.log(input); 
}
/*
1. Lettercase Percentage Ratio

Write a function that takes a string and returns an object containing the following three properties:

    the percentage of characters in the string that are lowercase letters
    the percentage of characters that are uppercase letters
    the percentage of characters that are neither

You may assume that the string will always contain at least one character.

Problem:
we want to get an object and have 3 keys. lowercase, uppercase, and neither. Each will have a value represented in string which is the percentage that each sequence of particular values 
make up the input string. 

Rules: 
the input is a string. 
the input one will always contain one character or more. 

Patterns: 
'abCdef 123'
lowercase: a b d e f  : 5 
uppercase : C : 1 
neither is length of the str minus (uppercase count and lowerccase count) 10 - 6 -> 4 


DS: 
have 3 variables. 
create a percentageObj and set lowercase, uppercase, and neither as the keys 
calculate the variables 
set the respective key-value pairs to the variable values. 

Algorithm: 
1. initializ  const letterObj. create the keys lowercase, uppercase, and neither. set all values to ''
2. initialize lowerCaseCount to the result of getting all lowercase letters from the input, set to an empty array if no matches, then get the length
2. initialize upperCaseCount to the result of getting all uppercase letters from the input,  set to an empty array if no matches, then get the length
3. initialize neitherCount to the result of taking the length of the input and subtracting the sum of upperCaseCount and LowerCaseCount 

4. set the key value pair of lowercase to the result of calculatePercentage() converted to string
5. set the key value pair of uoppercase to the result of calculatePercentage() converted to string
6. set the key value pair of neither to the result of calculatePercentage()  converted to string

calculatePercentage(num, strLength)
initialize percentage to the result of dividing strLength from the num and multiplying by 100 
return formattedPerventage by making sure to add 2 decimal digits to the number. 




*/ 
const letterObj = {
    lowercase: '', 
    uppercase: '', 
    neither: ''
}; 

function calculatePercentage(num, strLength) {
    let percentage = num / strLength * 100
    return percentage.toFixed(2)
}


function letterPercentages(str) {
    let lowerCaseCount = (str.match(/[a-z]/g) || []).length
    let upperCaseCount = (str.match(/[A-Z]/g) || []).length
    let neither = str.length - (lowerCaseCount + upperCaseCount)
    
    letterObj.lowercase = calculatePercentage(lowerCaseCount, str.length)
    letterObj.uppercase = calculatePercentage(upperCaseCount, str.length)
    letterObj.neither = calculatePercentage(neither, str.length)
    return letterObj
}
letterPercentages('abCdef 123');
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

letterPercentages('AbCd +Ef');
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

letterPercentages('123');
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }

/*



2. Triangle Sides

A triangle is classified as follows:

    Equilateral: All three sides are of equal length.
    Isosceles: Two sides are of equal length, while the third is different.
    Scalene: All three sides are of different lengths.

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side,
 and every side must have a length greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

Write a function that takes the lengths of the three sides of a triangle as arguments and returns one of the following four strings representing the triangle's classification:
 'equilateral', 'isosceles', 'scalene', or 'invalid'.

Problem: 
we want to check if our triangle is valid and then check to see if the triangle is equilateral, isosceles, or scalene. 


Rules: 
the triangle will always have 3 sides. 
to be valid the sum of ther 2 smallest sides must be smaller than the largest and every side must have a length > 0


Patterns: 


DS: 
use boolean logic to rule out invalid triangles. we will put all inputs in an array to use in this logic

use if logic to rule type of triangle 

Algorithm: 

guardclause. initialize an array containing all three inputs.  isInvalidTriangle(arr) is true then return 'invalid

1. if all triangles have the same value return 'equilateral'
2. else if triangles at index 1 and index 2, 1 and 3, or if 2 and 3 are the same return 'isosceles
3  else return 'scalene

isInvalidTriangle(arr) 
1. initialize sortedArr to the result of sorting the arr in ascending order
2. if the first value of sortedArr is 0 or if index 0 + index 1 of sortedArr is <= index 2 of sortedArr then return true. 
3. return false



*/ 

function isInvalidTriangle(arr) {
    let sortedArr = arr.sort()
    
    if (sortedArr[0] === 0  || sortedArr[0] + sortedArr[1] <= sortedArr[2]) return true; 
    return false

}


function triangle(one, two, three) {
    let arr = [one, two, three]
    if (isInvalidTriangle(arr)) return 'invalid';

    if (arr.every((num) => num === arr[0])) {
        return 'equilateral';
    } else if (arr[0] === arr[1] || arr[0] === arr[2] || arr[1] === arr[2]) {
        return 'isoceles';
    } else 
    return 'scalene';

}
triangle(3, 3, 3);        // "equilateral"
triangle(3, 3, 1.5);      // "isosceles"
triangle(1.5, 3, 3)      // 'isosceles'
triangle(3, 4, 5);        // "scalene"
triangle(0, 3, 3);        // "invalid"
triangle(3, 1, 1);        // "invalid"



/* 



3. Tri-Angles

A triangle is classified as follows:

    Right: One angle is a right angle (exactly 90 degrees).
    Acute: All three angles are less than 90 degrees.
    Obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and every angle must be greater than 0. If either of these conditions is not satisfied,
 the triangle is invalid.

Write a function that takes the three angles of a triangle as arguments and returns one of the following four strings representing the triangle's classification:
 'right', 'acute', 'obtuse', or 'invalid'.

You may assume that all angles have integer values, so you do not have to worry about floating point errors. You may also assume that the arguments are in degrees.

Problem: 
we need to check if a triangle is valid. And then if it is return the type of triangle that is is 

Rules:  
all input will be integers. 
the sum of all angles must be exactly 180 and every angle must be > 0 to be valid. 


Pattern: 


DS: 
use an array to store each input and compare all values to see if valid and what type of triangle it is 

Algorithm:
1. initialize triArr to the result of putting all of our inputs into an array. 
2. if invalidTriangle(triArr) is true then return 'invalid' 
3. if any value in triArr is > 90 
    - return 'obtuse' 
4. if any value in triArr is === 90 
    - return 'right' 
5. else 
    - return 'acute' 

invalidTriangle(arr): 
1. if the sum of all values in arr is not equal to 180 or if all values in triArr are not > 0 return true 
2. return false 




*/ 

function invalidTriangle(arr) {
    if (arr.reduce((accum, curr) => accum += curr, 0 ) !== 180 || arr.some((angle) => angle <= 0 )  ) return true; 
    return false; 
}



function triangles(first, second, third) {
    let triArr = [first, second, third]; 
    if (invalidTriangle(triArr)) return 'invalid'

    if (triArr.some((angle) => angle > 90)) {
        return 'obtuse'
    } else if (triArr.some((angle) => angle === 90)) {  
            return 'right'
    } else {
        return 'acute'
    }

}
triangles(60, 70, 50);       // "acute"
triangles(30, 90, 60);       // "right"
triangles(120, 50, 10);      // "obtuse"
triangles(0, 90, 90);        // "invalid"
triangles(50, 50, 50);       // "invalid"



/* 


4. Unlucky Days

Write a function that takes a year as an argument and returns the number of 'Friday the 13ths' in that year.
 You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom). 
 You may also assume that the same calendar will remain in use for the foreseeable future.

Problem:  
we are to count all friday the 13ths that occur in a given year post 1752 (the modern gregorian calendar start)


Rules:
we can use future dates to predict the amount of friday the 13ths 

Pattern: 


DS:  
we need an array to match all day integers with the corresponding days of the week. 
we need an array to match all month integers with the corresponding month of the year 
iterate through array of months and get each day that the 13th falls on. 
   


Algorithm: 
1. initialize const days to an array starting from sunday to saturday
32 initialize count to 0 
4. iterate through a loop from 0 until the value 12. treat the index as a given month
     - initialize date to the result of creating a date object with the year as the input, the month as the current  index, and the day as 13 
    - get the integer value from getting the day of date. 
    - if the value is 5 then increment the count by 1 
5. return the count

*/ 

const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' ]; 

function fridayThe13ths(year) {
    let  count = 0
    for (let month = 0; month < 12; month += 1) {
        let date = new Date (year, month, 13);
        date.getDay() === 5 ? count += 1 : count
    }
    return count; 

}
fridayThe13ths(1986);      // 1
fridayThe13ths(2015);      // 3
fridayThe13ths(2017);      // 2
fridayThe13ths(2034)




/* 


5. Next Featured Number Higher than a Given Value

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, with all of its digits occurring exactly once each. 
For example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a function that takes an integer as an argument and returns the next featured number greater than the integer.
 Issue an error message if there is no next featured number.

NOTE: The largest possible featured number is 9876543201.

Problem: 
we are given an integer as an input. We are to find the next featured number. 
Characteristics of a featured number is it is odd, it is a multiple of 7, and all characters are unique. 
Issue an errror message if there is no next featured number. 

Rules: 
Largest  feature number is 9876543201. 
There will always be a single input. 
The input will always be a positive integer. 


Patterns: 

DS:  looping mechanism starting from the input value + 1 until the max featured num length 
     return a number if there is a matching featured number or finish the loop 

Algorithm: 
1. initialize maxFeaturedNum to a const of 9876543201
2. iterate through a loop from the input + 1 until maxFeaturedNum 
    - if the current index is odd, is a multiple of seven, and return true for allUniqueDigits() return the char 

- if the loop ends return 'There is no possible number that fulfills this requirement 

AllUniqueDigits(num)
1. initialize stringDigits to the result of converting the num into string. 
2. initialize countObj to an empty obj
3. iterate through each digit in stringDigit
    - set each key in countObj to the current string. Set it's value to 0 + 1 or it's current value + 1 
4. iterate through all values in countObj and check to see if the count is all 1. 


*/ 
const maxFeaturedNum = 9876543201
function allUniqueDigits(num) {
    let stringDigits = String(num); 
    let countObj =  {}; 
    for (let digit of stringDigits) {
        countObj[digit] = (countObj[digit] || 0) + 1
    }
    return Object.values(countObj).every((num) => num === 1)
}


function featured(num) {
    for (let i = num + 1; i <= maxFeaturedNum; i += 1) {
        if (i % 2 !== 0 && i % 7 === 0 && allUniqueDigits(i)) {
            return i
        }
    }
    return "There is no possible number that fulfills those requirements."; 
}

featured(12);           // 21
featured(20);           // 21
featured(21);           // 35
featured(997);          // 1029
featured(1029);         // 1043
featured(999999);       // 1023547
featured(999999987);    // 1023456987
featured(9876543186);   // 9876543201
featured(9876543200);   // 9876543201
featured(9876543201);   // "There is no possible number that fulfills those requirements."




/* 


6. Bubble Sort

'Bubble Sort' is one of the simplest sorting algorithms available. Although it is not an efficient algorithm,
 it is an excellent exercise for student developers. In this exercise, you will write a function that sorts an array using the bubble sort algorithm.

A bubble sort works by making multiple passes (iterations) through an array. On each pass, the two values of each pair of consecutive elements are compared.
 If the first value is greater than the second, the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps
  — at which point the array is completely sorted.
					
6 	2 	7 	1 	4 	Start: compare 6 > 2? Yes
2 	6 	7 	1 	4 	Swap
2 	6 	7 	1 	4 	6 > 7? No (no swap)
2 	6 	7 	1 	4 	7 > 1? Yes
2 	6 	1 	7 	4 	Swap
2 	6 	1 	7 	4 	7 > 4? Yes
2 	6 	1 	4 	7 	Swap
					
2 	6 	1 	4 	7 	2 > 6? No
2 	6 	1 	4 	7 	6 > 1? Yes
2 	1 	6 	4 	7 	Swap
2 	1 	6 	4 	7 	6 > 4? Yes
2 	1 	4 	6 	7 	Swap
2 	1 	4 	6 	7 	6 > 7? No
					
2 	1 	4 	6 	7 	2 > 1? Yes
1 	2 	4 	6 	7 	Swap
1 	2 	4 	6 	7 	2 > 4? No
1 	2 	4 	6 	7 	4 > 6? No
1 	2 	4 	6 	7 	6 > 7? No
					
1 	2 	4 	6 	7 	1 > 2? No
1 	2 	4 	6 	7 	2 > 4? No
1 	2 	4 	6 	7 	4 > 6? No
1 	2 	4 	6 	7 	6 > 7? No
1 	2 	4 	6 	7 	No swaps; all done; sorted



 Problem: 
 we are to take an input array and bubble sort it. 
 That is to iterate through the array as many times until we can go through each element without swapping any two elements (a swap will occur when the first num is > then the second)


 Rules: 
if the input array is empty then return the input array. 
the input will only be an array 

 Patterns: 
[6, 2, 7, 1, 4]
start with 6: 6 > 2 yes so swap now it is [2, 6, 7, 1, 4]
now move on to  2:  2 > 7 no so no swap  [2, 6, 7, 1, 4]
now move on to 1. 1 > 4 no so no swap  [2, 6, 7, 1, 4]

we swapped once so we have to loop through again 
start with 2: 2 > 6 ? no so no swap 
move on to 6. 6 > 7 no so no swap 
move on to 7. 7 > 1 yes so swap. now we are [2, 6, 1, 7, 4]
move on to 7. 7 > 4. yes so swap. now we are [2, 6, 1, 4, 7]

We swapped so we loop again 
2 > 6 ? no 
6 > 1 ? yes. now [2, 1, 6, 4, 7]
6 > 4? yes. now [2, 1, 4, 6, 7]
6 > 7? no 

We swapped so we loop again 

2 > 1? yes. now [1, 2, 4, 6, 7]
2 > 4? no. 
4 > 6? no. 
6 > 7 ? no 

We swapped so we loop again  [1, 2, 4, 6, 7]
1 > 2 ? no
2 > 4 ? no 
4 > 6 ? no 
6 > 7 no 

no swaps so we return this version of the array 


 DS;
 we will use a copy of the input array and sort it to match what we want the bubble sort algorithm to eventually match. Until our array matches it we will continue to shift elements. 
 we will use a loop to compare each current element to the next until we reach the element before the input arr length 


 Algorithm: 
 guard clause. if the input array is empty we will return the input array 
 1. initialize targetArr to the result of making a copy of the input and sorting it. 
 2. while each index value of arr does not match each index value of targetArr repeat the following 
    - invoke sortSingleIteration(arr)

3. return arr 

sortSingleIteration(arr) 
    1. iterate through a loop from 0 until the length of the arr -1 non inclusive
        - compare the current value and the next value. if the current value is > then the next value then swap their places in the current arr 
    2. return the input arr 




 */ 

function sortSingleIteration(arr) {
    for (let i = 0; i < arr.length - 1; i += 1) {
        if (arr[i] > arr[i + 1]) {
            [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
          }
    }
    return arr

}

sortSingleIteration([6, 2, 7, 1, ]) // [2, 6, 1, 4, 7]

 function bubbleSort(arr) {
    if (arr.length === 0) return arr; 
    let targetArr = arr.slice().sort();

    while (!arr.every((_, i) =>  {
       return  arr[i] === targetArr[i]
    })) {
        sortSingleIteration(arr)
    }
    return arr; 

 }

const array1 = [5, 3];
bubbleSort(array1);
//console.log(array1);    // [3, 5]

const array2 = [6, 2, 7, 1, 4];
bubbleSort(array2);
//console.log(array2);    // [1, 2, 4, 6, 7]

const array3 = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array3);
//console.log(array3);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]





function ungroupStudents(arr) {
    let result = [];
    for (let obj of arr) {
      for (let studentData of obj.data) {
        log(obj.data)
        result.push({'teacher': obj.teacher, ...studentData})
      }
    }
    return result;
  }
  
  (ungroupStudents([{
    teacher: "Ms. Car",
    data: [{
       name: "James",
       emergenceNumber: "617-771-1082",
    }, {
       name: "Alice",
       alergies: ["nuts", "carrots"],
    }],
  }, {
    teacher: "Mr. Lamb",
    data: [{
      name: "Aaron",
      age: 3
    }]
  }]))
  
  // => [{
  //   teacher: "Ms. Car",
  //   name: "James",
  //   emergencyNumber: "617-771-1082",
  // }, {
  //   teacher: "Ms. Car",
  //   name: "Alice",
  //   alergies: ["nuts", "carrots"],
  // }, {
  //   teacher: "Mr. Lamb",
  //   name: "Aaron",
  //   age: 3,
  // }]
  
  