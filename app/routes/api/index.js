const express = require('express');

const recipeRouter = require('./recipe');
const ingredientRouter = require('./ingredient');
const unitRouter = require('./unit');

const { apiController } = require('../../controllers/api');
const { ApiError } = require('../../helpers/errorHandler');

const router = express.Router();

// On préfixe les routers de l'API
router.all('/', apiController.home); // will return a message saying that route is incomplete
router.use('/recipes', recipeRouter);
router.use('/ingredients', ingredientRouter);
router.use('/units', unitRouter);

router.use(() => {
    throw new ApiError(404, 'API Route not found');
});

module.exports = router;
