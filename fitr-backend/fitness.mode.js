const mongoose = require('mongoose');
const Schema = mongoose.Schema;
let Fitness = new Schema({
    workout_date: {
        type: Date,
    },
    workout_number: {
        type: Number
    },
    workout_exercises: {
        type: {}
    }
});
module.exports = mongoose.model('Fitness', Fitness);

// typical workout_exercise:
// {
//     pullups: [null, [10, 10, 10]],
//     bench_press: [100, [10, 10, 10]]
// }
// Object with nested arrays. name is key
// value is an array. First item in array
// is weight, null is used if exercise 
// doesn't use weights. Then an array for
// the work sets. May eventually add another
// way to store metric/imperial.