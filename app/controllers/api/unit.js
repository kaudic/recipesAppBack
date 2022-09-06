const unitDataMapper = require('../../models/unit');
const { ApiError } = require('../../helpers/errorHandler');

module.exports = {
    /**
     * Unit controller to get all records.
     * ExpressMiddleware signature
     * @param {object} _ Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async getAll(_, res) {
        const units = await unitDataMapper.findAll();
        return res.json(units);
    },

    /**
     * Unit controller to get a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async getOne(req, res) {
        const unit = await unitDataMapper.findByPk(req.params.id);

        if (!unit) {
            throw new ApiError(404, 'Unit not found');
        }

        return res.json(unit);
    },

    /**
     * Unit controller to create a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async create(req, res) {
        const savedUnit = await unitDataMapper.insert(req.body);
        return res.json(savedUnit);
    },

    /**
     * Unit controller to update a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async update(req, res) {
        const savedUnit = await unitDataMapper.update(req.body);
        return res.json(savedUnit);
    },

    /**
     * Unit controller to delete a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async delete(req, res) {
        await unitDataMapper.delete(req.params.id);
        return res.status(204).json();
    },

};