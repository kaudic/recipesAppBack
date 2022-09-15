/**
 * 
 * @param {array} array array of items to be shuffled
 * @returns {array} array array shuffled randomly
 */

const shuffle = (array) => {
    let currentIndex = array.length, randomIndex;
    console.log(currentIndex);

    // While there remain elements to shuffle...
    while (currentIndex != 0) {

        // Pick a remaining element...
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex--;

        // And swap it with the current element.
        [array[currentIndex], array[randomIndex]] = [
            array[randomIndex], array[currentIndex]];
    }

    return array;
};

module.exports = shuffle;