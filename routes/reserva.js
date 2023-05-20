const express = require('express');
const routerReserva = express.Router();
const sql = require('mssql');
const { config, pool, dbConnect } = require('../config/db');
const path = require('path');

// Middleware para analizar los datos en formato JSON
routerReserva.use(express.json());

// Ruta para cargar el formulario add-reserva.html
routerReserva.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'public', 'reservas.html'));
});


// Función para generar valor unico para el codigo de reserva
async function generarValorUnico() {
    const caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let valorUnico = '';

    for (let i = 0; i < 10; i++) {
        const indice = Math.floor(Math.random() * caracteres.length);
        valorUnico += caracteres.charAt(indice);
    }

    return valorUnico;
}
// Fin función para generar valor unico para el codigo de reserva

// Función para hacer una reserva
async function addReservas(reservaCliente, id_habitacion) {
    try {

        // Insertar la reserva en la base de datos
        await sql.connect(config);
        const query = `
        -- INSERT en la tabla 'reservas'
        INSERT INTO reservas (codigo_reserva, id_cliente, fecha_inicio, fecha_fin, num_personas, desayuno, almuerzo, cena, transporte, parqueadero, lavanderia, descripcion, guia)
        VALUES (@codigoReserva, @idCliente, @fechaInicio, @fechaFin, @numPersonas, @desayuno, @almuerzo, @cena, @transporte, @parqueadero, @lavanderia, @descripcion, @guia);
  
        -- Obtener el ID de la reserva recién insertada
        DECLARE @idReserva INT;
        SET @idReserva = SCOPE_IDENTITY();
  
        -- INSERT en la tabla 'reservas_habitaciones'
        INSERT INTO reservas_habitaciones (id_reserva, id_habitacion)
        VALUES (@idReserva, @idHabitacion);
      `;
        const pool = await sql.connect(config);
        const request = pool.request();
        const codigo = await generarValorUnico();
        request.input('codigoReserva', sql.VarChar(100), codigo);
        request.input('idHabitacion', sql.Int, id_habitacion);
        request.input('idCliente', sql.VarChar(50), reservaCliente.docCliente);
        request.input('fechaInicio', sql.DateTime, reservaCliente.check_in);
        request.input('fechaFin', sql.DateTime, reservaCliente.check_out);
        request.input('numPersonas', sql.Int, reservaCliente.numero_huespedes);
        request.input('desayuno', sql.Bit, reservaCliente.desayuno ? 1 : 0);
        request.input('almuerzo', sql.Bit, reservaCliente.almuerzo ? 1 : 0);
        request.input('cena', sql.Bit, reservaCliente.cena ? 1 : 0);
        request.input('transporte', sql.Bit, reservaCliente.transporte_pueblo ? 1 : 0);
        request.input('parqueadero', sql.Bit, reservaCliente.parqueadero ? 1 : 0);
        request.input('lavanderia', sql.Bit, reservaCliente.lavanderia ? 1 : 0);
        request.input('descripcion', sql.Text, reservaCliente.descripcion);
        request.input('guia', sql.Bit, reservaCliente.servicio_guia ? 1 : 0);
        await request.query(query);
        //console.log('Reserva realizada exitosamente.');

        return codigo
    } catch (error) {
        console.log('Error al hacer la reserva:', error);
        throw new Error('Error al hacer la reserva');
    } finally {
        sql.close();
    }
}
// Fin de función para hacer reserva

