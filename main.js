





//codigo para font-end
const axios = require('axios');

const reserva = {
  codigo_reserva: 'RES-001',
  fk_id_habitacion: 1,
  fk_huesped: 1,
  fecha_inicio: '2023-05-18T10:00:00Z',
  fecha_fin: '2023-05-20T12:00:00Z',
  num_personas: 2,
  desayuno: true,
  almuerzo: false,
  cena: true,
  transporte: true,
  parqueadero: false,
  lavanderia: true,
  guia: false,
  descripcion: 'Reserva de habitación doble con desayuno y transporte'
};

async function crearReserva() {
  try {
    const response = await axios.post('http://localhost:3000/reservas', reserva);
    console.log(response.mensaje);
  } catch (error) {
    console.error('Error al crear la reserva:', error);
  }
}

crearReserva();


