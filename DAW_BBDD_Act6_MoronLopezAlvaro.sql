DROP DATABASE IF EXISTS hym_act7; 
CREATE DATABASE IF NOT EXISTS hym_act7;
USE hym_act7;

--
-- Base de datos: `hym_act7`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE almacen (
  `id_almacen` int(11) NOT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  `poblacion` varchar(128) DEFAULT NULL,
  `calle` varchar(128) DEFAULT NULL,
  `ciudad` varchar(64) DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `capacidad_total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id_almacen`, `nombre`, `poblacion`, `calle`, `ciudad`, `codigo_postal`, `capacidad_total`) VALUES
(1, 'Xiun Guan S.L', 'Carmona', 'Polígono La Isla, Calle Filosofía, 3', 'Sevilla', 41010, 45000),
(2, 'Warehouse 45', 'San Fernando', 'Calle Pinar 34', 'Cádiz', 34500, 250000),
(3, 'Tu almacén S.L', 'San Juan del Puerto', 'Calle Aplauso nº1', 'Huelva', 28040, 90000),
(4, 'BigStore S.L', 'Almería', 'Calle Energías Renovables, 49', 'Almería', 32095, NULL),
(5, 'El Corte Francés S.L', 'Valencia', 'Calle La imitación nº 45', 'Valencia', 93021, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `descripcion` varchar(128) DEFAULT NULL,
  `imagen` varchar(64) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`, `imagen`, `url`) VALUES
(1, 'Pantalones', 'Pantalones de la nueva temporada primavera-verano', 'imagen-categoria1.jpg', 'https://hym.web/pantalones'),
(2, 'Sudaderas', 'Las sudaderas que más abrigan del mercado', 'imagen-categoria2.jpg', 'https://hym.web/sudaderas'),
(3, 'Calzado', 'Calzado de todo tipo para todo tipo de ocasiones', 'imagen-categoria3.jpg', 'https://hym.web/calzado'),
(4, 'Ropa deportiva', 'Ropa para practicar tu deporte favorito', 'imagen-categoria4.jpg', 'https://hym.web/ropa-deportiva'),
(5, 'Chaquetas', 'Chaquetas para todo tipo de ocasiones', 'imagen-categoria5.jpg', 'https://hym.web/chaquetas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `forma_pago` varchar(64) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total_compra` float(20,6) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id_compra`, `forma_pago`, `fecha`, `total_compra`, `id_usuario`, `id_direccion`) VALUES
(1, 'Efectivo', '2021-05-12', 45.939999, 2, 3),
(2, 'Bizum', '2020-10-09', 59.980000, 2, 2),
(3, 'Tarjeta', '2021-01-29', 29.990000, 1, 1),
(4, 'Efectivo', '2021-11-08', 58.990002, 5, 9),
(5, 'Tarjeta', '2021-07-13', 58.000000, 6, 10),
(6, 'Bizum', '2021-12-29', 34.000000, 4, 5),
(7, 'Paypal', '2022-01-11', 88.980003, 5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `calle` varchar(128) DEFAULT NULL,
  `ciudad` varchar(64) DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `poblacion` varchar(128) DEFAULT NULL,
  `es_favorita` tinyint(1) DEFAULT 0,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `calle`, `ciudad`, `codigo_postal`, `poblacion`, `es_favorita`, `id_usuario`) VALUES
(1, 'Calle Tetuán, 3', 'Sevilla', 41001, 'Alcalá de Guadaíra', 1, 1),
(2, 'Calle Sanitarios, 33', 'Granada', 48210, 'Almuñecar', 1, 2),
(3, 'Avda Andalucía 4 Portal 2 3ºC', 'Zamora', 52320, 'Carrascal', 0, 2),
(4, 'Calle Cervantes nº1', 'Soria', 16033, 'Lubia', 1, 3),
(5, 'Calle Policarpo Sanz, 2', 'Vigo', 34055, 'Vigo', 1, 4),
(6, 'Calle Innovación, nº 89', 'Burgos', 55403, 'Aranda del Duero', 1, 5),
(7, 'Calle de la Estrella, n3 portal 2 1ºF', 'Barcelona', 68030, 'Sabadell', 1, 6),
(8, 'Calle Arrontegi, nº 12 3ºC', 'Bilbao', 87410, 'Baracaldo', 1, 7),
(9, 'Calle Bailén s/n', 'Bilbao', 94031, 'Vizcaya', 0, 5),
(10, 'Calle Carretería, 2', 'Huelva', 98212, 'Moguer', 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_pedido`
--

CREATE TABLE `linea_pedido` (
  `id_linea` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total_linea` float(20,6) DEFAULT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `linea_pedido`
--

INSERT INTO `linea_pedido` (`id_linea`, `cantidad`, `total_linea`, `id_compra`, `id_producto`) VALUES
(2, 1, 29.990000, 1, 2),
(4, 1, 29.990000, 3, 2),
(5, 1, 24.990000, 4, 3),
(6, 1, 34.000000, 4, 5),
(7, 1, 39.000000, 5, 6),
(8, 1, 19.000000, 5, 8),
(9, 1, 34.000000, 6, 7),
(10, 2, 29.990000, 7, 2),
(11, 1, 29.000000, 7, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `descripcion` varchar(128) DEFAULT NULL,
  `imagen` varchar(64) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `precio` float(20,6) DEFAULT NULL,
  `id_almacen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `imagen`, `stock`, `precio`, `id_almacen`) VALUES
(1, 'Joggers cargo de nailon', 'Joggers cargo de nailon con cintura elástica con cordón de ajuste.', 'prod1-joggersA.jpg', 45, 15.950000, 2),
(2, 'Zapatos Derby', 'Zapatos Derby con cordones abiertos. Forro y plantillas de lona. Tacón 2,5 cm', 'prod2-derbyPrin.jpg', 12, 29.990000, 1),
(3, 'Sudadera Relaxed Fit', 'Sudadera en peluche suave con bolsillo canguro y capucha con cordón de ajuste elástico', 'prod3-sudRelax.jpg', 15, 24.990000, 3),
(4, 'Sudadera con capucha relaxed fit', 'Sudadera en mezcla de algodón con capucha forrada en punto y cordón de ajuste elástico.', 'prod4-sudConCapuchaRelax.jpg', 22, 29.000000, 1),
(5, 'Chaqueta de borreguito con capucha Relaxed Fit', 'Chaqueta en borreguito suave. Modelo de corte relajado con cierre de cremallera.', 'prod5-chaqBorreguito.jpg', 4, 34.000000, 2),
(6, 'Chaqueta puffy repelente al agua', 'Chaqueta puffy guateada en tejido cortavientos, repelente al agua.', 'chaqpuffy-guat.jpg', 12, 39.000000, 3),
(7, 'Joggers de deporte', 'Joggers de deporte en punto de mezcla de algodón con detalles sellados.', 'jodders-sport1.jpg', 32, 34.000000, 2),
(8, 'Chaqueta de correr Regular Fit', 'Chaqueta de correr en punto de secado rápido para absorber el sudor y mantener el frescor durante la práctica deportiva.', 'chaqCorrer-regular.jpg', 9, 19.000000, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_categoria`
--

CREATE TABLE `producto_categoria` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto_categoria`
--

INSERT INTO `producto_categoria` (`id_producto`, `id_categoria`) VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 2),
(5, 2),
(6, 4),
(7, 4),
(8, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  `apellidos` varchar(128) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `tipo_miembro` varchar(64) DEFAULT NULL,
  `puntos_acumulados` int(11) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `fecha_ultima_visita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellidos`, `email`, `fecha_nacimiento`, `tipo_miembro`, `puntos_acumulados`, `fecha_registro`, `fecha_ultima_visita`) VALUES
(1, 'Sergio', 'Guillén Lara', 'glara@gmail.com', '2001-09-12', 'miembro', 200, '2021-01-18', '2022-01-15'),
(2, 'Carmen', 'Suárez Pérez', 'sperez@gmail.com', '1995-05-05', 'miembro-plus', 12, '2018-03-20', '2021-12-30'),
(3, 'Cristina', 'Martín Gutiérrez', 'mguti@gmail.com', '1965-02-20', 'miembro', 340, '2015-06-06', '2021-10-20'),
(4, 'Susana', 'Márquez Nadal', 'smarquez@correo.com', '2002-01-02', 'miembro', 540, '2014-01-16', '2021-12-15'),
(5, 'Marcos', 'López Sánchez', 'mlopez@yahoo.es', '2006-01-19', 'miembro-plus', 54, '2018-11-07', '2021-10-19'),
(6, 'Jesús', 'Castro Pérez', 'jcastro@hgmail.com', '1999-09-04', 'miembro', 32, '2021-11-01', '2021-11-02'),
(7, 'Marta', 'Rodríguez Requena', 'mrodriguez@hotmail.com', '1989-05-18', 'miembro-plus', 430, '2020-09-15', '2022-01-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vale_descuento`
--

CREATE TABLE `vale_descuento` (
  `id_vale` int(11) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `usado` tinyint(1) DEFAULT 0,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vale_descuento`
--

INSERT INTO `vale_descuento` (`id_vale`, `fecha_creacion`, `fecha_caducidad`, `usado`, `id_usuario`) VALUES
(1, '2022-01-14', '2022-07-14', 0, 1),
(3, '2021-05-12', '2021-11-12', 0, 1),
(4, '2021-07-06', '2022-02-18', 0, 5),
(5, '2021-06-07', '2022-02-15', 1, 6),
(6, '2020-10-12', '2021-09-09', 1, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id_almacen`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `usuario_FK3` (`id_usuario`),
  ADD KEY `direccion_FK` (`id_direccion`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `usuario_FK2` (`id_usuario`);

--
-- Indices de la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  ADD PRIMARY KEY (`id_linea`),
  ADD KEY `compra_FK` (`id_compra`),
  ADD KEY `producto_FK2` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `alamcen_FK` (`id_almacen`);

--
-- Indices de la tabla `producto_categoria`
--
ALTER TABLE `producto_categoria`
  ADD PRIMARY KEY (`id_producto`,`id_categoria`),
  ADD KEY `categoria_FK` (`id_categoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `vale_descuento`
--
ALTER TABLE `vale_descuento`
  ADD PRIMARY KEY (`id_vale`),
  ADD KEY `usuario_FK` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id_almacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  MODIFY `id_linea` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `vale_descuento`
--
ALTER TABLE `vale_descuento`
  MODIFY `id_vale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `direccion_FK` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  ADD CONSTRAINT `usuario_FK3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `usuario_FK2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  ADD CONSTRAINT `compra_FK` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  ADD CONSTRAINT `producto_FK2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `alamcen_FK` FOREIGN KEY (`id_almacen`) REFERENCES `almacen` (`id_almacen`);

--
-- Filtros para la tabla `producto_categoria`
--
ALTER TABLE `producto_categoria`
  ADD CONSTRAINT `categoria_FK` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `producto_FK` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `vale_descuento`
--
ALTER TABLE `vale_descuento`
  ADD CONSTRAINT `usuario_FK` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
  
-- 1.- Realiza una consulta y muestra todos los datos de las categorías.
SELECT * FROM categoria;

-- 2.- Realiza una consulta y muestra los datos de la calle, la población y la ciudad de todos los almacenes.
SELECT calle, poblacion, ciudad FROM almacen;

-- 3.- Obtén los datos del email y la fecha de registro de todos los usuarios.
SELECT email, fecha_registro FROM usuario;

-- 4.- Obtén la fecha de caducidad y si han sido usado o no, de todos los vales de descuento ordenado por fecha de caducidad de forma descendente.
SELECT fecha_caducidad, usado FROM vale_descuento ORDER BY fecha_caducidad DESC;

-- 5.- Obtén todas las direcciones mostrando los valores de id_direccion, ciudad e id_usuario ordenado por id_usuario de forma ascendente.
SELECT id_direccion, ciudad, id_usuario FROM direccion ORDER BY id_usuario ASC;

-- 6.- Muestra todos los datos de los productos cuyo stock sea mayor que 14.
SELECT * FROM producto WHERE stock > 14;

-- 7.- Muestra los datos de la calle, ciudad y código postal de las direcciones que no estén marcadas como favoritas.
SELECT calle, ciudad, codigo_postal FROM direccion WHERE es_favorita = 0;

-- 8.- Obtén los productos cuyo precio sea menor de 30, ordenados primero por el id_almacen y después por el nombre de forma descendente.
SELECT precio, id_almacen, nombre FROM producto
WHERE precio < 30 
ORDER BY id_almacen DESC, nombre DESC;

-- 9.- Obtén los datos de nombre y descripción de las categorías cuyo nombre empiecen por la letra ‘C’ ordenadas por el id_categoria de forma ascendente.
SELECT nombre, descripcion FROM categoria
WHERE nombre LIKE 'C%'
ORDER BY id_categoria ASC;

-- 10.- Muestra todos los datos de los almacenes ordenados alfabéticamente primero por el nombre de la calle y después por la capacidad_total de forma ascendente.
SELECT * FROM almacen
ORDER BY calle ASC, capacidad_total ASC;

-- 11.- Muestra el precio del producto más alto.
SELECT precio FROM producto
ORDER BY precio DESC
LIMIT 1;

-- 12.- Cuenta cuántos pedidos ha realizado el usuario con id_usuario 5.
SELECT COUNT(*) AS total_pedidos FROM compra
WHERE id_usuario = 5;

-- 13.- Cuenta cuántos vales descuento no han sido usados y todavía no han caducado.
SELECT COUNT(*) AS vales_sin_usar FROM vale_descuento
WHERE usado = 0 AND fecha_caducidad > CURDATE();

-- 14.- Cuenta cuántos productos contienen la palabra “Fit” en su nombre.
SELECT COUNT(*) AS producto_fit FROM producto
WHERE nombre LIKE '%Fit%';