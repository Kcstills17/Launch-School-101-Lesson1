function log(input) {
    return console.log(input) 
}

/* 

1. Uppercase Check

Write a function that takes a string argument and returns true if all of the alphabetic characters inside the string are uppercase; otherwise, return false. Ignore characters that are not alphabetic.

Examples:

*/ 

function isUppercase(str) {
    return !/[a-z]/.test(str)
}
  

(isUppercase('t'));               // false
(isUppercase('T'));               // true
isUppercase('Four Score');      // false
isUppercase('FOUR SCORE');      // true
isUppercase('4SCORE!');         // true
isUppercase('');                // true


/* 

2. Delete Vowels

Write a function that takes an array of strings and returns an array of the same string values, but with all vowels (a, e, i, o, u) removed.

Examples:


*/ 

function removeVowels(arr) {
   return  arr.map((word) => word.replace(/[aeiouAEIOU]/g, '') )
}

removeVowels(['abcdefghijklmnopqrstuvwxyz']);         // ["bcdfghjklmnpqrstvwxyz"]
removeVowels(['green', 'YELLOW', 'black', 'white']);  // ["grn", "YLLW", "blck", "wht"]
removeVowels(['ABC', 'AEIOU', 'XYZ']);                // ["BC", "", "XYZ"]


/*


3. Lettercase Counter

Write a function that takes a string and returns an object containing three properties: one representing the number of characters in 
the string that are lowercase letters, one representing the number of characters that are uppercase letters, and one representing the number of characters that are neither.

E: 
input is a string 
output is an object that contains 3 properties. the keys will be lowercase, uppercase, and neither to represent chars in the input. the value of all of these will be the amound of 
those values in the input string. 


A; 
initialize countObj to have the keys lowercase, uppercase, and neither. set all values to 0 
get the str of all lowercase values and get the length. initialize as  lowerCaseLength. if there any null values then set to an empty array 
get the str of all uppercase values and get the length. initialize as upperCaseLength. if there any null values then set to an empty array 
get the str of all non alpha char values and get the length. initialize as nonAlphaLength. if there any null values then set to an empty array 
increment countObj[lowercase] by lowerCaseLength 
increment countObj[uppercase] by upperCaseLength 
increment count[neither] by nonAlphaLength 
return countObj 

Examples:
*/ 

function letterCaseCount(str) {
    let countObj = {lowercase: 0, uppercase: 0, neither: 0,};
    let lowerCaseLength = getMatchingLength(str, /[a-z]/g)
    let upperCaseLength = getMatchingLength(str, /[A-Z]/g)
    let nonAlphaLength = getMatchingLength(str, /[^a-zA-Z]/g)
   
    countObj.lowercase += lowerCaseLength
    countObj.uppercase += upperCaseLength
    countObj.neither += nonAlphaLength

    return countObj
}

function getMatchingLength(str, match) {
   return  (str.match(match) ?? []).length || 0 

}

letterCaseCount('abCdef 123');  // { lowercase: 5, uppercase: 1, neither: 4 }
letterCaseCount('AbCd +Ef');    // { lowercase: 3, uppercase: 3, neither: 2 }
letterCaseCount('123');         // { lowercase: 0, uppercase: 0, neither: 3 }
letterCaseCount('');            // { lowercase: 0, uppercase: 0, neither: 0 }


/* 

4. Capitalize Words

Write a function that takes a string as an argument and returns that string with the first character of every word capitalized and all subsequent characters in lowercase.

You may assume that a word is any sequence of non-whitespace characters.

Examples:

*/ 

function wordCap(str) {
   return str.split(' ').map((word) => {
       return  word[0].toUpperCase() + word.slice(1).toLowerCase()
    }).join(' ')
}

wordCap('four score and seven');       // "Four Score And Seven"
wordCap('the javaScript language');    // "The Javascript Language"
wordCap('this is a "quoted" word');    // 'This Is A "quoted" Word'


/* 

5. Swap Case

Write a function that takes a string as an argument and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase.
 Leave all other characters unchanged.

 E: 
 input is a string. 
 output is the result of swapping case of every alpha character in the input. all non alpha chars are left unchanged. 

 I: 

 A: 
 iterate through and get each char of the input str. if the char matches lowercase alpha chars then convert it to uppper 
 if the char matches lower case then convert it to upper 
 transform these values onto a new array and join them back together by spaces. 

Examples:

*/ 

function swapCase(str) {
   return str.split('').map((char) => {
     if (char.match(/[a-z]/g)) {
        char = char.toUpperCase()
     } else if (char.match(/[A-Z]/g)) {
        char = char.toLowerCase()
     }
     return char 
    }).join('')
}

swapCase('CamelCase');              // "cAMELcASE"
log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"



/*
6. Staggered Caps Part 1

Write a function that takes a string as an argument and returns that string with a staggered capitalization scheme. Every other character, starting from the first,
 should be capitalized and should be followed by a lowercase or non-alphabetic character. Non-alphabetic characters should not be changed,
  but should be counted as characters for determining when to switch between upper and lower case.

E: 
input is a string. 
output is the result of dealing a staggered capitalization scheme on every character from the input. Starting from the fist, each other char should be capitalized. 
Values between should either be lowercase or non alpha 
non alpha values are not affected but these indexes count to change the current stagger value. So if the previous was 0 and the next number is non alpha you would still add to the stagger 
. 


I: 



A: 
to identify our staggers 0 will start off for our uppercase values. so all indexes that are divisible evenly 2 will match this. all that are not will reprersent our lowercase and non alpha stagger 
'T' : 0,   'a' : 1,  'S' : 2,  3: 3, 'A' ; 4 etc 
iterate through and get each char andeach index value starting from 0 
if the index is evenly divisible by 2 
if the current value matches an alpha char than return the char uppercased. if the char is non alpha, return the char 
else if the index is not evenly divisible by 2 
if the current value matches an alpha char then return the char lowercased. otherwise return the char 

join the transformed array and return the string 


Examples:


*/ 

