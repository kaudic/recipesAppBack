const client = require('../config/db');
const { ApiError } = require('../helpers/errorHandler');
const { insertQueryGenerator, updateQueryGenerator } = require('../tools/queryGenerator');

/**
 * @typedef {object} Ingredient
 * @property {number} id - unique pk of the ingredient
 * @property {string} name - name of the ingredient
 * @property {string} mainUnitId - the default unit id
 */

module.exports = {
    /**
     * Get all ingredients without filtering nor ordering
     * @returns {Ingredient[]} - Every ingredients from Database
     */
    async findAll() {
        const result = await client.query('SELECT * FROM ingredient ORDER BY name ASC');
        return result.rows;
    },

    /**
     * Get an ingredient by using its id
     * @param {number} ingredientId - id of required ingredient
     * @returns {(Ingredient|undefined)} -
     * Ingredient searched or undefined if no ingredient found using the provided id
     */
    async findByPk(ingredientId) {
        const result = await client.query('SELECT * FROM ingredient WHERE id = $1', [ingredientId]);

        if (result.rowCount === 0) {
            return undefined;
        }

        return result.rows[0];
    },

    /**
 * @typedef {object} InputIngredient
 * @property {string} name - name of the ingredient
 * @property {number} mainUnitId - id of main unit for this ingredient (ex: centiliter for milk)
 */

    /**
     * Insert in database
     * @param {InputIngredient} ingredient - Data required
     * @returns {Ingredient} - Inserted ingredient with the generated id
     */
    async insert(ingredient) {
        const [columns, placeHolders, values] = insertQueryGenerator(ingredient);
        const savedIngredient = await client.query(
            `
                INSERT INTO ingredient
                ${columns} VALUES
                ${placeHolders} RETURNING *
            `,
            values,
        );

        return savedIngredient.rows[0];
    },

    /**
     * Modify in Database (PUT)
     * @param {number} id - id of Ingredient to modify
     * @param {InputIngredient} ingredient - the data to insert in place of previous data
     * @returns {Ingredient} - The modified ingredient
     */

    async update({ id, ingredient }) {
        const [setStatement, values] = updateQueryGenerator(ingredient);
        const result = await client.query(`UPDATE ingredient ${setStatement} WHERE id = $1 RETURNING *`, [id, ...values]);

        if (result.rowCount === 0) {
            throw new ApiError(400, 'This recipe does not exist');
        }

        return result.rows[0];
    },

    /**
     * Delete from Database
     * @param {number} id - The ingredient id to delete
     * @returns {boolean} - Result from delete operation
     */
    async delete(id) {
        const result = await client.query('DELETE FROM ingredient WHERE id = $1', [id]);
        // rowcount equals 1 (truthy) or 0 (falsy) -> casting thuthy/fasly into real boolean
        // On cast le truthy/falsy en vrai booléen
        return !!result.rowCount;
    },

};