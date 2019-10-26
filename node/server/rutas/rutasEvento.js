/*Al iniciar una sesión exitosamente, el sistema debe cargar todos los eventos asociados al usuario en la sesión desde la base de datos y mostrarlos en el calendario.
*/
var express = require('express');
var mongoose = require('mongoose');
var Agenda2 = mongoose.connect('mongodb://localhost/Agenda2');
module.exports = Agenda2;
var Operaciones = require('../datos/CRUDeventos.js');
var Router = express.Router();


/*Al diligenciar el formulario de la derecha, se debe crear un nuevo evento en el calendario y debe ser almacenado en la base de datos.
*/
Router.post('/new', (req, res) => {
	data = {title: req.body.title, start: req.body.start, end: req.body.end, uid: req.session.userLogin._id};
	Operaciones.insertarEvento(data, (error, result) => {
		if(error) res.send(error);
		res.send(result);
	});
});

//mostramos todos los eventos.
Router.get('/all', (req, res) => {
	Operaciones.consultarEventos(req.session.userLogin._id, (error, result) => {
		if(error) res.json(error);
		else {
			var leventos = [];
			result.forEach(function(item){
				colorEvento = "#" + (Math.round(Math.random() * 0XFFFFFF)).toString(16);
				leventos.push({id: item._id, title: item.title, start: item.start, end: item.end, color: colorEvento});
			});
			res.json(leventos);
		}
	});
});
/*Al arrastrar un evento a otro día del calendario, éste debe ser actualizado en la base de datos a las nuevas fechas de inicio y final según su nueva posición.
*/
Router.post('/update', (req, res) => {
	data = {start: req.body.start, end: req.body.end};
	Operaciones.actualizarEvento(req.body.id, data, (error, result) => {
		if(error) res.send(error);
		res.send(result);
	});
});
/*Al arrastrar un evento al ícono de la basura en la parte derecha de la página, éste debe ser eliminado del calendario y su registro debe eliminarse de la base de datos.*/
Router.post('/delete/:id', (req, res) => {
	Operaciones.eliminarEvento(req.body.id, (error, result) => {
		if(error) res.send(error);
		else res.send(result);
	});
});
module.exports = Router;
