const recipeDataMapper = require('../../models/recipe');
const recipeIngredientDataMapper = require('../../models/recipeIngredient');
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
        const recipes = await recipeDataMapper.findAll();
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
        const { ingredients } = req.body;
        delete req.body.ingredients;

        // create recipe in the recipe Table
        const savedRecipe = await recipeDataMapper.insert(req.body);

        // create the links between recipe and ingredients in the jump table recipe_ingredient
        const queries = [];
        const recipeId = savedRecipe.id;
        ingredients.forEach(({ id: ingredientId, qty, unitId }) => {
            queries.push(
                recipeIngredientDataMapper.insert({
                    recipeId,
                    ingredientId,
                    qty,
                    unitId
                })
            )
        })
        await Promise.all(queries);

        // get from DB the complete recipe from view detailed_recipe
        const newRecipe = await recipeDataMapper.findByPk(recipeId);
        return res.json(newRecipe);
    },

    /**
     * Recipe controller to update a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async update(req, res) {
        const { id: recipeId, ingredients } = req.body;
        delete req.body.id;
        delete req.body.ingredients;

        // update recipe from main table recipe
        await recipeDataMapper.update(recipeId, req.body);

        // update the links between recipes and ingredients in a jump table
        const recipeIngredientLinks = await recipeIngredientDataMapper.findAll(recipeId);
        const queries = [];

        // first: get all current links in the table and then iterate through current provided links to create or update
        ingredients.forEach(({ id: ingredientId, qty, unitId }) => {
            const isIngredient = (recipeIngredientLinks.map((x) => x.id)).includes(ingredientId);
            if (isIngredient) {
                queries.push(recipeIngredientDataMapper.update(recipeId, ingredientId, { qty, unitId }))
            } else {
                queries.push(recipeIngredientDataMapper.insert({
                    recipeId,
                    ingredientId,
                    qty,
                    unitId
                }))
            }
        })
        // second: iterate through current links and check if they exist in new provided links
        recipeIngredientLinks.forEach(({ ingredient_id: ingredientId }) => {
            const isIngredient = (ingredients.map(x => x.id)).includes(ingredientId);
            if (!isIngredient) {
                queries.push(recipeIngredientDataMapper.delete(recipeId, ingredientId));
            }
        })

        // execute all the queries (create, update and delete)
        Promise.all([queries]);

        // return complete updated Recipe
        const updatedRecipe = await recipeDataMapper.findByPk(recipeId);
        return res.json(updatedRecipe);

    },

    /**
     * Recipe controller to delete a record.
     * ExpressMiddleware signature
     * @param {object} req Express request object (not used)
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async delete(req, res) {
        // delete recipe from main table recipe And the DELETE CASCADE will delete from jump table
        await recipeDataMapper.delete(req.params.id);
        return res.status(204).json();
    },

    /**
     * Recipe controller to look for records containing a specific string.
     * ExpressMiddleware signature
     * @param {object} req Express request object
     * @param {object} res Express response object
     * @returns {string} Route API JSON response
     */
    async search(req, res) {
        const searchedRecipes = await recipeDataMapper.search(req.body.searchString);
        return res.json(searchedRecipes);
    },
};