function staggeredCase(str) {
   return str.split('').map((char, i) => {
        if (i % 2 === 0 ) {
            return char.toUpperCase()
        } else {
            return char.toLowerCase()
        }
    }).join('')
   
    
}
staggeredCase('I Love Launch School!');        // "I LoVe lAuNcH ScHoOl!"
staggeredCase('ALL_CAPS');                     // "AlL_CaPs"
staggeredCase('ignore 77 the 4444 numbers');   // "IgNoRe 77 ThE 4444 nUmBeRs"



/*
7. Staggered Caps Part 2

Modify the function from the previous exercise so that it ignores non-alphabetic characters when determining whether a letter should be upper or lower case.
 Non-alphabetic characters should still be included in the output string, but should not be counted when determining the appropriate case.

Examples:

A: 
In this case  since we are not counting nonalpha chars we dont want to use the current index as our stagger logic. Here we will initialize a value staggerCount to 0 
if char is a non alpha char then do not increment staggerCount. otherwise if  the staggercount is evenly divisible by 2 we will upperchase the char and increment staggerCount 
if it is not divisivle by 2 then we lowercase the char and incremnent the staggerCount
return the transformed array joined into a string 

*/ 
function staggeredCaseTwo(str) {
    let staggerCount = 0 
    return  str.split('').map((char) => {
      
        if (char.match(/[^a-zA-Z]/g)) {
            return char 
        } else if (staggerCount % 2 === 0) {
            staggerCount += 1 
           return char.toUpperCase() 
           
        } else {
            staggerCount += 1
           return  char.toLowerCase()
          
        }
    }).join('')
}

staggeredCaseTwo('I Love Launch School!');        // "I lOvE lAuNcH sChOoL!"
staggeredCaseTwo('ALL CAPS');                     // "AlL cApS"
staggeredCaseTwo('ignore 77 the 444 numbers');    // "IgNoRe 77 ThE 444 nUmBeRs"



/* 

8. How Long Are You

Write a function that takes a string as an argument and returns an array that contains every word from the string,
 with each word followed by a space and the word's length. If the argument is an empty string or if no argument is passed, the function should return an empty array.

You may assume that every pair of words in the string will be separated by a single space.




*/ 

function wordLengths(str) {
    if (!str) {
        return []
    }
     return str.split(' ').map((word) => word + ' ' + word.length)

}

wordLengths('cow sheep chicken');
// ["cow 3", "sheep 5", "chicken 7"]

wordLengths('baseball hot dogs and apple pie');
// ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

wordLengths("It ain't easy, is it?");
// ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

wordLengths('Supercalifragilisticexpialidocious');
// ["Supercalifragilisticexpialidocious 34"]

wordLengths('');      // []
wordLengths();        // []



/* 


Search Word Part 1

Write a function that takes two arguments, a word and a string of text, and returns an integer representing the number of times the word appears in the text.

You may assume that the word and text inputs will always be provided, and that all word breaks are spaces. Thus, some words will include punctuation such as periods and commas.

Example:

E: 
input is a string that represents the word we are searching and str that represents the full text 
we will output the number of times the word appears in the text. All word spaces are considered breaks. So punctuation may be considered apart of a word. 
the word and text input will always be provided. 

I: 
what if the string is empty? 


DS: 
input: two strings 
output: number integer that represents the amount of time the str query appears in the full text 
intermediary: possibly an array to split the values up by spaces and remove all punctuation 

A: 
If text size is 0 then just return 0. 
initialize wordCount to 0 
split up the str by spaces and remove all punctuation so that when we compare our word query we will not have trouble. Lowercase all string to deal with cases. 
if the current word matches the query then increment wordCount by 1. 
finish the loop and return wordCount 

  */ 
const text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur autodit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam,quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptatevelit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

   

     function searchWord(query, fullText) {
        let wordCount = 0 
        let filteredQuery = fullText.replace(/[./,?!]/g, '').toLowerCase()
        filteredQuery.split(' ').forEach((word) => {
            query === word ? wordCount += 1 : wordCount 
        })
        return wordCount 
     }
searchWord('sed', text);      // 3




/* 


Search Word Part 2

The function from the previous exercise returns the number of occurrences of a word in some text. Although this is useful, there are also situations in which we just want
 to find the word in the context of the text.

For this exercise, write a function that takes a word and a string of text as arguments, and returns the text with every instance of the word highlighted.
 To highlight a word, enclose the word with two asterisks ('**') on each side and change every letter of the word to uppercase (e.g., '**HIGHLIGHTEDWORD**').

 A: 
 initialize highlightedText to an empty str 

 initialize regex to the result of creating a new regex object that will search all instances of the occurence, be case insenstive, and only evaluate the occurences that are specific words. 
 initialize highlightedText to the result od replacing the text input where the value matches the regex we have. When that is the case replace it with an interpolated str of 
 ** current match uppercased and ** 
 
 return highlightedText 


 */ 

 function searchWordHighlight(query, text) {
    let regex = new RegExp(`\\b${query}\\b`, 'gi')
    let highlightedText = text.replace(regex, (match) => `**${match.toUpperCase()}**`);
    return highlightedText
    
 }


console.log(searchWordHighlight('sed', text));
// returns
// "**SED** ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, **SED** quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, **SED** quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"


let str = 'whatamaker. What a big what whattin whatter. ? '

let query = 'what'

const regex = new RegExp(`\\b${query}\\b`, 'gi');
const matches = str.match(regex);

log(str.substr(2, 2))