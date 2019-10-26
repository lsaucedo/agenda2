-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-10-2019 a las 17:36:30
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `fecha_inicio` varchar(20) NOT NULL,
  `fecha_fin` varchar(20) DEFAULT NULL,
  `hora_inicio` varchar(20) DEFAULT NULL,
  `hora_fin` varchar(20) DEFAULT NULL,
  `allday` tinyint(1) DEFAULT NULL,
  `fk_usuarios` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `titulo`, `fecha_inicio`, `fecha_fin`, `hora_inicio`, `hora_fin`, `allday`, `fk_usuarios`) VALUES
(2, 'prueba', '2019-10-24', '2019-10-25', '07:00:00', '07:00:00', 0, 'luis@gmail.com'),
(5, 'pepe_prueba', '2019-10-23', '', ':00', ':00', 1, 'pepe@gmail.com'),
(6, 'cumpleaÃ±o', '2019-10-20', '', ':00', ':00', 1, 'pepe@gmail.com'),
(7, 'cumpleaÃ±o', '2019-10-20', '', ':00', ':00', 1, 'luis@gmail.com'),
(10, 'pepe_prueba', '2019-10-21', '', '07:00:00', '07:00:00', 0, 'luis@gmail.com'),
(11, 'prueba2', '2019-10-21', '', ':00', ':00', 1, 'pepe@gmail.com'),
(12, 'tabla', '2019-10-23', '', ':00', ':00', 1, 'luis@gmail.com'),
(13, 'prueba2', '2019-10-23', '', ':00', ':00', 1, 'luis@gmail.com'),
(14, 'cumpleaÃ±o hija', '2019-10-16', '', ':00', ':00', 1, 'luis@gmail.com'),
(15, 'Prueba_evento', '2019-10-01', '2019-10-05', '07:00:00', '17:30:00', 0, 'pepe@gmail.com'),
(19, 'entrega trabajo final', '2019-10-24', '', ':00', ':00', 1, 'pepe@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `email` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`email`, `nombre`, `password`, `fecha_nacimiento`) VALUES
('luis@gmail.com', 'luis saucedo', '$2y$10$fAZ4TPJaPjvMc1IYFI8jiuxomD6/vUCNjphb73j5JX3VFGQ1Xxkoi', '1976-04-01'),
('pepe@gmail.com', 'pepe', '$2y$10$Jfcp1Ltl/0ox9kcRGUsX/OY0A0sjpaRLvp4VpAjl0M5rvK7X9UVXm', '2000-11-20'),
('valerie@gmail.com', 'valerie saucedo', '$2y$10$dTpgftIzo9ULwXVftpkLn.px76/Ddn.QIQo0Mj1vizcxFp.1fJDaW', '2008-08-19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuarios` (`fk_usuarios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_usuarioemail_evento` FOREIGN KEY (`fk_usuarios`) REFERENCES `usuarios` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
