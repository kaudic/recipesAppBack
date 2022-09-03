const controller = {
    renderHomePage (req,res) {
        res.send(`Bienvenue sur l'API`);
    },
    error (err, req, res, _next) {

        console.log('errorController! :' + err.message);
        console.log(err);

        res.json({
            result: false,
            message: err.message
        });
    },
}

module.exports = controller;