const corsOptionsSetUp = function (req, callback) {
    const allowlist = ['http://localhost:3000', 'http://localhost:3002', 'http://audicserver.ddns.net:3000'];

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

module.exports = corsOptionsSetUp;