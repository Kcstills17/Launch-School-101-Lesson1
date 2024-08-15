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