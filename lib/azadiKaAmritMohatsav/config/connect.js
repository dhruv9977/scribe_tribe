const mongoose = require('mongoose');

exports.connect = () => {
    console.log("Hello")
    mongoose.connect(process.env.MONGO_URL).then(() => {
        console.log("Connected successfully");
    }).catch((err) => {
        console.log(err);
        process.exit();
    });
}

