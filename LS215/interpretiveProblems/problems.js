function log(input) {
    return console.log(input)
}

/* 
1. 1000 Lights

You have a bank of switches before you, numbered from 1 to n. Every switch is connected to exactly one light that is initially off.
 You walk down the row of switches and toggle every one of them. You walk back to the beginning of the row and start another pass.
  On this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back to the beginning again, this time toggling switches 3, 6, 9, and so on.
   You continue to repeat this process until you have gone through n repetitions.

Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after n repetitions.

Understand the Problem: 
we are connected to a bank of switches. each switch is connected to one light that is initially off. 
our input represents the number of switches we will have. 
the output will be an rray of lights that are still on after n amount of toggles. 
Once we have finished toggling we need to return an array of all values that are toggled on. (based on our DS that contains the values.)



Questions: 
will there always be an input argument?  yes 
we will have non positive values for an input?  no 
is there a maximum size for n that we want to deal with? a reasonable amount 
Are we to deal with NAN, Infinity, or -Infinity as number values?  no

Rules: 
We are given a positive integer value as our argument to represent the n amount of switches that we toggle. 
On each n turn we are toggling switches that are evenly divisible by n. 
We need to have some data structure to account for our switching. 




DS: An object is a good DS to deal with this type of logic. We can create an object by using a loop from 0 until the we are no longer smaller than the input integer. and make the 
current index the key and make all values false to simulate being off 


Algorithm:  (5)

toggle Algorithm: 
pass in an obj and an array of keys called keys 
    -  iterate through keys and get each key 
       - iterate through keys once more and get each index. 
            -initialize currentSwitch to index + 1. this is to use all possible switch values. As this will match the length starting from 1. and not the index count 
            - if the key converted to a number has a remainder of 0 from the current index 
                - set the current value of our obj to the result of toggling the value of the current object. 
    
return obj 


1. create our switchObj. loop through from 0 to the length of the input integer value. at each loop set the current property key to the index and each property value to false 
2. initialize turnedOnLights to an empty arr. also initialize switchObjKeys to the result of capturing an array of keys from the switchObj
3. invoke toggle and pass switchObj and switchObjKeys in as arguments 
4. filter through switchObj and select all keys in which the value is true.  initialize result to turnedOnLights 
5. transform turnedOnLights to make all string digits into numeric versions. return this array 
*/ 

function toggle(obj, keys ) {  
    keys.forEach((key) => {
      keys.forEach((_, i) => {
          let currentSwitch = i + 1; 
          if (Number(key) % currentSwitch === 0) {
           
              obj[key] = !obj[key]; 
          }
      })
  })
  return obj; 

}

function lightsOn(switches) {
  let switchObj = {}; 
  for (let i = 1; i <= switches; i += 1) {
    switchObj[i] = false;
  } 

  let switchObjKeys = Object.keys(switchObj)
  toggle(switchObj, switchObjKeys)

let turnedOnLights= switchObjKeys.filter((k) => {
    return switchObj[k] === true;
})
return turnedOnLights.map((v) => Number(v));
}

lightsOn(5);        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]



