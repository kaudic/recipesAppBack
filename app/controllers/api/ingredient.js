const ingredientDataMapper = require('../../models/ingredient');
const { ApiError } = require('../../helpers/errorHandler');

module.exports = {
    /**
     * Ingredient controller to get all records.
     * ExpressMiddleware signature
     * @param {object} _ Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async getAll(_, res) {
        const ingredients = await ingredientDataMapper.findAll();
        return res.json(ingredients);
    },

    /**
     * Ingredient controller to get a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async getOne(req, res) {
        const ingredient = await ingredientDataMapper.findByPk(req.params.id);

        if (!ingredient) {
            throw new ApiError(404, 'Ingredient not found');
        }

        return res.json(ingredient);
    },

    /**
     * Ingredient controller to create a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async create(req, res) {
        const savedIngredient = await ingredientDataMapper.insert(req.body);
        return res.json(savedIngredient);
    },

    /**
     * Ingredient controller to update a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async update(req, res) {
        const savedIngredient = await ingredientDataMapper.update(req.body);
        return res.json(savedIngredient);
    },

    /**
     * Ingredient controller to delete a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async delete(req, res) {
        await ingredientDataMapper.delete(req.params.id);
        return res.status(204).json();
    },

};