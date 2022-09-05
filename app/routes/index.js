// importation des modules pour le router
const express = require('express');
const router = express.Router();
const { errorHandler } = require('../helpers/errorHandler');

// Imports of the main router
const apiRouter = require('./api/recipe');

// Call the different routers
router.use('/api', apiRouter);

router.use((err, _, response, next) => {
    errorHandler(err, response, next);
});


module.exports = router;