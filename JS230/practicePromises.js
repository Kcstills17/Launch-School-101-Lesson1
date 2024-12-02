function log(input) {
    return console.log(input); 
}


/* 
Rewrite the downloadFile callback function you created in this assignment's Q2, as a new promise-based function called downloadFilePromise.
 Instead of using a callback, it should return a promise that resolves with the message "Download complete!" after a delay.

 callback example: 

  function downloadFile(callback, status) { // function param and status param 
    if (typeof callback !== 'function') {
        console.log('ooops. You need a callback FUNCTION')
    } else {
        console.log('YAYY!! It is a callbackfunction')
        setTimeout(() => {
            console.log('Downloading File....')
            callback(status)
        }, 1500)
    }
  }
  
 

  downloadFile((complete) => {   // cb parameter 
    console.log(complete)
  }, 'Download Complete!')   // argument for parameter is added as 2nd argument 


  */ 

function downloadFilePromise() {
    return new Promise((resolve) => {
        log('Downloading File...')

        setTimeout(() => {
            resolve('Download Complete')
            log('Download Complete!')
        }, 1500);
    });
}

downloadFilePromise()


// 2. Convert the processData function from Q3 of this assignment to a new function named processDataPromise that uses promises. 
// This function should return a promise that processes an array of numbers after a delay, utilizing the .then() method for logging the altered array.

/* example 

  function processData(arr, cb) { // callback is a function that takes each element of the array 
    console.log('computing')
    setTimeout(() => {
        let result = arr.map(cb)  // we map through and pass each element into the cb function .
        console.log(result)
    }, 1000)
  }

// Example usage:
processData([1, 2, 3], (number) => number * 2);
// After 1 second, logs: [2, 4, 6]


*/ 
// Define the function to process the data
function processDataPromise(arr, cb) {
    return new Promise((resolve) => {
        // Simulate asynchronous processing with a 1-second delay
        setTimeout(() => {
            const processed = arr.map(cb);  // Apply the callback function to each array element
            resolve(processed);  // Resolve the promise with the processed array
        }, 1000); // 1 second delay
    });
}


// Example usage with a valid callback function:
processDataPromise([1, 2, 3], (num) => num * 2).then((processedNumbers) => {
    console.log(processedNumbers);  // After 1 second, logs: [2, 4, 6]
  });


  // 3. Create a promise called flakyService that simulates a service that sometimes fails. The promise should resolve with "Operation successful" or reject
  // with "Operation failed" randomly. Use .then() for a successful operation log and .catch() for logging a failed operation.

  function flakyService() {
    return new Promise((resolve, reject) => {
      if (Math.random() > 0.5) {
        resolve("Operation successful");
      } else {
        reject("Operation failed");
      }
    });
  }
  

  // 4. Imagine a situation where you need to clean up resources (e.g., close a file) whether an operation succeeds or fails.
  //  Create a promise that resolves with "Operation complete" and demonstrate how to perform cleanup after the operation completes by using .finally().


  function cleanOperation() {
    return new Promise((resolve) => {
        resolve('Operation Complete')
    })
  }

  cleanOperation()
  .then(console.log)
  .finally(() => {
    console.log('this code is clean and finished')
  })


  
  
  // 5. Practice chaining promises by creating a promise chain that involves three promises. The first promise should resolve with a number,
  //  then the chain should double the number and add 5 in successive .then() calls. Log the result after the final operation.

  Promise.resolve(7)
  .then((number) => number * 2)
  .then((number) => number + 5)
  .then((result) => console.log(result));
// Logs: 19


// Error Handling 

// Use the flakyService function from the last practice problem to handle errors gracefully by logging "An error occurred" in a .catch() block, instead of logging "Operation failed" directly.
/* 
function flakyService() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.5) {
      resolve("Operation successful");
   
    }
  });
}
  */ 

flakyService()
.then(console.log)
.catch(() => {
    console.log("Operation Failure: ")
})

// Suppose you are fetching user data from an API. Handle the error thrown by this fetchUserData function, catch it and log only the error message. 
//  Then, use .finally() to log "Fetching complete".

function fetchUserData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => reject({ error: "User not found" }), 500);
  });
}


fetchUserData()
.catch((error) =>  {
    console.log(error.error)
})
.finally(() => {
    console.log('Fetching complete')
}) 

// Implement a function retryOperation that attempts to perform an operation by calling a provided function operationFunc.
//  If operationFunc throws an error, retryOperation should retry the operation up to two additional times before giving up and logging "Operation failed".

// Example usage:

retryOperation(
    () =>
      new Promise((resolve, reject) =>
        Math.random() > 0.33
          ? resolve("Success!")
          : reject(new Error("Fail!"))
      )
  );

  
function retryOperation(operationFunc) {
    let attempts = 0;
  
    function attempt() {
      return operationFunc().catch((err) => {
        if (attempts < 2) {
          attempts++;
          console.log(`Retry attempt #${attempts}`);
          return attempt();
        } else {
          throw err;
        }
      });
    }
  
    return attempt().catch(() => console.error("Operation failed"));
  }

  // Implement a loadData function that fetches data but sometimes fails. It should return a promise that either fulfils with "Data loaded" or rejects with "Network error".
  //  Use a .catch() block to return a recovery promise that resolves with "Using cached data" in case of failure.

  function loadData() {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        if (Math.random() > 0.5) {
          resolve("Data loaded");
        } else {
          reject("Network error");
        }
      }, 1000);
    }).catch(() => {
      console.error("An error occurred. Attempting to recover...");
      // Return a recovery promise
      return Promise.resolve("Using cached data");
    });
  }
  
  loadData().then(console.log);
  // Logs "Data loaded" or "Using cached data"



  // promise API 


 // Use Promise.all() to execute two instances of the flakyService function and one of the loadData function concurrently. Log the results 
 // if all the operations are successful. Handle the situation where one or more of the promises might fail by logging "One or more operations failed"

 // Invoke the functions to get the promises
let promise1 = flakyService(); 
let promise2 = loadData();

let allPromises = Promise.all([promise1, promise2])
  .then((values) => {
    console.log(values); // Logs the resolved values of all promises
  })
  .catch((error) => {
    console.log("One or more operations failed:", error); // Logs if any promise is rejected
  });

  // You have multiple instances of flakyService promises. Implement a strategy using Promise.allSettled() to execute all services but log all the different outcomes,
  //  whether fulfilled or rejected.

  const services = [flakyService(), flakyService(), flakyService()];


  Promise.allSettled(services).then((results) => {
    results.forEach((result, index) => {
      if (result.status === "fulfilled") {
        console.log(
          `Service ${index + 1} succeeded with message: ${result.value}`
        );
      } else {
        console.error(
          `Service ${index + 1} failed with error: ${result.reason}`
        );
      }
    });
  });
  // Logs success message or error for each service
  




  