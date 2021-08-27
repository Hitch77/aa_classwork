Array.prototype.binarySearch = function(target, callback){
    if (this.length === 0){
        return -1
    }

    return search(this, target, callback)
}

function search(arr, target, callback) {

    let mid = Math.floor(arr.length / 2);

    if (callback(arr[mid], target)) {
        return mid;
    } else if (callback(arr[mid], target)) {
        let left = arr.slice(0, mid)
        return callback(left, target);
    } else if (callback(arr[mid], target)) {
        let right = arr.slice(mid+1)
        let searchResult = callback(right, target)
        return (searchResult === -1) ? -1 : searchResult + mid + 1
    }
}
let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(array.binarySearch(2, (value, target) => {
    if (value === target){
        return true
    } else if (value > target) {
        return true
    } else if (value < target) {
        return true
    }
}))

// function(arr, target, callback){

//     if (arr[mid] === target) {
//         return mid;
//     } else if (arr[mid] > target) {

// //     }


// console.log(myArr.myBinarySearch((num, target) =>  {
//     if (num === target){
//         return true
//     };
//     return false;
// })




















// function mergeSorte(arr, callback) {
//     // use arr.methodName
// }