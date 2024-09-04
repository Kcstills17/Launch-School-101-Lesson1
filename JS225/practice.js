function log(input) {
    return console.log(input); 
}



// -----> Factory Functions <-----

/* Rewrite the code below to use object-literal syntax to generate the returned object:

function makeObj() {
  let obj = {};
  obj.propA = 10;
  obj.propB = 20;
  return obj;
}
*/ 

function makeObj() {
  return {
    propA: 10, 
    propB: 20 
  }
}



// In the following problems, we'll be working through an invoice processing program. To get you started, we provide you with the following code that can process one invoice:
/* 

let invoice = {
  phone: 3000,
  internet: 6500,
};
let payment = {
  phone: 1300,
  internet: 5500,
};
let invoiceTotal = invoice.phone + invoice.internet;
let paymentTotal = payment.phone + payment.internet;
let remainingDue = invoiceTotal - paymentTotal;

console.log(paymentTotal);         // => 6800
console.log(remainingDue);         // => 2700

To be able to process multiple invoices, we'll need to have a factory function that we can use to create invoices. The requirements for this factory function are the following:

    It returns an invoice object, with phone and internet properties, and a total method.
    The default value for the phone service is 3000, and the internet service is 5500 (in cents, of course!).
    The function takes an object argument with attributes to override the default values.

Your implemented function should be able to work with the code below:
*/ 
function createInvoice(services) {
  // implement the factory function here
  return {
    phone: services?.phone ||  3000, 
    internet: services?.internet || 5500 , 
    totalPayment: 0, 
    total() {
      return this.phone + this.internet
    }, 
    addPayment(payment) {
      return this.totalPayment += payment.total(); 
    }, 
    addPayments(paymentArr) {
      return paymentArr.forEach((payment) => this.totalPayment += payment.total())
    }, 
    amountDue() {
      if (this.totalPayment > this.total()) this.totalPayment = this.total()
        return this.total() - this.totalPayment
    }

  }
}

function invoiceTotal(invoices) {
  let total = 0;
  let i;

  for (i = 0; i < invoices.length; i += 1) {
    total += invoices[i].total();
  }

  return total;
}

let invoices = [];
invoices.push(createInvoice());
invoices.push(createInvoice({
  internet: 6500,
}));

invoices.push(createInvoice({
  phone: 2000,
}));

invoices.push(createInvoice({
  phone: 1000,
  internet: 4500,
}));

console.log(invoiceTotal(invoices));             // => 31000


/*Now let's build a factory function to create payments. The function can take an object argument in one of 3 forms:

    Payment for one service, such as: {internet: 1000} or {phone: 1000}
    Payment for both services, such as: {internet: 2000, phone: 1000}.
    Payment with just an amount property, such as: {amount: 2000}.

and should return an object that has paid services, and a total method that returns the payment total. If the amount property is not present, 
 this should return the sum of phone and internet services; if the amount property is present, just return the value of that property.

Your code should work with the following:

*/ 
function createPayment(services) {
  // implement the factory function here

 return {
    internet: services?.internet || 0, 
    phone: services?.phone || 0, 
    amount: services?.amount || 0, 
    total() {
      if (this.amount !== 0) {
        return this.amount; 
      }
      return this.internet + this.phone 
    }
 }
}

function paymentTotal(payments) {
  let total = 0;
  let i;

  for (i = 0; i < payments.length; i += 1) {
    total += payments[i].total();
  }

  return total;
}

let payments = [];
payments.push(createPayment());
payments.push(createPayment({
  internet: 6500,
}));

payments.push(createPayment({
  phone: 2000,
}));

payments.push(createPayment({
  phone: 1000,
  internet: 4500,
}));

payments.push(createPayment({
  amount: 10000,
}));

console.log(paymentTotal(payments));      // => 24000

//Update your createInvoice function to make it possible to add payment(s) to invoices. Use the code below as a guideline:

let invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

let payment1 = createPayment({
  amount: 2000,
});

let payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

let payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
log(invoice.amountDue());       // this should return 0


// -----> Constructor Functions <-----

