const Joi = require('joi');
const regexpForTimeInterval = `/^([0-1]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$/`;

module.exports = Joi.object({
    title: Joi.string().required(),
    reference: Joi.string().required(),
    imgName: Joi.string().required(),
    text: Joi.string(),
    mealQty: Joi.number().required(),
    cookingTime: Joi.string().pattern(regexpForTimeInterval).required(),
    preparationTime: Joi.string().pattern(regexpForTimeInterval).required(),
    typeId: Joi.string().required(),
    ingredients: Joi.array().items(Joi.object({
        id: Joi.number().integer().required(),
        unitId: Joi.number().integer().required(),
        qty: Joi.number().required(),
    })).required()
}).required();
