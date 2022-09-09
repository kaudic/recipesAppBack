const express = require('express');
const uploadImage = require('../../middlewares/uploadImages');
const validate = require('../../validation/validator');
const schemaCreate = require('../../validation/schemas/recipeCreateSchema');
const schemaUpdate = require('../../validation/schemas/recipeUpdateSchema');
const sanitizeBody = require('../../validation/sanitizeHtml');

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
     * @return {array<Recipe>} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     */
    .post(validate('body', schemaCreate), controllerHandler(controller.create))
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
    .put(validate('body', schemaUpdate), controllerHandler(controller.update));



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
     * DELETE /api/recipes/{id}
     * @summary Delete one recipe
     * @tags Recipe
     * @param {number} id.path.required - recipe identifier
     * @return {Category} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Recipe not found - application/json
     */
    .delete(controllerHandler(controller.delete));

/**
 * POST /api/recipes/search
 * @summary Look for all recipes containing a string in (title, reference, ingredients or text)
 * @tags Recipe
 * @param {InputSearchString} request.body.required - string to look for
 * @return {array<Recipe>} 200 - success response - application/json
 * @return {ApiError} 400 - Bad request response - application/json
 */
router
    .route('/search')
    .post(sanitizeBody(), controllerHandler(controller.search));

router
    .route('/uploadImage')
    /**
     * PUT /api/recipes/uploadImage
     * @summary Upload the enclosed image file and modify the imgName column in recipe Table
     * @tags Recipe
     * @return {} 204 - empty success response - application/json
     */
    .put(uploadImage(), controllerHandler(controller.modifyImgName));

module.exports = router;