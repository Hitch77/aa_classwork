// // function sum(n1, n2, n3, n4, n5) {
// //     let array = [n1, n2, n3, n4, n5];
// //     let sum = 0;
// //     for (let i = 0; i < array.length; i++) {
// //         sum += array[i];
// //     }
// //     return sum
// // }

// // function sum (...args) {
// //     let sum = 0;
// //     args.forEach(ele => {
// //         sum += ele
// //     })
// //     return sum
// // }

// // console.log(sum (1, 2, 3, 4)) === 10;
// // console.log(sum(1, 2, 3, 4, 5)) === 15;

// Function.prototype.myBind = function(ctx) {
//     const that = this;
//     return function() {
//         return that.apply(ctx)
//     }
// }

// Function.prototype.myBind = function(ctx, ...bindArgs) {
//     const that = this;
//     return function (...callArgs) {
//         return that.apply(ctx, bindArgs.concat(callArgs))
//     }

// }

// class Cat {
//     constructor(name) {
//         this.name = name;
//     }

//     says(sound, person) {
//         console.log(`${this.name} says ${sound} to ${person}!`);
//         return true;
//     }
// }

// class Dog {
//     constructor(name) {
//         this.name = name;
//     }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

// function curriedSum(numArgs){
//     let numbers = [];
//     let sum = 0;
//     return function _singleSum(num1){
//         numbers.push(num1)
//         sum += num1
//         if (numArgs === numbers.length){
//             // console.log (numbers.reduce((a, b) => a + b));
//             return sum;
//         }else{
//             console.log(sum);
//         };
//         return _singleSum;
//     }
// }

// const sum1 = curriedSum(3);
// console.log(sum1(5)(30)(20));
// console.log(curriedSum(4))

Function.prototype.curry(numArgs) {
    let array = [];
    return function _sum(num) {
        
        if (array.length === numArgs) {

        }
        console.log(num)
    }

console.log()

}

Function.prototype.myBind = function(ctx, ...bindArgs) {
    const that = this;
    return function (...callArgs) {
        return that.apply(ctx, bindArgs.concat(callArgs))
    }

}