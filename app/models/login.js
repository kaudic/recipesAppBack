const client = require('../config/db');
const { ApiError } = require('../helpers/errorHandler');
const { insertQueryGenerator, updateQueryGenerator } = require('../tools/queryGenerator');


module.exports = {

  async checkCredentials() {
    const result = await client.query('SELECT * FROM ingredient ORDER BY name ASC');
    return result.rows;
  }

};