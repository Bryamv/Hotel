const sql = require('mssql');

const config = {
    server: 'diseno1.database.windows.net',
    database: 'hotel_horizonte',
    user: 'bryamv',
    password: 'Theomars18',
    options: {
      encrypt: true // Si utilizas una conexión encriptada
    }
  };
  

const pool = new sql.ConnectionPool(config);
const dbConnect = pool.connect();

module.exports = { pool, dbConnect,config };
