const express = require('express');

const validate = require('../../validation/validator');
const schemaCreate = require('../../validation/schemas/unitCreateSchema');
const schemaUpdate = require('../../validation/schemas/unitUpdateSchema');

const { unitController: controller } = require('../../controllers/api');
const controllerHandler = require('../../helpers/controllerHandler');

const router = express.Router();

router
    .route('/')
    /**
     * GET /api/units
     * @summary Get all units
     * @tags Unit
     * @return {[Unit]} 200 - success response - application/json
     */
    .get(controllerHandler(controller.getAll))
    /**
     * POST /api/units
     * @summary Create a new unit
     * @tags Unit
     * @param {InputUnit} request.body.required - unit info
     * @return {Unit} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     */
    .post(validate('body', schemaCreate), controllerHandler(controller.create))
    /**
     * PUT /api/units/{id}
     * @summary Update one unit
     * @tags Unit
     * @param {number} id.path.required - unit identifier
     * @param {InputUnit} request.body.required - unit info
     * @return {Unit} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Unit not found - application/json
     */
    .put(validate('body', schemaUpdate), controllerHandler(controller.update));

router
    .route('/:id(\\d+)')
    /**
     * GET /api/units/{id}
     * @summary Get one unit
     * @tags Unit
     * @param {number} id.path.required - unit identifier
     * @return {Unit} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Unit not found - application/json
     */
    .get(controllerHandler(controller.getOne))
    /**
     * DELETE /api/units/{id}
     * @summary Delete one unit
     * @tags Unit
     * @param {number} id.path.required - unit identifier
     * @return {Unit} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Ingredient not found - application/json
     */
    .delete(controllerHandler(controller.delete));

module.exports = router;