const client = require('../config/db');
const { ApiError } = require('../helpers/errorHandler');
const { insertQueryGenerator, updateQueryGenerator } = require('../tools/queryGenerator');

module.exports = {
    /**
     * Get all ingredients for a given recipe Id - bridge table recipe_ingredient
     */
    async findByPk(recipeId) {
        const result = await client.query('SELECT * FROM recipe_ingredient WHERE recipe_id = $1', [recipeId]);

        if (result.rowCount === 0) {
            return undefined;
        }

        return result.rows[0];
    },

    /**
     * Insert in jump table the links between recipe/ingredient/unit with a quantity
     */
    async insert(recipeIngredientUnitLink) {
        const [columns, placeHolders, values] = insertQueryGenerator(recipeIngredientUnitLink);
        const savedRecipeIngredientUnitLink = await client.query(
            `
                INSERT INTO recipe_ingredient
                ${columns} VALUES
                ${placeHolders} RETURNING *
            `,
            values,
        );

        return savedRecipeIngredientUnitLink.rows[0];
    },

    /**
     * Modify in jump table the unit or quantity for a given link (link is recipeId and IngredientId)
     */

    async update({ recipeid, ingredientId, recipeIngredientUnitAndQty }) {
        const [setStatement, values] = updateQueryGenerator(recipeIngredientUnitAndQty, { countStarter: 3 });
        const result = await client.query(`UPDATE recipe_ingredient ${setStatement} WHERE recipe_id = $1 AND ingredient_id=$2`, [recipeId, ingredientId, ...values]);

        if (result.rowCount === 0) {
            throw new ApiError(400, 'This recipe does not exist');
        }

        return result.rows[0];
    },

    /**
     * Delete one row in jump table between recipeId and IngredientId
     */
    async delete(recipeId, ingredientId) {
        const result = await client.query('DELETE FROM recipe_ingredient WHERE recipe_id = $1 AND ingredient_id=$2', [recipeId, ingredientId]);
        // rowcount equals 1 (truthy) or 0 (falsy) -> casting thuthy/fasly into real boolean
        // On cast le truthy/falsy en vrai booléen
        return !!result.rowCount;
    },

};