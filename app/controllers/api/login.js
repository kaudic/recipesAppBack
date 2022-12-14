const loginDataMapper = require('../../models/login');
const { ApiError } = require('../../helpers/errorHandler');

module.exports = {

  async login(req, res) {
    const { login, password } = req.body;
    console.log(login, password);
    // const recipes = await recipeDataMapper.findAll();
    return res.status(400).json('credentials well received');
  },


};
