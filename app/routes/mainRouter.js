// imports modules for Router
const express = require('express');
const router = express.Router();
const upLoadImages = require('../middlewares/uploadImages');
const controller = require('../controllers');
const handler = require('../helpers/controllerHandler');
const path = require('path');

// to create body in application/json request object
router.use(express.json());

// Route for welcoming page - controling token first
router.get('/', handler(controller.renderHomePage));

// Upload Routes
// router.post('/upload', upLoadImages(), handler(controller.renderUploadPage));

// Catch the error created by controller Handler
router.use((controller.error));

module.exports = router;