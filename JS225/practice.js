function log(input) {
    return console.log(input); 
}


// Start by creating a new object, invoices. The object requires a property named unpaid; unpaid should be an array that is initially empty.


let invoices = {
    unpaid: [], 

    add(name, owedAmount) {
       this.unpaid.push({
        name, 
        owedAmount
       })
    }, 


    totalDue() {
     let values = Object.values(this.unpaid).map(({owedAmount}) => owedAmount)
     return values.reduce((accum, curr) => accum += curr, 0)
    }, 

    paid: [], 


    payInvoice(clientName) {
        let unpaid = []; 
        this.unpaid.forEach((obj)=> {
            obj.name === clientName ? this.paid.push(obj) : unpaid.push(obj)
        })
       return this.unpaid = unpaid 
    }, 

    totalPaid() {
        let values = Object.values(this.paid).map(({owedAmount}) => owedAmount)
        return values.reduce((accum, curr) => accum += curr, 0)
    }
   
}; 

//invoices.add('starbucks', 300)
invoices.add('Due North Development', 250)
invoices.add('Moonbeam Interactive', 187.50)
invoices.add('Slough Digital', 300)
invoices.payInvoice('Slough Digital')
invoices.payInvoice('Due North Development')
//Now that we have a way to store our unpaid invoices, we should have a way to compute the total amount of all unpaid invoices. Create a method on the invoices object named totalDue that iterates over the unpaid array and computes the total amount for its contents. Return the total at the end of the method.


//Now that we have some invoices, we need to add a way to mark invoices as paid. Add a paid property to the invoices object and initialize it as an empty Array; we will use this property to store the paid invoices.

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

 log(scissors.setPrice(-45))
 log(scissors.describe())