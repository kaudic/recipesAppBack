const express = require('express');

const { loginController: controller } = require('../../controllers/api');
const controllerHandler = require('../../helpers/controllerHandler');

const router = express.Router();

router
  .route('/')
  .post(controllerHandler(controller.login));


module.exports = router;