/* 
2. Diamonds

Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function.
 You may assume that the argument will always be an odd integer.

Understand The Problem: 
we are given an odd integer an an input. 
We are to output a four pointed diamond grid in a nxn grid. n representing the odd integer input 



Questions: 
is there a maxiumum size we want to account for?  a reasonable time complexity amount. 
are negative integers a valid input?  no 
can the input be a string that can be coerced?  no 
can the input be zero? no 



Rules: 
The input always has to be an odd integer. These is always a positive integer and accepts no other types as an argument. And there will always be one argument 
the diamond grid will always start from the smallest odd value (from 0) and print n amount of * upto and including the n that represents the input odd argument. 
output the result of decreasing the current * count by 2 until the count is less than This will not include the input integer again. 
Each output will need to be centered to match the diamond pattern 

example  7 
1
3
5
7
5
3
1

our padding logic will go as follows. 
At the beginning of each dimaond the left padding will match the input integer. 
While we are incrementing our diamond size (start from 1 until size of integer) we will decrease our padding by 1 
Once we reach our decrementing diamond (decreasee from max size of 9 to 7 for example) we will begin increasing the left padding by 1. 



DS: 
input: integer 
Output: string 
Intermediary: use the input for a looping mechanism to output a new string 


Algorithm: 
initialize variable star and declare to string value * 
initialize leftPadding to the same value as the input integer. 
enter a loop starting from 1 until the index is >= the input integer. increment by 1 
    concatenate the result of empty space repeated leftPadding times + star repeated index times. log this value 
    decrement leftPadding by 1 
if input is 1 return out of function 
decrement the leftPadding by 2; This is because we will be skipping the largest star value that matches the size of the integer since it is present in the previous loop. It must still be accounted for with our padding. 
Once we have finished that loop enter a new loop and set the index to the input integer - 2. loop until the index is <= 1. decrement the value by 2 
    concatenate the result of empty space repeated leftaPadding times + star repeated index times. log this value 
    increment leftPadding by 1 



 */ 

function diamond(num) {
    let star = '*';
    let leftPadding = num; 
    for (let  upperDiamond = 1; upperDiamond <= num; upperDiamond += 2) {
        log(' '.repeat(leftPadding) + star.repeat(upperDiamond))
        leftPadding -= 1;  
    }

    if (num === 1) {return;}
    leftPadding += 2

    for (let lowerDiamond = num - 2; lowerDiamond >= 1; lowerDiamond -= 2 ){
        log(' '.repeat(leftPadding) + star.repeat(lowerDiamond))
        leftPadding += 1;  
      
    }

}
/* 
diamond(1);
// logs
//*

diamond(3);
// logs
 //*
//***
// *

diamond(9);
// logs
    //*
   //***
  //*****
 //*******
//*********
 //*******
  //*****
   //***
    //*

    diamond(20)
*/ 


/*
3. Now I Know My ABCs

A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument and returns true if the word can be spelled using the set of blocks, false otherwise. 
You can consider the letters to be case-insensitive when you apply the rules.

Understand The Problem: 
we are given a string input which will represents a word. 
We are using spellingblocks to determine whether we return true or false 
each spelling block contains two letters. We can only use a single letter from each block and each block once. otherwise we return false 

must make all characters same case to deal with case insensitivity. 
if any character has a count > 1 we will short circuit and return false 




Questions: 
is empty string valid? if so what do we return? no 
Are any non spellingblock values included? if so how do we work with them?  no 


Rules: 
Each spellingblock can only be used once. If any full pair is included in the string the result will be false. 
Letters in the string are case insensitive to match the spellingblocks. 

DS: 
input: string 
output: boolean 
intermediary: use an object to store each character as a key and the count of each character as the value. We can use this with our spellingBlock nested array. 
              we can use each nested pair value as our key to check our value count. And then determine whether we return true or false 


Algorithm: 
1.initialize upperCase str to the result of uppercasing all of the input values 
2.initialize strCountObj to the result of invoke getCount() passing in upperCaseStr 
3. loop through from index 0 until the length of spellingBlock. name outerIndex 
    4. loop through once more from index 0 to the length of spellingBlock. Name pairIndex 
        5. (if the key value matching index 0 is > 1 or and the key value matching index 1 is > 1 return false. ) or (if the key value matching index 0 and the key value matching index 1 > 0 return false )

6. return true 

getCount(str)
initialize an empty obj; 
split the string into an array of string. name splitArr
iterate through splitArr from index 0 until the length of the string. 
    for each char check to see if this value has been included in our object yet. If not set the key to the char and the value to 0. otherwise increment the value by 1 
return the obj. 



Examples:


*/ 
const spellingBlock = [
    ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
    ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
    ['V', 'I'], ['L', 'Y'], ['Z', 'M']
  ];
  

  function getCount(str) {
    let obj = {}; 
    let splitArr = str.split('')
    for (let i = 0; i < splitArr.length; i += 1) {
        obj[splitArr[i]] = (obj[splitArr[i]] || 0) + 1;
    }
    return obj; 
  }

  getCount('APPLE')

