-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2020 a las 20:20:42
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int(2) NOT NULL,
  `name` varchar(17) NOT NULL,
  `address` tinytext NOT NULL,
  `lat` decimal(10,6) NOT NULL,
  `lng` decimal(10,6) NOT NULL,
  `kind_food` set('Mediterranean','Seafood','Vegetarian','Catalan cuisine','Asian cuisine') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `kind_food`) VALUES
(1, 'Can Ros', 'Almirall Aixada, 7, La Barceloneta (Barcelona - 08003)', '41.377342', '2.189375', 'Mediterranean,Seafood'),
(2, 'Chicha Limoná', 'Passeig de Sant Joan, 80 (Barcelona - 08009)', '41.397522', '2.172600', 'Mediterranean'),
(3, 'Windsor', 'Còrsega, 286, Eixample Esquerre (Barcelona - 08008)', '41.394597', '2.157233', 'Catalan cuisine'),
(4, 'Lluritu', 'Torrent de les Flors, 71 (Barcelona - 08024)', '41.406728', '2.159600', 'Seafood'),
(5, 'Marimorena BCN', 'Loreto, 24-26, Esquerra de l\'Eixample (Barcelona - 08029)', '41.389805', '2.142218', 'Vegetarian,Catalan cuisine'),
(6, 'Barraca', 'Passeig Marítim, 1, La Barceloneta (Barcelona - 08003)', '41.379067', '2.191931', 'Seafood,Vegetarian'),
(7, 'Colella', 'Pau Claris, 190, Dreta de l\'Eixample (Barcelona - 08037)', '41.396650', '2.162154', 'Mediterranean,Catalan cuisine'),
(8, 'Indochine Ly Leap', 'Muntaner, 82, Eixample Esquerre (Barcelona - 08011)', '41.387918', '2.157885', 'Asian cuisine'),
(9, 'Spicy', 'Borrell, 41 (Barcelona - 08015)', '41.377081', '2.162801', 'Asian cuisine'),
(10, 'Gutai BCN', 'Mallorca, 196 (Barcelona - 08036)', '41.390010', '2.157865', 'Asian cuisine');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
