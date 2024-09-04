function log(input) {
    return console.log(input); 
}

let arr = [1, 2]
 // Prototypal chain 
log(arr.constructor === Array)

// arr.__proto__ refers to Array.prototype where  array functions such as sort, forEach, map(), etc are stored in the chain 
log(arr.__proto__ == Array.prototype)
log(Array.prototype.__proto__ === Object.prototype)
log(Object.prototype.__proto__) // Null


log(Function.prototype.__proto__ === Object.prototype)

// Function constructor refers to the Function Object itself. 
log(Function.constructor === Function)



function Person(name, age) {
    this.name = name 
    this.age = age
  }
  Person.prototype.areYouOld = function() {
    return "I'm super old"
  }
  
  function Child(name, age, grade) {
    Person.call(this, name, age) // way to emulate super() with pseduo classical prototypal inheritance chain
    this.grade = grade
  }
  
  Child.prototype = Object.create(Person.prototype);
  Child.prototype.constructor = Child;
  
  Child.prototype.areYouOld = function() {
    return "No you're old"
  }
  
  let tom = new Person('tom', 30)
  let kid = new Child('sam', 8)
  
  console.log(kid.areYouOld())
  console.log(tom.areYouOld())
  
