
// 1. Hello Friends!

// You have written basic functions to display a random greeting to any number of friends upon each invocation of greet.
// Upon invoking the greet function, however, the output is not as expected. Figure out why not and fix the code.

function randomGreeting() {
  const words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
               'Greetings', 'Salutations', 'Good to see you'];

  const idx = Math.floor(Math.random() * words.length);

   words[idx];
}

function greet(...args) {
  const names = Array.prototype.slice.call(args);

  for (let i = 0; i < names.length; i++) {
    const name = names[i];
    const greeting = randomGreeting;

    console.log(`${greeting}, ${name}!`);
  }
}

//greet('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');

// two things are wrong. On line 13 there is nothing explicitly returned for the randomGreeting() function. Therefore undefined is implicitly returned.
// on line 21 const greeting = randomGreeting is not actually being set to the invocation of the function. Instead it is merely set to the function variable name and will just
// output the body of the function randomGreeting(). this can be fixed by initializing greeting to randomGreeting();  const greeting = randomGreeting();
// now the proper results weill log.




// 2. Includes False

// Caroline has written a very simple function, includesFalse, that searches a list of primitives for the boolean false.
//  If false is found, the function immediately returns true. If no occurrence of false has been found after iterating through the entire array, the function returns false.

// Caroline's last method invocation of includesFalse (line 15) doesn't return what she expects. Why is that? Fix the code so that it behaves as intended.

function includesFalse(list) {
  for (let i = 0; i < list.length; i++) {
    let element = list[i];

    if (element == false) {
      return true;
    }
  }

  return false;
}
                                                                  // returns:
includesFalse([8, null, 'abc', true, 'launch', 11, false]);       // true
includesFalse(['programming', undefined, 37, 64, true, 'false']); // false
console.log(includesFalse([9422, 'lambda', true, 0, '54', null]));             // true


// The issue is we are using the loose equality operator. Which when comparing false with 0 it will implicitly coerce false into 0. making them equal.
// To fix this we can modify the loose operator to the strict equality operator if (element === false) which will prevent any implicit coercision. It is best to avoid
// implicitly cocersion in most cases as they can lead to unexpected results or bugs.



// 3. Place A Bet

// The function placeABet below accepts a guess from the user between 1 and 25. The function should determine a winning number and return a message to the user
// indicating whether he/she entered a winning guess. When you try to invoke placeABet, an error is raised. Fix the bug and explain what caused it.

// fix
/*
function prompt() {
  const RLSYNC = require('readline-sync');
  return RLSYNC.question('Input a guess between 1 and 25 \n')
}
*/

function placeABet(guess) {
  (function generateRandomInt() {
    return Math.floor(Math.random() * 25) + 1;
  });

  const winningNumber = generateRandomInt();


  if (guess < 1 || guess > 25) {
    return 'Invalid guess. Valid guesses are between 1 and 25.';
  }

  if (guess === winningNumber) {
    return "Congratulations, you win!";
  } else {
    return "Wrong-o! You lose.";
  }
}
//console.log(placeABet(4))
//const userGuess = parseInt(prompt('Input a guess between 1-25'), 10);

// prompt is not compatible outside of a browser environment. In this case i created a function that utilized the readlines module to replicate the functionality of prompt.
// The main issue is how the function generateRandomInt is wrapped in parenthesis. That makes it a function expression here. These are often unnamed. and if they are named
// they are only available within that function. So on line 85 when we initialize winningNumber to generateRandomInt() the invocation will simply raise an error.



// 4. Picky Museum Filter

// We love to visit museums if they are about science or computers. We're undecided when it comes to modern art, and would rather not go in most cases.
// However, we're willing to go to any modern art museum that is about Andy Warhol (we like him!) or that is located in nearby Amsterdam. We'd rather skip any other museums.

// We tried to implement these preferences in a function, so we can automatically sort through long lists of museums and find the ones that sound interesting.
// However, our Boolean check is flawed, as it fails some of our test cases. Can you fix it?

function wantToVisit(museum, city) {
  return museum.includes('Computer')
      || museum.includes('Science')
      && !(
        museum.includes('Modern')
        && museum.includes('Art')
        && museum.includes('Andy Warhol')
        || city === 'Amsterdam'
      );
}

// Tests (should all print 'true')

