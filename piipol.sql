-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2021 a las 21:13:56
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.27

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

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`ID_COM`, `ID_PUB`, `ID_USER`, `TEXT_COM`, `TIME_COM`) VALUES
(1, 35, 15, 'HOLA COMO ESTAS ', '2021-04-01 15:37:53');

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
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `ID_PUB` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `TEXT_PUB` varchar(50) DEFAULT NULL,
  `FILE_PUB` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`ID_PUB`, `ID_USER`, `TEXT_PUB`, `FILE_PUB`) VALUES
(35, 15, 'adasd', 'dolarizacion.jpg'),
(36, 15, 'adasd', 'dolarizacion.jpg'),
(37, 15, 'asd', 'estetocopio.png'),
(40, 15, 'fgh', 'Ã­ndice.jpg'),
(41, 15, 'vcv', 'dolarizacion.jpg'),
(42, 15, 'nhgn', 'bancapublica.jpg');

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
  `PAIS` varchar(30) DEFAULT NULL,
  `NICK_US` varchar(25) DEFAULT NULL,
  `EMAIL_US` char(50) DEFAULT NULL,
  `PASS_US` char(16) DEFAULT NULL,
  `FOTO_US` varchar(70) DEFAULT NULL,
  `NombreFoto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`ID_USER`, `ID_CAT`, `ID_PAY`, `NOM_US`, `APEL_US`, `EDAD_US`, `PAIS`, `NICK_US`, `EMAIL_US`, `PASS_US`, `FOTO_US`, `NombreFoto`) VALUES
(15, NULL, NULL, 'mauricio', 'junia', 22, 'ALEMANIA', 'mau', 'maujunia@gmail.com', '12345', 'C:/PIIPOL/web/imagen/imgfin.PNG', 'imgfin.PNG'),
(16, NULL, NULL, 'jorge', 'jun', 22, 'FRANCIA', 'llor', 'jorsad', '12345', 'C:/PIIPOL/web/imagen/img.jpg', 'img.jpg'),
(17, NULL, NULL, 'jorge', 'jun', 22, 'FRANCIA', 'llor', 'jorsad', '12345', 'C:/PIIPOL/web/imagen/img.jpg', 'img.jpg'),
(18, NULL, NULL, 'asd', 'vf', 20, 'ALEMANIA', 'ccd', 'asdas', '123', 'C:/PIIPOL/web/imagen/img2.jpg', 'img2.jpg'),
(19, NULL, NULL, 'tier', 'asd', 25, 'ECUADOR', 'asd', 'as', '12345', '../imagen/img2.jpg', 'img2.jpg'),
(22, NULL, NULL, 'san', 'san', 21, 'ECUADOR', 'san', 'san', 'san', 'C:/PIIPOL/build/web/imagen/dolarizacion.jpg', 'dolarizacion.jpg'),
(23, NULL, NULL, 'carlos', 'asd', 23, 'ECUADOR', 'calr', 'car@gmail.com', 'car', 'C:/PIIPOL/build/web/imagen/dolarizacion.jpg', 'dolarizacion.jpg');

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
  MODIFY `ID_COM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `ID_PUB` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `regalos`
--
ALTER TABLE `regalos`
  MODIFY `ID_REG` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
