const recipeController = require('./recipe');
const ingredientController = require('./ingredient');
const unitController = require('./unit');
const typeController = require('./type');
const basketController = require('./basket');

const apiController = {
    /**
     * Default API controller to show documention url.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    home(req, res) {
        return res.json({
            message: `La route est incomplète, il manque /recipes ou /ingredients ou /units`,
        });
    },
};

module.exports = { apiController, recipeController, ingredientController, unitController, typeController, basketController };