function log(input) {
    return console.log(input)
}

/* 
1. Create an object that represents a Cessna 152 aircraft. The aircraft should include information that shows its fuel capacity of 
 24.5 gallons and a cruising speed of 111 knots. The aircraft should be able to take off and land.

Identify the state and behavior items in this object.
*/ 


let cessnaAircraft = {
    fCapacity: '24.5 gallons', 
    crSpeed: '111 knots', 
    land() {
         Console.log(`The aircraft  can land`)
    }, 

    takeOff() {
        console.log('The aircraft can takeoff')
    }

}

//fCapacity and crSpeed are the states. land() and takeOff() are the behaviors. 



/*

Write a simple constructor function that creates objects that represent books. Each book should have a title, author, and the year published. 
Create objects that represent the following books:
Title 	Author 	Year Published
Neuromancer 	William Gibson 	1984
Doomsday Book 	Connie Willis 	1992

When you are done, identify the type of the objects created, the constructor function, and the instance objects.
*/ 

function Books(title, author, year) {

    this.title = title, 
    this.author = author, 
    this.year =  year
}


let bookOne = new Books('Neuromancer', 'William Gibson', 1984);
let bookTwo = new Books('Doomsday Book', 'Connie Willis', 1992);

log(bookOne)
log(bookTwo)

// The object type is Book, the constructor is the Book function, and the instance objects are the objects assigned to neuromancer and doomsday.




/* 3. Write a simple constructor function that creates objects that represent musical albums. Each album should have a title, artist, and release year. 
Create objects that represent the following 2 albums:
Title 	Artist 	Release Year
Thriller 	Michael Jackson 	1982
The Dark Side of the Moon 	Pink Floyd 	1973

When you are done, identify the type of the objects created, the constructor function, and the instance objects.


*/ 
 function Album(title, artist, releaseYear) {
    this.title = title; 
    this.artist = artist; 
    this.releaseYear = releaseYear
 }


 let thriller = new Album('Thriller', 'Michael Jackson', 1982)

 let theDarkSideOfTheMoon = new Album('The Dark Side of The Moon', 'Pink Floyd', 1973)


 // The object type is Album, the constructor function is the Album function. The instance objects are thriller and theDarkSideOfTheMoon 


 /* 4. Write a constructor function that creates objects that represent smartphones. Each smartphones should have a brand, model, and release year.
  Add methods to check the battery level and to display the smartphones's information. Create objects that represent the following two smartphones:
Brand 	Model 	Release Year
Apple 	iPhone 12 	2020
Samsung 	Galaxy S21 	2021
*/ 

function Smartphones(brand, model, releaseYear) {
    this.brand = brand, 
    this.model = model, 
    this.releaseYear = releaseYear
    this.info = {brand: this.brand, model: this.model, releaseYear: this.releaseYear}

    this.checkBatteryLevel = function() {
        return `This ${model} has a battery capacity of 80%`
    }
}

let iphone12 = new Smartphones('apple', 'iPhone 12', 2020)
let s21 = new Smartphones('Samsung', 's21', 2021)
log(iphone12.checkBatteryLevel())


let me = {}; 
me.firstName = 'Jane'; 
me.lastName = 'Doe'; 


function fullName(person) {
    log(person.firstName + ' ' + person.lastName); 
}


let father = {
    firstName: 'Shane',
    lastName: 'Doe',
  }
  let arr = []; 
  arr.push(me)
  arr.push(father)
  

  arr.forEach(fullName)



//Now, create a method named payInvoice that takes a client name as an argument. Your method should loop over the unpaid invoices and check the name of each invoice. If the name matches, push the invoice object to the paid property. If the name does not match, push the invoice object to a new array defined as a local variable in your method. When the loop ends, replace the existing unpaid property with the newly created array of remaining unpaid invoices.



