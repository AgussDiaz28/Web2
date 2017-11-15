-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 16, 2017 at 12:40 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `turismo`
--

-- --------------------------------------------------------

--
-- Table structure for table `Aerolineas`
--

CREATE TABLE `Aerolineas` (
  `ID_AEROLINEA` int(11) NOT NULL,
  `NOMBRE_AEROLINEA` varchar(30) DEFAULT NULL,
  `PAIS_ORIGEN` varchar(100) NOT NULL,
  `CANT_AVIONES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Aerolineas`
--

INSERT INTO `Aerolineas` (`ID_AEROLINEA`, `NOMBRE_AEROLINEA`, `PAIS_ORIGEN`, `CANT_AVIONES`) VALUES
(2, 'GOL', 'BRASIL', 254),
(3, 'EMIRATES', 'EMIRATOS ARABES', 461),
(4, 'AIR CANADA', 'CANADA', 370),
(5, 'AEROLINEAS ARGENTINA', 'ARGENTINA', 420),
(6, 'QATAR', 'QATAR', 313);

-- --------------------------------------------------------

--
-- Table structure for table `Ciudades`
--

CREATE TABLE `Ciudades` (
  `ID_CIUDAD` int(11) NOT NULL,
  `NOMBRE_CIUDAD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ciudades`
--

INSERT INTO `Ciudades` (`ID_CIUDAD`, `NOMBRE_CIUDAD`) VALUES
(1, 'San Francisco'),
(2, 'Buenos Aires'),
(3, 'Las Vegas'),
(4, 'Miami'),
(5, 'Sydney'),
(6, 'Dubai');

-- --------------------------------------------------------

--
-- Table structure for table `Comentario`
--

CREATE TABLE `Comentario` (
  `ID_COMENTARIO` int(11) NOT NULL,
  `DETALLE` text NOT NULL,
  `ID_AEROLINEA` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `puntaje` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Comentario`
--

INSERT INTO `Comentario` (`ID_COMENTARIO`, `DETALLE`, `ID_AEROLINEA`, `ID_USUARIO`, `Fecha`, `puntaje`) VALUES
(4, 'No pudo ser mejor', 3, 3, '2017-11-05 15:33:43', 1),
(43, 'Locura', 6, 1, '2017-11-11 15:03:11', 2),
(48, 'Locura', 3, 1, '2017-11-11 15:03:53', 5),
(62, 'hi', 2, 1, '2017-11-11 15:11:22', 3),
(63, 'Como Estas', 2, 1, '2017-11-11 15:12:49', 1),
(64, 'bladl vlada ldasldal d dla lda dlal d', 2, 1, '2017-11-11 15:25:20', 3),
(65, 'Una Porqueria', 2, 1, '2017-11-11 15:25:31', 4),
(68, 'comentario nuevo', 3, 1, '2017-11-15 22:46:06', 0),
(69, 'Comentario nuevo 2', 3, 1, '2017-11-15 22:46:30', 0),
(70, 'Comentario a GOL', 2, 1, '2017-11-15 22:46:49', 0),
(72, 'Nuevo a Qatar', 6, 1, '2017-11-15 22:47:19', 0),
(73, 'Comentarioa a Aerolineas Argentinas', 5, 1, '2017-11-15 22:47:31', 0),
(74, 'AIR CANADA no doubt', 4, 1, '2017-11-15 22:47:51', 0),
(75, 'comentario Nuevo', 5, 1, '2017-11-15 23:08:51', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Imagen`
--

CREATE TABLE `Imagen` (
  `ID_IMAGEN` int(11) NOT NULL,
  `PATH` varchar(3000) NOT NULL,
  `ID_CIUDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Imagen`
--

INSERT INTO `Imagen` (`ID_IMAGEN`, `PATH`, `ID_CIUDAD`) VALUES
(6, 'images/5a04b88953a76.jpg', 4),
(7, 'images/5a09fb968b7ab.jpg', 1),
(8, 'images/5a09fc0211b7b.jpg', 1),
(9, 'images/5a09fc2445cb1.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(500) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `ADMIN` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 = No admin ; 1 = Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `USERNAME`, `PASSWORD`, `EMAIL`, `ADMIN`) VALUES
(1, 'AgussDiaz28', '$2y$10$A8k4TsiHgQc6cD/hrS3hleYZQFQMH/Gbdh4Vpfk7lRYadsowP9nJC', 'agussdiaz28@gmail.com', 1),
(3, 'Agustin', '$2y$10$WYOr6oF8wuYo5pfVPoX3POSUvFG3BJVzV1DEqLQeGEi6O44Y5gQly', 'adiaz28@qwavee.com', 0),
(4, 'admin', '$2y$10$dM7P9zgnkEIwNEFeFrX9K.rFgODjSrO7k0kzcZu1JThN1gwlBWJwK', 'admin@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Vuelos`
--

CREATE TABLE `Vuelos` (
  `ID_VUELO` int(11) NOT NULL,
  `ID_AEROLINEA` int(11) DEFAULT NULL,
  `ID_DESTINO` int(11) DEFAULT NULL,
  `ID_ORIGEN` int(11) DEFAULT NULL,
  `FECHA_SALIDA` date DEFAULT NULL,
  `CODIGO_VUELO` varchar(15) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Vuelos`
--

INSERT INTO `Vuelos` (`ID_VUELO`, `ID_AEROLINEA`, `ID_DESTINO`, `ID_ORIGEN`, `FECHA_SALIDA`, `CODIGO_VUELO`, `PRECIO`) VALUES
(7, 2, 3, 4, '2017-09-28', 'GL764', 4234),
(9, 4, 2, 3, '2017-09-22', 'LA9542', 14),
(11, 3, 5, 2, '2017-08-21', 'gw314', 23);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_comentarios`
-- (See below for the actual view)
--
CREATE TABLE `vw_comentarios` (
`ComentarioID` int(11)
,`DetalleComentario` text
,`ID_AEROLINEA` int(11)
,`ID_USUARIO` int(11)
,`ComentarioUsuario` varchar(30)
,`PuntajeComentario` int(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_vuelos`
-- (See below for the actual view)
--
CREATE TABLE `vw_vuelos` (
`ID_VUELO` int(11)
,`CODIGO_VUELO` varchar(15)
,`ID_AEROLINEA` int(11)
,`ID_DESTINO` int(11)
,`NOMBRE_AEROLINEA` varchar(30)
,`CIUDAD_DESTINO` varchar(20)
,`CIUDAD_ORIGEN` varchar(20)
,`ID_ORIGEN` int(11)
,`FECHA_SALIDA` date
,`PRECIO` float
);

-- --------------------------------------------------------

--
-- Structure for view `vw_comentarios`
--
DROP TABLE IF EXISTS `vw_comentarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Comentario`@`%` SQL SECURITY INVOKER VIEW `vw_comentarios`  AS  select `comentario`.`ID_COMENTARIO` AS `ComentarioID`,`comentario`.`DETALLE` AS `DetalleComentario`,`comentario`.`ID_AEROLINEA` AS `ID_AEROLINEA`,`comentario`.`ID_USUARIO` AS `ID_USUARIO`,`usuario`.`USERNAME` AS `ComentarioUsuario`,`comentario`.`puntaje` AS `PuntajeComentario` from (`comentario` join `usuario`) where (`usuario`.`ID_USUARIO` = `comentario`.`ID_USUARIO`) order by `comentario`.`Fecha` desc WITH LOCAL CHECK OPTION ;

-- --------------------------------------------------------

--
-- Structure for view `vw_vuelos`
--
DROP TABLE IF EXISTS `vw_vuelos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vuelos`  AS  select `vuelos`.`ID_VUELO` AS `ID_VUELO`,`vuelos`.`CODIGO_VUELO` AS `CODIGO_VUELO`,`aerolineas`.`ID_AEROLINEA` AS `ID_AEROLINEA`,`ciudades`.`ID_CIUDAD` AS `ID_DESTINO`,`aerolineas`.`NOMBRE_AEROLINEA` AS `NOMBRE_AEROLINEA`,`ciudades`.`NOMBRE_CIUDAD` AS `CIUDAD_DESTINO`,`Ciudades2`.`NOMBRE_CIUDAD` AS `CIUDAD_ORIGEN`,`vuelos`.`ID_ORIGEN` AS `ID_ORIGEN`,`vuelos`.`FECHA_SALIDA` AS `FECHA_SALIDA`,`vuelos`.`PRECIO` AS `PRECIO` from (((`vuelos` join `ciudades`) join `aerolineas`) join `ciudades` `Ciudades2`) where ((`vuelos`.`ID_AEROLINEA` = `aerolineas`.`ID_AEROLINEA`) and (`vuelos`.`ID_DESTINO` = `ciudades`.`ID_CIUDAD`) and (`vuelos`.`ID_ORIGEN` = `Ciudades2`.`ID_CIUDAD`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Aerolineas`
--
ALTER TABLE `Aerolineas`
  ADD PRIMARY KEY (`ID_AEROLINEA`);

--
-- Indexes for table `Ciudades`
--
ALTER TABLE `Ciudades`
  ADD PRIMARY KEY (`ID_CIUDAD`);

--
-- Indexes for table `Comentario`
--
ALTER TABLE `Comentario`
  ADD PRIMARY KEY (`ID_COMENTARIO`),
  ADD KEY `ID_AEROLINEA` (`ID_AEROLINEA`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indexes for table `Imagen`
--
ALTER TABLE `Imagen`
  ADD PRIMARY KEY (`ID_IMAGEN`),
  ADD KEY `ID_CIUDAD` (`ID_CIUDAD`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- Indexes for table `Vuelos`
--
ALTER TABLE `Vuelos`
  ADD PRIMARY KEY (`ID_VUELO`),
  ADD KEY `ID_AEROLINEA` (`ID_AEROLINEA`),
  ADD KEY `ID_DESTINO` (`ID_DESTINO`),
  ADD KEY `ID_ORIGEN` (`ID_ORIGEN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Aerolineas`
--
ALTER TABLE `Aerolineas`
  MODIFY `ID_AEROLINEA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Ciudades`
--
ALTER TABLE `Ciudades`
  MODIFY `ID_CIUDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Comentario`
--
ALTER TABLE `Comentario`
  MODIFY `ID_COMENTARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `Imagen`
--
ALTER TABLE `Imagen`
  MODIFY `ID_IMAGEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Vuelos`
--
ALTER TABLE `Vuelos`
  MODIFY `ID_VUELO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Comentario`
--
ALTER TABLE `Comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`ID_AEROLINEA`) REFERENCES `Aerolineas` (`ID_AEROLINEA`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Imagen`
--
ALTER TABLE `Imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`ID_CIUDAD`) REFERENCES `Ciudades` (`ID_CIUDAD`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Vuelos`
--
ALTER TABLE `Vuelos`
  ADD CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`ID_AEROLINEA`) REFERENCES `Aerolineas` (`ID_AEROLINEA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`ID_DESTINO`) REFERENCES `Ciudades` (`ID_CIUDAD`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelos_ibfk_3` FOREIGN KEY (`ID_ORIGEN`) REFERENCES `Ciudades` (`ID_CIUDAD`) ON DELETE CASCADE ON UPDATE CASCADE;
