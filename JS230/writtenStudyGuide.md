# *The Dom*
1. *What is the DOM?*

The DOM or `Document Object Model` is an in memory object representation of a html page. It allows for actual code such as Javascript to interact with the page and provide modern functionality to it as well. 



2 *What is a node?*

The Dom is a hierarchial structure that is usually represented as a tree. The branches of the tree are represented as a node. 
A node is a particular type of object that represents an element in the DOM. Nodes are array like objects but do not have all of the functionality of an array.

3. *What are the different kinds of nodes the DOM tree can contain?*


the DOM Tree can contain multiple different types.  Here are some common types. 

Element Nodes: 

These nodes represent each element in the dom. These are values such as. `p`,  `div`,  `h1`, etc. These values provide the most functionality of any node as they can contain attributes or child nodes. 

Text Nodes:

These are represented as the text content within an element node. These values can also be represented by white space in the html page. So an empty text node may exist but not be visibly shown in html. It will always be the child of a element node. two examples 


`<p> 'I am a p tag </p>` The text content is the text within the `p` element node. 

```
<div> 
<p> 'I am a p tag' </p>
</div>
```
In this above example we have two text nodes. One as content for the. `p` tag and another which is an empty text node created by the space and new line following the opening. `div` tag. 


The DOM also contains other popular node types such as `comment`,  `document`, and. `attribute`. 



4. *DOM Visualizer link*
    https://bioub.github.io/dom-visualizer/
5. *What do we mean when we say we are walking the tree?*


The DOM connects nodes to each other through attributes that reference their relationships (e.g., parent, child, sibling). Walking the tree refers to traversing the DOM hierarchy, visiting every node, including children, grandchildren, great-grandchildren, and so on and performing some kind of action along the way. 

6. *How can we “walk the tree”?*

One way to walk the tree is a depth-first approach which recursively calls itself until every node with a descendant until the last descendant has been reached.

```js
// walk() calls the function "callback" once for each node
function walk(node, callback) {
  callback(node);                                                   // do something with node
  for (let index = 0; index < node.childNodes.length; index += 1) { // for each child node
    walk(node.childNodes[index], callback);                         // recursively call walk()
  }
}

walk(document.body, node => {                                // log nodeName of every node
  console.log(node.nodeName);
});

```

In the above code we have the function  `walk()` which will take a `node` to start and a `callback` function as arguments. Beaeath the `walk()` definition we have the invocation of walk `walk()` whihch will take `document.body` as the initial node argument and  `node` to represent the callback. The contents of the callback will console.log the result of `node.nodeName` which should return the tag name of the given element. 

Returning back to the contents of `walk` we invoke the callback, passing in `node` with  `callback(node)` which output the name of our starting tag, aka the `body`. Now we want to walk through the tree recursively so we enter a loop starting from `0` until reaching the length of the current `node.childNodes.length` 

Within this loop we invoke our recursive function. `walk(node.childNodes[index], callback)` which will dive in and log the name of each childNode until it has reached the bottom, in which it will return back to the parent node and move on to the next sibling (if there is one) and continue this process until it has reached every descendant of the original passed in node. 


7. *What’s the difference between HTMLCollections, NodeLists, and Arrays?*

An actual array has access to all   `Array` methods and properties.  

Both `HTMLCollection` and `NodeList` are array like objects but do not have access to all `Array` methods and properties. 

`HTMLCollection` only contains Element nodes and is usually returned by methods such as. `document.getElementsByClassName()` or `document.getElementsByTagName()`. It is also a live collection meaning it automatically updates and has its changes reflected in the DOM. 

`NodeList` will contain any type of node and is usually returned by methods such as `document.querySelectorAll(arg)` and `node.childNodes()`. It is a static collection so it does not have its changed automatically reflected in the DOM. It also has a bit more functional Array like behavior with the use of methods like `forEach()`.  


8. *What is a live collection?*

A live collection is an object the will have its changes automatically reflected in the DOM. Here is an example of both a live and static collection in action. 


``` html

<p>Paragraph One</p>
<p>Paragraph Two</p>
<p>Paragraph Three</p>

<div> 
    
</div>

```


