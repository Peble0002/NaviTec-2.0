-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2021 a las 03:47:44
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_helper` (IN `A` INT(50), IN `B` VARCHAR(250), IN `C` VARCHAR(250), IN `D` VARCHAR(250), IN `E` VARCHAR(250), IN `F` TEXT(250), IN `G` VARCHAR(250))  BEGIN

INSERT INTO `santa's_helper`(`ID`, `name`, `lastname_1`, `lastname_2`, `position_name`, `position_description`, `hiring_date`) VALUES (A, B, C, D, E,F, G);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_toy` (IN `a` INT(50), IN `b` VARCHAR(250), IN `c` VARCHAR(250), IN `d` INT(250), IN `e` INT(250), IN `f` VARCHAR(250), IN `g` VARCHAR(250))  BEGIN

INSERT INTO `toy`(`ID`, `name`, `description`, `cost`, `age_range`, `photo`, `category_ID`) VALUES (a,b,c,d,e,f,g);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_toy_category` (IN `a` INT(50), IN `b` VARCHAR(250), IN `c` VARCHAR(250), IN `d` VARCHAR(250))  BEGIN

INSERT INTO `toy_category`(`ID`, `name`, `description`, `state`) VALUES (a,b,c,d);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_child` (IN `i` INT(250))  BEGIN

DELETE FROM `child` WHERE ID = i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_heper` (IN `i` INT(250))  BEGIN

DELETE FROM `santa's_helper` WHERE ID = i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_toy` (IN `i` INT(250))  BEGIN

DELETE FROM `toy` WHERE ID = i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_toy_category` (IN `i` INT(250))  BEGIN

DELETE FROM `toy_category` WHERE ID = i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `read_child` (IN `i` INT(250))  BEGIN

SELECT * FROM `child` WHERE  ID = i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `read_helper` (IN `i` INT(250))  BEGIN

SELECT * FROM `santa's_helper` WHERE ID = i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `read_toy` (IN `i` INT(250))  BEGIN

SELECT * FROM `toy` WHERE ID = i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `read_toy_category` (IN `i` INT(250))  BEGIN

SELECT * FROM `toy_category` WHERE ID = i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_child` (IN `i` INT(250), IN `a` INT(50), IN `b` VARCHAR(250), IN `c` VARCHAR(250), IN `d` INT(250), IN `e` VARCHAR(250), IN `f` VARCHAR(50), IN `g` VARCHAR(250), IN `h` INT(250))  BEGIN

UPDATE `child` SET `ID`=a,`name`=b,`lastname_1`=c,`lastname_2`=d,`email`=e,`birthdate`=f,`special_needs`=g,`parent_ID`=h WHERE i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_helper` (IN `i` INT(250), IN `A` INT(50), IN `B` VARCHAR(250), IN `C` VARCHAR(250), IN `D` VARCHAR(250), IN `E` VARCHAR(250), IN `F` TEXT(250), IN `G` VARCHAR(250))  BEGIN

UPDATE `santa's_helper` SET `ID`=A ,`name`=B ,`lastname_1`=C,`lastname_2`=D,`position_name`=E,`position_description`=F,`hiring_date`=G WHERE i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_toy` (IN `i` INT(250), IN `a` INT(50), IN `b` VARCHAR(250), IN `c` VARCHAR(250), IN `d` INT(250), IN `e` INT(250), IN `f` VARCHAR(250), IN `g` VARCHAR(250))  BEGIN

UPDATE `toy` SET `ID`=a,`name`=b,`description`=c,`cost`=d,`age_range`=e,`photo`=f,`category_ID`=g WHERE i;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_toy_category` (IN `i` INT(250), IN `a` INT(50), IN `b` VARCHAR(250), IN `c` VARCHAR(250), IN `d` VARCHAR(250))  BEGIN

UPDATE `toy_category` SET `ID`=a ,`name`=b ,`description`=c,`state`= d WHERE i;

END$$

DELIMITER ;

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

--
-- Volcado de datos para la tabla `parent`
--

INSERT INTO `parent` (`ID`, `Name`, `Last_name_1`, `Last_name_2`, `email`, `Birthdate`) VALUES
(1, 'Juan', 'Pérez', 'Soto', 'juanperez2345@gmail.com', '2021-01-05');

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

--
-- Volcado de datos para la tabla `toy`
--

INSERT INTO `toy` (`ID`, `name`, `description`, `cost`, `age_range`, `photo`, `category_ID`) VALUES
(1, 'Firestation car', 'A car that emulates the car of a fireman', 12500, 1, 'Fotografía.png', 4);

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
-- Volcado de datos para la tabla `toy_category`
--

INSERT INTO `toy_category` (`ID`, `name`, `description`, `state`) VALUES
(1, 'LEGO', 'LEGO is a Danish toy company and brand known primarily for its interlocking plastic blocks. Founded in 1932 by Kristiansen, until 1949, LEGO was dedicated almost exclusively to producing wooden toys.', 'ACTIVE'),
(2, 'DOLLS', 'The dolls are toys for girls in which they can recreate some of the tasks of motherhood: change their clothes, comb them, rock them, put them to bed, etc. ... For girls, dolls are also ideal playmates.', 'ACTIVE'),
(3, 'SPORTS', 'We love sports toys, a perfect way to play sports and have a great time', 'ACTIVE'),
(4, 'CARS', 'They are very similar to real cars. There are different types: remote control, friction and drag.', 'ACTIVE'),
(5, 'ROBOTS', 'Robots use fun activities to attract childrens attention, such as: Posing challenges to solve, fun exercises, rewarding problem solving with new functions or features, through games and different didactic activities', 'ACTIVE'),
(6, 'VIDEOGAME', 'A video game is an interactive application oriented to entertainment that, through certain controls or controls, allows simulating experiences on the screen of a television, computer or other electronic device.', 'ACTIVE'),
(7, 'ELECTRONICS', 'The term \"Electronic toy\" could be defined as a preprogrammed playful device that needs electricity (whether it be mains, batteries, batteries, etc.) in order to function.', 'ACTIVE'),
(8, 'CRAFTS', 'didactic tasks in which a personal advancement, development of creativity, and are a form of recreation is sought.', 'ACTIVE'),
(9, 'BOOKS', 'Childrens literature is understood to be the literature directed towards the child reader, that is, the set of literary texts that society has considered suitable for the little ones because they can understand and enjoy it, as well as all the texts adopted by the most readers. young as their own', 'ACTIVE');

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
-- Indices de la tabla `canton/city`
--
ALTER TABLE `canton/city`
  ADD PRIMARY KEY (`code`),
  ADD KEY `country_code` (`country_code`,`province_code`),
  ADD KEY `province_code` (`province_code`);

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
  ADD PRIMARY KEY (`code`);

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
-- Indices de la tabla `state/province`
--
ALTER TABLE `state/province`
  ADD PRIMARY KEY (`code`),
  ADD KEY `country_code` (`country_code`);

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
-- Filtros para la tabla `canton/city`
--
ALTER TABLE `canton/city`
  ADD CONSTRAINT `canton/city_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`) ON UPDATE CASCADE,
  ADD CONSTRAINT `canton/city_ibfk_2` FOREIGN KEY (`province_code`) REFERENCES `state/province` (`code`) ON UPDATE CASCADE;

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
-- Filtros para la tabla `state/province`
--
ALTER TABLE `state/province`
  ADD CONSTRAINT `state/province_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `toy`
--
ALTER TABLE `toy`
  ADD CONSTRAINT `toy_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `toy_category` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
