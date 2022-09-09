const express = require('express');
const cors = require('cors');
const router = require('./routes');
const app = express();
const corsOptionsSetUp = require('./tools/corsOptionsSetUp');
const path = require('path');

// Dynamic Cors
app.use(cors(corsOptionsSetUp));

// parsing payload JSON & urlencoded
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// defining a static directory that will contain recipes images
const pathToLog = path.normalize(`${__dirname}/../public`);
console.log(pathToLog);
app.use(express.static(pathToLog));

// routing
app.use(router);

module.exports = app;