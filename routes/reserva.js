const express = require('express');
const routerReserva = express.Router();
const sql = require('mssql');
const { config, pool, dbConnect } = require('../config/db');
const path = require('path');
const { Console } = require('console');

// Middleware para analizar los datos en formato JSON
routerReserva.use(express.json());

// Ruta para cargar el formulario add-reserva.html
routerReserva.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'public', 'reservas.html'));
});
//aqui desarollar la logica para verificar la disponibilidad de las habitaciones
routerReserva.post('/', async (req, res) => {
    const reservaCliente = req.body;
    console.log(reservaCliente);
    const disponibilidad = await consultarCamasDisponibles(reservaCliente);
    console.log(disponibilidad)
    if (!(disponibilidad)) {
        res.status(404).send(`No hay habitaciones disponibles en el rango de fechas seleccionadas`)
    } else {
        res.status(200).send("Hay camas disponibles")
    }

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
        tipoServicio = createservicios(reservaCliente);
        fechaFin = reservaCliente.check_out
        fechaInicio = reservaCliente.check_in
        if (reservaCliente.tipo_habitacion == 'Ordinaria') {
            personas = 1
        } else {
            personas = 2
        }
        for (let i = 0; i < tipoServicio.length; i++) {
            const elemento = tipoServicio[i];
            cupos = await ConfirmarCupos(fechaInicio, fechaFin, elemento, personas)
            if (cupos == false) {
                return [0, elemento];
            }
            // Resto del código dentro del bucle
        }
        for (let i = 0; i < tipoServicio.length; i++) {
            const elemento = tipoServicio[i];
            await reservarCupos(fechaInicio, fechaFin, elemento, personas);
            // Resto del código dentro del bucle
        }
        // Insertar la reserva en la base de datos
        await sql.connect(config);
        const query = `
        -- INSERT en la tabla 'reservas'
        INSERT INTO reservas (codigo_reserva, correo, id_habitacion, fecha_inicio, fecha_fin, num_personas, desayuno, almuerzo, cena, transporte, parqueadero, lavanderia, guia, menores)
        VALUES (@codigoReserva, @correo, @idHabitacion, @fechaInicio, @fechaFin, @numPersonas, @desayuno, @almuerzo, @cena, @transporte, @parqueadero, @lavanderia, @guia, @menores);
        
      `;

        const pool = await sql.connect(config);
        const request = pool.request();
        const codigo = await generarValorUnico();
        request.input('codigoReserva', sql.VarChar(100), codigo);
        request.input('idHabitacion', sql.Int, id_habitacion);
        request.input('correo', sql.VarChar(100), reservaCliente.mail);
        request.input('fechaInicio', sql.Date, reservaCliente.check_in);
        request.input('fechaFin', sql.Date, reservaCliente.check_out);
        request.input('numPersonas', sql.Int, reservaCliente.numero_huespedes);
        request.input('desayuno', sql.Bit, reservaCliente.desayuno ? 1 : 0);
        request.input('almuerzo', sql.Bit, reservaCliente.almuerzo ? 1 : 0);
        request.input('cena', sql.Bit, reservaCliente.cena ? 1 : 0);
        request.input('transporte', sql.Bit, reservaCliente.transporte_pueblo ? 1 : 0);
        request.input('parqueadero', sql.Bit, reservaCliente.parqueadero ? 1 : 0);
        request.input('lavanderia', sql.Bit, reservaCliente.lavanderia ? 1 : 0);
        request.input('guia', sql.Bit, reservaCliente.servicio_guia ? 1 : 0);
        request.input('menores', sql.Bit, reservaCliente.menores ? 1 : 0);
        await request.query(query);
        //console.log('Reserva realizada exitosamente.');
        return [1, codigo];

    } catch (error) {
        console.log('Error al hacer la reserva:', error);
        throw new Error('Error al hacer la reserva');
    } finally {
        sql.close();
    }
}
// Fin de función para hacer reserva

