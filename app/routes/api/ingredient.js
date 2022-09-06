const express = require('express');

const validate = require('../../validation/validator');
const schemaCreate = require('../../validation/schemas/ingredientCreateSchema');
const schemaUpdate = require('../../validation/schemas/ingredientUpdateSchema');

const { ingredientController: controller } = require('../../controllers/api');
const controllerHandler = require('../../helpers/controllerHandler');

const router = express.Router();

router
    .route('/')
    /**
     * GET /api/ingredients
     * @summary Get all ingredients
     * @tags Ingredient
     * @return {[Ingredient]} 200 - success response - application/json
     */
    .get(controllerHandler(controller.getAll))
    /**
     * POST /api/ingredients
     * @summary Create a new ingredient
     * @tags Ingredient
     * @param {InputIngredient} request.body.required - ingredient info
     * @return {Ingredient} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     */
    .post(validate('body', schemaCreate), controllerHandler(controller.create))
    /**
     * PUT /api/ingredients/{id}
     * @summary Update one ingredient
     * @tags Ingredient
     * @param {number} id.path.required - ingredient identifier
     * @param {InputIngredient} request.body.required - ingredient info
     * @return {Ingredient} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Ingredient not found - application/json
     */
    .put(validate('body', schemaUpdate), controllerHandler(controller.update));

router
    .route('/:id(\\d+)')
    /**
     * GET /api/ingredients/{id}
     * @summary Get one ingredient
     * @tags Ingredient
     * @param {number} id.path.required - ingredient identifier
     * @return {Ingredient} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Ingredient not found - application/json
     */
    .get(controllerHandler(controller.getOne))

    /**
     * DELETE /api/ingredients/{id}
     * @summary Delete one ingredient
     * @tags Ingredient
     * @param {number} id.path.required - ingredient identifier
     * @return {Ingredient} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Ingredient not found - application/json
     */
    .delete(controllerHandler(controller.delete));

module.exports = router;