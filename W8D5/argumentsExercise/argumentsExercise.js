// function sum(n1, n2, n3, n4, n5) {
//     let array = [n1, n2, n3, n4, n5];
//     let sum = 0;
//     for (let i = 0; i < array.length; i++) {
//         sum += array[i];
//     }
//     return sum
// }

// function sum (...args) {
//     let sum = 0;
//     args.forEach(ele => {
//         sum += ele
//     })
//     return sum
// }

// console.log(sum (1, 2, 3, 4)) === 10;
// console.log(sum(1, 2, 3, 4, 5)) === 15;

Function.prototype.myBind = function(ctx) {
    const that = this;
    return function() {
        return that.apply(ctx)
    }
}

Function.prototype.myBind = function(ctx, ...bindArgs) {
    const that = this;
    return function (...callArgs) {
        return that.apply(ctx, bindArgs.concat(callArgs))
    }

}

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true

