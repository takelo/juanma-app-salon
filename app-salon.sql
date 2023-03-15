-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 15-03-2023 a las 18:13:11
-- Versión del servidor: 5.7.33
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app-salon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `hora` time DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_usuario_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `hora`, `fecha`, `id_usuario_fk`) VALUES
(23, '10:00:00', '2023-03-14', 2),
(24, '10:00:00', '2023-03-22', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas_servicios`
--

CREATE TABLE `citas_servicios` (
  `id` int(11) NOT NULL,
  `id_servicio_fk` int(11) DEFAULT NULL,
  `id_cita_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `citas_servicios`
--

INSERT INTO `citas_servicios` (`id`, `id_servicio_fk`, `id_cita_fk`) VALUES
(14, 3, 23),
(15, 6, 23),
(16, 9, 23),
(17, 11, 23),
(18, 12, 23),
(19, 14, 23),
(20, 7, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `precio`) VALUES
(3, 'Corte de Cabello Nino', '60.00'),
(4, 'Peinado Mujer', '80.00'),
(5, 'Peinado Hombre', '60.00'),
(6, 'Peinado Nino', '60.00'),
(7, 'Corte de Barba', '60.00'),
(8, 'Tinte Mujer', '300.00'),
(9, 'Uniasas', '400.00'),
(10, 'Lavado de Cabello', '50.00'),
(11, 'Tratamiento Capilar', '150.00'),
(12, ' Corte de Pelo', '500.00'),
(13, ' Juan Manuel', '10.00'),
(14, 'Uñas', '400.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `token` varchar(15) DEFAULT NULL,
  `confirmado` tinyint(4) DEFAULT NULL,
  `admin` tinyint(4) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `nombre` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `token`, `confirmado`, `admin`, `password`, `telefono`, `email`, `apellido`, `nombre`) VALUES
(2, '63ee95817bc81 ', 1, 0, '$2y$10$MMHnpStb3WNktzn/Sv9LMOP/.WAOCiS5pHPMJTONE9kN80wx0FOx6', '4453456346', 'factorzero@gmail.com', 'Echeverria', ' Juan');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuarioid_fk` (`id_usuario_fk`) USING BTREE;

--
-- Indices de la tabla `citas_servicios`
--
ALTER TABLE `citas_servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cita_fk` (`id_cita_fk`),
  ADD KEY `id_usuarioid_fk` (`id_servicio_fk`) USING BTREE;

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `citas_servicios`
--
ALTER TABLE `citas_servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
