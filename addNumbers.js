const readline = require("readline");
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// function addNumbers(sum, numsLeft, completionCallback){
//         if (numsLeft > 0){
//             reader.question("Gimme a number: ", response => {
//                 let num = parseInt(response)
//                 sum += num
//                 console.log(sum)
//                 numsLeft -= 1
//                 addNumbers(sum, numsLeft, completionCallback)
//             });
//         } else if (numsLeft === 0){
//             completionCallback(sum)
//             reader.close();
//         }
// }


function addNumbers(sum, numsLeft, completionCallback){
    if (numsLeft > 0){
        reader.question("Gimme a number: ", response => {
            summer(sum, numsLeft, response, completionCallback)
        });
    } else {
        completionCallback(sum)
        reader.close();
    }
}

function summer(sum, numsLeft, response, completionCallback){
    let num = parseInt(response)
    sum += num
    console.log(sum)
    numsLeft += -1
    addNumbers(sum, numsLeft, completionCallback)
}
// function summer(response, sum, numsLeft){
    
//     addNumbers(sum, numsLeft, sumNumbers)
// }

addNumbers(0, 3, (sum) => console.log(`Total Sum: ${sum}`));










// reader.question("What do you think of Javascript?", response => {
//     console.log(`Thank you for your feedback: ${response}`);
//     reader.question("What do you reallyyyy think of Javascript?", truth => {
//         console.log(`You said: ${truth}. Thanks for your honesty.`)
//         reader.close();
//     })
// })

