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