function makeCar(rate, decelerate) {
    return {
      speed: 0,
      rate,
      decelerate, 
      accelerate() {
        this.speed += this.rate;
      },
      brake() {
       let slowDown =  this.speed -  this.decelerate
       return slowDown > 0 ? this.speed = slowDown : this.speed = 0  
      }
    };
  }
  

  let sedan = makeCar(8, 6);
sedan.accelerate();
sedan.speed
 //8
 sedan.brake();
sedan.speed;
 //2
 sedan.brake();
 sedan.speed;
// 0


function country(name, continent, visited = false) {
   return { name, 
    continent, 
    visited, 
    getDescription() {
        return this.name + ' is located in ' + this.continent + '.' + ' ' + this.visitStatus() + '.';
      },

      visitCountry() {
        this.visited = true; 
      }, 

      visitStatus() {
       return  this.visited === true ? `I have visited ${this.name}` : `I haven't visited ${this.name}`
      }

    }; 
}

let chile = country('The Republic of Chile', 'South America', true)
let canada = country('Canada', 'North America');


function createTool(id, name, stock, price) {
    if (price < 0 ) return 'invalid'
    return {
        id, 
        name, 
        stock, 
        price, 

        describe() {
            return `
                    Name: ${this.name}
                    ID: ${this.id}
                    Price: ${this.price}
                    Stock: ${this.stock}`
        }, 

        setPrice(newPrice) {
            if (newPrice >= 0 ) {
                return this.price = newPrice
            } else {
                return 'Invalid price'
            }
        }
    }; 
}

let scissors = createTool(0, 'Scissors', 8, 10)
let cordlessDrill = createTool(1, 'Cordless Drill', 15, 45)


//What does the following code log to the console?

