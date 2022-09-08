const sanitizeHtml = require('sanitize-html');

const sanitizeBody = () => {
    return (req, res, next) => {
        for (const key in req.body) {
            req.body[key] = sanitizeHtml(req.body);
        };
        next();
    }
};

module.exports = sanitizeBody;