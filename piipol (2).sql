-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2021 a las 22:00:04
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `piipol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID_CAT` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `NOM_CAT` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `ID_COM` int(11) NOT NULL,
  `ID_PUB` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `TEXT_COM` text DEFAULT NULL,
  `TIME_COM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lives`
--

CREATE TABLE `lives` (
  `ID_LIV` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `NOM_LIV` varchar(25) DEFAULT NULL,
  `TIME_LIV` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `ID_MESS` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `EMI_MESS` varchar(50) DEFAULT NULL,
  `TEXT_MESS` varchar(500) DEFAULT NULL,
  `TIME_MESS` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `ID_NOT` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `NOM_NOT` varchar(50) DEFAULT NULL,
  `TIME_NOT` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paypal`
--

CREATE TABLE `paypal` (
  `ID_PAY` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `CUEN_PAY` int(11) DEFAULT NULL,
  `SALD_PAY` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `ID_PRE` int(11) NOT NULL,
  `NICK_US` varchar(25) NOT NULL,
  `PREG1` varchar(25) NOT NULL,
  `PREG2` varchar(25) NOT NULL,
  `PREG3` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `ID_PUB` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `TEXT_PUB` varchar(50) DEFAULT NULL,
  `FILE_PUB` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regalos`
--

CREATE TABLE `regalos` (
  `ID_REG` int(11) NOT NULL,
  `ID_PUB` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `TIP_REG` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `ID_USER` int(11) NOT NULL,
  `ID_CAT` int(11) DEFAULT NULL,
  `ID_PAY` int(11) DEFAULT NULL,
  `NOM_US` varchar(50) DEFAULT NULL,
  `APEL_US` varchar(20) DEFAULT NULL,
  `EDAD_US` int(11) DEFAULT NULL,
  `GENERO_US` varchar(25) NOT NULL,
  `PAIS` varchar(30) DEFAULT NULL,
  `NICK_US` varchar(25) DEFAULT NULL,
  `EMAIL_US` char(50) DEFAULT NULL,
  `PASS_US` char(16) DEFAULT NULL,
  `FOTO_US` varchar(70) DEFAULT NULL,
  `NombreFoto` varchar(50) NOT NULL,
  `Activacion` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_CAT`),
  ADD KEY `FK_TIENE_CAT2` (`ID_USER`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`ID_COM`),
  ADD KEY `FK_HACE_COM` (`ID_USER`),
  ADD KEY `FK_RECIBE_COM` (`ID_PUB`);

--
-- Indices de la tabla `lives`
--
ALTER TABLE `lives`
  ADD PRIMARY KEY (`ID_LIV`),
  ADD KEY `FK_HACE_LIVE` (`ID_USER`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`ID_MESS`),
  ADD KEY `FK_RECIBE_MEN` (`ID_USER`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`ID_NOT`),
  ADD KEY `FK_RECIBE_NOT` (`ID_USER`);

--
-- Indices de la tabla `paypal`
--
ALTER TABLE `paypal`
  ADD PRIMARY KEY (`ID_PAY`),
  ADD KEY `FK_INSERTA_PAY2` (`ID_USER`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`ID_PRE`),
  ADD UNIQUE KEY `NICK_US` (`NICK_US`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`ID_PUB`),
  ADD KEY `FK_HACE_PUB` (`ID_USER`);

--
-- Indices de la tabla `regalos`
--
ALTER TABLE `regalos`
  ADD PRIMARY KEY (`ID_REG`),
  ADD KEY `FK_HACE_REG` (`ID_USER`),
  ADD KEY `FK_RECIBE_REG` (`ID_PUB`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`),
  ADD UNIQUE KEY `NICK_US` (`NICK_US`),
  ADD KEY `FK_INSERTA_PAY` (`ID_PAY`),
  ADD KEY `FK_TIENE_CAT` (`ID_CAT`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID_CAT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `ID_COM` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lives`
--
ALTER TABLE `lives`
  MODIFY `ID_LIV` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `ID_MESS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `ID_NOT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paypal`
--
ALTER TABLE `paypal`
  MODIFY `ID_PAY` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `ID_PRE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `ID_PUB` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `regalos`
--
ALTER TABLE `regalos`
  MODIFY `ID_REG` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `FK_TIENE_CAT2` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FK_HACE_COM` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`),
  ADD CONSTRAINT `FK_RECIBE_COM` FOREIGN KEY (`ID_PUB`) REFERENCES `publicaciones` (`ID_PUB`);

--
-- Filtros para la tabla `lives`
--
ALTER TABLE `lives`
  ADD CONSTRAINT `FK_HACE_LIVE` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `FK_RECIBE_MEN` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `FK_RECIBE_NOT` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Filtros para la tabla `paypal`
--
ALTER TABLE `paypal`
  ADD CONSTRAINT `FK_INSERTA_PAY2` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`NICK_US`) REFERENCES `user` (`NICK_US`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `FK_HACE_PUB` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Filtros para la tabla `regalos`
--
ALTER TABLE `regalos`
  ADD CONSTRAINT `FK_HACE_REG` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`),
  ADD CONSTRAINT `FK_RECIBE_REG` FOREIGN KEY (`ID_PUB`) REFERENCES `publicaciones` (`ID_PUB`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_INSERTA_PAY` FOREIGN KEY (`ID_PAY`) REFERENCES `paypal` (`ID_PAY`),
  ADD CONSTRAINT `FK_TIENE_CAT` FOREIGN KEY (`ID_CAT`) REFERENCES `categoria` (`ID_CAT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
