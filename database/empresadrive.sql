-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2019 a las 18:17:51
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresadrive`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `folioDevolucion` int(11) NOT NULL,
  `fechaDevolucion` date DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `idproveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `folioPedido` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fechaVenta` date DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `ubicacion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `departamento` enum('surtido','produccion','calidad','distribucion','recibo') DEFAULT NULL,
  `descripcion` varchar(35) DEFAULT NULL,
  `fechaDeIngreso` datetime DEFAULT NULL,
  `totalProducto` int(11) DEFAULT NULL,
  `ubicacion` varchar(30) DEFAULT NULL,
  `nombreProducto` varchar(30) DEFAULT NULL,
  `lote` int(11) DEFAULT NULL,
  `factura` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `departamento`, `descripcion`, `fechaDeIngreso`, `totalProducto`, `ubicacion`, `nombreProducto`, `lote`, `factura`) VALUES
(0, 'surtido', 'valata GXCNUND935-1', '2019-09-08 00:00:00', 500, 'B214', 'valata', 12, '9000815'),
(2, 'distribucion', 'placas', '2019-09-07 00:00:00', 900, 'B265', 'PLACAS', 250, '8000567'),
(3, 'surtido', 'BALATA', '2019-09-11 06:16:17', 200, 'B214', 'GXNUD1776-O', 12, '9000815'),
(4, 'recibo', 'PLACA', '2019-09-05 13:16:00', 700, 'B457', 'GXNUND1158-IF', 588, '80006974'),
(5, 'recibo', 'PLACA', '2019-09-02 10:25:12', 8000, 'B789', 'GXCNUD436-0', 246, '5000879');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `nombreProveedor` varchar(40) DEFAULT NULL,
  `idProveedor` int(11) NOT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `idlote` int(11) DEFAULT NULL,
  `nombreEmpresa` varchar(30) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`nombreProveedor`, `idProveedor`, `idproducto`, `idlote`, `nombreEmpresa`, `telefono`) VALUES
('JUAN PEREZ', 1, 0, 13, 'WOLVERINE', 55906090),
('CARLOS HERNANDEZ', 2, 3, 14, 'COOPEL', 559877561);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo`
--

CREATE TABLE `recibo` (
  `idfolioRecibo` varchar(30) NOT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fechaCaducidad` datetime DEFAULT NULL,
  `lote` int(11) DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  `unidadTransporte` int(11) DEFAULT NULL,
  `nombreChofer` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `idRack` int(11) NOT NULL,
  `pasillo` int(11) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`folioDevolucion`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`folioPedido`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD PRIMARY KEY (`idfolioRecibo`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`idRack`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `devoluciones_ibfk_2` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD CONSTRAINT `recibo_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `ubicacion_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
