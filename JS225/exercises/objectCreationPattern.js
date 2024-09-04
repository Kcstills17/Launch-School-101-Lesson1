function log(input) {
    return console.log(input); 
}; 


// 1. Implement an ancestors method that returns the prototype chain (ancestors) of a calling object as an array of object names. Here's an example output:

// name property added to make objects easier to identify

let foo = {
    name: 'foo', 
    ancestors() {
      let currentAncestor = Object.getPrototypeOf(this);
      let objProto = [];
  
      while (currentAncestor !== null) {
        let name = currentAncestor.name || 'Object.prototype';
        objProto.push(name);
        currentAncestor = Object.getPrototypeOf(currentAncestor);
      }
  
      return objProto; 
    }
  };

bar = Object.create(foo);
bar.name = 'bar';


let baz = Object.create(bar);
baz.name = 'baz';
let  qux = Object.create(baz);
qux.name = 'qux';
qux.ancestors();  // returns ['baz', 'bar', 'foo', 'Object.prototype']
baz.ancestors();  // returns ['bar', 'foo', 'Object.prototype']
bar.ancestors();  // returns ['foo', 'Object.prototype']
//foo.ancestors();  // returns ['Object.prototype']




/* 2. Delegate

Write a delegate function that can be used to delegate the behavior of a method or function to another object's method. delegate takes a minimum of two arguments: (1)
 the object and (2) name of the method on the object. The remaining arguments, if any, are passed — as arguments — to the objects' method that it delegates to.
 The delegate function should return the same value returned by calling the other object's method.

Note that this is not the same as using bind. bind returns a new function, whereas delegate maintains the reference.


*/ 

function delegate(obj, methodName, ...args) {  // obj for context, methodName is the specific property name in the original object and ...args supplies all possible arguments 
    return function() {   // use PFA
      return obj[methodName].apply(obj, args);  // we want to return the same value by the original object's method. so we invoke apply on the original object's passed in property.
    };                                          // we use the passed in object for the context and pass in our args to fill in any input parameters. 
  }

 foo = {
  name: 'test',
  bar(greeting) {
    console.log(`${greeting} ${this.name}`);
  },
};

 baz = {
    qux: delegate(foo, 'bar', 'hello') ,
  };
  
  baz.qux();   // logs 'hello test';
  
  foo.bar = () => { console.log('changed'); };
  
  baz.qux();          // logs 'changed'
  


  //3. re-implement the following diagram using the pseudo-classical approach. Subclasses should inherit all of the superclass's methods. 
  // Reuse the constructors of the superclass when implementing a subclass.

//For the methods, you can have it log out anything you want.

// Here's a sample run you can use as a reference:

function Person(firstName,lastName, age, gender) {
    this.firstName = firstName
    this.lastName = lastName
    this.age = age 
    this.gender = gender 
}

Person.prototype.fullName = function() {    
   return  this.firstName + ' ' +  this.lastName

}

Person.prototype.communicate = function() {
    log('Communicating!')
}

Person.prototype.eat =  function() {
    log('Eating!')
}


Person.prototype.sleep = function() {
    log('Sleeping')
}

// have to set Doctor prototype to Person prototype to properly inherit state and behaviors 
Doctor.prototype  = Object.create(Person.prototype) // this must be done before any Unique properties to the current object are defined. Otherwise they will be overriden with the inheriting property states and behaviors. 
Doctor.prototype.constructor = Doctor;  // must set constructor back to Doctor to avoid strange results 



function Doctor(firstName, lastName, age, gender, specialization) {
    Person.call(this, firstName, lastName, age, gender)
    this.specialization = specialization
}

Doctor.prototype.diagnose = function() {
    log('Diagnosing')
}


Professor.prototype = Object.create(Person.prototype)
Professor.prototype.constructor  = Professor; 

function Professor(firstName, lastName, age, gender, subject) {
    Person.call(this, firstName, lastName, age, gender)
    this.subject = subject
}

Professor.prototype.teach = function() {
    log('Teaching')
}

Student.prototype = Object.create(Person.prototype)
Student.prototype.constructor = Student

function Student(firstName, lastName, age, gender, degree) {
    Person.call(this, firstName, lastName, age, gender)
    this.degree = degree

}

Student.prototype.study = function() {
    'Studying'
}

GraduateStudent.prototype = Object.create(Student.prototype)
GraduateStudent.prototype.constructor = GraduateStudent


