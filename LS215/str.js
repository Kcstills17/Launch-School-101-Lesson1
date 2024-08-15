function log(input) {
    return console.log(input)
}

let language = 'JavaScript'

let idx = language.indexOf('S')

let charCode = language.charCodeAt(idx)

let fact1 = 'JavaScript is fun' 
let fact2 = 'Kids like it too' 
let compoundSentences = fact1 + ' and ' + fact2[0].toLowerCase() + fact2.slice(1)

let pi = 22 / 7 
log(pi.toString().lastIndexOf('14'))

let boxNumber = (356).toString()
log(boxNumber)
log(typeof(Number.parseInt(boxNumber, 10)))
log(typeof(boxNumber))

/* 
PEDAC 

E: 
input is a large string. 
we are to take this input and log the longest sentence from the input. 
We then want to log the statement 'The longes sentence has n words' which will log the amount of words
in that sentence 

Sentences can end in (./?) so all of these values must be accounted for with sentences. 
any sequence of characters that are not spaces or sentence ending chars. are considered words. 
all details matter (case, punctuation, tabs, and spaces)




I: 

D: 

A:
match all values that start with a non sentence ending character or punctuation, and continue with a sentence until reaching a sentence ending char. Initialize this 
as filteredText 

use grabLongestSentence() on filteredText to get the longest sentence. initialize as maxSentence. 

iterate through MaxSentence and filter each word. Only choose words that 
are not spaces or punctuation. 
initialize this as filteredMaxSentence 

log maxSentence
log ('This longest sentence has (length of filteredMaxSentence) words)


// grabLongestSentence 
initialize a currentSentence value to the first index value of the input array 
iterate through a loop from index 1 to the size of the input array length. increment index by 1 
if  the current array index value > then currentSentence set currentSentence to that value. otherwise keep it the same 
return currentSetence. 
*/ 






let longText = 'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced. It is rather for' +
  ' us to be here dedicated to the great task remaining' +
  ' before us -- that from these honored dead we take' +
  ' increased devotion to that cause for which they gave' +
  ' the last full measure of devotion -- that we here highly' +
  ' resolve that these dead shall not have died in vain' +
  ' -- that this nation, under God, shall have a new birth' +
  ' of freedom -- and that government of the people, by' +
  ' the people, for the people, shall not perish from the' +
  ' earth.';


  function grabLongestSentence(arr) {
    let currentSentence = ''  // modified to set to empty string and start index from 0 to deal with cases where there are no sentences. 
    arr = arr ?? [] // nullish operator to deal with null value when there are no matches due to there being no sentence ending markers. 
    for (let i = 0; i < arr.length; i++) {
        currentSentence.length < arr[i].length ? currentSentence = arr[i] : currentSentence
    }
     return currentSentence
};
function longestSentence(text) {
    let filteredText = text.match(/[^.!?]*[.!?]/g);
    let maxSentence = grabLongestSentence( filteredText)
    let filteredMaxSentence = maxSentence.match(/[^\s.!?]+/g) || [];// new regex to deal with newline characters to not count as apart of logged length.  used or operator to put an empty array when we have no valid matches 
    log(maxSentence)
    log(`The longest sentence has ${filteredMaxSentence.length} words`)
}

longestSentence(longText);
longestSentence("I!");
console.log(longestSentence("No punctuation")); // 2 words or 0 words depending on rule if there's no punctuation
console.log(longestSentence("Hello \n world.")); // 2 words


// I!s
/* 
// console output
It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause
 for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God,
  shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.

The longest sentence has 86 words.


// Assuming the last sentence is removed:

longestSentence(longText);

// console output
Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.

The longest sentence has 30 words.


*/



// find the neighbors of the input 
// input will be an two values and an array. the integers represent row (x) and column arrays (y)
// We are to check the value at the array value of arr[x][y] and compare it to it's neighbors 
// a neighbor consist of any value directly horizontal, vertical, or diagonal from the current array value 
// output will returns the smallest neighbor that is < than the input value. if there is none then you will return the initial array value. 
// if the array contains all infinity, -infinity, or is empty we will return null 
// if the x or y cooridinates is out of bounds of the array we will also return null 

let array = [
    [1, 2, 3, 4, 5], 
    [6, 3, 8, 3, 10], 
    [5, 1, 4, 7, 2]
]; 



function lowestNeighbor(arr, x, y) {
    log(arr[x][y])

}

lowestNeighbor(array, 0, 0) === 1
// neighbors by array position arr[x, y]
// horizontal [0, 1],
// vertical  [1, 0], 
// diagonal [1, 2] 
lowestNeighbor(array, 1, 2) ===  1
// neighbors
// horizontal  [1, 1], [1, 3],
//vertical [0, 2], [2, 2],
//diagonal  [0, 1], [0, 3], [2, 1], [2, 3]

lowestNeighbor(array, 1, 4) ===  2
//neighbors 
// horizontal [1, 3], 
// verical [0, 4], [2, 4], 
// diagonal [0, 3], [2, 3]