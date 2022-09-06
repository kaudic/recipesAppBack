const Joi = require('joi');

module.exports = Joi.object({
    name: Joi.string().required(),
    mainUnitId: Joi.number().integer().required(),
}).required();