function isBlockWord(str) {
    let upperCaseStr = str.toUpperCase(); 
    let strCountObj = getCount(upperCaseStr);

    for (let pair of spellingBlock) {
        if ((strCountObj[pair[0]] || 0) > 1 || (strCountObj[pair[1]] || 0) > 1 || 
            ((strCountObj[pair[0]] || 0) > 0 && (strCountObj[pair[1]] || 0) > 0)) {
            return false;
        }
    }
    return true;
}

isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true
isBlockWord('DucK') // true 
isBlockWord('AppLe') // false 






/* 
Caesar Cipher

Write a function that implements the Caesar Cipher. The Caesar Cipher is one of the earliest and simplest ways to encrypt plaintext so that a message can be transmitted securely.
 It is a substitution cipher in which each letter in a plaintext is substituted by the letter located a given number of positions away in the alphabet. For example
  if the letter 'A' is right-shifted by 3 positions, it will be substituted with the letter 'D'. This shift value is often referred to as the key.
   The "encrypted plaintext" (ciphertext) can be decoded using this key value.

The Caesar Cipher only encrypts letters (including both lower and upper case). Any other character is left as is.
 The substituted letters are in the same letter case as the original letter. If the key value for shifting exceeds the length of the alphabet,
  it wraps around from the beginning.

Examples:


Understand the Problem: 
We are to implement the caesar cipher.  This will encrypt the given input by moving it's position  a given amount of posiitons away in the alphabet. 
this cipher only affects letter (case insensitive). Other values are left alone 
by our examples we will take an input string. we will also take an integer that represents the shift positions 
if the shift exceeds the length of the input str, wrap aroind from the beginning 


Questions: 
Will we always have a string? 
will the shifting input always be positive? 
postive shifting values will always be to the right correct? 
when a value is uppercase or lowercase respectively do we wrap around to that given case's beginning? 

Rules: 
we must shift every leter from our given string by our shiftPosition 
When the shift exceeds the length of the input str, we will wrap around the letter from the beginning 
non letters are left alone 


DS: 
given our input is a string and an integer to represent the shift position we can use string to reassign a current value to it's new shifted posiiton. And add back to the original posiiton 
we can use the ASCII chart to use to shift our positions and then convert back to it's current letter state 
We also can use an array to transform our values. As the size will always be the same. And then convert back into string. 


lower case ASCII 97-122
uppercase ASCII 65-90

Algorithm: 
initialize an array of characters from the given string. name splitChars 
iterate through splitChars with the intention to transform specific characters 
    if the current char is a lowercase letter 
    convert the value to it's matching ascii value. increase by shiftPosition. 
        if this position is > 122  subtract the value by 26. 
    return the askii value converted back to a char. 
   else if the current char is uppercase 
        if this position is > 90 then subtract 26 from the askii value and set back to it's original form
    return the askii value convertedf back into a char. 

  else 
    return char

join the string back together and return the string. 


*/ 

function shiftCurrentChar(char, shiftPosition) {
    let asciiChar = char.charCodeAt(char);
    //log(`This is the char ${char} and it should shift by this much ${shiftPosition}`)
    let shiftedChar = asciiChar + shiftPosition;
    //log(`This is the shift position: ${shiftedChar} and its converted value ${String.fromCharCode(shiftedChar)}`)
 
  
    if (char.match(/[a-z]/g )) 
        return shiftedChar > 122 ? String.fromCharCode(shiftedChar - 26) : String.fromCharCode(shiftedChar);
    else if (char.match(/[A-Z]/g)) {
        return shiftedChar > 90 ? String.fromCharCode(shiftedChar - 26) : String.fromCharCode(shiftedChar);
    } else 
    
    return char;
}

