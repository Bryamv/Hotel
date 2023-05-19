const sql = require('mssql');

const dbConfig = {
    server: 'diseno1.database.windows.net',
    database: 'Hotel',
    user: 'bryamv',
    password: 'Theomars18',
    options: {
      encrypt: true // Si utilizas una conexión encriptada
    }
  };
  

const pool = new sql.ConnectionPool(dbConfig);
const dbConnect = pool.connect();

module.exports = { pool, dbConnect };
