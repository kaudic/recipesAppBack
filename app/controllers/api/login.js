const loginDataMapper = require('../../models/login');
const { ApiError } = require('../../helpers/errorHandler');
const PasswordService = require('../../helpers/password');
const TokenService = require('../../helpers/token');

module.exports = {

  async login(req, res) {
    const { login, password } = req.body;

    const user = await loginDataMapper.findOneByLogin(login);

    if (!user) return res.status(400).json('credentials are not correct');

    // compare clear Password with the one in DB
    const passwordService = new PasswordService();
    const isPasswordCorrect = await passwordService.check(password, user.password);

    if (!isPasswordCorrect) {
      return res.status(400).json('credentials are not correct');
    }

    // generate token
    const tokenService = new TokenService();
    const token = tokenService.generate(user.id, user.role);
    return res.json({ ...user, token });
  },


};