```js 

// live collection example

const paragraphs = document.getElementsByTagName('p'); 
console.log('BEFORE UPDATE:', paragraphs.length); 

const newParagraph = document.createElement('p'); 
document.body.appendChild(newParagraph); 

console.log('AFTER UPDATE:', paragraphs.length); 

// result 

BEFORE UPDATE: 3

AFTER UPDATE: 4


```

``` js 

// static collection example 


console.log('This is a static collection')


let allDivs = document.querySelectorAll('div'); 

console.log('allDivs length before Update:', allDivs.length)

let newDiv = document.createElement('div'); 

document.body.appendChild(newDiv); 

console.log('allDivs length after Update:', allDivs.length)

// result 


allDivs length before Update: 1 
allDivs length after Update: 1

```



9. *What happens if you try to add a node to the DOM that already exists in the DOM? Why?*

When you try to add a node to the DOM that exists it will remove that node from its previous location and insert it where you have added it. This is because no single node in the DOM can exist in more than one place. 

10. *Create some examples of using different css selectors (class, tag name, attribute, combination of all etc.) with document.querySelector()*


```html 
... prior html setup
   <p class = 'one' >Paragraph One</p>
    <p id = 'two'>Paragraph Two</p>
    <div class = 'first-div' text = 'I am the div text content'> </div>
... more html 

```

```js
let allP = document.querySelectorAll('p')
console.log(allP.length)
// 2 

let firstP = document.querySelector('.one')
console.log(firstP)
// <p class="one">

let secondP = document.querySelector('#two')
console.log(secondP)
// <p id="two">

let div = document.querySelector('div')
console.log(div.getAttribute('text'))
// I am the div text content



```

11. *Create a table of useful DOM manipulation methods*
# Events and Async
1. *What is asynchronous code?*



Asynchronous code is code that runs separately from the main code in a JS Program. It is mainly used to help JS effectively do more than one task at once as JS can only technially do one thing as a single threaded langauage. Through the use of asynchronous code running concurrently of the main program, however, more functionality can be added/used. 

2. *What is the setTimeout() function? Give an example of creating a setTimeout() and cancelling it.*

SetTimeout() is an asynchronous function that takes two arguments. A callback, and an amount of time (a Number with each second represented as 1000) to wait before invoking the callback. 


```js 


// setTimer() running 

let getData = function() {

  console.log(' getting data...') // will log 

  setTimeout(() => {
    console.log('Data has been retrieved.')
  }, 2000)
}

getData()

// setTimeout will run asynchronously from the main code and once the 2 seconds will pass will use the invoked callback to log "Data has been retrieved"



```


```js 

// setTimer() being cancelled


let failToGetData = function()  {
  console.log('Im gonna get data...')

 let timeoutId =  setTimeout(() => {
    console.log('Data has been retrieved.')
  }, 2000)

  clearTimeout(timeoutId)
}


failToGetData()

// here we assign the setTimeout to a variable and then name it timeoutId. we can use the clearTimeout method by passing in timeoutId as an argument to cancel the setTimer() method.

```

3. *What is the setInterval() function? Give an example of creating a setInterval() function and cancelling it.*


`SetInterval` is a method that will take a callback function and an amount of time as arguments. it will invoke the callback function each time the amount of time that the time argument represents. You must cancel this method with `clearInterval` to stop the method from running. 

```js 


function intervalCounter(cb, count) {
  let currentCount = count;

  const intervalId = setInterval(() => {
    const shouldStop = cb(currentCount);
    currentCount += 1;

    if (shouldStop) {
      clearInterval(intervalId); // Stop the interval if the callback returns true
    }
  }, 2000);
}

// Example usage
intervalCounter((counter) => {
  console.log(`Counter: ${counter}`);
  if (counter === 5) {
    console.log('Stopping counter.');
    return true; // Stop the interval when counter reaches 5
  }
  return false;
}, 1);

```

4. *What is an event?*

An event is an object that represents some 
occurrence; it contains information about what happened and where it 
happened. The browser can trigger events as the page loads, when the 
user interacts with the page, and when the browser performs some action 
required by the program.

5. *What is an event listener?*

an event listener, also known as event handlers, are functions that Javascript runtime calls when a particular event occurs. They are registered onto elements using the method. `addEventListener(event, callback)`. Multiple listeners can be registered to the same or different event and you can dynamically add or remove an eventListener to an element. 


6. *What is the lifecycle of loading a webpage? When does the DOMContentLoaded event fire?*


