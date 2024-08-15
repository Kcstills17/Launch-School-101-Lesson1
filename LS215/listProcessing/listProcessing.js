function log(input) {
    return console.log(input)
}

/* 
1. Sum of Digits

Write a function that takes one argument, a positive integer, and returns the sum of its digits. Do this without using for, while, or do...while loops - instead, use a series of method calls to perform the sum.


PEDAC: 

E: 
input is a postive integer. 
output is the sum of the input's digit
cannot use for, hwile, or do...while loops 

I: 
DS: input:number 
    output:number 

    use string to get each digit and then convert back to numbers to perform operation. 

A: 

initialize arrDigits to the result of converting the input into a string 
and splitting the values up into an array of string. 
transform each value into a number in a new array. 
initialize this as numberArr 
reduce the values of numberArr by getting the sum of all values. 
return this total value 




*/

function sum(num) {
    let arrDigits  = String(num).split('')
    let numberArr = arrDigits.map((digit) => Number.parseInt(digit, 10))
    return numberArr.reduce((accum, curr) => {
        return accum += curr

    }, 0)

}


 
sum(23);           // 5
sum(496);          // 19
sum(123456789);    // 45


/*


2. Alphabetical Numbers

Write a function that takes an array of integers between 0 and 19 and returns an array of those integers sorted based on the English word for each number:

    zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Do not mutate the argument.

PEDAC: 


E: 
input is an array of integers between 0-19.   
output is an array of the same integers, but they are sorted by their english word counterpart. 
do not mutate the argument 

I: 

DS: 
 I; array of numbers 
 O: Array of numbers sorted by english spelling 

 A:
initialize alphaNumObj and create a key for each number 0-19. make the value 
the english version of it's counterpart. 

we need to compare our current elment as with obj[elem] to access its value with the next element. 
we have to create this custom sort logic as the standard sort wont be able to help. 

initialize copyArr to a copy of the input array so we can avoid duplicating that array 

sort the copyArr and return the mutated copyArr

function alphaObj
//manually create our alphaNumobj and return that value 

function alphaNumSort 
// pass in an array that we will use to sort and an obj that we will use to access the values of specific properties. 
 sort by using a, b to represent the current and next value .
 if the o[a] is less than o[b] then return -1. if  it is larger than return 1 and otherwise return 0 



Example:



*/ 

function alphaNumObj() {
    return  {
        '0': 'zero', '1': 'one', '2': 'two', '3': 'three', '4': 'four',
        '5': 'five', '6': 'six', '7': 'seven', '8': 'eight', '9': 'nine',
        '10': 'ten', '11': 'eleven', '12': 'twelve', '13': 'thirteen', 
        '14': 'fourteen', '15': 'fifteen', '16': 'sixteen', '17': 'seventeen', 
        '18': 'eighteen', '19': 'nineteen'
      };
}


function sortAlphaNum(arr, o) {
    arr.sort((a, b) => {
        
        if (o[a] < o[b]) {
            return - 1 
        } else if (o[a] > o[b]) {
            return 1
        }
        return 0 
    })
}

