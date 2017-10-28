-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 28, 2017 at 04:15 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `turismo`
--

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
(11, 3, 5, 2, '2017-08-21', 'gw314', 25984),
(12, 6, 3, 6, '2017-09-08', 'Q984', 4213);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `Vuelos`
--
ALTER TABLE `Vuelos`
  MODIFY `ID_VUELO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