function GraduateStudent(firstName, lastName, age, gender, degree, graduateDegree) {
    Student.call(this, firstName, lastName, age, gender, degree)
    this.graduateDegree = graduateDegree
}

GraduateStudent.prototype.research = function() {
    'Researching'
}
/* 
const person = new Person('Foo', 'Bar', 21, 'male');

console.log(person instanceof Person);       // logs true
console.log(person instanceof Doctor);       // logs false
console.log(person instanceof Professor);    // logs false
console.log(person instanceof Student);      // logs false
person.eat();                                // logs 'Eating'
person.communicate();                        // logs 'Communicating'
person.sleep();                              // logs 'Sleeping'
console.log(person.fullName());              // logs 'Foo Bar'


const doctor = new Doctor('Bar', 'Qux', 21, 'female', 'Pediatrics');

console.log(doctor instanceof Person);       // logs true
console.log(doctor instanceof Doctor);       // logs true
console.log(doctor instanceof Professor);    // logs false
console.log(doctor instanceof Student);      // logs false
doctor.eat();                                // logs 'Eating'
doctor.communicate();                        // logs 'Communicating'
doctor.sleep();                              // logs 'Sleeping'
console.log(doctor.fullName());              // logs 'Bar Qux'
doctor.diagnose();                           // logs 'Diagnosing'


const professor = new Professor('Bar', 'Foo', 48, 'female', 'Law');
console.log(professor instanceof Person);    // logs true
console.log(professor instanceof Professor); // logs true
console.log(professor instanceof Doctor);    // logs false
console.log(professor instanceof Student);   // logs false
professor.eat();                             // logs 'Eating'
professor.communicate();                     // logs 'Communicating'
professor.sleep();                           // logs 'Sleeping'
console.log(professor.fullName());           // logs 'Bar Foo'
professor.teach();                           // logs 'Teaching'





const graduateStudent = new GraduateStudent('Qux', 'Bar', 21, 'non-binary', 'BS Industrial Engineering', 'MS Industrial Engineering');
// logs true for next three statements
console.log(graduateStudent instanceof Person);          // logs true
console.log(graduateStudent instanceof Student);         // logs true
console.log(graduateStudent instanceof GraduateStudent); // logs true
console.log(graduateStudent instanceof Professor);       // logs false
console.log(graduateStudent instanceof Doctor);          // logs false
graduateStudent.eat();                       // logs 'Eating'
graduateStudent.communicate();               // logs 'Communicating'
graduateStudent.sleep();                     // logs 'Sleeping'
console.log(graduateStudent.fullName());     // logs 'Qux Bar'
graduateStudent.study();                     // logs 'Studying'
graduateStudent.research();                  // logs 'Researching'
*/ 
// commented out for more readable ide 


/* 


4. Mini Inventory Management System

In this exercise, you'll build a simple inventory management system. The system is composed of an item creator, an item manager, and a reports manager. 
The item creator makes sure that all necessary information are present and valid. The item manager is responsible for creating items, updating information about items,
deleting items, and querying information about the items. Finally, the report manager generates reports for a specific item or ALL items. Reports for specific items
 are generated from report objects created from the report manager. The report manager is responsible for reports for all items.
Component Specifications

Here's all the required information for an item:

    SKU code: This is the unique identifier for a product. It consists of the first 3 letters of the item and the first 2 letters of the category.
     If the item name consists of two words and the first word consists of two letters only, the next letter is taken from the next word.
    Item name: This is the name of the item. It must consist of a minimum of 5 characters. Spaces are not counted as characters.
    Category: This is the category that the item belongs to. It must consist of a minimum of 5 characters and be only one word.
    Quantity: This is the quantity in stock of an item. This must not be blank. You may assume that a valid number will be provided.

The following are the methods that the item manager can perform:

    create: This method creates a new item. Returns false if creation is not successful.
    update: This method accepts an SKU Code and an object as an argument and updates any of the information on an item. You may assume valid values will be provided.
    delete: This method accepts an SKU Code and deletes the item from the list. You may assume a valid SKU code is provided.
    items: This property contains a list of all the items.
    inStock: This method lists all the items that have a quantity greater than 0.
    itemsInCategory: This method lists all the items for a given category

The following are the methods on the reports managers:

    init: This method accepts the ItemManager object as an argument and assigns it to the items property.
    createReporter: This method accepts an SKU code as an argument and returns an object.
        The returned object has one method, itemInfo. It logs to the console all the properties of an object as "key:value" pairs (one pair per line).
         There are no other properties or methods on the returned object (except for properties/methods inherited from Object.prototype).
    reportInStock: Logs to the console the item names of all the items that are in stock as a comma separated values.

Notes:

    There's no need to add the ability to validate the uniqueness of the SKU code. Given the current description, it's possible that a duplicate will exist.
    Each required piece of information for an item corresponds to one property.
    If any of the information provided is not valid, the item creator returns an object with a notValid property with a value of true.
    The created item objects should not have any methods/properties on them other than the required information above and those inherited from Object.prototype.
    You may add methods to the item manager as you deem necessary.

Here is a sample run that you can use as a reference:

*/ 




