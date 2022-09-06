const Joi = require('joi');
const unitCreateSchema = require('./unitCreateSchema');

const unitUpdateSchema = Joi.object({
    id: Joi.number().integer().required,
    unit: unitCreateSchema.required
});

module.exports = unitUpdateSchema;
