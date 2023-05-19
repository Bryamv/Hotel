const express = require('express');
const sql = require('mssql');
const { pool, dbConnect } = require('./config/db');
const routerReserva = require('./routes/reserva');
const app = express();
const port = process.env.port || 3000;
app.use('/reservas', routerReserva);
app.use(express.json());
app.get('/', (req, res) => {
    res.send('¡Bienvenido a la página principal!');
});
routerReserva.get('/', (req, res) => {
    res.send('¡Bienvenido a la página de reservas');
});


app.listen(port, () => {
    console.log(`Servidor Express iniciado en el puerto ${port}`);
});