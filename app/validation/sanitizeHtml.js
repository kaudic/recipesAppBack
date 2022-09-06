const sanitizeHtml = require('sanitize-html');

const sanitizeBody = () => {
    return (req, res, next) => {
        console.log('sanitizing body');
        for (const key in req.body) {
            req.body[key] = sanitizeHtml(req.body);
        };
        next();
    }
};

module.exports = sanitizeBody;