function caesarEncrypt(str, shiftPosition) {
    let splitChars = str.split('');
   splitChars.map((char) => {
    return shiftCurrentChar(char, shiftPosition);
   }).join('')
}
/*
// simple shift
//caesarEncrypt('A', 0);       // "A"
//caesarEncrypt('A', 3);       // "D"

// wrap around
//caesarEncrypt('y', 5);       // "d"
caesarEncrypt('a', 47);      // "v"

// all letters
caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25);
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5);
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2);
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"

*/ 


/* 
5. Vigenere Cipher

The Vigenere Cipher encrypts alphabetic text using polyalphabetic substitution. It uses a series of Caesar Ciphers based on the letters of a keyword. 
Each letter of the keyword is treated as a shift value. For instance, the letter 'B' corresponds to a shift value of 1, and the letter 'd' corresponds to a shift value of 3.
 In other words, the shift value used for a letter is equal to its index value in the alphabet. This means that the letters 'a'-'z' are equivalent to the numbers 0-25.
  The uppercase letters 'A'-'Z' are also equivalent to 0-25.

Applying the Vigenere Cipher is done sequentially for each character by applying the current shift value to a Caesar Cipher for that particular character.
 To make this more concrete, let's look at the following example:

plaintext: Pineapples don't go on pizzas!
keyword: meat

Applying the Vigenere Cipher for each alphabetic character:
plaintext : Pine appl esdo ntgo onpi zzas
shift     : meat meat meat meat meat meat
ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

result: Bmnxmtpeqw dhz'x gh ar pbldal!

Notice that in the example, the key isn't moved forward if the character isn't in the alphabet. Like the Caesar Cipher, the Vigenere Cipher only encrypts alphabetic characters.

Write a function that implements the Vigenere Cipher. The case of the keyword doesn't matter—in other words, the resulting encryption won't change depending on the case of
 the keyword's letters (e.g., 'MEat' === 'mEaT').

For a quick lookup of a ciphertext per character, you may consult this tabula recta. Each row of the table corresponds to a Caesar Cipher encryption using the columns' character
 letter as a shift value.


 Understand The Problem: 
 The vigenere cipher uses a series of caesar cipher based on letters of a keyword (e.g. meat)
 each character in the alphabet represents a position (a-z => 0-25) for each letter of our current char it represents the position to shift ('e' would shift 4 positions )
 only alphabetic characters count towards our encryption. if it is not an alphabetic char than remain at the same encryptic position 


 Questions: 
 will the input contain a string for our string and another string to represent our shift? 
 can either input be empty? 


 Rules: 

 DS:  input is two string values. ourput is the result of our vingenere cipher based off our text and keyword 
    we can use an array for both uppercase and lowecase letters. and use the index position of each to use as our shift from our input string. 


 Algorithm: 
 initialize upperCaseArr to an array of all up. letters 
 initialize lowerCaseArr to an array of all low. case ltters 
 initialize currKeywordPosition to the 0th index of the input keyword 
 iterate through a split array from the input text with the intention of transforming each particular value based on our keyword position 
    - if the currKeywordPosition + 1 === the input text length then reset to 0, otherwise leave as be 
    - if the current char is lowercase 
        invoke shiftCurrentChar and pass in char and the index position of currKeywordPosition in lowerCaseArr. initialize as shiftedChar 
        increment currKeywordPosition by 1 
        return shiftedChar 
    - else if current char is uppercase 
         invoke vingereShift and pass in char and the index position of currKeywordPosition in upperCaseArr. initialize as shiftedChar 
        increment currKeywordPosition by 1 
        return shiftedChar 
    else 
        return char 

return the result of joining the array together by spaces 


vingereShift(char, shiftPosition) 
    initialize asciiChar to the result of incrementing 
        

 */ 

    const upperCaseArr = [
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
        'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
        'U', 'V', 'W', 'X', 'Y', 'Z'
      ];
      
      const lowerCaseArr = [
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
        'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
        'u', 'v', 'w', 'x', 'y', 'z'
      ];

      
 function vingereCipher(text, keyword ) {
    let currentKeywordPosition = 0;
    text.split('').map((char) => {
        if (currentKeywordPosition  === keyword.length ) {currentKeywordPosition = 0}

        if (char.match(/[a-z]/g)) {
            let shiftedChar = shiftCurrentChar(char, lowerCaseArr.indexOf(keyword[currentKeywordPosition]))
            currentKeywordPosition += 1 
            return shiftedChar

        }   else if (char.match(/[A-Z]/g)) {
            let shiftedChar = shiftCurrentChar(char, upperCaseArr.indexOf((keyword.toUpperCase()[currentKeywordPosition])))
            currentKeywordPosition += 1 
            return shiftedChar
        } else 
        return char 
    }).join('')
    
 }


 vingereCipher("Pineapples don't go on pizzas!", 'meat') // Bmnxmtpeqw dhz'x gh ar pbldal!
 vingereCipher("Pineapples don't go on pizzas!", 'cab') //  Riogaqrlfu dpp't hq oo riabat!
 vingereCipher('Dog', 'Rabbit') // Uoh 


 

