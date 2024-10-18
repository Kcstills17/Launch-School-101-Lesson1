/* 

Write a function basicCallback that receives a callback function and a numeric argument. This function should execute the callback, 
passing it the number after 2 seconds using setTimeout. The callback should then multiply the number by 2 and log the result.



*/ 
// Example usage:
function basicCallback(callback, number) {
    // Check if the callback is actually a function
    if (typeof callback !== 'function') {
      console.error("Error: callback is not a function. Please provide a valid function.");
      return; // Exit the function to prevent further execution
    }
    
    console.log("basicCallback called with number:", number);
    
    // Use setTimeout to delay the execution of the callback by 2 seconds
    setTimeout(() => {
      console.log("Executing callback after 2 seconds");
      callback(number); // Call the provided callback with the number
    }, 2000);
  }
  
  // Test the function with a valid callback
  basicCallback((number) => {
    console.log("Callback executed. Result:", number * 2);
  }, 16); // After 2 seconds, logs "Callback executed. Result: 10"



  // 2. Create a function downloadFile that receives a callback function as an argument, and simulates downloading a file by logging "Downloading file...". 
  // After a delay of 1.5 seconds, it should call the callback with the argument "Download complete!".


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


  // 3. Write a function processData that takes in two parameters: an array of numbers and a callback function.
  // This function should use setTimeout to simulate a time-consuming computation by waiting 1 second. After the delay,
  //  it should apply the callback to each number in the array, and then log the new array.


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


// 4 Build a function waterfallOverCallbacks that chains the execution of multiple callbacks. 
// This function should take an array of callbacks that each take a single numerical argument.
//  Each callback should multiply the number by 2 and then the main function should pass it to the next callback in the array.
//  Log the result after the last callback executes.

// Example usage:

function waterfallOverCallbacks(arr, num) { // arr contains all callback functions 
    console.log('The array all contains callback functions', arr)
    // Loop through each callback in the array
    for (let i = 0; i < arr.length; i += 1) {
      
        // Apply the callback function to the number
        num = arr[i](num); // Use the callback from the array
        console.log('This is the current index:', i, 'This is the current doubled value:', num);
    }
    
    // Log the final result after all callbacks
    console.log('Final result:', num);
}

const double = (x) => x * 2;

waterfallOverCallbacks([double, double, double], 1);
// Logs: 8


// 5. Consider the function startCounter that accepts a callback. It should use setInterval to call the callback every second,
//  incrementing and logging a counter variable each time. Also, provide a way for the callback to stop the counter after reaching a specified value.

// Example usage:

function startCounter(cb, count = 0) {
  console.log('starting counter...')
  let intervalId = setInterval(() => {
    const stopCount = cb(count);  // callback returns true when count === 5. so when that is the case ...
    if (stopCount) {
      console.log("All done counting!!")
      clearInterval(intervalId) // we can clear our interval! 
    }
    console.log(`You have to wait ${5 - count} seconds `)
    count += 1;  // otherwise increment count here. 
  }, 1000)

}


startCounter((count) => {
  console.log(count);
  return count === 5;
});
// Logs 1, 2, 3, 4, 5, then stops