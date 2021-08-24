Array.prototype.uniq = function () {
    let array = [];
    this.forEach(ele => {
        if (array.indexOf(ele) === -1){
            array.push(ele)
        }
    });
    return array;
}

Array.prototype.twoSum = function () {
    let array = []
    this.forEach((ele1, i1) => {
        this.forEach((ele2, i2) => {
            if (i2 > i1){
                let sum = ele1 + ele2;
                if (sum === 0){
                    array.push([i1, i2]);
                }
            }

        });
    });
    return array;
}

Array.prototype.transpose = function () {
    let array = []
    for(let i=0; i<this[0].length; i++){
        let new_arr = []

        for(let j=0; j<this.length; j++){
            new_arr.push(this[j][i])
        }
        array.push(new_arr)
    }
    return array
}

new_array = [[1, 2], [3, 4], [5, 6]]
new_array_t = [[1, 3, 5], [2, 4, 6]]