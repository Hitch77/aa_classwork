Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++){
    callback(this[i]);
  }
}

Array.prototype.myMap = function (callback) {
  let newArr = [];
  this.myEach((ele) => {
    newArr.push(callback(ele));
  })
  return newArr;
}

let newArray = [1, 2, 3];

const func = function(num) {
  return num * 2;
}

Array.prototype.myReduce = function (callback, initialValue = null) {
    // if (!initialValue) {
    //     let initialValue = this[0]
    // }
    if (initialValue === null){
    initialValue = this.shift()}
    this.myEach((ele) => {
        initialValue = callback(ele, initialValue)
    })
    return initialValue;
}

array = [1, 2, 3]
// without initialValue
array.myReduce(function (acc, el) {return acc + el;}); // => 6

// with initialValue
array.myReduce(function (acc, el) {return acc + el;}, 25); // => 31