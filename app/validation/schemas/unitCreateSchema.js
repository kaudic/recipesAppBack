const Joi = require('joi');

module.exports = Joi.object({
    name: Joi.string().required(),
    shortName: Joi.string().required(),
}).required();
