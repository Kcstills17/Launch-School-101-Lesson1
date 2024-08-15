function swapEnds(arr) {
  let first = arr[0];
  let last = arr[arr.length - 1];

  arr[0] = last;
  arr[arr.length - 1] = first;
  return arr;
}

let numbers = [1, 2, 3, 4]