/* 
6. Seeing Stars

Write a function that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the function
 The smallest such star you need to handle is a 7x7 grid (i.e., when n is 7).

Understand the problem: 
input is an odd integer 
the input (n) will represent a nxn grid. The smallest such star being 7x7 
star(7) 
*  *  *    // star, space, space, star, space, space, star  
 * * *     // space, star, space, star, spce, star, space
  ***      // space, space, space, star, star, star, space
*******    // star, star, star, star, star, star, star 
  ***      // space, space, star, star, star, space, space
 * * *     // space, star, space, star, space, star, space 
*  *  *    // star, space, space, star, space, space, star 


star(9);
*   *   * // gap between stars 3      spaces before and after stars // 0    // matches the current index for all values (if we split between top and bottom )
 *  *  *  //2                                                          1
  * * *  // 1                                                          2
   ***   // 0                                                          3
********* // 0                                                         0
   ***    // 0                                                         3
  * * *   // 1                                                         2
 *  *  *  // 2                                                         1
*   *   * // 3                                                         0


patterns: 
stars: all indexes except for the index that represents the halfway point will have 3 stars 

spaces between: for the first half we use the pattern (n - 3) / 2 to start with. decrease by 1 until we reach the halway point 
               for the second half start with 0 with the 1st index past the halfway mark  and increase by 1 until reaching the input 

spaces before/after : for the first half we start with 0 until we reach the halfway mark of the input 
                      for the second half we use the pattern (n - 3) / 2 once more. then decrease by 1 until reaching the input 
questions: 
can we have any nan, infinity, -infinity values? no 


rules: 
input will always be odd and always >= 7 
input will always be a whole integer 



DS: 

Algorithm: 
now that we know our pattern we can designate a plan to actually ouput. '
initialize halfPoint to the input / 2 
initialize max to (n - 3) / 2
We know that we will have 3 stars at every iteration except for when we are at the halfway size 
we will first use our stars and spaces between them. We will then prepend our given space before and append our given space afterwards 
iterate through the loop starting at index 0 until  we reach the size of the input 
    if the index is 0 then initialize spaceBetweenStars to max and initialize beginAndEndSpaces to 0 
        ser  starsAndBetweenSpaces to the result of  * + a spacebetweenStars amount of stars + * + ... 3 times 
         initialize formattedStars to the result of prepending a beginAndEndSpaces amount of spaced before starsAndBetweenSpaces and appending a beginAndEndSpaces amount to the end of it         
         reassign this value and output it 
         increment beginAndEndSpaces 
         decrement spaceBetweenStars 
     else if the index is equal to halfPoint 
        - output stars input amount of times 
    else 
        initialize spaceBetweenStars to 0 and initialize beginAndEndSpaces to max 
        set  starsAndBetweenSpaces to the result of  * + a spacebetweenStars amount of stars + * + ... 3 times 
        set  formattedStars to the result of prepending a beginAndEndSpaces amount of spaced before starsAndBetweenSpaces and appending a beginAndEndSpaces amount to the end of it         
         reassign this value and output it 
         increment spaceBetweenStars 
         decrement beginAndEndSpaces





*/ 
function generateStarsWithSpaces(spaceBetweenStars) {
    const stars = ['*', '*', '*']
    const spaces = ' '
    return stars.join(spaces.repeat(spaceBetweenStars))
}