// Ruta post para obtener los datos del formulario de reservas en la ruta add-reservas
routerReserva.post('/', async (req, res) => {
    try {
        console.log(req.body);
        const reservaCliente = req.body;
        const tipo = req.body.tipo_habitacion;
        reservaCliente.numero_huespedes = (parseInt(reservaCliente.numero_huespedes) + 1).toString();
        const paro = await paroarmado(reservaCliente.check_in, reservaCliente.check_out);
        console.log(paro)
        if (paro[0] == true) {
            if (tipo === "Ordinaria") {

                const disponibilidad = await consultarCamasDisponibles(reservaCliente);
                console.log(disponibilidad)
                if (disponibilidad.recordset.length === 0) {
                    res.status(404).send(`No hay habitaciones disponibles en el rango de fechas seleccionadas`)
                } else {
                    const id = disponibilidad.recordset[0].id;
                    const result = await addReservas(req.body, id);

                    if (result[0] == 1) {
                        res.status(200).send(`Reserva realizada exitosamente codigo de reserva # ${result[1]}`)
                    } else {
                        res.status(404).send(`No hay suficientes cupos para el servicio de ${result[1]}`)
                    }
                }

            } else if (tipo === "Uso compartido") {
                // Verificar si se acomodaron todas las personas
                const reservacompartidas = await reservaHabitaciones(reservaCliente, await obtenerHabitacionesCompartidas(), reservaCliente.check_in, reservaCliente.check_out);

                if (reservacompartidas[0] == 1) {

                    res.status(200).send(`Reserva realizada exitosamente codigo de reserva # ${reservacompartidas[1]}`)

                } else {
                    if (reservacompartidas[1] != 0) {
                        res.status(400).send(`No hay suficientes cupos para el servicio de ${reservacompartidas[1]}`)
                    } else {
                        res.status(400).send('No se pueden acomodar a todas las personas en habitaciones compartidas');
                    }
                }
            }
        } else {
            res.status(400).send(`No se puede realizar la reserva debido a un ${paro[0]}`);
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
        SELECT top 1 h.id
        FROM habitaciones h
        WHERE h.tipo = 'Ordinaria' 
        AND h.acomodacion = @tipoCama
        AND h.id NOT IN (
        SELECT r.id_habitacion
        FROM reservas r
        WHERE (r.fecha_inicio <= @fechaFin AND r.fecha_fin >= @fechaInicio)
        )`;
        const pool = await sql.connect(config);
        const request = pool.request();
        request.input('tipoCama', sql.VarChar(50), reservaCliente.tipo_camas);
        request.input('fechaInicio', sql.Date, reservaCliente.check_in);
        request.input('fechaFin', sql.Date, reservaCliente.check_out);
        const result = await request.query(query);

        await sql.close();

        return result
    } catch (error) {
        console.error(error);
         new Error('Error en la consulta de camas disponibles');
    }
}
// Fin de la función consultar camas disponibles si el tipo de habitación es ordinaria

//  Funcion para consultar si hay fechas ineactivas
async function paroarmado(fechaInicio, fechaFin) {
    try {
        await sql.connect(config);
        // Actualizar los cupos disponibles para cada fecha
        const updateQuery = `
            SELECT *
            FROM fechas_inactivas
            WHERE fecha_inicio <= @Fecha_fin
            AND fecha_fin >= @Fecha_inicio;
            ;
            
        `;
        const pool = await sql.connect(config);
        const request = pool.request();
        request.input('Fecha_inicio', sql.Date, fechaInicio);
        request.input('Fecha_fin', sql.Date, fechaFin);
        
        result = await request.query(updateQuery);

        if (result.recordset.length === 0) {
            return [true, true, true];

        } else {
            console.log("Hay un paro armado");
            return [result.recordset[0].tipo];

        }



    } catch (error) {
        console.error('No se pudo realizar la consulta de fechas inactivas:', error.message);
    } finally {
        sql.close();
    }
}
//  Funcion para consultar si hay servicios disponibles en el rango de fechas seleccionadas
async function reservarCupos(fechaInicio, fechaFin, tipoServicio, personas) {
    try {
        await sql.connect(config);

        // Actualizar los cupos disponibles para cada fecha
        const updateQuery = `
            UPDATE CuposDisponibles
            SET [${tipoServicio}] = [${tipoServicio}] - @personas
            WHERE Fecha >= @FechaInicio AND Fecha <= @FechaFin
            
        `;
        const pool = await sql.connect(config);
        const request = pool.request();
        request.input('FechaInicio', sql.Date, fechaInicio);
        request.input('FechaFin', sql.Date, fechaFin);
        request.input('Personas', sql.Int, personas);
        await request.query(updateQuery);
        console.log('cupos exitosos.');


    } catch (error) {
        if (transaction) {
            await transaction.rollback();
        }
        console.error('No se pudo realizar la asignación de cupos:', error.message);
    } finally {
        sql.close();
        return true
    }
}
async function ConfirmarCupos(fechaInicio, fechaFin, tipoServicio, personas) {
    try {
        await sql.connect(config);
        // Verificar si hay cupos disponibles para todas las fechas
        const query = `
            SELECT 1
            FROM CuposDisponibles
            WHERE Fecha >= @FechaInicio 
            AND Fecha <= @FechaFin
            AND [${tipoServicio}] < @Personas
        `;
        const pool = await sql.connect(config);
        const request = pool.request();
        request.input('FechaInicio', sql.Date, fechaInicio);
        request.input('FechaFin', sql.Date, fechaFin);
        request.input('Personas', sql.Int, personas);
        const result = await request.query(query);
        if (result.recordset.length === 0) {
            return true;
        } else {
            console.log("No alcanzó los cupos")
            return false;
        }
    } catch (error) {
        if (transaction) {
            await transaction.rollback();
        }
        console.error('No se pudo realizar la reserva:', error.message);
    } finally {
        sql.close();
    }
}
// Fin de la función consultar si hay servicios disponibles en el rango de fechas seleccionadas

// Función para obtener los IDs de las habitaciones compartidas
async function obtenerHabitacionesCompartidas() {
    try {
        // Conectarse a la base de datos
        await sql.connect(config);

        const pool = await sql.connect(config);
        const request = pool.request();

        // Consulta SQL para obtener los IDs de las habitaciones compartidas
        const query = `SELECT id FROM habitaciones WHERE tipo = 'Uso compartido'`;

        // Ejecutar la consulta
        const result = await request.query(query);

        // Extraer los IDs de los resultados de la consulta
        const ids = result.recordset.map((row) => row.id);

        // Devolver los IDs de las habitaciones compartidas
        return ids;
    } catch (error) {
        console.error('Error al obtener las habitaciones compartidas:', error);
        throw error;
    } finally {
        // Cerrar la conexión a la base de datos
        sql.close();
    }
}
// Fin de la función para obtener los IDs de las habitaciones compartidas
async function revertirInsert(codigoReserva) {
    try {
        await sql.connect(config);

        // Realizar la lógica para revertir el insert en la base de datos
        const query = `
        DELETE FROM reserva_compartida
        WHERE  codigo_reserva = '${codigoReserva}';
      `;

        const pool = await sql.connect(config);
        const request = pool.request();

        await request.query(query);
        await sql.close();
    } catch (error) {
        console.error('Error al revertir insert:', error);
        throw error;
    }
}
function createservicios(reservaCliente) {
    const tipoServicio = [];
    const arregloservicios = ['Desayuno', 'Almuerzo', 'Cena', 'Lavanderia', 'Parqueadero', 'guia', 'Transporte']
    let contador = 0;
    const arregloOriginal = [reservaCliente.desayuno, reservaCliente.almuerzo, reservaCliente.cena, reservaCliente.lavanderia, reservaCliente.parqueadero, reservaCliente.servicio_guia, reservaCliente.transporte_pueblo];
    // Recorrer el arreglo original y verificar si el bit está encendido (bit on)
    arregloOriginal.forEach((bit) => {
        if (bit === 'on') {
            // Si el bit está encendido (bit on), agregar 1 al arreglo resultado
            tipoServicio.push(arregloservicios[contador]);
        }
        contador = contador + 1;
    });
    return tipoServicio
}
async function reservaHabitaciones(reservaCliente, idsHabitaciones, fechaInicio, fechaFin) {
    try {
        const codigoReserva = await generarValorUnico();
        await sql.connect(config);

        let acomododar = 0;
        let personas = reservaCliente.numero_huespedes;
        const tipoServicio = createservicios(reservaCliente);
        for (const idHabitacion of idsHabitaciones) {
            let fin = personas - acomododar
            for (let i = 0; i < fin; i++) {

                const query = `
            DECLARE @fecha_inicio Date;
            DECLARE @fecha_fin Date;
            DECLARE @numero_habitacion int;
  
            SET @fecha_inicio = '${fechaInicio}'; -- Fecha de inicio del rango
            SET @fecha_fin = '${fechaFin}'; -- Fecha de fin del rango
            SET @numero_habitacion = ${idHabitacion}; -- ID de la habitación a verificar
  
            SELECT COUNT(*) AS total_reservas
            FROM reserva_compartida
            WHERE numero_habitacion = @numero_habitacion
                AND fecha_inicio <= @fecha_fin
                AND fecha_fin >= @fecha_inicio;
          `;

                const pool = await sql.connect(config);
                const request = pool.request();

                const result = await request.query(query);

                await sql.close();

                const totalReservas = result.recordset[0].total_reservas;

                console.log('Total de reservas:', totalReservas);

                if (totalReservas < 4 && !(acomododar == personas)) {

                    await insertarReservaCompartida(reservaCliente, idHabitacion, codigoReserva)


                    acomododar++;

                    habitacionReservada = idHabitacion;

                } else {
                    break;
                }
            }
        }
        console.log(`acomodadas ${acomododar} de ${personas}`);

        if (acomododar == personas) {
            for (let i = 0; i < tipoServicio.length; i++) {
                const elemento = tipoServicio[i];
                cupos = await ConfirmarCupos(fechaInicio, fechaFin, elemento, personas)
                if (cupos == false) {
                    revertirInsert(codigoReserva);
                    return [0, elemento];
                }
                // Resto del código dentro del bucle
            }
            for (let i = 0; i < tipoServicio.length; i++) {
                const elemento = tipoServicio[i];
                await reservarCupos(fechaInicio, fechaFin, elemento, personas);
                // Resto del código dentro del bucle
            }
            return [1, codigoReserva];

        } else {
            revertirInsert(codigoReserva);
            return [0, 0];
        }

    } catch (error) {
        console.error('Error al reservar habitación:', error);
        throw error;
    }
}





async function insertarReservaCompartida(reservaCliente, idHabitacion, codigoReserva) {
    try {
        // Generar un valor único para el código de reserva


        // Conectarse a la base de datos
        await sql.connect(config);

        // Crear una instancia de solicitud de consulta
        const pool = await sql.connect(config);
        const request = pool.request();

        // Consulta SQL para insertar una nueva reserva compartida
        const query = `
          INSERT INTO reserva_compartida (codigo_reserva, numero_habitacion, correo, fecha_inicio, fecha_fin, desayuno, almuerzo, cena, transporte, parqueadero, lavanderia, guia, menores)
          VALUES (@codigoReserva, @idHabitacion, @correo, @fechaInicio, @fechaFin, @desayuno, @almuerzo, @cena, @transporte, @parqueadero, @lavanderia, @guia, @menores)
      `;

        // Definir los parámetros de la consulta
        request.input('codigoReserva', sql.VarChar(100), codigoReserva);
        request.input('idHabitacion', sql.Int, idHabitacion);
        request.input('correo', sql.VarChar(100), reservaCliente.mail);
        request.input('fechaInicio', sql.Date, reservaCliente.check_in);
        request.input('fechaFin', sql.Date, reservaCliente.check_out);
        request.input('numPersonas', sql.Int, reservaCliente.numero_huespedes);
        request.input('desayuno', sql.Bit, reservaCliente.desayuno ? 1 : 0);
        request.input('almuerzo', sql.Bit, reservaCliente.almuerzo ? 1 : 0);
        request.input('cena', sql.Bit, reservaCliente.cena ? 1 : 0);
        request.input('transporte', sql.Bit, reservaCliente.transporte_pueblo ? 1 : 0);
        request.input('parqueadero', sql.Bit, reservaCliente.parqueadero ? 1 : 0);
        request.input('lavanderia', sql.Bit, reservaCliente.lavanderia ? 1 : 0);
        request.input('guia', sql.Bit, reservaCliente.servicio_guia ? 1 : 0);
        request.input('menores', sql.Bit, reservaCliente.menores ? 1 : 0);



        // Ejecutar la consulta
        await request.query(query);

        //console.log('Reserva compartida insertada correctamente y el id es: ', idHabitacion);


        // Cerrar la conexión a la base de datos
        sql.close();
    } catch (error) {
        console.error('Error al insertar la reserva compartida:', error);
        throw error;
    }
}

module.exports = routerReserva;
