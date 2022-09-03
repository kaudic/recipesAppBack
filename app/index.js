const express = require('express');
const cors = require('cors');
const router = require('./routes');
const app = express();

// Dynamic Cors
const allowlist = ['http://localhost:3000'];

var corsOptionsDelegate = function (req, callback) {

    const corsOptions = {
        methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS', 'UPDATE'],
        credentials: true,
    };

    if (allowlist.indexOf(req.header('Origin')) !== -1) {
        corsOptions.origin = true;
    } else {
        corsOptions.origin = false;
    };
    callback(null, corsOptions)
};

console.log('test à la plage et à chateau gont');

app.use(
    cors(corsOptionsDelegate),
);

app.use(router);

module.exports = app;