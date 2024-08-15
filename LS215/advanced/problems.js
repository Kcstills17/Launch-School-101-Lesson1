function p(input) {
    return console.log(input)
}

/* 


1. Rotating Matrix 
const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. For example,
 the 90-degree rotation of the matrix shown above is:

3  4  1
9  7  5
6  2  8

A 90-degree rotation of a non-square matrix is similar. For example, given the following matrix:

3  4  1
9  7  5

its 90-degree rotation is:

9  3
7  4
5  1

Write a function that takes an arbitrary MxN matrix, rotates it clockwise by 90-degrees as described above, and returns the result as a new matrix. 
The function should not mutate the original matrix.


Problem: 
We are to take an array of values and rotate each value 90 degrees clockwise and return this as a new matrix 

Rules: 
The input will always be an array. 
If the array is empty return an empty array 
The array can be of arbitrary mxn size (rows and columns)
You cannot mutate the input array 
return a new array 

Patterns: 
[1, 5, 8],     // orginal index position [0][0,1, 2]           
[4, 7, 2],                               [1][0, 1, 2]
[3, 9, 6],                               [2][0, 1, 2]

  becomes 

[3,  4,  1],                 
[9,  7,  5],                
[6,  2,  8]     

original index value location is 
[[2][0], [1][0], [0][0]], 
[[2][1], [1][1], [0][1]], 
[[2][2], [1][2], [0][2]]

pattern is row index will descend from last index place until 0 
and column index will start from 0 and increase 1 every time the row completes an iteration 





DS: a new array to store our return array 
we will create a rotate group array to store each subarray to then append to our main array 


Algorithm: 
1.initialize rotatedArr to an empty arr 
2. if the input arr is a square array 
  a.reassign rotatedArr to the result of squareArrRotate on the input arr 
3. else 
  a. reassign rotatedArr to the result of nonSquareArrRotate 
4. return rotatedArr 


squareArrRotate 
1. initialize returnArr 
2. iterate through an index from 0 up to the length of the input array 
  1a. initialize rotatedGroup to an empty arr 
  2a. iterate through another index from the length of the input array - 1  downto when the index >= 0 
    1b. push accessing the inner index and then the outer index value of our input array to rotatedPairs 
  3a. append rotateGroup to returnArr 
3. return returnArr 


nonSquareArrRotate 
1. initialize returnArr to an empty arr 
2. initialize columnLength to the length of the first index of the input array 
3. iterate through an index from 0 upto the columnlength. 
  1a. initialize columnGroup to an empty array 
  2a. iterate through another index from the length of the input array -1 downto and including 0 
    1b. append to columnGroup the result of accessing the first index and then the second index of our input array 
  3a. append columnGroup to returnArr 
4. return returnArr




Examples:


*/ 

const matrix1 = [
    [1, 5, 8],
    [4, 7, 2],
    [3, 9, 6],
  ];
  
  const matrix2 = [
    [3, 7, 4, 2],
    [5, 1, 0, 8],
  ];
  

function squareArrRotate(arr) {
    returnArr = []
    for (let i = 0; i < arr.length; i += 1) {
        let rotatedGroup = []
        for (let j = arr.length - 1; j >= 0; j -= 1) {
            rotatedGroup.push(arr[j][i]) 
     }
     returnArr.push(rotatedGroup)
    }
    return returnArr
    
}

function nonSquareArrRotate(arr) {
  let returnArr = []; 
  let columnLength = arr[0].length 
 
  for (let j = 0; j < columnLength; j += 1) {
    let columnGroup = []; 
    for (let i = arr.length - 1; i >= 0; i -= 1) {
      columnGroup.push(arr[i][j])
    }
    returnArr.push(columnGroup)
  }

  return returnArr
}



function rotate90(arr) {
    let rotatedArr = []; 
   if (arr.length === arr[0].length) {
    rotatedArr = squareArrRotate(arr)
   } else {
    rotatedArr = nonSquareArrRotate(arr)
   }
 return rotatedArr
}



const newMatrix1 = rotate90(matrix1);
const newMatrix2 = rotate90(matrix2);
const newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

console.log(newMatrix1);      // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
console.log(newMatrix2);      // [[5, 3], [1, 7], [0, 4], [8, 2]]
console.log(newMatrix3);      // `matrix2` --> [[3, 7, 4, 2], [5, 1, 0, 8]]

