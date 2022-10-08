const express = require('express');
const app = express();
require('dotenv').config();
require('./config/connect').connect();
app.use(express.json())

const appRoutes = require('./controller/routes');
app.use('/api',appRoutes);

app.listen(process.env.PORT,() => {
    console.log(`Connected sucessfully on port ${process.env.PORT}`);
});
