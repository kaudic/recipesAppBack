const typeDataMapper = require('../../models/type');
const { ApiError } = require('../../helpers/errorHandler');

module.exports = {
    /**
     * Type controller to get all records.
     * ExpressMiddleware signature
     * @param {object} _ Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async getAll(_, res) {
        const types = await typeDataMapper.findAll();
        return res.json(types);
    },

    /**
     * Type controller to get a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async getOne(req, res) {
        const type = await typeDataMapper.findByPk(req.params.id);

        if (!type) {
            throw new ApiError(404, 'Type not found');
        }

        return res.json(type);
    },

    /**
     * Type controller to create a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async create(req, res) {
        const savedType = await typeDataMapper.insert(req.body);
        return res.json(savedType);
    },

    /**
     * Type controller to update a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async update(req, res) {
        const savedType = await typeDataMapper.update(req.body);
        return res.json(savedType);
    },

    /**
     * Type controller to delete a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async delete(req, res) {
        await typeDataMapper.delete(req.params.id);
        return res.status(204).json();
    },

};