let computer = {
  price: 30000,
  shipping: 2000,
  total() {
    let tax = 3000;
    let  specialDiscount = function() {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }.bind(this)

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());


//Implement makeListTransformer below such that timesTwo's return value matches the commented return value.

function makeListTransformer(func) {
   return function(collection) {
        return collection.map(func)
    }
} 

let timesTwo = makeListTransformer(function(number) {
  return number * 2;
});

log(timesTwo([1, 2, 3, 4])); // [2, 4, 6, 8]


//Create a makeCounterLogger function that takes a number as an argument and returns a function. When we invoke the returned function with a second number,
// it should count up or down from the first number to the second number, logging each number to the console:

function makeCounterLogger(num) {
    return function(numTwo) {
        if (num < numTwo) {
            for (let i = num; i <= numTwo; i += 1 ) {
                log(i)
            }
        } else 
        for (let i = num; i >= numTwo; i -= 1 ) {
            log(i)
        }
    }
    
}

 let countlog = makeCounterLogger(5);
 countlog(8);
//5
//6
//7
//8
 countlog(2);
//5
//4
//3
//2


/*
We'll build a simple todo list program using the techniques we've seen in this assignment.
Write a makeList function that returns a new function that implements a todo list. The returned function should have the following behavior:

    When called with an argument that is not already on the list, it adds that argument to the list.
    When called with an argument that is already on the list, it removes the element from the list.
    When called without arguments, it logs all items on the list. If the list is empty, it logs an appropriate message.

  

    function makeList() {
        let list = []; 
        return function(...arg) {
            if (arg.length > 0 && !list.includes(arg[0])) { // Changed to arg[0]
                list.push(arg[0]);
                console.log(`${arg[0]} added`);
            } else if (arg.length > 0 && list.includes(arg[0])) { // Changed to arg[0]
                let index = list.indexOf(arg[0]); // Changed to arg[0]
                list.splice(index, 1);
                console.log(`${arg[index]} removed!`)
            } else {
                if (list.length === 0) {console.log('The list is empty.')}
                list.forEach((element) => console.log(element));
            }
        };
    }
 let list = makeList();
 list();
// The list is empty.
 list('make breakfast');
// make breakfast added!
list('read book');
// read book added!
 list();
// make breakfast
// read book
 list('make breakfast');
// make breakfast removed!
 list();
// read book
  */ 

//Write a function named makeMultipleLister that, when invoked and passed a number, 
//returns a function that logs every positive integer multiple of that number less than 100. Usage looks like this:

function makeMultipleLister(num) {
    return function() {
        for (let i = 1; i * num <= 100; i += 1) {
            log(num * i)
        }
        
    }
}

let lister = makeMultipleLister(13);
 log(lister())
 /* 
13
26
39
52
65
78
91
*/ 

//Write a program that uses two functions, add and subtract, to manipulate a running total value.
// When you invoke either function with a number, it should add or subtract that number from the running total and log the new total to the console. Usage looks like this:


//A: 
// 
//
// 
// 

  let total = {num: 0}

function add(num) {
    return total.num += num; 
}

function subtract(num) {
    return total.num -= num; 
}
add(1)
//
log(add(42));

//43
 log(subtract(39));
//4
// add(6);




function makeList() {
    let itemList = []
    return {
        

        add(item) {
            itemList.push(item)
            log(`${item} added!`)
        }, 
        remove(item) {
            let currentItemPosition = itemList.indexOf(item)
            if (itemList[currentItemPosition]) {
                itemList.splice(currentItemPosition, 1)
                log(`${item} removed!`)
            } else 
            log('This item does not exist')
    
        }, 
        list() {
            itemList.forEach((item) => log(item))
        }
    }
}

let list = makeList();
 list.add('peas');
// peas added!
 list.list();
// peas
list.add('corn');
// corn added!
list.list();
// peas
// corn
 list.remove('peas');
// peas removed!
 list.list();
// corn

  //  Reimplement makeList, so that it returns an Object that provides the interface shown above, including add, list, and remove methods.


/*
  In the following code, when can JavaScript garbage collect each of the following arrays? [1], [2], and [1, 2].

let a = [1];

function add(b) {
  a = a.concat(b); // arr [1] no longer referenced and can be GC'd 
}

function run() {
  let c = [2];
  let d = add(c);
}
  

run(); // closure access to c which references [2] is now finished. 

// [1, 2] can be GC'd after programs ends, since a is a global variable the reference will always be intact until then. 


// in the following code, when can JavaScript garbage collect the value ["Steve", "Edie"]?

function makeHello(names) {
  return function() {
    console.log("Hello, " + names[0] + " and " + names[1] + "!");
  };
}

let helloSteveAndEdie = makeHello(["Steve", "Edie"]);
*/ 

// when the program finishes. After JS GC's the function referenced by helloSteveAndEdie.



//The code below throws an error:

var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

sum += (function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
}(numbers))

//sum += sum(numbers);  // ?

//What kind of problem does this error highlight? Use an IIFE to address it, so that code runs without error.

//answer: the function sum is hoisted to the top. therefore the variable sum will reassign the function to a new integer value. because of that we cannot add to sum the intended return value of the sum function 
function countdown(count) {
    (function(n) {
      for (let i = n; i >= 0; i -= 1) {
        console.log(i);
      }
  
      console.log('Done!');
    })(count);
  }
countdown(7);
/* 
7
6
5
4
3
2
1
0
*/ 


//Implement a function countdown that uses an IIFE to generate the desired output.



//Write a class that can be used to instantiate objects that represent smartphones. 
//Each smartphone should have a brand, model, and release year. Add methods to check the battery level and to display the smartphone's information.
//  Create objects that represent the following 2 smartphones:

class SmartPhone {
    constructor(brand, model, releaseYear) {
        this.brand = brand; 
        this.model = model; 
        this.releaseYear = releaseYear
    }

    checkBattery() {
        return  `The ${this.brand} ${this.model} has a battery capacity of 85%`
    }

    displayInfo() {
        [this.brand, this.model, this.releaseYear].forEach((info) => log(`==> ${info}`))
    }
}



let iphone = new SmartPhone('Apple', 'Iphone 12', 2020)