The browser will first load the page and evaluate the Javascript in the`script` tag. This code will register a callback to handle the. `DOMContentLoaded` event when it fires on the `document`. 

7. *What are some examples of user-driven events?*

Some of the most common user-driven events are `click`, `mouseover`,  `keydown`, and  `keyup`. These are the result of typical user actions such as clicking a button, hovering over a particular element, pressing a key on a keyboard, or holding the key on a keyboard. 

8. *Give an example of creating/implementing an event listener*


examples

```js 
	// click
	// Triggered when the user clicks on an element, such as a button or a link.
	
document.querySelector('button').addEventListener('click', () => {
  console.log('Button clicked!');
});


	// mouseover
	// Triggered when the user moves the mouse pointer over an element.

document.querySelector('div').addEventListener('mouseover', () => {
 console.log('Mouse hovered over the div!');
});

	// keydown
	// Triggered when the user presses a key on the keyboard.

document.addEventListener('keydown', (event) => {
  console.log(`Key pressed: ${event.key}`);
});

 	// keyup
	// Triggered when the user releases a key on the keyboard.

document.addEventListener('keyup', (event) => {
  console.log(`Key released: ${event.key}`);
});
	

```
9. *What’s the difference between the event listener and the event handler?*

They are virually the same except for one key aspect. The method itself is usually moreso referred to as the event listener. The callback function argument is usually known as the event handler, since it is the action that is performed when the event is fired. 

10. *What’s are some of the common properties of the event object?*

The three most common property types of an event object are  `type`,  `currentTarget`,and `target`. 

`type` refers to the name of the event. Such as. `click` or  `keydown`. 

`currentTarget` refers to the element that the event listner is attached to.

`target` refers to the object in which the event has occured. If you clicked on that element it is the target. 


11. *What is event delegation? What problems does it solve? What is a tradeoff of using event delegation instead of attaching event listeners to individual child elements?*

Event delegation is instead of creating and attaching events all throughout a group of elements , to instead use `event propagation` or capturing/bubbling to have a single or few event listeners either capture down or bubble up to have the same functionality. This is possible through an event listener that has some relation (parent, grandparent, child, grandchild etc) that can travel through the tree directly.

A problem it solves it is allows for less code and therefore better execution and runtime. And also can allow for modular/versatile code by being able to delegate event logic through different portions of a page. 

A problem it incurs is it introduces complexity to certain elements. not all events should have the same functionality. If we are using delegation to extend an event listener to both a button and link then we may have an issue. You probably would not want these events to have the same event handling. With a lot of different elements and event listeners being delegated, this can be extremely complicated.

12. *What is the value of this within the event handler?*

The value of  `this` in an event handler always refers to the  `currentTarget` or the element the event handler is attached to when the function is a function expression. 

13. *What is capturing/bubbling?*

Capturing and bubbling refer to the two phases of event propagation in the DOM. When an event is triggered on an element, it propagates through the DOM in a specific sequence, passing through related elements during two main phases:

Capturing Phase (Capture)
The event starts at the root of the DOM (the topmost element, usually document) and propagates down to the target element.
Event listeners set to listen during the capture phase can intercept the event as it travels downward.

Target Phase:
Once the event reaches the target element, the event fires on the target itself.
Bubbling Phase (Bubble):
After the event fires on the target, it propagates back up the DOM tree to the root.
Event listeners set to listen during the bubbling phase handle the event as it travels upward.

The third argument of addEventListener (called useCapture) determines whether the event listener listens during the capturing phase or the bubbling phase:
	•	true (Capture Phase): The listener will handle the event as it propagates downward during the capturing phase.
	•	false (Bubble Phase): The listener will handle the event as it propagates upward during the bubbling phase (default behavior).

```js
elem1.addEventListener('click', callbackFunction, true);
// Notice the third argument. It's set to `true`. When it's set to true, the event listener will listen during the capturing phase. If not specified, `useCapture` defaults to `false` and the event listener listens during the bubbling phase.

```

14. *What is the event loop?*

The event loop is a key mechanic for asynchronous code. It looks at the stack and task queue. The asynchronous code from the task queue, usually loaded in from an API of some sort, will only be added to the stack once it is empty. This is shown with this example here. 

