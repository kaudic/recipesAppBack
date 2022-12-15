const express = require('express');
const authorization = require('../../middlewares/authorization');
const { typeController: controller } = require('../../controllers/api');
const controllerHandler = require('../../helpers/controllerHandler');

const router = express.Router();

router
    .route('/')
    /**
     * GET /api/types
     * @summary Get all types
     * @tags Type
     * @return {[Unit]} 200 - success response - application/json
     */
    .get(controllerHandler(controller.getAll))
    /**
     * POST /api/types
     * @summary Create a new type
     * @tags Type
     * @param {typeUnit} request.body.required - type info
     * @return {Type} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     */
    .post(authorization, controllerHandler(controller.create))
    /**
     * PUT /api/types
     * @summary Update one unit
     * @tags Unit
    * @param {typeUnit} request.body.required - type info
     * @return {Type} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Type not found - application/json
     */
    .put(authorization, controllerHandler(controller.update));

router
    .route('/:id(\\d+)')
    /**
     * GET /api/types/{id}
     * @summary Get one Type
     * @tags Type
     * @param {number} id.path.required - type identifier
     * @return {Type} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Unit not found - application/json
     */
    .get(controllerHandler(controller.getOne))
    /**
     * DELETE /api/types/{id}
     * @summary Delete one type
     * @tags Type
     * @param {number} id.path.required - type identifier
     * @return {Type} 200 - success response - application/json
     * @return {ApiError} 400 - Bad request response - application/json
     * @return {ApiError} 404 - Ingredient not found - application/json
     */
    .delete(authorization, controllerHandler(controller.delete));

module.exports = router;