function alphabeticNumberSort(arr) {
    let alphaNumObject = alphaNumObj()
    let dupArr = arr.slice()
    sortAlphaNum(dupArr, alphaNumObject)
   
    return dupArr
}
(alphabeticNumberSort(
   [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]



let arr = [1, 2, 3, 4]
let obj = { '1': 'one', '2': 'two', '3': 'three', '4': 'four' }



/*
3. 

Multiply All Pairs

Write a function that takes two array arguments, each containing a list of numbers, and returns a new array containing the products of all combinations of 
number pairs that exist between the two arrays. The returned array should be sorted in ascending numerical order.

You may assume that neither argument will be an empty array.

PEDAC: 
E: 
input is two arrays. 
output is an array of all possible products between the first array values and the second array values. 

I: 

DS: 
input is two arrays 
output is one result array from the product of all values between the two 

A: 

initialize an empty array named productOfBothArrays 
iterate through arr1 and get each element 
for each element we want to pass this value into multpElemByNth() which will also pass in arr2 to iterate through 
push this value onto productOfBothArrays 
flatten productOfBothArrays and initialize as  allValuesArr 
sort allValuesArr by it's numeric value and return it 


multpElembyNth(num, arr)

iterate through and get each value of the arr 
transform each value by multiplying it by num. return tnat array 

return resiltArr 


*/ 
function multpElemByNth(num, arr) {
    return arr.map((elem) => elem * num)
}

function multiplyAllPairs(arr1, arr2) {
    let productOfBothArrays = []

    arr1.forEach((elem) => {
        productOfBothArrays.push(multpElemByNth(elem, arr2))
    })
    allValuesArr = productOfBothArrays.flat()
    return allValuesArr.sort((a, b) => a - b)

}


multiplyAllPairs([2, 4], [4, 3, 1, 2]);    // [2, 4, 4, 6, 8, 8, 12, 16]



/*
4. Sum of Sums

Write a function that takes an array of numbers and returns the sum of the sums of each leading subsequence in that array.
 Examine the examples to see what we mean. You may assume that the array always contains at least one number.

 E: 
 input is an array 
 output is a number that represents the total sum of each individual sum up the given index. 
 e.g. [1, 2, 3, 4] at index 0 the sum is 1. this is added to the total. at index 1 the total sum is 3 this is added to the total of 1 to make 4. 
 at index 2 the total sum is 6, which added to the total is 10. and at index 3 the sum is 10, which added to the total is 20. which gives us a final total of 20 

 The array will always contain at least one number. So no worries about empty arrays. 


 A: 
 initialize total to 0 
 iterate through a loop from 1 until the length of the array + 1 
 
 we want to get the value of all values from the 1st index to the currennt value.
 to do so we want to slice through values starting from the first index to the current one. Because of this we want to skip the first iteration to avoid dealing with an empty array 
 and we want to go over the length by 1 to get the full amount of values from slicng through our array.  
 at each iteration reduce this sliced array and add this value to total. 

 reduce total. 

=

*/ 

function sumOfSums(arr) {
    let total = 0 
 for (let i = 1; i < arr.length + 1 ; i+= 1) {
 total +=  arr.slice(0, i).reduce((accum, curr) => accum += curr)
 }
return total
}

sumOfSums([3, 5, 2]);        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
sumOfSums([1, 5, 7, 3]);     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
sumOfSums([4]);              // 4
sumOfSums([1, 2, 3, 4, 5]);  // 35



/*
5. Leading Substrings

Write a function that takes a string argument and returns a list of substrings of that string. 
Each substring should begin with the first letter of the word, and the list should be ordered from shortest to longest.

P: 
Explicit: 
input is  a string 
output is an array that contains all substring from the first letter of the input string. THe list should be ordered from shortest to longest .

I: 
don't have to deal with empty inputs 

DS: 
 input: string 
 output: array of all substring resulting from the first letter. 

A:  
we want to iterate through a array of our str values. We can use the spread operator to create an array of these values.
we know we will return the same amount of values as there are chars in our array. This is a good indication that transformation may be a good choice. 
Here we can iterate through and get each char and it's index. We only really need the index value 
we want to have all substring from the first character. So we can have all characters from index 0 up until the current value. 
We can accomplis this by slicing through the str from 0 to the index + 1. We want to increment the index by 1 since otherwise we will have an empty string included and exclude 
the final substring value 
return the new array. 




*/ 

function leadingSubstrings(str) {
   return [...str].map((_, i) => str.slice(0, i + 1 ))
}

leadingSubstrings('abc');      // ["a", "ab", "abc"]
leadingSubstrings('a');        // ["a"]
leadingSubstrings('xyzzy');    // ["x", "xy", "xyz", "xyzz", "xyzzy"]



/* 

6. All Substrings

Write a function that returns a list of all substrings of a string. Order the returned list by where in the string the substring begins.
 This means that all substrings that start at index position 0 should come first, then all substrings that start at index position 1, and so on.
  Since multiple substrings will occur at each position, return the substrings at a given index from shortest to longest.

You may (and should) use the leadingSubstrings function you wrote in the previous exercise:
PEDAC 
E:

I: 


DS: 


A: 
we need to utilize similar logic to the previous problen, however now we want the substring of all possible values  from our input string. 
We cannot just get every value upto the current point for the 0th index. But to compensate for that we can iterate through twice so that we go through each element str.length times 
at each index to slice through every substrings. 
initialize gloval var allSubstring to an empty arr
Iterate through a loop from 0 to the length of the array + 1. index will be known as i . THe condition is that i < the length of the str. 
within this loop we will loop once more. The  index will be known as nestedI. nestedI will be set to i + 1 and we want the condition to be <= to the length of 
the str. 
slice through an array of the string at position i to start with. and position nestedI to add elements. . 
append each array to allSubstrings

outside of the loop flatten all of the arrays in allSubstrings and return the value 





*/ 


isPalindrome('madam')
function substrings(str, func) {
    let allSubstrings = [];

    for (let i = 0; i < str.length; i++) {
        for (let nestedI = i + 1; nestedI <= str.length; nestedI++) {
            let currentSubstring = str.slice(i, nestedI);
            if (func !== undefined) {
                func(currentSubstring) ? allSubstrings.push(currentSubstring) : currentSubstring
            } else {
                allSubstrings.push(currentSubstring);
            }
        }
    }
    return allSubstrings;
}


substrings('abcde');



// returns
[ "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e" ]



/* 
7. Palindromic Substrings

Write a function that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters
 forwards as backwards. The substrings in the returned list should be sorted by their order of appearance in the input string.
  Duplicate substrings should be included multiple times.

You may (and should) use the substrings function you wrote in the previous exercise.

For the purpose of this exercise, you should consider all characters and pay attention to case; that is, 'AbcbA' is a palindrome, but 'Abcba' and 'Abc-bA' are not.
 In addition, assume that single characters are not palindromes.


 PEDAC: 
 I: string 
 O: an array of all palindromic substring 

 any value <= 1 in length is not considered a palindrome 
 this is case sensitive 
A: 
 so we need to refactor our previous substring function in a way that allows further versatiity. So that we can test each substring in this instance if it is a palindrome. 

 within the first loop of the function we need to check to see whether or not we pass in a valid function. if it exist 
 invoke the function on the current substring and initialize it to currentSubstring. 
 if the passed in function is true then append the value to the allSubstring value.  otheriwse leave the allSubstring array as is. 

 //isPalindrome function 

 return false if the passed in string is <= to 1 
 initialize reverseStr to the result of splitting the input into an array, reversing, and joining back together. 
 return the boolean result of input === reverseString 

 // main function 
 invoke the substring method and pass in the input of the main function and isPalindrome. return this valeu 


*/ 

function isPalindrome(str) {
    if (str.length <= 1 ) {
        return false 
    }
    let reverseStr = str.split('').reverse().join('')
    return str === reverseStr 
}


function palindromes(str) {
      return substrings(str, isPalindrome)

}

palindromes('abcd');       // []
 palindromes('madam');      // [ "madam", "ada" ]

palindromes('hello-madam-did-madam-goodbye');
// returns

[ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo" ]

palindromes('knitting cassettes');
// returns
[ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]



/* 
8. Grocery List

Write a function that takes a grocery list in a two-dimensional array and returns a one-dimensional array. Each element in the grocery list contains a
 fruit name and a number that represents the desired quantity of that fruit. The output array is such that each fruit name appears the number of
  times equal to its desired quantity.

In the example below, we want to buy 3 apples, 1 orange, and 2 bananas. Thus, we return an array that contains 3 apples, 1 orange, and 2 bananas.

PEDAC: 

E: 
we are given an input array. This array is a 2 dimensional array and each nested array contains a string fruit name and a integer number value 
The output is to be a flat array that will add from each nested array the given fruit name n amount of times. (n being the number in the nested array)
e.g ['apple', 2] will add to the flat returned array ('apple', 'apple'.)

DS: input is a nested  array 
    output is a flat array which contains each fruit from the nested array the specified number amount of times. 


A: 
    initialize groceryList to an empty arr 
    first lets iterate through the nested array and get each arr 
    at this point we want to add the value at the 0th index of our array arr[1] amount of times. To do this we can use addToList()

    return groceryList 

    //addToList()
    this takes 2 params an arr that will be getting appended to (resultArr) and an iterative array we are looping through (loopArr) 
    iterate through a loop. Set the index to be the same value as loopArr at index 1. iterate until this value is < 1. decrement the index 
    with each loop append loopArr[0] to resultArr

    return resultArr
Example:


*/ 

function addToList(loopArr, resultArr) {
 
    for (let i = loopArr[1]; i > 0; i-= 1) {
        resultArr.push(loopArr[0])
    }
    return resultArr
}

function buyFruit(nestedArr) {
    let groceryList = []; 
    nestedArr.forEach((arr) => {
        
        return addToList(arr, groceryList)
    })
    return groceryList
}

log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]


/* 

9. Inventory Item Transactions

Write a function that takes two arguments, an inventory item ID and a list of transactions, and returns an array containing only the
 transactions for the specified inventory item.

PEDAC: 

E: 
input has two arguments. an inventory id and a list of transactions. 
output returns an array of all objects that have the matching id 

DS: 

A: 
to get only a specified list of objects returned in an array we can first iterate through the given array 
and get each list. from this list we want to only return a list if it's id value is === to the input id. 
return each of these objects 
returned the new resulting array 


*/ 

function transactionsFor(id, trans) {
    return trans.filter((list) => list.id === id)

}
/*
const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

console.log(transactionsFor(101, transactions));
// returns
// [ { id: 101, movement: "in",  quantity:  5 },
//   { id: 101, movement: "in",  quantity: 12 },
//   { id: 101, movement: "out", quantity: 18 }, ]

*/ 

/*
10. Inventory Item Availability

Building on the previous exercise, write a function that returns true or false based on whether or not an inventory item is available. 
As before, the function takes two arguments: an inventory item and a list of transactions. The function should return true only if the sum of the quantity values
 of the item's transactions is greater than zero. Notice that there is a movement property in each transaction object. A movement value of 'out' will decrease the item's quantity.

You may (and should) use the transactionsFor function from the previous exercise.

E: 
input is two arguments. id which represents a selected object from the array. and trans which represents an array of all objects 
output: is a boolean value. This is determined by the sum value of the specified id. the movement property can have a value of 'in' or 'out'. the former will add 
to our total where the latter will subtract from it. 

A: 
initialize total to 0 
we can use the transactionsFor function to get our particular array of specified id list objects 
initialize this array as idArray
iterate through idArray and get each obj. 
if the property key movement is === 'in' 
icrement total by the property value of quantity 
if the property key movement is === 'out' 
decrement the value of quantitiy from total 

return true if total > 0, otherwise return false 


Examples:

*/ 

function isItemAvailable(id, trans) {
    let total =0 
    let idArray = transactionsFor(id, trans)
    idArray.forEach((list) => {
        if (list.movement === 'in') {
            total += list.quantity
        } else 
        total -= list.quantity
    })
    return total > 0 

}

const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

log(isItemAvailable(101, transactions));     // false
isItemAvailable(105, transactions);     // true
