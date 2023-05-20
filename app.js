const express = require('express');
const sql = require('mssql');
const { pool, dbConnect } = require('./config/db');
const routerReserva = require('./routes/reserva');
const path = require('path');
//constante de port
const app = express();
const port = process.env.PORT || 3000;
//middleware
app.use(express.json());
app.use(express.urlencoded({extended: false}));
// Configurar la ruta por defecto a public/index.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Configurar la carpeta "public" para servir archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Usar el enrutador de reserva
app.use('/add-reservas', routerReserva);

app.listen(port, () => {
  console.log(`Servidor Express iniciado en el puerto ${port}`);
});