function formatRow(starsWithSpaces, beginAndEndSpaces) {
    const spaces = ' ';
    return spaces.repeat(beginAndEndSpaces) + starsWithSpaces + spaces.repeat(beginAndEndSpaces);
}

function printTopHalf(halfPoint, max) {
    for (let i = 0; i < halfPoint; i += 1) {
        let spaceBetweenStars = max - i;
        let beginAndEndSpaces = i;
        let starsWithSpaces = generateStarsWithSpaces(spaceBetweenStars);
        let formattedRow = formatRow(starsWithSpaces, beginAndEndSpaces);
        console.log(formattedRow);
    }
}

function printBottomHalf(halfPoint, max) {
    for (let i = 1; i <= halfPoint; i += 1) {
        let spaceBetweenStars = i - 1;
        let beginAndEndSpaces = max - spaceBetweenStars;
        let starsWithSpaces = generateStarsWithSpaces(spaceBetweenStars);
        let formattedRow = formatRow(starsWithSpaces, beginAndEndSpaces);
        console.log(formattedRow);
    }
}

function star(num) {
    const halfPoint = Math.floor(num / 2);
    const max = (num - 3) / 2;

    // Print top half
    printTopHalf(halfPoint, max);

    // Print middle row
    console.log('*'.repeat(num));

    // Print bottom half
    printBottomHalf(halfPoint, max);
}
star(7);
/* logs
*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *
*/ 
star(9);

/* logs
*   *   * // gap between stars 3      spaces before and after stars // 0 
 *  *  *  //2                                                          1
  * * *  // 1                                                          2
   ***   // 0                                                          3
********* // 0                                                         0
   ***    // 0                                                         3
  * * *   // 1                                                         2
 *  *  *  // 2                                                         1
*   *   * // 3                                                         0
*/ 


/* test for Studnet 
All Pairs that Sum to Target

Create a function that returns all pairs of numbers in an array that sum to a target. Sort the pairs in ascending order with respect to the smaller number, then order each pair in this order: [smaller, larger].
Examples

allPairs([2, 4, 5, 3], 7) ➞ [[2, 5], [3, 4]]
// 2 + 5 = 7, 3 + 4 = 7

allPairs([5, 3, 9, 2, 1], 3) ➞ [[1, 2]]

allPairs([4, 5, 1, 3, 6, 8], 9) ➞ [[1, 8], [3, 6], [4, 5]]
// Sorted: 1 < 3 < 4; each pair is ordered [smaller, larger]

Notes

    If no pairs are found, return an empty array [].
    You are only allowed to use each number once in a pair.


    */ 