function getSKU(firstWord, secondWord) {
    let upperFirstWord = firstWord.toUpperCase()
    let upperSecondWord = secondWord.toUpperCase()
    if (!firstWord || !secondWord ) { {
        return false; 
    }
    } else if (firstWord.length >= 3 ){
        return upperFirstWord.slice(0, 3) + upperSecondWord.slice(0,  2);  
    } else 
    return  upperFirstWord.slice(0, 2) + upperSecondWord[0] + upperSecondWord.slice(0, 2); 

}

function validateName(name) {
    let nonSpaces = name.trim().match(/[^\s]/g) || [];
    return nonSpaces.length >= 5;
}

function validateCategory(category) {
    return /^[^\s]+$/.test(category) && category.length >= 5;
}

function getQuantity(itemAmount) {
    if (itemAmount === undefined || itemAmount < 0 ) {
        return false 
    }
    return itemAmount
}



let ItemManager = {
    items: [], 
    create( name, category, quantity) {
        if (validateName(name) && validateCategory(category) && getSKU(name, category) !== false && getQuantity(quantity) !== false ) {
            this.items.push({skuCode: getSKU(name, category), name, category, quantity})
        }

    }, 
    update(sku, selectedItem) {
        let key = Object.keys(selectedItem)[0]
        let currentI = 0 
        this.items.forEach((list, i) => {
            if (list.skuCode === sku) currentI = i 
        })
       return  this.items[1][key] = selectedItem[key] ; 
    },

    delete(sku) {
        this.items.forEach((list, i) => {
            let chosenIndex = 0 
            if (list.skuCode === sku) {
               return  this.items.splice(i, 1)
            }
            
        })
    }, 
    inStock() {
       return this.items.filter((list) => {
            return list.quantity > 0 
        })
    }, 
    itemsInCategory(category) {
        return this.items.filter((list) => {
            return list.category === category
        })
    }

}


let ReportManager =  { 
    init(item) {
        this.item = item
    }, 
    createReporter(sku) {
        let item = this.item.items.filter((list) => list.skuCode === sku)[0]

        return {
            itemInfo() {
                Object.entries(item).forEach((pair) => log(`${pair[0]}: ${pair[1]}`))
            }
        }
    }, 
    reportInStock() {
        let selectedItems = (this.item.items.filter((list) => list.quantity > 0 )); 
        let allNames = selectedItems.map((list) => list.name)
        log(allNames.join(', '))
    }

}

log(ItemManager.create('basket ball', 'sports', 0));           // valid item
ItemManager.create('asd', 'sports', 0);
ItemManager.create('soccer ball', 'sports', 5);           // valid item
ItemManager.create('football', 'sports');
ItemManager.create('football', 'sports', 3);              // valid item
ItemManager.create('kitchen pot', 'cooking items', 0);
ItemManager.create('kitchen pot', 'cooking', 3);          // valid item

ItemManager.items;
//log(ItemManager.update('SOCSP', {quantity : 10}))


// returns list with the 4 valid items

ReportManager.init(ItemManager);
const kitchenPotReporter = ReportManager.createReporter('KITCO');
log(ReportManager.reportInStock())
/* 
// logs soccer ball,football,kitchen pot

ItemManager.update('SOCSP', { quantity: 0 });
ItemManager.inStock();
// returns list with the item objects for football and kitchen pot
ReportManager.reportInStock();
// logs football,kitchen pot
ItemManager.itemsInCategory('sports');
// returns list with the item objects for basket ball, soccer ball, and football
ItemManager.delete('SOCSP');
ItemManager.items;
// returns list with the remaining 3 valid items (soccer ball is removed from the list)

const kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10
*/ 

let string = ('b' + 'a' + 'a' + 'a').toLowerCase();
console.log(string);