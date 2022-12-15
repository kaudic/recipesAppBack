const jsonwebtoken = require('jsonwebtoken');
require('dotenv').config();

class TokenService {
  jwtSecret;

  jwtVerifyOptions = {
    algorithms: ['HS256'],
  };

  jwtSignOptions = {
    algorithm: 'HS256',
    expiresIn: '3h',
  };

  constructor() {
    this.jwtSecret = process.env.JWTSECRET;
  }

  decode(token) {
    return jsonwebtoken.verify(
      token,
      this.jwtSecret,
      this.jwtVerifyOptions,
    );
  }

  generate(userId, role) {
    const jwtContent = { userId: userId, role: role };
    return jsonwebtoken.sign(jwtContent, this.jwtSecret, this.jwtSignOptions);
  }

  extract(req) {
    return req.headers?.authorization?.split(' ')[0] === 'bearer'
      ? req.headers.authorization.split(' ')[1]
      : null;
  }
}

module.exports = TokenService;