```js
console.log('I am the first log')
setTimeout(() => console.log('I am the second log'), 0); 
console.log('I am the third log')
// I am the first log 
// I am the third log 
// I am the second log


```
This snippet effectively shows the event loop at play. Despite the `setTimeout` method being set to `0` as its time to wait argument, the event loop must still wait for the stack to clear (which in this case will log the other two logs) before adding the code from the task queue. 

15. *What is a callback? How do callbacks enable asynchronous operations?*

A callback is a function which takes another function as an argument. They enable asynchronous operations in that when an asynchronous function takes a callback as an argument, the callback function will wait for that aysync. action to be added onto the stack by the event loop before invoking the callback functionality. Allowing for more functional and diverse code in a normally single threaded JS language.

16. *What are some of the limitations of callbacks?*

One major pitfall of callbacks has its own term. `callback hell` this refers to when in code there are multiple callback functions being used. This becomes a major problem in terms of the legibility of the code and the possible functionality as a result of that.


Another major issue is error handling. When you have many callbacks, it is easily possible to not get the correct error handling, or to perhaps even overlook an error itself. 

17. *What is a promise?*

A promise is another way to handle asynchronous code while avoiding some of the pitfalls of callbacks such as poor legibility and poor error management.

A promise is its own type of object in JS `Promise` and these objects can have callbacks attached to them without any nesting. 

18. *What are the states of a promise?*

The three states of a promise are 

Pending: This is the initial state. The operation has not been completed. 

Fulfillled: The operation has completed successfully, and the promise has a resulting value. 

Rejected: The operation has failed, and the promise has an error. 


```
Pending -> Fulfilled
     \
      -> Rejected

```



19. *How do you create a promise?*

You use the  `Promise` constructor to create a new promise. This will take a function called the 'executor' as an argument. This function will run automatically at creation and we include the operations we want to complete. It can take two arguments, `resolve` and  `reject` which are functions themselves. When we want to succesfully complete a promise we would invoke. `resolve()` and when we wish to reject a promise we will invoke `reject()`


```js 

let myFirstPromise = new Promise((resolve, reject) => {
  // We do something asynchronous here, and then call resolve or reject

  // This is just an example condition
  let condition = true;
  if (condition) {
    // This value will be passed to the .then()
    resolve("Success!");
  } else {
    // This error will be passed to the .catch()
    reject("Failure!");
  }
});
```

20. *What are .then(), .catch() and .finally()? How are they different?*

The `then()` method is to be invoked when a promise is succesfully fulfilled. You can pass a function that will receive the result. Aka the result of the `resolve()` function in the original function. 

```js

myFirstPromise.then((successMessage) => {
	console.log("yay!" + successMessage
})
```

If a promise is rejected,  `catch()` will catch the error. It behaves similarly to a `try/catch` block in synchronous code. 

```js 
myFirstPromise.catch((errorMessage) => {
  console.error("Uh oh! " + errorMessage);
});

```

The `finally()` method will run regardless of whether `then()` or  `catch()` or ran prior. It is typically used for some cleanup actions, like stopping a loading indicator. 


```js

myFirstPromise
  .then((successMessage) => {
    console.log("Yay! " + successMessage);
  })
  .catch((errorMessage) => {
    console.error("Uh oh! " + errorMessage);
  })
  .finally(() => {
    console.log("This runs no matter what.");
  });


```

21. *How can you handle errors using promise chaining?*

When  `then()` is attached to a promise this will return a new promise. This new promise can also be chained with `then()`, `catch()`, or  `finally()`. 

When any errors occur in this chain, typically the chain will short circuit to the end and provide whatever result of the `catch()` method. Here is an example. 

```js 
doSomethingAsync()
  .then((result) => doSomethingElseAsync(result))
  .then((newResult) => doThirdThingAsync(newResult))
  .catch((error) => console.error("An error occurred:", error));

```

In this chain, any errors thrown in doSomethingAsync, doSomethingElseAsync, or doThirdThingAsync are caught by the .catch() at the end.

Also `catch()` can be used to recover from errors. It can provide a fallback value in case an error would possibly break the program progressing past the current point. 


```js
doSomethingAsync()
  .then((result) => doSomethingElseAsync(result))
  .catch((error) => {
    console.error("An error occurred in the first two steps:", error);
    return fallbackValue;
  })
  .then((newResult) => doThirdThingAsync(newResult));



```




