<?php
/* Crea 3 usuarios en la base de datos desde el servidor ejecutando un script de PHP, las contraseñas deben almacenarse encriptadas.*/
	require('conector.php');
	$con = new conectorBD();
	$response['conexion'] = $con->initConexion($con->database);

	if ($response['conexion'] == 'OK'){
		$conexion = $con->getConexion();
		// si la conexión es exitosa,hacemos insercion de los datos con el metodo prepare.
		$insert = $conexion->prepare('INSERT INTO usuarios (email, nombre, password , fecha_nacimiento) VALUES (?,?,?,?)');
		$insert->bind_param("ssss", $email, $nombre, $password, $fecha_nacimiento);

	//datos usuario1
		$email = "luis@gmail.com";
		$nombre = "luis saucedo";
		$password = password_hash('123', PASSWORD_DEFAULT);
		$fecha_nacimiento = "1976-04-01";
		$insert->execute();
//datos usuario2
		$email = 'valerie@gmail.com';
		$nombre = 'valerie saucedo';
		$password = password_hash('124', PASSWORD_DEFAULT);
		$fecha_nacimiento = '2008-08-19';
		$insert->execute();
//datos usuario3
		$email = 'pepe@gmail.com';
		$nombre = 'pepe';
		$password = password_hash('125', PASSWORD_DEFAULT);
		$fecha_nacimiento = '2000-11-20';
		$insert->execute();

		echo "Se insertaron los registros exitosamente";
		}else{
		  echo "Se presentó un error en la conexión";
			$response['msg'] = 'No se pudo conectar a la base de datos';
		}
		echo json_encode($response);
 ?>
