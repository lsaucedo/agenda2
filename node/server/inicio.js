/**Crea un script en el servidor que al ejecutarse por consola, cree un nuevo usuario para el sistema en una base de datos en MongoDB. */
//ejecutar este script en la consola.

var mongoose = require('mongoose');
var Agenda2 = mongoose.connect('mongodb://localhost/Agenda2');
module.exports = Agenda2;

var Operaciones = require('./datos/CRUDusuarios.js');

Operaciones.insertarUsuario((error, result) => {
	if(error) console.log(error);
	console.log(result);
});
