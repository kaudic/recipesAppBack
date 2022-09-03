// importation des modules pour le router
const express = require('express');
const router = express.Router();

// Imports of the main router
const mainRouter = require('./mainRouter');

// Call the different routers
router.use('/', mainRouter);

module.exports = router;