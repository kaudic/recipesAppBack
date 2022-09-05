const express = require('express');

const validate = require('../../validation/validator');
const schemaCreate = require('../../validation/schemas/recipeCreateSchema');
const schemaUpdate = require('../../validation/schemas/recipeUpdateSchema');

const { recipeController: controller } = require('../../controllers/api');
const controllerHandler = require('../../helpers/controllerHandler');

const router = express.Router();

router
    .route('/')
    /**
     * GET /api/recipes
     * @summary Get all recipes with linked tables such as ingredients and units
     * @tags Recipe
     * @return {[Recipe]} 200 - success response - application/json
     */
    .get(controllerHandler(controller.getAll))
    /**
     * POST /api/recipes
     * @summary Create a new recipe
     * @tags Recipe
     * @param {InputRecipe} request.body.required - category info
     * @return {Recipe} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     */
    .post(validate('body', schemaCreate), controllerHandler(controller.create));

router
    .route('/:id(\\d+)')
    /**
     * GET /api/recipes/{id}
     * @summary Get one recipe
     * @tags Recipe
     * @param {number} id.path.required - recipe identifier
     * @return {Recipe} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Category not found - application/json
     */
    .get(controllerHandler(controller.getOne))
    /**
     * PUT /api/recipes/{id}
     * @summary Update one recipe
     * @tags Recipe
     * @param {number} id.path.required - recipe identifier
     * @param {InputRecipe} request.body.required - recipe info
     * @return {Recipe} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Category not found - application/json
     */
    .put(validate('body', schemaUpdate), controllerHandler(controller.update))
    /**
     * DELETE /api/recipes/{id}
     * @summary Delete one recipe
     * @tags Recipe
     * @param {number} id.path.required - recipe identifier
     * @return {Category} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Recipe not found - application/json
     */
    .delete(controllerHandler(controller.delete));


module.exports = router;