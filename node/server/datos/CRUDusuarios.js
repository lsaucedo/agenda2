
var Usuario = require('./Modelusuario.js');
module.exports.insertarUsuario = function (callback) {

	let User1 = new Usuario({nombre: "usuario1", user: 'prueba', pass:'123'});
	let User2 = new Usuario({nombre: "usuario2", user: 'luis', pass:'123'});
	let User3 = new Usuario({nombre: "usuario3", user: 'miguel', pass:'123'});

	User1.save((error) => {
		if(error) callback(error);
		callback(null,"Usuario1 nuevo guardado");
	});
	User2.save((error) => {
		if(error) callback(error);
		callback(null,"Usuario2 nuevo guardado");
	});
	User3.save((error) => {
		if(error) callback(error);
		callback(null,"Usuario3 nuevo guardado");
	});

};

module.exports.consultarUsuario = function (data, callback) {
	Usuario.findOne({user: data.user}, (err, user) => {
		if(user){
			if(user.pass === data.pass)
				callback(null,user);
      		else
      			callback('La Contraseña es incorrecta');
      	} else
			callback('El Usuario no existe');
	});
};
