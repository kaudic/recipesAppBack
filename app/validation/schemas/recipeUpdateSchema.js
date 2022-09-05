const Joi = require('joi');
const recipeCreateSchema = require('./recipeCreateSchema');

const recipeUpdateSchema = Joi.object({
    id: Joi.number().integer().required,
    recipe: recipeCreateSchema.required
});

module.exports = recipeUpdateSchema;
