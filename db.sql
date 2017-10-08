-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 08, 2017 at 06:13 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `db_turismo`
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
(1, 'LATAM', 'CHILE', 340),
(2, 'GOL', 'BRASIL', 230),
(3, 'EMIRATES', 'EMIRATOS ARABES', 460),
(4, 'AIR CANADA', 'CANADA', 370);

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
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(500) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `USERNAME`, `PASSWORD`, `EMAIL`) VALUES
(1, 'AgussDiaz28', '$2y$10$A8k4TsiHgQc6cD/hrS3hleYZQFQMH/Gbdh4Vpfk7lRYadsowP9nJC', 'agussdiaz28@gmail.com');

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
(3, 1, 1, 2, '2017-09-22', 'LA321', 174943),
(7, 2, 3, 4, '2017-09-28', 'GL764', 4234),
(8, 1, 6, 5, '2017-09-22', 'LT653', 323),
(9, 4, 2, 3, '2017-09-22', 'LA9542', 23214),
(10, 1, 4, 2, '2017-09-21', 'LA431', 13980),
(11, 3, 5, 2, '2017-08-21', 'gw314', 25984);

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
  MODIFY `ID_AEROLINEA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Ciudades`
--
ALTER TABLE `Ciudades`
  MODIFY `ID_CIUDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Vuelos`
--
ALTER TABLE `Vuelos`
  MODIFY `ID_VUELO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Vuelos`
--
ALTER TABLE `Vuelos`
  ADD CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`ID_AEROLINEA`) REFERENCES `Aerolineas` (`ID_AEROLINEA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`ID_DESTINO`) REFERENCES `Ciudades` (`ID_CIUDAD`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelos_ibfk_3` FOREIGN KEY (`ID_ORIGEN`) REFERENCES `Ciudades` (`ID_CIUDAD`) ON DELETE CASCADE ON UPDATE CASCADE;
