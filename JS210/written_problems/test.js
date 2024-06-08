let test = function (...items){
  console.log(Array.isArray(arguments))
  console.log(items.sort())
  console.log(items.pop())
  console.log(items.unshift())
  console.log(items)
  //console.log(arguments.slice(1, 1))
  //console.log(arguments.sort())

}



test(1, 4, 2, 9, 5)
test(6, 8, 4)