routerReserva.post('/', async (req, res) => {
    try {
        console.log(req.body);
        const reservaCliente = req.body;

        const tipo = req.body.tipo_habitacion;

        if (tipo === "Ordinaria") {

            const disponibilidad = await consultarCamasDisponibles(reservaCliente);
            if (disponibilidad.recordset.length === 0) {
                res.status(404).send(`No hay habitaciones disponibles en el rango de fechas seleccionadas`)
            } else {
                const id = disponibilidad.recordset[0].id;
                const result = await addReservas(req.body, id);

                if (result) {
                    res.status(200).send(`Reserva realizada exitosamente codigo de reserva # ${result}`)
                }
            }

        } else if (tipo === "Compartida") {
            // Verificar si se acomodaron todas las personas
            const reservaCompartidas = await reservarHabitacionesCompartidas(reservaCliente);
            console.log(reservaCompartidas)
            if (reservaCompartidas.personasRestantes === 0) {
                // Aquí iría el código para guardar las reservas en la base de datos
                console.log(reservaCompartidas);
            } else {
                res.status(400).send('No se pueden acomodar a todas las personas en habitaciones compartidas');
            }
        }

        //res.json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al hacer la reserva' });
        // No envíes más respuestas aquí, evita llamar a res.send(), res.render(), u otras funciones de respuesta.
    }
});
// Fin de la ruta de hacer reserva del formulario de reservas add-reservas
// Función para consultar camas disponibles si el tipo de habitación es ordinaria
async function consultarCamasDisponibles(reservaCliente) {
    try {

        await sql.connect(config);

        const query = `
      SELECT TOP 1 h.id, h.numero_habitacion, h.tipo, h.acomodacion
      FROM habitaciones h
      WHERE h.tipo = @tipoHabitacion
      AND h.acomodacion = @tipoCama
      AND h.id NOT IN (
        SELECT rh.id_habitacion
        FROM reservas_habitaciones rh
        INNER JOIN reservas r ON rh.id_reserva = r.id_reserva
        WHERE (
            (r.fecha_inicio >= @fechaInicio AND r.fecha_inicio < @fechaFin)
            OR (r.fecha_fin > @fechaInicio AND r.fecha_fin <= @fechaFin)
            OR (r.fecha_inicio <= @fechaInicio AND r.fecha_fin >= @fechaFin)
        )
      )`;

        const pool = await sql.connect(config);
        const request = pool.request();

        request.input('tipoHabitacion', sql.VarChar(50), reservaCliente.tipo_habitacion);
        request.input('tipoCama', sql.VarChar(50), reservaCliente.tipo_camas);
        request.input('fechaInicio', sql.DateTime, reservaCliente.fechaInicio);
        request.input('fechaFin', sql.DateTime, reservaCliente.fechaFin);

        const result = await request.query(query);

        await sql.close();

        return result
    } catch (error) {
        console.error(error);
        throw new Error('Error en la consulta de camas disponibles');
    }
}
// Fin de la función consultar camas disponibles si el tipo de habitación es ordinaria


// Ruta para hacer una reserva de habitaciones compartidas para un grupo de personas
async function reservarHabitacionesCompartidas(reservaCliente) {

    try {
        // Obtener las habitaciones compartidas disponibles
        await sql.connect(config);

        const query = `
    SELECT  h.id, h.numero_habitacion, h.tipo, h.acomodacion, h.camas_disponibles
      FROM habitaciones h
      WHERE h.tipo = @tipoHabitacion
      AND h.id NOT IN (
        SELECT rh.id_habitacion
        FROM reservas_habitaciones rh
        INNER JOIN reservas r ON rh.id_reserva = r.id_reserva
        WHERE (
            (r.fecha_inicio >= @fechaInicio AND r.fecha_inicio < @fechaFin)
            OR (r.fecha_fin > @fechaInicio AND r.fecha_fin <= @fechaFin)
            OR (r.fecha_inicio <= @fechaInicio AND r.fecha_fin >= @fechaFin)
        )
    )`;

        const pool = await sql.connect(config);
        const request = pool.request();

        request.input('tipoHabitacion', sql.VarChar(50), reservaCliente.tipo_habitacion);
        request.input('fechaInicio', sql.DateTime, reservaCliente.fechaInicio);
        request.input('fechaFin', sql.DateTime, reservaCliente.fechaFin);

        const result = await request.query(query);

        await sql.close();


        const habitacionesDisponibles = result.recordset;

        // Asignar personas a habitaciones hasta que no haya más personas por acomodar
        const reservas = [];
        let personasRestantes = reservaCliente.numero_huespedes;

        for (const habitacion of habitacionesDisponibles) {

            const camasDisponibles = habitacion.camas_disponibles;

            if (personasRestantes === 0) {
                break; // Ya no hay más personas por acomodar, salir del bucle
            }

            if (camasDisponibles > 0) {
                const personasAsignadas = Math.min(personasRestantes, camasDisponibles);
                const reserva = {
                    id_habitacion: habitacion.id,
                    numero_habitacion: habitacion.numero_habitacion,
                    personas: personasAsignadas,
                };
                reservas.push(reserva);
                personasRestantes -= personasAsignadas;
            }
        }

        // Verificar si se acomodaron todas las personas
        //console.log('personas restantes: ', personasRestantes);

        return { personasRestantes, reservas }
    } catch (error) {
        console.error('Error al ejecutar la consulta:', error);
    }
}
// Fin de la función Hacer reserva de habitaciones compartidas para un grupo de personas

module.exports = routerReserva;
