const express = require('express');
const app = express();
const sql = require('mssql');
const { pool, dbConnect } = require('../config/db');
const routerReserva = express.Router();
//middleware
routerReserva.use(express.json());
//app.use('/reservas', routerReserva);

const crearReserva = async (req, res) => {
    try {
        await dbConnect; // Espera a que la conexión a la base de datos se establezca
        const { codigo_reserva, fk_id_habitacion, fk_huesped, fecha_inicio, fecha_fin, num_personas, desayuno, almuerzo, cena, transporte, parqueadero, lavanderia, guia, descripcion } = req.body;

        const request = pool.request();
        request.input('CodigoReserva', sql.VarChar(100), codigo_reserva);
        request.input('IdHabitacion', sql.Int, fk_id_habitacion);
        request.input('IdHuesped', sql.Int, fk_huesped);
        request.input('FechaInicio', sql.Date, fecha_inicio);
        request.input('FechaFin', sql.Date, fecha_fin);
        request.input('NumPersonas', sql.Int, num_personas);
        request.input('Desayuno', sql.Bit, desayuno);
        request.input('Almuerzo', sql.Bit, almuerzo);
        request.input('Cena', sql.Bit, cena);
        request.input('Transporte', sql.Bit, transporte);
        request.input('Parqueadero', sql.Bit, parqueadero);
        request.input('Lavanderia', sql.Bit, lavanderia);
        request.input('Guia', sql.Bit, guia);
        request.input('Descripcion', sql.VarChar(255), descripcion);

        await request.query('INSERT INTO reservas (codigo_reserva, fk_id_habitacion, fk_huesped, fecha_inicio, fecha_fin, num_personas, desayuno, almuerzo, cena, transporte, parqueadero, lavanderia, guia, descripcion) VALUES (@CodigoReserva, @IdHabitacion, @IdHuesped, @FechaInicio, @FechaFin, @NumPersonas, @Desayuno, @Almuerzo, @Cena, @Transporte, @Parqueadero, @Lavanderia, @Guia, @Descripcion)');

        res.status(201).json({ mensaje: 'Reserva creada exitosamente' });
    } catch (error) {
        console.error('Error al crear la reserva:', error);
        res.status(500).json({ error: 'Ocurrió un error al crear la reserva' });
    }
};

routerReserva.post('/', crearReserva);



module.exports = routerReserva;
