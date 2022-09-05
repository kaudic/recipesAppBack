const express = require('express');
const cors = require('cors');
const router = require('./routes');
const app = express();
const corsOptionsSetUp = require('./tools/corsOptionsSetUp');

// Dynamic Cors
app.use(cors(corsOptionsSetUp));

// parsing payload JSON & urlencoded
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// routing
app.use(router);

module.exports = app;