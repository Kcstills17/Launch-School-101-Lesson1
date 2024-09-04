function log(input) {
    return console.log(input)
}
//Project: Banking with Objects and Closures

//In this assignment, we'll build a small banking application and look at how we can use closures to control access to the application's data.
// We'll proceed through this assignment using some example code and then you will write code that satisfies it.

   //1.  Create an object named account that represents a bank account. It should contain a balance property that stores the account's current balance.
function makeAccount(number) {
    let balance = 0; 
    let transactions = []; 
    return {     
    balance() {
        return balance; 
    }, 
    number() {
        return number;
    }, 
    transactions() {
        return transactions; 
    }, 

    deposit(amount) {
        balance += amount; 
        transactions.push({type: 'deposit', amount: amount})
        return amount; 
    }, 
    withdraw(amount) {
        if (amount > balance) {
            amount = balance 
        }
            balance -= amount; 
            transactions.push({type: 'withdrawal', amount: amount})
        return amount; 
    }
   }; 
}

function makeBank() {
    let accounts = []; 
    return {
    
        openAccount() {
            let number = 101 + accounts.length; 
            let newAccount = new makeAccount(number)
            accounts.push(newAccount)
            return newAccount; 

        }, 
        transfer(sourceAccount, destinationAccount, transferTotal) {
            if (transferTotal > sourceAccount.balance) {
                transferTotal = sourceAccount.balance
            }
            sourceAccount.withdraw(transferTotal)
            destinationAccount.deposit(transferTotal)
            return transferTotal; 
        }

    }
}

   /* 
2. Add a deposit method to the account object that takes a single argument, the value of the deposit. 
The deposit method adds the value of the argument passed to it to the account's balance, and then returns the deposit amount.

3. Add a withdraw method to the account object that takes a single argument, the amount to withdraw. 
It should subtract the amount from the account's balance and return the amount subtracted.

4. Each account should have a record of every deposit and withdrawal applied to it. To do this, add a property named transactions 
    to account that contains an array of transactions, each of which is an object with type and amount properties.

5. We want to create more than one account. Move the account creation code to a function named makeAccount that returns a new account object.

6. We also need an object to manage accounts: a bank. Create a function that returns an object that represents a bank. 
The bank should have a property named accounts that represents a list of accounts.

7. Add a new method named openAccount to the object returned by makeBank. It should create a new account, 
add it to the bank's accounts collection, and return the new account. Each new account should have a unique account number, starting at 101;
 each account number should be one greater than the previous account created.

 8. Add a new method to the bank object that transfers money from one account to another.

9. Change the code so that users can access the account balance, account number, and transactions list by calling methods, but not by directly accessing those properties.

10. Change the code so that users can no longer access the list of accounts.

let bank = makeBank();
console.log(bank.accounts);
// undefined
*/ 




let bank = makeBank();
let account = bank.openAccount();
console.log(account.balance());
// 0
console.log(account.deposit(17));
// 17
let secondAccount = bank.openAccount();
console.log(secondAccount.number());
// 102
console.log(account.transactions());
log(secondAccount.accounts)
// [{...}]