22. *What is an async Function?*

an async function will be prepended by the  `async` keyword. This makes sure that the function will return a `Promise` object. Regardless of the function explicitly returns a function or value, the returned value is wrapped in a promise. 

```js 

async function loadingData() {
  return 'Retrieved data from server!!'

}

loadingData().then((data) => console.log(data))

```

This function returns a string, however the `async` keyword wraps the value in a promise. so `then()` can be used. 


23. *List some useful Promise API methods*

`Promise.all()`:  this will take an array (or iterable object) of promises. It will return a single promise that will resolve when all contained promises complete succesfully or one contained promise rejects and throws an error. 

```js 
const promise1 = Promise.resolve(10);
const promise2 = Promise.resolve(20);
const promise3 = Promise.resolve(30);

Promise.all([promise1, promise2, promise3])
  .then((results) => console.log('All resolved:', results)) // Logs: All resolved: [10, 20, 30]
  .catch((error) => console.error('One failed:', error));

```

`Promise.race()`: This API method will take an iterable list of promises and then return a promise. This promise is settled as soon as any promise resolves or rejects. The usecase here is typically to see on average what promise will complete first. 

```js 

const fastPromise = new Promise((resolve) => setTimeout(() => resolve('Fast!'), 100));
const slowPromise = new Promise((resolve) => setTimeout(() => resolve('Slow!'), 500));

Promise.race([fastPromise, slowPromise])
  .then((result) => console.log('Winner:', result)) // Logs: Winner: Fast!
  .catch((error) => console.error('Error:', error));
```

`Promise.allSettled()`: This takes an iterable list of promises and returns a promise. This promise completes after all contained promises either resolve or reject. It is used to see the outcome of each promise, regardless of result. 


```js 

const promise1 = Promise.resolve('Resolved!');
const promise2 = Promise.reject('Rejected!');
const promise3 = Promise.resolve('Another resolved!');

Promise.allSettled([promise1, promise2, promise3])
  .then((results) => console.log('Results:', results));
// Logs:
// Results: [
//   { status: 'fulfilled', value: 'Resolved!' },
//   { status: 'rejected', reason: 'Rejected!' },
//   { status: 'fulfilled', value: 'Another resolved!' }
// ]
```

`Promise.any()`: This method will take an iterable list of promises and return a promise. It will complete once any contained promise fulfills. If no promises fulfill and all reject then the returned promise will then be rejected with an `AggregateError`. This is a type of error that groups together individual errors. 


```js
const promise1 = Promise.reject('Error 1');
const promise2 = Promise.reject('Error 2');
const promise3 = Promise.resolve('Success!');

Promise.any([promise1, promise2, promise3])
  .then((result) => console.log('First fulfilled:', result)) // Logs: First fulfilled: Success!
  .catch((error) => console.error('All rejected:', error.errors));

```

# HTTP Requests
1. *What is the basic structure of an XMLHttpRequest?*

The XMLHttpRequest object is used to interact with servers via HTTP. It allows sending and receiving data without refreshing the web page, supporting both asynchronous and synchronous communication.

The basic structure is 

Instantiate a new `XMLHTTPRequest` Object

Set `HTTP` method and  `URL` on request. 

send request 


```js 
let request = new XMLHttpRequest(); 

request.open("GET", '/path'); 

request.send()


```

2. *What is the lifecycle of an XMLHttpRequest?*


There are two main events in the lifecycle of a  `XMLHttpRequest`. When it sends the request and one where response loading ends. 

Event: `loadstart` fires when a request is sent to the server. 

Event: `loadend` fires when the response loading is done and all other events have fired. 


Before `loadend` fires another event will fire based off the result of the request. 


`load`: a complete response is loaded. 

`abort`: The request is interrputed before it could complete. 

`error`: An error occurred

`timeout`: A response wasn't received before the timoeut period ended. 

3. *Write an example of submitting form data using an XMLHttpRequest.*

``` html 

   <form id="form" method="POST" action="books">
      <p><label>Title: <input type="text" name="title"></label></p>
      <p><label>Author: <input type="text" name="author"></label></p>
      <p><button type="submit">Submit</button></p>
    </form>
    
```

