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
     * Get all without filtering nor ordering
     * @returns {Recipe[]} - Every recipes from Database
     */
    async findAll() {
        // select from a view created in sqitch file
        const result = await client.query('SELECT * FROM detailed_recipe');
        return result.rows;
    },

    /**
     * Get a recipe by using its id
     * @param {number} recipeId - id of required recipe
     * @returns {(Recipe|undefined)} -
     * Reciped searched or undefined if no recipe found using the provided id
     */
    async findByPk(recipeId) {

        const result = await client.query('SELECT * FROM detailed_recipe WHERE id = $1', [recipeId]);

        if (result.rowCount === 0) {
            return undefined;
        }

        return result.rows[0];
    },

    /**
 * @typedef {object} InputRecipe
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

    /**
     * Insert in database
     * @param {InputRecipe} recipe - Data required
     * @returns {Recipe} - Inserted recipe with the generated id
     */
    async insert(recipe) {
        const [columns, placeHolders, values] = insertQueryGenerator(recipe);
        const savedRecipe = await client.query(
            `
                INSERT INTO recipe
                ${columns} VALUES
                ${placeHolders} RETURNING *
            `,
            values,
        );

        return savedRecipe.rows[0];
    },

    /**
     * Modify in Database (PUT)
     * @param {number} id - id of Recipe to modify
     * @param {InputRecipe} recipe - the data to insert in place of previous data
     * @returns {Recipe} - The modified recipe
     */

    async update(id, recipe) {
        const [setStatement, values] = updateQueryGenerator(recipe);
        const result = await client.query(`UPDATE recipe ${setStatement} WHERE id = $1`, [id, ...values]);

        if (result.rowCount === 0) {
            throw new ApiError(400, 'This recipe does not exist');
        }

        return result.rows[0];
    },

    /**
     * Delete from Database
     * @param {number} id - The recipe id to delete
     * @returns {boolean} - Le résultat de la suppression
     */
    async delete(id) {
        const result = await client.query('DELETE FROM recipe WHERE id = $1', [id]);
        // rowcount equals 1 (truthy) or 0 (falsy) -> casting thuthy/fasly into real boolean
        // On cast le truthy/falsy en vrai booléen
        return !!result.rowCount;
    },

    /**
     * Get Recipes containing a word
     * @param {string} string - The word or string we are looking for (could be an ingredient)
     * @returns {(array<Recipe>|undefined)} -
     * All found recipes or undefined if no recipes matching this string
     */
    async findAllByString(string) {
        const result = await client.query(
            `
        SELECT * FROM detailed_recipe WHERE
        LOWER(ingredients::text) like LOWER('%$1%') 
        or LOWER(reference) like LOWER('%$1%')
        or LOWER(title) like LOWER('%$1%')
        or LOWER(text) like LOWER('%$1%')
        `, [string]);


        if (result.rowCount === 0) {
            return undefined;
        }

        return result.rows;
    },

    /**
 * Modify in Database the name of the image for the recipe (PUT)
 * @param {number} id - id of Recipe to modify
 * @param {InputRecipe} recipe - the data to insert in place of previous data
 * @returns {Recipe} - The modified recipe
 */

    async updateImgName(id, imgName) {
        const result = await client.query(`UPDATE recipe SET img_name=$2 WHERE id = $1 RETURNING *`, [id, imgName]);

        if (result.rowCount === 0) {
            throw new ApiError(400, 'This recipe does not exist');
        }

        console.log('datamapper: ' + result.rows[0]);

        return result.rows[0];
    },
};
