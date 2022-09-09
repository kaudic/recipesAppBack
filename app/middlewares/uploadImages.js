const multer = require('multer');
const path = require('path');
const fs = require('fs');

// function to return the path to the images folder in the audicServer
const returnImagesFolderPath = () => {
    const pathToImagesFolder = path.normalize(`${__dirname}/../../public/images`);
    return pathToImagesFolder;
}

// middleware's factory -> return a middleware function
const upLoadImage = (file) => {

    const storage = multer.diskStorage({
        destination: returnImagesFolderPath(),

        filename: (req, file, callback) => {
            const newFileName = file.originalname.split('.')[0].toLowerCase() + '.' + file.originalname.split('.')[1].toLowerCase();
            req.body.imgName = newFileName; // giving the controller the file name
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
            callback(null, true);
        }
    };

    return multer({ storage: storage, fileFilter: fileFilter }).single('imgFile');

}

module.exports = upLoadImage;