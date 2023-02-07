-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-02-2023 a las 12:36:50
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tiendagame_v2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `Nombre`) VALUES
(1, 'Videojuegos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `Dni` char(9) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idCompra` int(11) NOT NULL,
  `idPago` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `FechaCompra` date NOT NULL,
  `PagoTotal` double NOT NULL,
  `Estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compra`
--

CREATE TABLE `detalles_compra` (
  `idProducto` int(11) NOT NULL,
  `idCompra` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL,
  `PagoFinal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE `plataforma` (
  `idPlataforma` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plataforma`
--

INSERT INTO `plataforma` (`idPlataforma`, `Nombre`) VALUES
(1, 'Playstation');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `FotoURL` varchar(255) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Precio` double NOT NULL,
  `Stock` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idPlataforma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Nombre`, `FotoURL`, `Descripcion`, `Precio`, `Stock`, `idCategoria`, `idPlataforma`) VALUES
(1, 'Grand Theft Auto V', 'https://i.3djuegos.com/juegos/5065/grand_theft_auto_v/fotos/ficha/grand_theft_auto_v-2654943.jpg', 'Cuando un joven estafador callejero, un ladrón de bancos retirado y un psicópata aterrador se ven involucrados con lo peor y más desquiciado del mundo criminal, el gobierno de los EE. UU. y la industria del espectáculo, deberán llevar a cabo una serie de peligrosos golpes para sobrevivir en una ciudad implacable en la que no pueden confiar en nadie. Y mucho menos los unos en los otros.', 20.99, 100, 1, 1),
(2, 'Red Dead Redemption 2', 'https://cdn.cdkeys.com/700x700/media/catalog/product/f/i/fifa-22-pc-game-origin-cover_4_.jpg', 'De los creadores de Grand Theft Auto V y Red Dead Redemption, Red Dead Redemption 2 es una historia épica sobre la vida en América en el umbral de una nueva era. Red Dead Redemption 2 es un videojuego de acción-aventura western, en un mundo abierto y en perspectiva de primera y tercera persona, con componentes para un jugador y multijugador.', 49.99, 200, 1, 1),
(3, 'Call of Duty Modern Warfare II', 'https://cdn-products.eneba.com/resized-products/4FTGL0Ta9wnP4dqoBDEEE91a45upnnRDxUHIpKNwvIA_350x200_1x-0.jpeg', 'CallofDuty: Modern Warfare II es la secuela del exitoso Modern Warfare de 2019. Vuelve el icónico capitán John Price, líder del equipo, el intrépido John \"Soap\" MacTavish, el veterano sargento Kyle \"Gaz\" Garricky el único e inimitable Simon \"Ghost\" Riley, el lobo solitario favorito de los fans, en donde los jugadores podrán presenciar cómo la Fuerza Operativa 141 se convierte en el legendario pelotón que es hoy en día.', 69.99, 200, 1, 1),
(4, 'FIFA 20', 'https://m.media-amazon.com/images/I/61z86Ib5r1L._AC_SL1000_.jpg', 'Con EA SPORTS VOLTA, la cultura y la creatividad propias del fútbol a escala urbana vuelven por todo lo alto. Crea tu personaje, expresa tu estilo y juega a varios tipos de fútbol de estilo libre en entornos de todo el mundo.', 12.99, 200, 1, 1),
(5, 'Mortal Kombat 11', 'https://store-images.s-microsoft.com/image/apps.9688.70804610839547354.8da93c46-fd13-4b16-8ebe-e8e02c53d93e.09c2e91e-28bd-4f6f-bfd6-79d6b241667a', 'Continúa la legendaria saga Mortal Kombat en su 25º Aniversario con una nueva historia y nuevas cinemáticas. Los jugadores podrán jugar con una gran variedad de personajes del pasado y el presente en esta nueva aventura que desafía al tiempo para enfrentar a Raiden contra Kronika, el Guardián del Tiempo que creó la existencia en los albores de la historia.', 29.99, 200, 1, 1),
(6, 'NBA 2K20', 'https://upload.wikimedia.org/wikipedia/en/e/e9/NBA_2K20_cover.png', 'NBA 2K20 para PlayStation 4, Xbox One y Nintendo Switch vuelve a sentar las bases del género, con gráficos más realistas, nuevos modos de juego y controles personalizados sin igual. Este año la estrella de nuestra portada es Anthony Davis que tras su paso por New Orleans Pelicans da un paso al frente y se convierte junto a Lebron James en jugador franquicia de unos Lakers que lucharán por todo esta temporada.', 14.99, 0, 1, 1),
(7, 'Minecraft', 'https://www.minecraft.net/content/dam/games/minecraft/key-art/Games_Subnav_Minecraft-300x465.jpg', 'Minecraft es un juego de colocación de bloques y aventuras. Explora mundos generados aleatoriamente y construye cosas increíbles, desde el más humilde de los hogares hasta el más espléndido castillo. Juega en el modo creativo con recursos ilimitados o profundiza en el mundo del juego en el modo supervivencia fabricando armas y armaduras para defenderte.', 20.99, 200, 1, 1),
(8, 'The Legend of Zelda: Breath of the Wild', 'https://upload.wikimedia.org/wikipedia/en/c/c6/The_Legend_of_Zelda_Breath_of_the_Wild.jpg', 'Producido por Eiji Aonuma, The Legend of Zelda: Breath of the Wild te sumergirá en un mundo de descubrimiento con un impresionante estilo artístico similar a The Wind Waker o Skyward Sword, una cautivadora banda sonora y una intrigante y melancólica historia. Despierta tras un siglo de letargo, adéntrate en el Hyrule más amplio y abierto jamás creado por las tres grandes Diosas y forja tu propio camino con el orden y aventuras que quieras.', 45.95, 200, 1, 1),
(9, 'Super Mario Odyssey', 'https://static.posters.cz/image/750/posters/super-mario-odyssey-collage-i50045.jpg', 'Acompaña a Mario en una aventura en 3D enorme por todo el planeta usando sus nuevas habilidades para recoger lunas que servirán de combustible a tu aeronave, la Odyssey. ¡Y entretanto, rescata a la princesa Peach de las garras de Bowser!', 49.99, 200, 1, 1),
(10, 'Tom Clancy\'s Rainbow Six Siege', 'https://cdn1.epicgames.com/offer/carnation/Carousel_BoxArt_1200x1600_1200x1600-6888b9d57181d8fcfb3472a7f70ecc49', 'Compra el juego Rainbow Six Siege, inspirado en el día a día de los grupos de operaciones especiales antiterroristas de todo el mundo, Rainbow Six Siege te invita a dominar el arte de la destrucción. Intensísimos combates cuerpo a cuerpo, habilidades letales, táctica, juego en equipo y una acción explosiva son la clave de la experiencia que ofrece este juego.', 19.99, 200, 1, 1),
(11, 'Assasin\'s Creed Valhalla', 'https://cdn1.epicgames.com/400347196e674de89c23cc2a7f2121db/offer/AC%20KINGDOM%20PREORDER_STANDARD%20EDITION_EPIC_Key_Art_Portrait_640x854-640x854-288120c5573756cb988b6c1968cebd86.png', 'En Assassin\'s Creed Valhalla encarnarás a Eivor, una feroz leyenda vikinga criada entre historias de batallas y gloria. Explora un hermoso mundo abierto y cambiante ambientado en la despiadada Inglaterra de los años oscuros. Saquea a tus enemigos, haz prosperar tu asentamiento y consolida tu poder político mientras luchas por ganarte un sitio entre los dioses en el Valhalla', 30.95, 200, 1, 1),
(12, 'God of War', 'https://cdn1.epicgames.com/offer/3ddd6a590da64e3686042d108968a6b2/EGS_GodofWar_SantaMonicaStudio_S2_1200x1600-fbdf3cbc2980749091d52751ffabb7b7_1200x1600-fbdf3cbc2980749091d52751ffabb7b7', 'Compra God of War Ragnarok  para PlayStation 4, vuelve el clásico de acción a tu consola, revive las aventuras junto al Dios de la Guerra y su hijo explorando paisajes mitológicos increíbles, viajando por los nueve reinos y enfrentandose a nuevos desafíos con imponentes enemigos.', 42.99, 200, 1, 1),
(13, 'The Last of Us Parte II', 'https://static.posters.cz/image/1300/posters/the-last-of-us-2-ellie-i76718.jpg', 'Cinco años después de su peligroso viaje a través de unos Estados Unidos devastados, Ellie y Joel se han asentado en Jackson, Wyoming. Vivir en una próspera comunidad de supervivientes les ha otorgado paz y estabilidad a pesar de la amenaza constante que suponen los peligrosos enemigos.', 39.99, 200, 1, 1),
(14, 'Marvel\'s Spider-Man', 'https://cdn1.epicgames.com/offer/4bc43145bb8245a5b5cc9ea262ffbe0e/EGS_MarvelsSpiderManRemastered_InsomniacGamesNixxesSoftware_S2_1200x1600-76424286902489f4d9639ac9b735c2b2', 'Compra Marvel\'s Spider-Man, una historia de acción, mundo abierto y parkour del héroe arácnido de Nueva York, completamente nueva y auténtica. Este no es el Spider-Man que conocías ni el que has visto en las pelis, el hombre araña, es un Peter Parker experimentado que domina mucho más la lucha contra la delincuencia de Nueva York.\r\n', 29.99, 200, 1, 1),
(15, 'Resident Evil 2: Deluxe Edition', 'https://cdn-products.eneba.com/resized-products/a2pjQsMs6Ymob4c3wlzI_Jc76cLGeR_IBDBStexl06E_350x200_1x-0.jpeg', 'El rey del survival horror regresa con un lavado de cara en este remake del título de culto. Un brote vírico ha desatado el terror sobre una pequeña ciudad de Estados Unidos. Los muertos parecen volver a la vida y su único objetivo es alimentarse de carne fresca. Entre el caos, Leon S. Kennedy, un poli novato, y Claire Redfield, una estudiante en busca de su hermano desaparecido, se encontrarán con una pesadilla como jamás habían imaginado.', 64.95, 5, 1, 1),
(16, 'Death Stranding', 'https://cdn1.epicgames.com/offer/0a9e3c5ab6684506bd624a849ca0cf39/EGS_DeathStrandingDirectorsCut_KOJIMAPRODUCTIONS_S4_1200x1600-5f99e16507795f9b497716b470cfd876', 'Embárcate en un viaje como nunca antes has visto de la mano del legendario creador Hideo Kojima con Death Stranding para PlayStation 4. Como Sam Porter Bridges, deberéis salvar las diferencias en la sociedad y, al hacerlo, crear nuevos lazos o strands con otros jugadores de todo el mundo. A través de vuestra propia experiencia en el juego.\r\n', 9.99, 200, 1, 1),
(17, 'Dark Souls III', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL8BddvMrL45loZZo_hWIfICt-spjsaDns1Q&usqp=CAU', 'Hazte en GAME con lo nuevo de DARK SOULS, la última obra dirigida por Hidetaka Miyazaki nos adentrará en una aventura llena de temibles bestias, trampas peligrosas y secretos ocultos. Esta entrega mantiene sus señas de identidad propias de la saga tales como los combates con espadas, dominio de la brujería o su sistema de juego de rol y acción.\r\n', 19.99, 200, 1, 1),
(18, 'Destiny 2', 'https://upload.wikimedia.org/wikipedia/en/0/05/Destiny_2_%28artwork%29.jpg', 'Regresa al universo online de Bungie con Destiny 2 para PlayStation 4, Xbox One y PC. Una nueva amenaza aparece en el horizonte y tus habilidades como guardián son requeridas de nuevo. La saga vuelve con más fuerza con Destiny 2, continuación del aclamado shooter multijugador de Bungie en un título mucho más grande y ambicioso que su predecesor.', 27.95, 200, 1, 1),
(19, 'Borderlands 3', 'https://s.yimg.com/ny/api/res/1.2/3Ag0Gnniev1ch90P1jYvmw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MA--/https://media.zenfs.com/es/levelup_525/927ab49e8bd64a189181000acd2686ed', 'Vence a la secta de los siameses Calypso para evitar que unan a los clanes de bandidos y se hagan con el poder supremo de la galaxia. Solo tú, un buscacámaras que quiere emociones fuertes, tiene el arsenal y los aliados que hacen falta para acabar con ellos.', 49.99, 200, 1, 1),
(20, 'The Witcher 3: Wild Hunt', 'https://i.3djuegos.com/juegos/9592/the_witcher_3/fotos/ficha/the_witcher_3-2546814.jpg', 'Métete en la piel de un cazarrecompensas marginado que busca a la protagonista de una profecía en un mundo fantástico abierto, turbulento y de moralidad tibia.', 26.95, 200, 1, 1),
(21, 'DOOM Eternal', 'https://image.api.playstation.com/vulcan/ap/rnd/202010/0114/b4Q1XWYaTdJLUvRuALuqr0wP.png', 'DOOM Eternal para PlayStation 4, Xbox One y PC, desarrollado por id Software, es la secuela directa del galardonado superventas DOOM, ganador del premio al Mejor juego de acción de 2016 en los Game Awards. Disfruta de la mejor combinación de velocidad y potencia mientras te abres paso entre dimensiones en un salto cualitativo del combate en primera persona en avance continuo que caracterizó al juego original.\r\n', 7.95, 200, 1, 1),
(22, 'Gears 5', 'https://store-images.s-microsoft.com/image/apps.10933.65494054591008504.4eae27ba-1cfe-4af2-950a-4af81f8cd22a.b5b2909d-8884-48d0-b25a-68d6518c9b73?q=90&w=177&h=265', 'Encuentra todo el contenido de Gear Club Unlimited 2 y descubre nuevos experimentos de conducción: en carreteras sencillas & en circuitos, para desafíos de velocidad y resistencia... ¡pero siempre con vehículos de prestigio! ¡De ti depende dominar las carreras y asentar tu supremacía sobre tus adversarios!\r\n', 19.99, 200, 1, 1),
(23, 'Forza Horizon 4', 'https://store-images.s-microsoft.com/image/apps.36093.14343301090572358.2000000000007864116.1feb0fed-abe9-4849-b638-8d7eca69cff4', 'Por primera vez en el género de carreras y conducción, disfruta de estaciones dinámicas en un mundo abierto compartido. Explora escenas hermosas, colecciona más de 450 coches y conviértete en superestrella Horizon en la Gran Bretaña histórica.', 39.99, 200, 1, 1),
(24, 'Sekiro: Shadows Die Twice', 'https://upload.wikimedia.org/wikipedia/en/6/6e/Sekiro_art.jpg', 'Hazte en GAME OVER con Sekiro: Shadows Die Twice para PlayStation 4, Xbox One y PC. Vive una aventura extraordinaria, con uns gráficso espectaculares y un combate de lucha de pelicula. Sumérgete en el periodo más sangriento de Japón con . Adentrate en la vida de un guerrero que dará su vida por salvar a su amo y por conseguir la venganza que tanto ansía.', 24.95, 200, 1, 1),
(25, 'Metal Gear Solid V: The Phamtom Pain', 'https://cdn.cdkeys.com/700x700/media/catalog/product/f/a/fate_of_iberia_card_12_.jpg', 'Metal Gear Solid regresa con un nuevo capítulo en el que vivirás las consecuencias directas de la guerra y lo que pueden hacerle a la salud mental de los hombres que participan en ellas. Desde los ojos del legendario Big Boss, descubrirás una historia intensa, cruel y visceral que no te dejará indiferente.', 14.99, 200, 1, 1),
(26, 'Persona 5', 'https://i0.wp.com/xboxera.com/wp-content/uploads/2022/10/I37BgLmQ.jpeg?fit=2438%2C3225&ssl=1', 'Tras verse obligado a cambiarse a otro instituto en Tokio, el protagonista tiene un extraño sueño. \"Eres, sin lugar a dudas, prisionero del destino. La perdición te aguarda en el futuro\". Con el objetivo de su \"rehabilitación\" en mente, deberá ponerse la máscara de un Ladrón Fantasma para salvar el mundo de sus distorsionados deseos.', 5.99, 200, 1, 1),
(27, 'Wolfenstein II: The New Colossus', 'https://m.media-amazon.com/images/I/91fR0oBKxbL.jpg', 'Wilkins, huido desde que los nazis arrasaron Manhattan con una bomba atómica, regresa para reunirse con un camarada y destruir el arma más letal jamás creada: el Cañón Solar.', 4.99, 200, 1, 1),
(28, 'Control: Ultimate Edition', 'https://image.api.playstation.com/vulcan/ap/rnd/202008/2111/kZuu7RcHultdoVUuGsReuGcq.png', 'Embárcate en una aventura sin igual, esto es Control para PlayStation 4 y Xbox One. Control es un emocionante título de acción y aventuras en tercera persona con gráficos espectaculares que ha ganado más de 80 premios.', 13.99, 200, 1, 1),
(29, 'Detroit: Become Human', 'https://cdn.cdkeys.com/700x700/media/catalog/product/c/o/co2228_7_.jpg', 'Adéntrate en una tensa visión futurista de Detroit Become Human para PlayStation 4, en la que humanos y androides mantienen una delicada coexistencia y las decisiones que tomas crean la historia a tu alrededor.', 15.99, 200, 1, 1),
(30, 'NieR: Automata', 'https://kbimages1-a.akamaihd.net/93d319e0-13a6-40fb-b651-3cd254820ffa/1200/1200/False/nier-automata-short-story-long.jpg', 'En un futuro lejano… Unos invasores de otro mundo han atacado inesperadamente desplegando su arma secreta: unas formas de vida mecánicas. En vista de semejante amenaza, la humanidad se ve obligada a abandonar la Tierra y refugiarse en la luna.', 14.95, 300, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `uniq_dni` (`Dni`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `fk_pago_has_cliente_cliente1_idx` (`idCliente`),
  ADD KEY `fk_pago_has_cliente_pago_idx` (`idPago`);

--
-- Indices de la tabla `detalles_compra`
--
ALTER TABLE `detalles_compra`
  ADD PRIMARY KEY (`idProducto`,`idCompra`),
  ADD KEY `fk_producto_has_Compra_Compra1_idx` (`idCompra`),
  ADD KEY `fk_producto_has_Compra_producto1_idx` (`idProducto`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`idPlataforma`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_producto_categoria_producto1_idx` (`idCategoria`),
  ADD KEY `fk_producto_plataforma1_idx` (`idPlataforma`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_pago_has_cliente_cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pago_has_cliente_pago` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalles_compra`
--
ALTER TABLE `detalles_compra`
  ADD CONSTRAINT `fk_producto_has_Compra_Compra1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_has_Compra_producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria_producto1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_plataforma1` FOREIGN KEY (`idPlataforma`) REFERENCES `plataforma` (`idPlataforma`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
