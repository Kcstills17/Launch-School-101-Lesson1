function makeFunc() {
  var name = 'Mozilla';
  function displayName() {
    console.log(name); // MDN uses `alert(name)` here, which I've switched to `console.log(name)`
  }
  return displayName;
}

var myFunc = makeFunc();
console.log(makeFunc())
console.log(myFunc());
