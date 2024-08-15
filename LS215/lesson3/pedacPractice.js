function p(input) {
    return console.log(input)
}
/* 

Write a function called swap that takes a string as an argument, and returns a new string, where the alphabetic characters have taken the place of the numeric characters, and vice versa.
Examples / Test Cases

function swap(str) {
  // ...
}

console.log(swap("1a2b3c") === "a1b2c3"); // true
console.log(swap("abcd123") === "123dabc"); // true


P: 

Rules: 
Input takes a string 
output returns a new string where all alpha and numeric characters have been swapped 
There will always be an input and it will always be a string.
if the input is an empty string, return an empty string. 
If there are fewer of either alpha or numeric chars then add those characters as is to the new string. 
the input string can be upper/lowercase 
non alpha/numeric string are added to the new string as is 



Questions: 
Will we always have an input? 
how is the swap performed? is it that each streak of alpha or numeric chars count as one to be swapped until we reach the next counter (opposite of the alpha or numericd) value 
or is every individual alpha and numeric swapped? 
can other types of strings be present? How do we deal with them? 
Does this deal with an empty string as an input? 
can we have any non string as an input? 
What if there is only one numeric or one alpha value? What is returned in that case? 
What if there is an odd amount of string values. such as ('a1a')? Do we swap only when we come across an opposite type value? 
can the string include different cases? 


Examples: 

swap('') === ''
swap('a') === 'a'
swap('1') === '1'
swap('A1a') === '1Aa' 
swap('heLLo-12345.') === '12345-heLLo'

let's use last case 

'heLLO-12345' === '12345-heLLO' 
("ab1CD23") === "12a3DbC");
alphaArr = ['h', 'e', 'l', 'l', 'o]
numericArr = ['1', '2', '3', '4', '5']
- we can use a regex to split all string by any different alpha or numeric char so here we would have 


DS: 
intermediary:  we can split our string into an array consisting of values that are split by any new sequence of alpha,numeric, or non alpha/numeric digit 
we can use this to compare the current index to the next 


Algorithm: 
Branch 1. check to see if the input str is empty or if the input is a length of 1. if so return that input str 
1. create an array of all alphachars and an array of all numeric chars. split by each letter. set to an array if either are undefined. 
2. initialize a counter for alpha and a counter for numeric to both 0 . This will be incremented each time one is flipped. initialize replacedStr to an empty str 
4. map over an array of our input str and get each char and index   ['h', 'e', 'l', 'l', 'O', '-', '1', '2', '3', '4'','5']

    if the current char is included in the alph array. 
        acesss the index value numeric in the numericArr. reassign replacedStr to this value  alphaArr[0] === '1' if this value does not exist use the current char
        increment numeric by 1  === 1 
        return replacedStr  '1' 
    else if the current char is included in the numeric arr 
        access the index value alpha in the alpha array. reassign value to replacedStr. if this value does not exist then return the current char 
        increment alpha by 1 
        return replacedStr 
    otherwise 
        return char 

5. join the resulting array and return this string 



*/ 



function swap(str) {
if (str.length === 0 || str.length === 1 ) {return str;}
let alphaChars = str.match(/[a-z]/gi) || [];
let numericChars = str.match(/[0-9]/gi) || [];
let alphaCounter = 0;
let numericCounter = 0; 
let replacedStr = ''
 return str.split('').map((char) => {
    if (alphaChars.includes(char)) {
        replacedStr = numericChars[numericCounter] ?? char;
        numericCounter += 1;
        return replacedStr;
    
    } else if (numericChars.includes(char)) {
        replacedStr = alphaChars[alphaCounter] ??  char;
        alphaCounter += 1;
        return replacedStr; 
    }
    return char;
}).join('')

}



// happy case 

swap('1a2b3c') === 'a1b2c3'
swap('hello2828') === '2828hello'
swap("ab1CD23")

// empty string or odd seqence case 

//p(swap('') === '')
//p(swap('a') === 'a')
swap('1a1') === 'a11'
swap("123-4a#b$")
console.log(swap("12a") === "a21"); // true
console.log(swap("ab1") === "1ba"); // true
console.log(swap("abcd") === "abcd"); // true


// notes on performance 
// questions could be more specific 