// What will the code below output? Why?

function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

let lizzy =  new Lizard();
lizzy.scamper(); // ?

// Answer: This will be a typeError because this is a not a constructor function. because of that. The keyword 'this' refers to the global/window object. 
//         So when the code attempts to assign a property value to the window/global object. That is effectively nothing, so assigned to undefined. Undefined cannot have properties. 

//Alter the code in problem 2 so that it produces the desired output 
// Answer : make the fynction a constructor by prepending new in front of Lizard()


// <----- Objects and Prototypes <----

// Use the method we learned above to assign foo below to a new Object with prot as its prototype.
//Use getPrototypeOf to demonstrate the prototypal relationship between prot and foo
//Use isPrototypeOf to demonstrate the prototypal relationship between prot and foo
let prot = {};

let foo = Object.create(prot)
log(Object.getPrototypeOf(foo) === prot)
log(prot.isPrototypeOf(foo))

//What will the last two lines of the code above return? Why?
//answer: Each line will return true. The first line returns true because we assign foo on line 3 a new object with prot set explicitly as its prototype. The second line returns true because of prototype chaining. The default prototype object, Object.prototype, is prot's object prototype since it was created as an Object literal. Because of the relationship between foo and prot, Object.prototype is on foo's prototype chain.

//What will the code below log to the console?

 foo = {};
let bar = Object.create(foo);

foo.a = 1;

console.log(bar.a);


//What will the code below log to the console?

 foo = {};
 bar = Object.create(foo);

foo.a = 1;
bar.a = 2;
console.log(bar.a)

// 2 as bar.a = 1 will locally override the property from the property chain here. 



//Given the code below, do we know for certain that on the last line we are ultimately referencing a property owned by boo? How can we test that far is not delegating to boo?

let boo = {};
boo.myProp = 1;

let far = Object.create(boo);

// lots of code

far.myProp;       // 1
//log(far.hasOwnProperty('myProp'))


//Write a function that returns the object on a given object's prototype chain where a property is defined. See the example code below:

function getDefiningObject(object, propKey) {
  while (object && !object.hasOwnProperty(propKey)) {
    object = Object.getPrototypeOf(object)
  }
  return object; 
}

 foo = {
  a: 1,
  b: 2,
};

 bar = Object.create(foo);
 baz = Object.create(bar);
 qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);     // => true
console.log(getDefiningObject(qux, 'e'));             // => null



//Write a function to provide a shallow copy of an object. The object that you copy should share the same prototype chain as the original object, and it should have the same own properties that return the same values or objects when accessed. Use the code below to verify your implementation:

function shallowCopy(object) {
  let result = Object.create(Object.getPrototypeOf(object));
  let prop;

  for (prop in object) {
    if (Object.prototype.hasOwnProperty.call(object, prop)) {
      result[prop] = object[prop];
    }
  }

  return result;
}

 foo = {
  a: 1,
  b: 2,
};

 bar = Object.create(foo);
bar.c = 3;
bar.say = function() {
  console.log('c is ' + this.c);
};

 baz = shallowCopy(bar);
console.log(baz.a);       // => 1
baz.say();                // => c is 3
log(baz.hasOwnProperty('a'));  // false
baz.hasOwnProperty('b');  // false
log(baz.hasOwnProperty('c'));  // true




//What does the following code log to the console?

let RECTANGLE = {
  area() {
    return this.width * this.height;
  },
  perimeter() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);
  this.perimeter = RECTANGLE.perimeter.call(this);
}

let rect1 = new Rectangle(2, 3);
console.log(rect1.area);
console.log(rect1.perimeter);

//Write a constructor function Circle, that takes a radius as an argument. You should be able to call an area method on the created objects to get the circle's area. 
// Test your implementation with the following code:
// pi 3.14159
let Circle = function(radius) {
  this.radius = radius;
};

Circle.prototype.area = function() {
  return Math.PI * this.radius * this.radius;
};

 a = new Circle(3);
 b = new Circle(4);

console.log(a.area().toFixed(2)); // => 28.27
console.log(b.area().toFixed(2)); // => 50.27


