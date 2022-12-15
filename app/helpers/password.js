const bcrypt = require('bcrypt');
require('dotenv').config();

class PasswordService {
  saltRounds;
  salt;

  constructor() {
    this.saltRounds = parseInt(process.env.SALT_ROUNDS);
    this.salt = bcrypt.genSaltSync(this.saltRounds);
    console.log(this.salt, typeof this.salt);
  }

  async check(passwordClear, passwordHash) {
    const match = await bcrypt.compare(passwordClear, passwordHash);
    return match ? true : false;
  }

  hash(passwordClear) {
    const passwordHash = bcrypt.hashSync(passwordClear, this.salt);
    return passwordHash;
  }

}

module.exports = PasswordService;
