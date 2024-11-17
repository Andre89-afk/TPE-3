-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2024 a las 22:43:00
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comple2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bolsos`
--

CREATE TABLE `bolsos` (
  `id_bolso` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Color` varchar(255) NOT NULL,
  `Precio` decimal(65,0) NOT NULL,
  `id_categoria` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bolsos`
--

INSERT INTO `bolsos` (`id_bolso`, `Nombre`, `Color`, `Precio`, `id_categoria`) VALUES
(91, 'Jackie Ara', 'Rojo', 999999, 3),
(92, 'Salvatore Ferragamo JOAN CALLARISSA', 'Negro', 599999, 4),
(93, 'Cleo Ara', 'Amarillo', 212121, 7),
(94, 'Carine Ara', 'Blanco', 3333333, 8),
(95, 'Birkin Ara', 'Blanco', 44444444, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito-bolsos`
--

CREATE TABLE `carrito-bolsos` (
  `id_carrito` int(11) NOT NULL,
  `id_bolso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `Categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `Categoria`) VALUES
(3, 'Bolso de Hombro'),
(4, 'Bolsos de Fiesta'),
(7, 'Bolso de viaje'),
(8, 'Bolso de Mano'),
(9, 'Mochila'),
(10, 'Bolso Billetera'),
(11, 'Bolso de Cinturón ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Nacimiento` date NOT NULL,
  `Rol` varchar(65) NOT NULL DEFAULT 'usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `Nombre`, `Contraseña`, `Email`, `Nacimiento`, `Rol`) VALUES
(23, 'admin', '$2y$10$BeMG/VRJxWX75E3Dqap2FuzM.6hK0ttjZaRoSPACjZ51UXqGf4p0W', 'admin@admin.com', '0001-01-01', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bolsos`
--
ALTER TABLE `bolsos`
  ADD PRIMARY KEY (`id_bolso`),
  ADD KEY `fk_categoria` (`id_categoria`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `carrito-bolsos`
--
ALTER TABLE `carrito-bolsos`
  ADD UNIQUE KEY `id_carrito` (`id_carrito`,`id_bolso`),
  ADD KEY `id_bolso` (`id_bolso`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Email_2` (`Email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bolsos`
--
ALTER TABLE `bolsos`
  MODIFY `id_bolso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bolsos`
--
ALTER TABLE `bolsos`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carrito-bolsos`
--
ALTER TABLE `carrito-bolsos`
  ADD CONSTRAINT `carrito-bolsos_ibfk_1` FOREIGN KEY (`id_bolso`) REFERENCES `bolsos` (`id_bolso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `carrito-bolsos_ibfk_2` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
