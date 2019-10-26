/**Valida el ingreso al sistema al iniciar sesión, comparando los datos ingresados en el formulario con los almacenados en la base de datos.
 */
var express = require('express');
var mongoose = require('mongoose');
var Agenda2 = mongoose.connect('mongodb://localhost/Agenda2');
module.exports = Agenda2;
var Operaciones = require('../datos/CRUDusuarios.js');
var Router = express.Router();


Router.post('/', (req, res) => {
	Operaciones.consultarUsuario({user: req.body.user, pass: req.body.pass},(error, result) => {
		if(error) res.send(error);
		else {
			req.session.login = true;
			req.session.userLogin = result;
			res.send("Validado");
		}
	});
});

Router.get('/out',function(req,res){
	req.session.destroy(function(err) {
		if(err) console.log(err);
		else res.redirect('/');
	});
});


module.exports = Router;
