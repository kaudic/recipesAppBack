const basketDataMapper = require('../../models/basket');
const recipeIngredientDataMapper = require('../../models/recipeIngredient');
const { ApiError } = require('../../helpers/errorHandler');

module.exports = {
    /**
     * get all recipes in the basket + number of meals and number of recipes
     */
    async getAll(_, res) {
        const recipes = await basketDataMapper.findAll();
        const recipesCount = await basketDataMapper.countRecipeInBasket();
        const mealsCount = await basketDataMapper.countMealsInBasket();
        return res.json({
            recipes,
            recipesCount,
            mealsCount,
        });
    },
    /**
     * delete all recipes in the basket.
     */
    async deleteAll(_, res) {
        const recipes = await basketDataMapper.deleteAll();
        return res.json(recipes);
    },
    /**
     * Add one recipe in the basket.
     */
    async addOneRecipeByPk(req, res) {
        const { id: recipeId } = req.params;
        const recipes = await basketDataMapper.addOneByPk(recipeId);
        return res.json(recipes);
    },
    /**
     * Delete one recipe in the basket.
     */
    async deleteOneRecipeByPk(req, res) {
        const { id: recipeId } = req.params;
        const recipes = await basketDataMapper.deleteOneByPk(recipeId);
        return res.json(recipes);
    },

};