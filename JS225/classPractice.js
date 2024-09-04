function log(input) {
    return console.log(input); 
}

// 1. Create a class Cat that logs the string I'm a cat! to the console whenever a new instance is created. Then instantiate a new instance of Cat and assign it to a kitty variable.

class Cat {
    constructor(name = 'Kitty') {
        this.name = name 
    }

    greet() {
        log(`Hello. My name is ${this.name}`)
    }

    rename(newName) {
      return  this.name = newName 
    }
    static genericGreeting() {
        log("I'm a cat!")
    }

}


let kitty = new Cat('Tom')
kitty.rename('Garfield')
log(kitty.greet())
log(Cat.genericGreeting())

//Using the code from the previous exercise, move the greeting from the constructor method to an instance method named greet that logs a greeting to the console when invoked.
// Additionally, define one more instance method named rename that renames a Cat instance when invoked.

//Using the code from the previous question, write any code necessary so that the string Hello! I'm a cat! is logged to the console when Cat.genericGreeting is invoked.

/*Create a class Rectangle.

The constructor should take 2 arguments which represent width and length, respectively.

Implement the class so that the output from the example below is correct.
*/ 


class Rectangle {
    constructor(w, l) {
        this.w = w 
        this.l = l 
    }

      getWidth() {
        return this.w; 
    }
     getLength() {
        return this.l; 
    }

    getArea() {
        return this.l * this.w; 
    }



}
let rect = new Rectangle(4, 5);

console.log(rect.getWidth()); // 4
console.log(rect.getLength()); // 5
console.log(rect.getArea()); // 20

//The formula for the rectangle area is: width * length.


// Given the class from the previous problem, write a class called Square that inherits from Rectangle, and is used like this:

class Square extends Rectangle {
    constructor(side) { // given that a square's length and width is === we only need one argument passed in. To use super to only grab the one argument for both we can pass the same parameter name into super twice. 
        super(side, side) 

    }
}

let square = new Square(5);
console.log(`area of square = ${square.getArea()}`); // area of square = 25



//Without calling the Cats constructor, create an object that looks and acts like a Cat instance that doesn't have a defined name.

class Cats {
  constructor(name) {
    this.name = name;
  }
  speaks() {
    return `${this.name} says meowwww.`;
  }
}


let fakeCat= Object.create(Cats.prototype)
fakeCat.constructor = Cats
console.log(fakeCat instanceof Cats); // logs true
console.log(fakeCat.hasOwnProperty('name')); // logs false
console.log(fakeCat.speaks()); // logs undefined says meowwww.