/*
Create a class hierarchy consisting of vehicles, including cars, boats, and planes, as specific kinds of vehicles.
 All vehicles should be able to accelerate and decelerate. Cars should be able to honk, boats should be able to drop anchor, and planes should be able to take off and land.
  Test your code.

All vehicles should have a color and weight. Cars have a license number, boats have a home port, and planes have an airline name.
*/ 

class Vehicles {
    constructor(color, weight) {
        this.color = color 
        this.weight = weight
    }
    accelerate() {
      return   'Speed + 10!'
    }
    decelerate() {
      return 'Speed + 10!'
    }
}

class Cars extends Vehicles {
    constructor(color, weight, licenseNumber) {
        super(color, weight)
        this.licenseNumber = licenseNumber
    }
   
    honk() {
        return 'BEEEEEEEEEPPPPPP!!!!'
    }
}

class Boats extends Vehicles {
    constructor(color, weight, homePort) {
        super(color, weight)
        this.homePort = homePort
    }
  
    dropAnchor() {
        return 'Loudly drops anchor into the sea!'
    }
}


class Planes extends Vehicles {
    constructor(color, weight, airline) {
        super(color, weight)
        this.airline  = airline
    }
  

    takeOff() {
        return 'Departing from airport! * Leaves Airport'
    }

    land() {
        return 'Returning to airport! * Arrives back at airport '
    }
}



let viper = new Cars('blue', 10000, 'V234H2')
log(viper.accelerate())
let boeing = new Planes('White', 1000000, 'Miami Airport')
log(boeing.accelerate())
let bigBoat = new Boats('Blue', 134321, 'Mobile Port')


//Rewrite the following Person class to use private fields for the name and age properties and provide a setter for setting the age property.
// Ensure that the setter raises a RangeError unless the age is a positive number.

class Person {
    #name 
    #age 
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  showAge() {
    console.log(this.age);
  }
  set age(newAge) {
    if (typeof newAge === 'number' && newAge > 0) {
        this.#age = newAge; 
    } else 
    throw new RangeError('Age Must be postiive')
  }
}

let person = new Person('John', 30);
person.showAge(); // 30
person.age = 31;
person.showAge(); // 31

try {
  // This line should raise a RangeError,
  // but does not.
  person.age = -5;
  person.showAge(); // -5
} catch (e) {
  // The following line should run, but won't
  console.log('RangeError: Age must be positive');
}


//Create a Book class with private fields title, author, and year. Provide getters for each field and a setter for the year field that raises a RangeError if year is before 1900.

class Book {
  #title 
  #author 
  #year 
  constructor(title, author, year) {
    this.#title = title
    this.#author = author 
    this.#year = year
  }

  get title() {
   return this.#title 
  }

  get author() {
   return this.#author
  }

  get year() {
    return this.#year 
  }

  set year(newYear) {
    if (newYear >= 1900) {
        return this.#year = newYear
    } else 
    throw new RangeError('RangeError: Invalid Year')
  }
}

let book = new Book('The Great Gatsby', 'F. Scott Fitzgerald', 1925);
console.log(book.title);  // The Great Gatsby
console.log(book.author); // F. Scott Fitzgerald
console.log(book.year);   // 1925

book.year = 1932;         // Changing year
console.log(book.year);   // 1932

try {
  book.year = 1900;
} catch (e) {
  console.log(e);   // RangeError: Invalid year
}

try {
  let book2 = new Book('A Tale of Two Cities', 'Charles Dickents', 1859);
} catch (e) {
  console.log(e);   // RangeError: Invalid year
}



//Create a BankAccount class with a private field balance. Add a private method, #checkBalance, that logs the current balance. Provide a public method, deposit, 
//to add money to the account and withdraw to take money out. Raise a RangeError if there are insufficient funds for the withdrawal.

class BankAccount {
  #balance
  constructor() {
    this.#balance = 0; 
  }
  deposit(amount) {
    this.#checkBalance()
   return  this.#balance += amount; 
  }

  withdraw(amount) {
    if (amount > this.#balance) {
      throw new RangeError('RangeError: Insufficient funds')
    } else 
    this.#checkBalance()
    return this.#balance -= amount; 
  }