console.log(wantToVisit('Computer Games Museum', 'Berlin') === true);
console.log(wantToVisit('National Museum of Nature and Science', 'Tokyo') === true);
console.log(wantToVisit('Museum of Modern Art', 'New York') === false);
console.log(wantToVisit('El Paso Museum of Archaeology', 'El Paso') === false);
console.log(wantToVisit('NEMO Science Museum', 'Amsterdam') === true);
console.log(wantToVisit('National Museum of Modern Art', 'Paris') === false);
console.log(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce') === true);
console.log(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam') === true);
console.log(wantToVisit('Van Gogh Museum', 'Amsterdam') === false);
console.log(wantToVisit('Andy Warhol Museum', 'Melbourne') === false);

//answer in steps
// remove the && and ! prepending the second parenthesis.
// prepend a || operator before this logic and add a new parenthesis to wrap around the entire body of this logic.
// because && has a higher precedence than ||  so when we compare the result of the first operation && the second. the && will always return the first falsy value.
// here is what it would look like


function wantToVisit(museum, city) {
  return  museum.includes('Computer')
       || museum.includes('Science')
       || (museum.includes('Modern')
          && museum.includes('Art')
          && (museum.includes('Andy Warhol')
             || city === 'Amsterdam'));
}




// 5. Shop Transactions

//Todd wrote some simple code in an attempt to log his shop's financial transactions. Each time he makes a sale or spends money on inventory,
// he logs that deposit or withdrawal via the logTransaction function. His code also intends to ensure that each transaction logged is a valid numerical amount.
//  At the end of each day, he displays his total gain or loss for the day with transactionTotal.

//Test out the code yourself. Can you spot the problem and fix it?
/*
const transactionLog = [];

function processInput(input) {
  const numericalData = parseFloat(input);

  if (Number.isNaN(numericalData)) {
    throw (new Error('Data could not be converted to numerical amount.'));
  }

  return numericalData;
}

function logTransaction() {
  let data = prompt('Please enter the transaction amount: ');

  try {
    data = processInput(data);
    transactionLog.push(data);

    alert('Thank you. Data accepted.');
  } catch {
    alert(error.message);
  }
}

function transactionTotal() {
  let total = 0;

  for (let i = 0; i < transactionLog.length; i++) {
    total += transactionLog[i];
  }

  return total;
}

logTransaction();
logTransaction();
logTransaction();

transactionTotal()

*/
//The catch block needs to receive an Error object in order to output the Error object's message.
/*
  alert('Thank you. Data accepted.');
  } catch(error) {
    alert(error.message);
  }
  */


// 6. Full Moon

// Run the following code. Why is every warning displayed twice? Change the code so that each warning is displayed only once, as intended.

const species = ['wolf', 'human', 'wasp', 'squirrel', 'weasel', 'dinosaur'];
const isMidnight = true;
const isFullmoon = true;

function isTransformable(species) {
  return species[0] === 'w';
}

function transform(species) {
  return `were${species}`;
}

for (let index = 0; index < species.length; index++) {
  const thisSpecies = species[index];
  var newSpecies;

  if (isMidnight && isFullmoon && isTransformable(thisSpecies)) {
    newSpecies = transform(thisSpecies);
  }

  if (newSpecies) {
    console.log(`Beware of the ${newSpecies}!`);
  }
}

/* Answer
The reason that each warning is output twice is because newSpecies uses the keyword var which is function scoped.  This is then hoisted to the top of the global scope.

What happened in our original for loop therefore was the following:

    On the first iteration, newSpecies is initially undefined, as it has not been assigned a value yet. All of the conditions provided to the if statement on line 236
    are truthy, and therefore newSpecies is assigned to the string 'werewolf'. Because 'werewolf' is truthy, the console.log on line 240 is executed.
    On the next iteration of our loop, newSpecies will continue to reference 'werewolf' unless re-assigned since the variable declaration has been hoisted to the top
    of the global scope. Since the condition provided to the if statement on line 239 evaluates as false on this iteration, newSpecies is not re-assigned to 'werehuman'.
    However, newSpecies still references a truthy value, 'werewolf', and thus the code within our if statement on line 21 is executed. Thus,
    we again log 'Beware of the werewolf!'. The process continues analogously for the other values in species.

To fix this, we must ensure that newSpecies is reset to undefined in each iteration. One way to do that is to change the declaration to use let instead of var.
 Alternatively, we could insert newSpecies = undefined; after the var declaration.
 */


// 7. Space Design

// We're putting together some information about our new company Space Design. Not all roles have been filled yet.
// But although we have a CEO and Scrum Master, displaying them shows undefined. Why is that?

// Roles (salary still to be determined)

const ceo = {
  tasks: ['company strategy', 'resource allocation', 'performance monitoring'],
  salary: 0,
};

const developer = {
  tasks: ['turn product vision into code'],
  salary: 0,
};

const scrumMaster = {
  tasks: ['organize scrum process', 'manage scrum teams'],
  salary: 0,
};

// Team -- we're hiring!

const team = {};

team[ceo] = 'Kim';
team[scrumMaster] = 'Alice';
team[developer] = undefined;

const company = {
  name: 'Space Design',
  team,
  projectedRevenue: 500000,
};

console.log(`----{ ${company.name} }----`);
console.log(`CEO: ${company.team[ceo]}`);
console.log(`Scrum master: ${company.team[scrumMaster]}`);
console.log(`Projected revenue: $${company.projectedRevenue}`);

// ----{ Space Design }----
// CEO: undefined
// Scrum master: undefined
// Projected revenue: $500000


/* Answer
 The issue lies when we try to add key value pairs to `team`
 team[ceo] = 'Kim';
team[scrumMaster] = 'Alice';
team[developer] = undefined;

When you try to create a k-v pair like this using a variable name for the key the object will search for a variable with that name within scope. Object keys must be strings so
it will either choose that string as a key or attempt to coerce it into string. Because these are objects when they are coerced to string it becomes [object Object].
Because these are all 3 objects they are overriding the same value. Therefore `team[developer] = undefined;` being the last expression will leaves us with undefined as our
value for all 3 keys.

*/


// 8. Expensive Study Preparation

// We make a few purchases to prepare for our study session, but the amount charged upon checkout seems too high. Run the following code and find out why
//  we are charged incorrectly.

// The shopping cart is a list of items, where each item
// is an object { name: <string>, amount: <number> }.
let shoppingCart = [];

// Currently available products with prices.
const prices = {
  'notebook': 9.99,
  'pencil': 1.70,
  'coffee': 3.00,
  'smoothie': 2.10,
};

function price({name}) {
  return prices[name];
}

// Adding an item to the shopping cart.
// The amount is optional and defaults to 1.
// If the item is already in the cart, its amount is updated.
function updateCart(name, amount) {
  amount = amount || 1;  // this is where the logic fails. when the amount is 0 we have 0 || 1 and when dealing with the || operator the first truthy value is returned. which is 1.

  let alreadyInCart = false;

  for (let i = 0; i < shoppingCart.length; i += 1) {
    let item = shoppingCart[i];

    if (item.name === name) {
      item.amount = amount;
      console.log(amount)
      alreadyInCart = true;
      break;
    }
  }

  if (!alreadyInCart) {

    shoppingCart.push({ name, amount });
  }
}

// Calculating the price for the whole shopping cart.
function total() {
  let total = 0;

  for (let i = 0; i < shoppingCart.length; i += 1) {
    let item = shoppingCart[i];

    total += (item.amount * price(item));
  }

  return total.toFixed(2);
}

function pay() {
  // omitted

  console.log(`You have been charged $${total()}.`);
}

function checkout() {
  pay();
  shoppingCart = [];
}

// Example purchase.

updateCart('notebook');
updateCart('pencil', 2);
updateCart('coffee', 1);

// Oh wait, I don't need pencils
console.log(shoppingCart)
updateCart('pencil', 0);



checkout();
// You have been charged $14.69


// Answer
//  On line 349 the logic `  amount = amount || 1; ` occurs. This works for most situations, however when the amount is 0, due to boolean logic the first truthy value will
// be returned. 1 is coerced into true and is a truthy value. To fix this we can replace the || operator with ?? (the nullish operator). This will only return the
// right operand if the left operand is null or undefined.




// 9. Stuck on Page 18

// The following code is a simplified (and not so serious) model of how we read a software development book. But running this code results in a stack overflow. What is wrong?

const totalPages = 364;
let energy = 100;

function read() {
  let currentPage = 1;

  while (energy > 0 && currentPage < totalPages) {
    currentPage += 1;
    energy -= (5 + currentPage * 0.1);
  }
 console.log(energy)
  console.log(`Made it to page ${String(currentPage)}.`);

  // Drink a cup of coffee.

  energy = 100;

  // Continue reading.
  if (currentPage < totalPages) {
    read();
  } else {
    console.log('Done!');
  }
}

read();


/* answer
We initialize `totalPages` to `364` and `energy` to `100`. Our function `read()` begins by initializing `currentPage` to `1`. In the loop,
`currentPage` is incremented, and energy is decremented by `(5 + currentPage * 0.1)`. Once `energy` is depleted or all pages are read,
the function logs the current page. Then, `energy` is reset to `100` for a new reading session. However, because `currentPage` is also reset to `1`
within each call to `read()`, and due to the way `energy` depletes, the condition `(currentPage < totalPages)` never becomes false. Thus, the function
is recursively called indefinitely, leading to a stack overflow because `currentPage` is reset, and the recursive function does not terminate properly."


to fix this issue we can move `  let currentPage = 1;` outside of the function. Therefore the progress is not endlessly reset after each loop. Now we can recursively
call `read()` properly until `currentPage < totalPages`

*/

let a = 1
let b = 1

console.log(a === b)
