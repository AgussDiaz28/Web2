-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 15, 2017 at 09:52 PM
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
  `NOMBRE_AEROLINEA` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Ciudades`
--

CREATE TABLE `Ciudades` (
  `ID_CIUDAD` int(11) NOT NULL,
  `NOMBRE_CIUDAD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `ID_AEROLINEA` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Ciudades`
--
ALTER TABLE `Ciudades`
  MODIFY `ID_CIUDAD` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Vuelos`
--
ALTER TABLE `Vuelos`
  MODIFY `ID_VUELO` int(11) NOT NULL AUTO_INCREMENT;
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