  #checkBalance() {
    log(`The current balance is ${this.#balance}`)
  }
  // your code here
}

let account = new BankAccount();
account.deposit(100);
account.withdraw(50);

//account.withdraw(100); // RangeError: Insufficient funds



//Create a Rectangle class with private fields width and height. Provide getters and setters for both fields. 
//The setters should raise a RangeError if the width or height is not a positive number. Add a getter for area to compute the area of the rectangle (width * height).

class Rectangle {
  #width 
  #height 
  constructor(width, height) {
    this.#width = width 
    this.#height = height 
  }

  get height() {
    return this.#height; 
  }
  get width() {
    return this.#width;
  }

  set height(newHeight) {
    if (newHeight <= 0) {
      throw new RangeError("RangeError: Height must be positive.")
    }
    return this.#height = newHeight; 
  }

  set width(newWidth) {
    if (newWidth <= 0) {
      throw new RangeError("RangeError: Width must be positive.")
    }
    return this.#width = newWidth; 
  }

  get area() {
    return this.#height * this.#width; 
  }
}

let rect = new Rectangle(10, 5);
console.log(rect.area); // 50

rect.width = 20;
console.log(rect.area); // 100

rect.height = 12;
console.log(rect.area); // 240

try {
  rect.width = 8;
} catch (e) {
  console.log(e); // RangeError: width must be positive
}

try {
  rect.height = 10;
} catch (e) {
  console.log(e); // RangeError: height must be positive
}




//Create a MathUtils class with static methods add, subtract, multiply, and divide. These methods should perform basic arithmetic operations.

class MathUtils {
  static add(num1, num2) {
    return num1 + num2; 
  }
  static subtract (num1, num2) {
    return num1 - num2; 
  }
  static multiply(num1, num2) {
    return num1 * num2; 
  }
  static divide(num1, num2) {
   return num2 === 0 ? new RangeError('RangeError: Division by zero') : num1 / num2 
  }
}

console.log(MathUtils.add(5, 3));       // 8
console.log(MathUtils.subtract(10, 4)); // 6
console.log(MathUtils.multiply(6, 7));  // 42
console.log(MathUtils.divide(20, 5));   // 4
console.log(MathUtils.divide(10, 0));   // RangeError: Division by zero


/* 

This exercise re-examines exercise 1 from the previous chapter. In that exercise, you wrote a class to instantiate smartphone objects. In this exercise,
 we'll rewrite that solution using the constructor/prototype pattern.

Using the constructor/prototype pattern, create a type that represents smartphones. Each smartphone should have a brand, model, and release year.
 Add methods that display the smartphone's information and check its battery level. Create objects that represent the following two smartphones:

Brand 	Model 	Release Year
Apple 	iPhone 12 	2020
Samsung 	Galaxy S21 	2021
*/ 

function Phone(brand, model, releaseYear) {
  this.brand = brand; 
  this.model = model; 
  this.releaseYear = releaseYear; 
}

Phone.prototype.battery = function() {
  return log(`The current ${this.brand} ${this.model}'s battery level is 75 percent`)

}

Phone.prototype.displayInfo = function() {
  return log(`This phone is a ${this.brand} ${this.model} and it was released in ${this.releaseYear}`); 
}

function Apple(brand, model, releaseYear) {
    Phone.call(this, brand, model, releaseYear)
  
}

Apple.prototype = Object.create(Phone.prototype); 
Apple.prototype.constructor = Apple; 


function Samsung(brand, model, releaseYear) {
    Phone.call(this, brand, model, releaseYear)
}

Samsung.prototype = Object.create(Phone.prototype); 
Samsung.prototype.constructor =  Samsung; 


let myPhone = new Phone('Motorola', 'Razor', 2017)
let myIphone = new Apple('Apple', 'Iphone 12', 2020 )
let mySamsung = new Samsung("Samsung", 'S21', 2021)

log(myIphone)
log(mySamsung)