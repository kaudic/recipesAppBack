const express = require('express');

// const sanitizeBody = require('../../validation/sanitizeHtml'); => caused me problem making a formData ?!

const { basketController: controller } = require('../../controllers/api');
const controllerHandler = require('../../helpers/controllerHandler');

const router = express.Router();

router.use('/', (req, res, next) => {
    console.log('I am in the basket router');
    next();
});

router
    .route('/')
    /**
     * GET /api/basket - get all recipes in basket + counts 
     */
    .get(controllerHandler(controller.getAll))
    /**
     * DELETE /api/basket - delete all recipes from baskets 
     */
    .delete(controllerHandler(controller.deleteAll));

router
    .route('/:id(\\d+)')
    /**
     * GET /api/basket/id - add a recipe to the basket
     */
    .get(controllerHandler(controller.addOneRecipeByPk))
    /**
     * DELETE /api/basket/id - delete one recipe from the basket 
     */
    .delete(controllerHandler(controller.deleteOneRecipeByPk));

/**
 * GET all ingredients necessary for the recipes in the basket
 */
router
    .route('/ingredients')
    .get(controllerHandler(controller.getIngredientsList))


module.exports = router;