const client = require('../config/db');
const { ApiError } = require('../helpers/errorHandler');
const { insertQueryGenerator, updateQueryGenerator } = require('../tools/queryGenerator');

/**
 * @typedef {object} Unit
 * @property {number} id - unique pk of the unit
 * @property {string} name - full name of the unit (ex: "LITER")
 * @property {string} shortName - short name if the unit (ex: "L")
 */

module.exports = {
    /**
     * Get all units without filtering nor ordering
     * @returns {Unit[]} - Every units from Database
     */
    async findAll() {
        const result = await client.query('SELECT * FROM unit');
        return result.rows;
    },

    /**
     * Get a unit by using its id
     * @param {number} unitId - id of required unit
     * @returns {(Unit|undefined)} -
     * Unit searched or undefined if no unit found using the provided id
     */
    async findByPk(unitId) {
        const result = await client.query('SELECT * FROM unit WHERE id = $1', [unitId]);

        if (result.rowCount === 0) {
            return undefined;
        }

        return result.rows[0];
    },

    /**
 * @typedef {object} InputUnit
 * @property {string} name - name of the unit (ex: "LITER")
 * @property {string} shorName - short name for the unit (ex: "L")
 */

    /**
     * Insert in database
     * @param {InputUnit} unit - Data required
     * @returns {Unit} - Inserted unit with the generated id
     */
    async insert(unit) {
        const [columns, placeHolders, values] = insertQueryGenerator(unit);
        const savedUnit = await client.query(
            `
                INSERT INTO unit
                ${columns} VALUES
                ${placeHolders} RETURNING *
            `,
            values,
        );

        return savedUnit.rows[0];
    },

    /**
     * Modify in Database (PUT)
     * @param {number} id - id of unit to modify
     * @param {InputUnit} unit - the data to insert in place of previous data
     * @returns {Unit} - The modified unit
     */

    async update({ id, unit }) {
        const [setStatement, values] = updateQueryGenerator(unit);
        const result = await client.query(`UPDATE unit ${setStatement} WHERE id = $1`, [id, ...values]);

        if (result.rowCount === 0) {
            throw new ApiError(400, 'This recipe does not exist');
        }

        return result.rows[0];
    },

    /**
     * Delete from Database
     * @param {number} id - The unit id to delete
     * @returns {boolean} - Result from delete operation
     */
    async delete(id) {
        const result = await client.query('DELETE FROM unit WHERE id = $1', [id]);
        // rowcount equals 1 (truthy) or 0 (falsy) -> casting thuthy/fasly into real boolean
        // On cast le truthy/falsy en vrai booléen
        return !!result.rowCount;
    },

};