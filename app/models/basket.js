const client = require('../config/db');
const { ApiError } = require('../helpers/errorHandler');
const { insertQueryGenerator, updateQueryGenerator } = require('../tools/queryGenerator');

/**
 * @typedef {object} Recipe
 * @property {number} id - unique pk of the recipe
 * @property {string} title - title of the recipe
 * @property {string} reference - Where does the recipe come from
 * @property {string} imgName - Name of image
 * @property {string} text - Description of the recipe method
 * @property {number} mealQty - number of meal in this recipe
 * @property {string} cookingTime - interval
 * @property {string} preparationTime - interval
 * @property {number} typeId - id of recipe type ('dessert','hot plate'...)
 * @property {Array<Object>} ingredients - list of ingredients
 */


module.exports = {
    /**
     * Get all recipes added to basket
     * @returns {Recipe[]} - Every recipes from Database
     */
    async findAll() {
        const result = await client.query('SELECT * FROM recipe WHERE basket=true');
        return result.rows;
    },
    /**
     * Delete all recipes from basket
     */
    async deleteAll() {
        const result = await client.query('UPDATE recipe SET basket=false WHERE basket=true');
        return result.rows;
    },
    /**
     * Add one recipe to basket based on recipe Id
     */
    async addOneByPk(recipeId) {
        const result = await client.query('UPDATE recipe SET basket=true WHERE id=$1',
            [recipeId]);
        return result.rows;
    },
    /**
     * Delete one recipe from basket based on recipe Id
     */
    async deleteOneByPk(recipeId) {
        const result = await client.query('UPDATE recipe SET basket=false WHERE id=$1',
            [recipeId]);
        return result.rows;
    },
    /**
     * Count number of recipes in the basket
     */
    async countRecipeInBasket() {
        const result = await client.query('SELECT COUNT(*) FROM recipe WHERE basket=true');
        return result.rows;
    },
    /**
     * Count number of meals in the basket
     */
    async countMealsInBasket() {
        const result = await client.query('SELECT SUM(meal_qty) FROM recipe WHERE basket=true');
        return result.rows;
    },

    /**
     * Get list of ingredients corresponding to the recipes in basket
     */
    async getIngredientsList() {
        const list = await client.query(
            `
                SELECT ingredient.*, sum(recipe_ingredient.qty),unit.name  FROM recipe
                LEFT JOIN recipe_ingredient 
                ON recipe.id = recipe_ingredient.recipe_id
                LEFT JOIN ingredient 
                ON recipe_ingredient.ingredient_id = ingredient.id
                LEFT JOIN unit
                ON recipe_ingredient.unit_id = unit.id
                GROUP BY recipe.basket, ingredient.id, recipe_ingredient.unit_id, unit.name
                HAVING recipe.basket=true
            `
        )
        return list.rows;
    }




};
