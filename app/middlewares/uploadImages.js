const multer = require('multer');
const path = require('path');
const fs = require('fs');

// function to return the path to the images folder in the audicServer
const returnImagesFolderPath = () => {
    const pathToImagesFolder = path.normalize(`${__dirname}/../../public/images`);
    console.log('Files will be downloaded to this path: ' + pathToImagesFolder);
    return pathToImagesFolder;
}

// middleware's factory -> return a middleware function
const upLoadImage = (file) => {

    const storage = multer.diskStorage({
        destination: returnImagesFolderPath(),

        filename: (req, file, callback) => {
            console.log('originalname: ' + file.originalname);
            const randomNumber = Math.floor(Math.random() * 1000);
            const newFileName = file.originalname.split('.')[0] + randomNumber + '.' + file.originalname.split('.')[1];
            callback(null, newFileName);
        }

    });

    const fileFilter = (req, file, callback) => {

        const extension = file.originalname.split('.')[1];
        const extensionAccepted = ['jpg', 'JPG', 'jpeg', 'JPEG', 'png', 'PNG'];

        if (extensionAccepted.indexOf(extension) === -1) {

            console.log(`extension ${extension} n'est pas autorisée.`)
            callback(null, false);
        }
        else {
            console.log('Autorisation de Multer pour le fichier: ' + file.originalname);
            callback(null, true);
        }
    };

    return multer({ storage: storage, fileFilter: fileFilter }).single('imgFile');

}

module.exports = upLoadImage;