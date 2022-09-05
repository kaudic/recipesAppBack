const recipeDataMapper = require('../../models/recipe');
const { ApiError } = require('../../helpers/errorHandler');

module.exports = {
    /**
     * Recipe controller to get all records.
     * ExpressMiddleware signature
     * @param {object} _ Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async getAll(_, res) {
        const recipes = await categoryDataMapper.findAll();
        return res.json(recipes);
    },

    /**
     * Recipe controller to get a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async getOne(req, res) {
        const recipe = await recipeDataMapper.findByPk(req.params.id);

        if (!recipe) {
            throw new ApiError(404, 'Recipe not found');
        }

        return res.json(recipe);
    },

    /**
     * Recipe controller to create a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async create(req, res) {
        const savedRecipe = await recipeDataMapper.insert(req.body);
        return res.json(savedRecipe);
    },

    /**
     * Recipe controller to update a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async update(req, res) {
        const savedRecipe = await recipeDataMapper.update(req.body);
        return res.json(savedRecipe);
    },

    /**
     * Recipe controller to delete a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async delete(req, res) {
        await recipeDataMapper.delete(req.params.id);
        return res.status(204).json();
    },
};