//What will the following code log out and why?

let ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();

Ninja.prototype.swingSword = function() {
  return this.swung;
};

console.log(ninja.swingSword());


// answer true: The constructor function Ninja sets the  current execution context (which is the returned object)'s swung property to true 
// the variable ninja is initialized to the result of the constructer Ninja which creates a new object with it's current context 
// The the property swingSword is added to the Ninja prorotype property. This is a function which returns the current ninja object's swung property. 
// Since the swung property in the current Ninja context was set to true earlier. true will be returned and logged finally.



// implement the method described in the comments below:


function Ninja() {
  this.swung = false;
}


ninjaA = new Ninja();
ninjaB = new Ninja();

// Add a swing method to the Ninja prototype which
// returns the calling object and modifies swung

Ninja.prototype.swing = function() {
  this.swung = true; 
  return true; 
}

console.log(ninjaA.swing().swung);      // must log true
console.log(ninjaB.swing().swung);      // must log true



//In this problem, we'll ask you to create a new instance of an object, without having direct access to the constructor function:

 ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

// create a ninjaB object
 ninjaB = Object.create(Object.getPrototypeOf(ninjaA))
console.log(ninjaB.constructor === ninjaA.constructor);    // should log true





// Practice Problems: Constructor Functions and Prototypes (2)
/*
Follow the steps below:

    Create an object called shape that has a getType method.
    Define a Triangle constructor function whose prototype is shape. Objects created with Triangle should have four own properties: a, b, c 
    (representing the sides of a triangle), and type.
    Add a new method to the prototype called getPerimeter.

Test your implementation with the following code:
*/ 

let shape = {
  getType() {
    return this.type;
  },
};

function Triangle(a, b, c) {
  this.type = 'triangle';
  this.a = a;
  this.b = b;
  this.c = c;
}

Triangle.prototype = shape;
Triangle.prototype.getPerimeter = function() {
  return this.a + this.b + this.c;
};

Triangle.prototype.constructor = Triangle;



//Update the following code so that, instead of logging the values, each statement logs the name of the constructor to which it belongs.

console.log("Hello");
console.log([1,2,3]);
console.log({name: 'Srdjan'});



//Expected output:
/*
String
Array
Object
*/ 
log('Hello'.constructor.name)
log([1, 2, 3].constructor.name)
log({name: 'Srdjan'}.constructor.name)



//Since a constructor is just a function, it can be called without the new operator, and this can lead to unexpected results and errors especially for inexperienced programmers.

//Write a constructor function that can be used with or without the new operator, and return the same result in either form. Use the code below to check your solution:

function User(first, last) {
  if (!(this instanceof User)) { // in our examples when we aren't using the new keyword the object is not constructed as an instance of User. So when that is not the case we can return a new manual constructor function for User
    return new User(first, last); 
  }
}

let name = 'Jane Doe';
let user1 = new User('John', 'Doe');
let user2 = User('John', 'Doe');

console.log(name);         // => Jane Doe
console.log(user1.name);   // => John Doe
console.log(user2.name);   // => John Doe


//Create a function that can create an object with a given object as its prototype, without using Object.create.

function createObject(obj) {
  return Object.setPrototypeOf({}, obj);
}

 foo = {
  a: 1
};

 bar = createObject(foo);
 
log(foo.isPrototypeOf(bar));         // true


//Similar to the problem above, without using Object.create, create a begetObject method that you can call on any object to create an object inherited from it:

Object.prototype.begetObject = function () {
  function F() {}
  F.prototype = this;
  return new F();
}

 foo = {
  a: 1,
};

 bar = foo.begetObject();
foo.isPrototypeOf(bar);         // true



//Create a function neww, so that it works like the new operator. For this practice problem, you may use Object.create.

function neww(constructor, args) {
  let object = Object.create(constructor.prototype);
  let result = constructor.apply(object, args);
  return result; 

  //return typeof result === 'object' ? result : object;
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

let john = neww(Person, ['John', 'Doe']);
john.greeting();          // => Hello, John Doe
log(john.constructor);         // Person(firstName, lastName) {...}
