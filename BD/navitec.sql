-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2021 a las 09:37:20
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `navitec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attended_letter`
--

CREATE TABLE `attended_letter` (
  `letter_ID` int(50) NOT NULL,
  `helper_ID` int(50) NOT NULL,
  `date` date NOT NULL,
  `total_cost` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `behavior report`
--

CREATE TABLE `behavior report` (
  `ID` int(50) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `kind_behavior` varchar(250) NOT NULL,
  `child_ID` int(50) NOT NULL,
  `parent_ID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canton/city`
--

CREATE TABLE `canton/city` (
  `country_code` int(50) NOT NULL,
  `province_code` int(50) NOT NULL,
  `code` int(50) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `child`
--

CREATE TABLE `child` (
  `ID` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname_1` varchar(100) NOT NULL,
  `lastname_2` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `birthdate` date NOT NULL,
  `special_needs` text NOT NULL,
  `parent_ID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `child_address`
--

CREATE TABLE `child_address` (
  `child_ID` int(50) NOT NULL,
  `country_code` int(50) NOT NULL,
  `province_code` int(50) NOT NULL,
  `canton_code` int(50) NOT NULL,
  `exact_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE `country` (
  `code` int(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `tel_prefix` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `new_toy`
--

CREATE TABLE `new_toy` (
  `ID` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(250) NOT NULL,
  `category_ID` int(50) NOT NULL,
  `letter_ID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parent`
--

CREATE TABLE `parent` (
  `ID` int(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Last_name_1` varchar(100) NOT NULL,
  `Last_name_2` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `Birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parent_address`
--

CREATE TABLE `parent_address` (
  `parent_ID` int(100) NOT NULL,
  `country_code` int(50) NOT NULL,
  `province_code` int(50) NOT NULL,
  `canton_code` int(50) NOT NULL,
  `exact_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parent_phonelist`
--

CREATE TABLE `parent_phonelist` (
  `phone_number` int(8) NOT NULL,
  `ID` int(11) NOT NULL,
  `parent_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requested_toy`
--

CREATE TABLE `requested_toy` (
  `letter_ID` int(50) NOT NULL,
  `toy_ID` int(50) NOT NULL,
  `state` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `santa's letter`
--

CREATE TABLE `santa's letter` (
  `ID` int(50) NOT NULL,
  `letter` text NOT NULL,
  `state` varchar(50) NOT NULL,
  `child_ID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `santa's_helper`
--

CREATE TABLE `santa's_helper` (
  `ID` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname_1` varchar(100) NOT NULL,
  `lastname_2` varchar(100) NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `position_description` text NOT NULL,
  `hiring_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state/province`
--

CREATE TABLE `state/province` (
  `country_code` int(50) NOT NULL,
  `code` int(50) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `toy`
--

CREATE TABLE `toy` (
  `ID` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `cost` int(250) NOT NULL,
  `age_range` int(100) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `category_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `toy_category`
--

CREATE TABLE `toy_category` (
  `ID` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `state` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `attended_letter`
--
ALTER TABLE `attended_letter`
  ADD KEY `letter_ID` (`letter_ID`,`helper_ID`),
  ADD KEY `helper_ID` (`helper_ID`);

--
-- Indices de la tabla `behavior report`
--
ALTER TABLE `behavior report`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `child_ID` (`child_ID`,`parent_ID`),
  ADD KEY `parent_ID` (`parent_ID`);

--
-- Indices de la tabla `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `parent_ID` (`parent_ID`);

--
-- Indices de la tabla `child_address`
--
ALTER TABLE `child_address`
  ADD KEY `country_code` (`country_code`),
  ADD KEY `child_ID` (`child_ID`,`province_code`,`canton_code`);

--
-- Indices de la tabla `country`
--
ALTER TABLE `country`
  ADD KEY `code` (`code`);

--
-- Indices de la tabla `new_toy`
--
ALTER TABLE `new_toy`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `category_ID` (`category_ID`,`letter_ID`),
  ADD KEY `letter_ID` (`letter_ID`);

--
-- Indices de la tabla `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `parent_address`
--
ALTER TABLE `parent_address`
  ADD KEY `parent_ID` (`parent_ID`,`country_code`,`province_code`,`canton_code`);

--
-- Indices de la tabla `parent_phonelist`
--
ALTER TABLE `parent_phonelist`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `parent_ID` (`parent_ID`);

--
-- Indices de la tabla `requested_toy`
--
ALTER TABLE `requested_toy`
  ADD KEY `letter_ID` (`letter_ID`,`toy_ID`),
  ADD KEY `toy_ID` (`toy_ID`);

--
-- Indices de la tabla `santa's letter`
--
ALTER TABLE `santa's letter`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `child_ID` (`child_ID`);

--
-- Indices de la tabla `santa's_helper`
--
ALTER TABLE `santa's_helper`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `toy`
--
ALTER TABLE `toy`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `category_ID` (`category_ID`);

--
-- Indices de la tabla `toy_category`
--
ALTER TABLE `toy_category`
  ADD PRIMARY KEY (`ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `attended_letter`
--
ALTER TABLE `attended_letter`
  ADD CONSTRAINT `attended_letter_ibfk_1` FOREIGN KEY (`helper_ID`) REFERENCES `santa's_helper` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `attended_letter_ibfk_2` FOREIGN KEY (`letter_ID`) REFERENCES `santa's letter` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `behavior report`
--
ALTER TABLE `behavior report`
  ADD CONSTRAINT `behavior report_ibfk_1` FOREIGN KEY (`child_ID`) REFERENCES `child` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `behavior report_ibfk_2` FOREIGN KEY (`parent_ID`) REFERENCES `parent` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `child`
--
ALTER TABLE `child`
  ADD CONSTRAINT `child_ibfk_1` FOREIGN KEY (`parent_ID`) REFERENCES `parent` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `child_address`
--
ALTER TABLE `child_address`
  ADD CONSTRAINT `child_address_ibfk_1` FOREIGN KEY (`child_ID`) REFERENCES `child` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `new_toy`
--
ALTER TABLE `new_toy`
  ADD CONSTRAINT `new_toy_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `toy_category` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `new_toy_ibfk_2` FOREIGN KEY (`letter_ID`) REFERENCES `santa's letter` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `parent_phonelist`
--
ALTER TABLE `parent_phonelist`
  ADD CONSTRAINT `parent_phonelist_ibfk_1` FOREIGN KEY (`parent_ID`) REFERENCES `parent` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `requested_toy`
--
ALTER TABLE `requested_toy`
  ADD CONSTRAINT `requested_toy_ibfk_1` FOREIGN KEY (`toy_ID`) REFERENCES `toy` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `requested_toy_ibfk_2` FOREIGN KEY (`letter_ID`) REFERENCES `santa's letter` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `santa's letter`
--
ALTER TABLE `santa's letter`
  ADD CONSTRAINT `santa's letter_ibfk_1` FOREIGN KEY (`child_ID`) REFERENCES `child` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `toy`
--
ALTER TABLE `toy`
  ADD CONSTRAINT `toy_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `toy_category` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
