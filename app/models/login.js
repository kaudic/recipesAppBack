const client = require('../config/db');
const { ApiError } = require('../helpers/errorHandler');
const { insertQueryGenerator, updateQueryGenerator } = require('../tools/queryGenerator');


module.exports = {

  async findOneByLogin(login) {
    const result = await client.query('SELECT * FROM "user" WHERE login = $1', [login]);
    if (result?.rows?.length >= 0) {
      return result.rows[0];
    } else {
      return null;
    }
  }

};