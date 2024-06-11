//Add a qux property with value 3 to the myObj object we created in the previous exercise. Now, examine the following code snippets:


let objKeys = Object.keys(myObj);
objKeys.forEach(function(key) {
  console.log(key);
});


for (let key in myObj) {
  console.log(key);
}

// Without running this code, can you determine whether these two snippets produce the same output? Why?
// you cannot determine if they will have the same output because both `Object.keys` and `for (let key in...)` have indeterminate orders 