``` js 
let form = document.getElementById('form');

form.addEventListener('submit', (event) => {
  event.preventDefault(); // Prevent default form submission

  let data = new FormData(form); // Collect form data

  let request = new XMLHttpRequest();

  // Set the method and correct URL
  request.open(form.method, `https://lsjs230-book-catalog.herokuapp.com/books`);

  // Listen for the load event to handle the response
  request.addEventListener('load', () => {
    if (request.status === 201) {
      console.log(`This book was added to the catalog: ${request.responseText}`);
    } else {
      console.error(`Failed to add book: ${request.status} - ${request.statusText}`);
    }
  });

  // Send the request
  request.send(data);
});


```

In the above code lets go over some key details. we use an event. `form.addEventListener()` to prevent the default behavior of submitting the form. So at this point submitting it does nothing. 

we collect the data of our input in the forms using `data = formData(form)`. A `FormData` object will collect the data from an existing `<form>` tag. a keynote is it only uses  input fields that have a `name` attribute. Our form does, so we are covered. 


we set up our xml request with. `let request = new XMLHttpRequest()` 

We then establish our connection through the use of  ` request.open(form.method, `https://lsjs230-book-catalog.herokuapp.com/books`);`s

Finally we want to add an event handler which will load in our data once the XML request has resolved.   `request.AddEventListener('load', ()...)` 

In this event handler when we get a successful connection and a status of `201` we will log a message and add the result of. `request.responseText` which will show the formatted JSON data. e.g. 

`This book was added to the catalog: {"title":"Naruto ","author":"Masashi Kishimoto"}
`

In any other case, perhaps we input no data, or the the request status is not successful we provide an error message with a message plus the `request.statusText`. e.g. 


`Failed to add book: 422 - Unprocessable Entity`

We complete the handler and the code with. `request.send(data)` which will send the `formData` object to the server, including the proper encoding. 

4. *What is a cross-origin request?*

The Scheme, host name, and port of a web pages url define it's origin. When a request is made to a page that has a different origin (either different scheme, host, or port) the request is considered a cross-origin request. 

5. *What is the same-origin policy?*

All browsers implement a security featur known as the. `same-origin-policy`. This prevents an `XMLHttpRequest` from making a cross-domain requests. It can still request from the origin domain with no issue. 

6. *How can we complete cross-origin requests if browsers implement same-origin policies?*

This is solved using CORS or `cross-origin-resource sharing`. This is a mechanism to allow cross-origin sharing.  This is accomplished as `XMLHttpRequest` sent by the browser has a `Origin` header that contains the origin of the requesting page. When the server receives this request it checks this `Origin` header to see that the origin is a place that is allowed to see the response. If so, it will send a `Access-Control-Allow-Origin` header as apart of the response.  If this header contains the correct value then the response will be available to the application.

7. *What is the Fetch API? Show an example of it in use using async/await and NOT using async/await*

The Fetch API is an API similar to. `XMLHTTPRequest` as in, it also makes network requests. It however, uses the promise syntax to provide a more simple interface. `Fetch()` takes a url as an argument (or  `Request` object) and it also takes optional arguments to configure the request. 


```js 

// using fetch() with async/await functions
async function fetchMoviesJSON() {
  try {
    const response = await fetch('/movies'); // Make the HTTP request
    if (!response.ok) {
      // Handle HTTP errors (status codes outside 200-299)
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const movies = await response.json(); // Parse JSON response
    return movies; // Return the movies
  } catch (error) {
    // Handle network or other errors
    console.error('Failed to fetch movies:', error);
    throw error; // Re-throw the error if necessary
  }
}

// Use the function to fetch and log movies
fetchMoviesJSON()
  .then((movies) => {
    console.log('Fetched movies:', movies); // Log the fetched movies
  })
  .catch((error) => {
    console.error('Error while fetching movies:', error); // Log any errors
  });
```


```js 

// using fetch() without async/await 

function fetchMoviesJSON() {
  // Return the fetch call so we can chain it later
  return fetch('/movies')
    .then((response) => {
      if (!response.ok) {
        // Handle HTTP errors (status codes outside 200-299)
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return response.json(); // Parse and return JSON data
    });
}

// Use the function and chain `.then()` and `.catch()`
fetchMoviesJSON()
  .then((movies) => {
    console.log('Fetched movies:', movies); // Handle the fetched movies
  })
  .catch((error) => {
    console.error('Error while fetching movies:', error); // Handle errors
  });
```


