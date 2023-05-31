const { Pool } = require('pg');

const pool = new Pool({
  user: 'mw',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

module.exports = pool;