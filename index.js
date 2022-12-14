// importation des différents package
const https = require('https');
const http = require('http');
require('dotenv').config();
const fs = require('fs');
const app = require('./app');
const port = process.env.PORT ?? 3001;

let server;

if (process.env.NODE_ENV === 'production') {
    // Certificate
    const privateKey = fs.readFileSync('/etc/letsencrypt/live/www.planitools.com/privkey.pem', 'utf8');
    const certificate = fs.readFileSync('/etc/letsencrypt/live/www.planitools.com/cert.pem', 'utf8');
    const ca = fs.readFileSync('/etc/letsencrypt/live/www.planitools.com/chain.pem', 'utf8');


    const credentials = {
        key: privateKey,
        cert: certificate,
        ca: ca
    };

    server = https.createServer(credentials, app);

} else {
    server = http.createServer(app);

}

// app listenning to port
server.listen(port, () => {
    console.log(`Listening on ${port}`);
});