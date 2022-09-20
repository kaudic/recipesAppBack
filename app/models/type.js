const client = require('../config/db');
const { ApiError } = require('../helpers/errorHandler');
const { insertQueryGenerator, updateQueryGenerator } = require('../tools/queryGenerator');

/**
 * @typedef {object} Type
 * @property {number} id - unique pk of the unit
 * @property {string} name - full name of the unit (ex: "LITER")
 */

module.exports = {
    /**
     * Get all types without filtering nor ordering
     * @returns {Unit[]} - Every types from Database
     */
    async findAll() {
        const result = await client.query('SELECT * FROM type');
        return result.rows;
    },

    /**
     * Get a type by using its id
     * @param {number} typeId - id of required type
     * @returns {(Type|undefined)} -
     * Type searched or undefined if no type found using the provided id
     */
    async findByPk(typeId) {
        const result = await client.query('SELECT * FROM type WHERE id = $1', [typeId]);

        if (result.rowCount === 0) {
            return undefined;
        }

        return result.rows[0];
    },

    /**
 * @typedef {object} InputType
 * @property {string} name - name of the type (ex: "POISSON")
 */

    /**
     * Insert in database
     * @param {InputType} type - Data required
     * @returns {Type} - Inserted type with the generated id
     */
    async insert(type) {
        const [columns, placeHolders, values] = insertQueryGenerator(type);
        const savedType = await client.query(
            `
                INSERT INTO type
                ${columns} VALUES
                ${placeHolders} RETURNING *
            `,
            values,
        );

        return savedType.rows[0];
    },

    /**
     * Modify in Database (PUT)
     * @param {number} id - id of type to modify
     * @param {InputType} type - the data to insert in place of previous data
     * @returns {Type} - The modified type
     */

    async update({ id, type }) {
        const [setStatement, values] = updateQueryGenerator(type);
        const result = await client.query(`UPDATE type ${setStatement} WHERE id = $1 RETURNING *`, [id, ...values]);

        if (result.rowCount === 0) {
            throw new ApiError(400, 'This type does not exist');
        }

        return result.rows[0];
    },

    /**
     * Delete from Database
     * @param {number} id - The type id to delete
     * @returns {boolean} - Result from delete operation
     */
    async delete(id) {
        const result = await client.query('DELETE FROM type WHERE id = $1', [id]);
        // rowcount equals 1 (truthy) or 0 (falsy) -> casting thuthy/fasly into real boolean
        // On cast le truthy/falsy en vrai booléen
        return !!result.rowCount;
    },

};