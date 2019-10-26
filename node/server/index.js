/*Al iniciar una sesión exitosamente, el sistema debe cargar todos los eventos asociados al usuario en la sesión desde la base de datos y mostrarlos en el calendario.
 */
var bodyParser = require('body-parser'),
	http = require('http'),
	express = require('express'),
	session = require('express-session'),
	rutaLogin = require('./rutas/rutasUsuario.js'),
	rutaEvents = require('./rutas/rutasEvento.js');

var PORT = 8082,
	app = express(),
	Server = http.createServer(app);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(session({
	secret: "mph*Next2019",
	resave: false,
	saveUninitialized: false
}));
app.use('/login', rutaLogin);
app.use('/events', rutaEvents);
app.use(express.static('client'));
Server.listen(PORT, () => {
	console.log('Server is listening on port: '+PORT);
});
