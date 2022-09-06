const Joi = require('joi');
const ingredientCreateSchema = require('./ingredientCreateSchema');

const ingredientUpdateSchema = Joi.object({
    id: Joi.number().integer().required,
    ingredient: ingredientCreateSchema.required
});

module.exports = ingredientUpdateSchema;