// happy case 
Test.assertSimilar(allPairs([2, 4, 5, 3], 7) //  [[2, 5], [3, 4]]) 
Test.assertSimilar(allPairs([5, 3, 9, 2, 1], 3) //  [[1, 2]])
Test.assertSimilar(allPairs([4, 5, 1, 3, 6, 8], 9) // [[1, 8], [3, 6], [4, 5]])
Test.assertSimilar(allPairs([8, 7, 7, 2, 4, 6], 14) // [[6, 8], [7, 7]])
Test.assertSimilar(allPairs([8, 7, 2, 4, 6], 14)//  [[6, 8]])
Test.assertSimilar(allPairs([1, 3, 5, 4, 0], 4)// [[0, 4], [1, 3]])
Test.assertSimilar(allPairs([1, 3, 5, 4, 0, 2], 4) // [[0, 4], [1, 3]])
Test.assertSimilar(allPairs([1, 3, 5, 4, 0, 2, 2], 4) // [[0, 4], [1, 3], [2, 2]])

// empty sums 
Test.assertSimilar(allPairs([5, 2], 14) // [])
Test.assertSimilar(allPairs([5, 5, 2], 14) // [])





/* 

Squishing an Array

Write a function that squishes an array from the left or the right.
Examples

squish([1, 2, 3, 4, 5], "left")
➞ [[1, 2, 3, 4, 5], [3, 3, 4, 5], [6, 4, 5], [10, 5], [15]]

squish([1, 2, 3, 4, 5], "right")
➞ [[1, 2, 3, 4, 5], [1, 2, 3, 9], [1, 2, 12], [1, 14], [15]]

squish([1, 0, 2, -3], "left")
➞ [[1, 0, 2, -3], [1, 2, -3], [3, -3], [0]]

squish([1, 0, 2, -3], "right")
➞ [[1, 0, 2, -3], [1, 0, -1], [1, -1], [0]]

Notes

    Squishing from the left is to successively sum the first two elements of an array (shortening the array in the process).
    Squishing from the right is to successively sum the last two elements of an array.
    Include the original array as the first element in either squish.
    Return an empty array if the input is an empty array.

    */ 



    squish([1, 2, 3, 4, 5], "left") // [[1, 2, 3, 4, 5], [3, 3, 4, 5], [6, 4, 5], [10, 5], [15]]
    squish([1, 0, 2, -3], "left") // [[1, 0, 2, -3], [1, 2, -3], [3, -3], [0]]
    squish([4, 9, -3, 2, 5], "left") // [[4, 9, -3, 2, 5], [13, -3, 2, 5], [10, 2, 5], [12, 5], [17]]
    squish([8, -7, 6, 1, 0, 2], "left") // [[8, -7, 6, 1, 0, 2], [1, 6, 1, 0, 2], [7, 1, 0, 2], [8, 0, 2], [8, 2], [10]]
    squish([8, 7], "left") // [[8, 7], [15]]
    squish([8], "left") // [[8]]
    squish([], "left") // []
    
    // Right Squish Tests
    squish([1, 2, 3, 4, 5], "right") // [[1, 2, 3, 4, 5], [1, 2, 3, 9], [1, 2, 12], [1, 14], [15]]
    squish([1, 0, 2, -3], "right") // [[1, 0, 2, -3], [1, 0, -1], [1, -1], [0]]
    squish([4, 9, -3, 2, 5], "right") // [[4, 9, -3, 2, 5], [4, 9, -3, 7], [4, 9, 4], [4, 13], [17]]
    squish([8, -7, 6, 1, 0, 2], "right") // [[8, -7, 6, 1, 0, 2], [8, -7, 6, 1, 2], [8, -7, 6, 3], [8, -7, 9], [8, 2], [10]]
    squish([8, 7], "right") // [[8, 7], [15]]
    squish([8], "right") // [[8]]
    squish([], "right") // []



// notes on performance 
// certain questions could be more specific
// when determining rules of problem. Could build out tests from information
// walks through an example in his rules. Good idea!! 
// did not ask about negative numbers, but included them (it works here)
// test cases are thorough. Very effective 
// tends to speak over what is being written 
// did not initially account for mutating arrays with subarray actions 
// ^ good case of looking at the DS aspect more closely 
// not sure based off of algorithm how subarrays being pushed will look like with first 2 indexes 
