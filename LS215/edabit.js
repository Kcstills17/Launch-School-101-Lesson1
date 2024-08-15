function countRepetitions(arr) {
    const countMap = new Map();

    // Count the occurrences of each element
    arr.forEach(element => {
        countMap.set(element, (countMap.get(element) || 0) + 1);
    });

    // Convert the map into an array of [key, value] pairs and sort them by value in descending order
    const sortedEntries = Array.from(countMap.entries()).sort(([, a], [, b]) => b - a);

    // Return an array of objects instead of a single object
    return sortedEntries.map(([key, value]) => ({ [key]: value }));
}

// Examples
console.log(countRepetitions(["cat", "dog", "cat", "cow", "cow", "cow"])); 
// Output: [{ cow: 3 }, { cat: 2 }, { dog: 1 }]

console.log(countRepetitions([1, 5, 5, 5, 12, 12, 0, 0, 0, 0, 0, 0])); 
// Output: [{ 0: 6 }, { 5: 3 }, { 12: 2 }, { 1: 1 }]

console.log(countRepetitions(["Infinity", "null", "Infinity", "null", "null"])); 
// Output: [{ null: 3 }, { Infinity: 2 }]