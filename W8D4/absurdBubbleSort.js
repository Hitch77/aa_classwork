const readline = require("readline");
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
    reader.question(`Is ${el1} > ${el2}?`, response => {
        if (response === "yes"){
            console.log(true)
        } else { 
            console.log(false)
        }
        reader.close();
    });
}

// function absurdBubbleSort(arr, sortCompletionCallback)

askIfGreaterThan(3, 4, (response) => console.log(`You said ${response}`));