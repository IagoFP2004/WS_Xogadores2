-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: ev2-solucion-mysql
-- Tiempo de generación: 20-02-2025 a las 10:25:17
-- Versión del servidor: 8.4.4
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `baloncesto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `codigo` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `nome_club` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pavillon` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `capacidade_pavillon` smallint UNSIGNED DEFAULT NULL,
  `web` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `nome_equipo` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`codigo`, `nome_club`, `pavillon`, `capacidade_pavillon`, `web`, `nome_equipo`) VALUES
('ALI', 'C.B. Lucentum Alicante', NULL, NULL, 'www.clublucentum', 'Lucentum Alicante'),
('BARC', 'F.C. Barcelona', NULL, NULL, 'www.fcbarcelona.cat', 'FC Barcelona Regal'),
('BASK', 'Saski-Baskonia S.A.D.', 'Iradier Arena', NULL, 'www.baskonia.com', 'Caja Laboral'),
('BILB', 'C.B.D. Bilbao Berri', 'Bilbao Arena', NULL, 'www.bilbaobasket.biz', 'Gescrap Bizkaia'),
('CAI', 'Basquet Zaragoza 2002 S.A.D.', 'Pabellón Príncipe Felipe', 10500, 'www.basketzaragoza.net', 'CAI Zaragoza'),
('ESTU', 'C. Estudiantes S.A.D.', 'Palacio de Deportes Comunidad de Madrid', 12000, 'www,clubestudiantes.com', 'Asefa Estudiantes'),
('FUEN', 'B. Fuenlabrada S.A.D.', 'Polideportivo Fernando Martín', 5100, 'www.baloncestofuenlabrada.com', 'Mad-Croc Fuenlabrada'),
('GRAN', 'Gran Canaria 2014', NULL, NULL, 'www.cbgrancanaria.net', 'Gran Canaria 2014'),
('JOVE', 'Club Joventut Badalona S.A.D.', NULL, NULL, 'www.penya.com', 'FIATC Mutua Joventut'),
('MADR', 'Real Madrid C. de F.', NULL, NULL, 'www.realmadrid.com', 'Real Madrid'),
('MALA', 'Baloncesto Málaga S.A.D.', NULL, NULL, 'www.unicajabaloncesto.com', 'Unicaja'),
('MANR', 'Baquet Manresa S.A.D.', 'Pavello Nou Congost', 5000, 'www.basquetmanresa.com', 'Assignia Manresa'),
('MURC', 'C.B. Murcia S.A.D.', NULL, NULL, 'www.cbmurcia.com', 'UCAM Murcia'),
('OBRA', 'Obradoiro C.A.B.', NULL, NULL, 'www.obradoirocab.com', 'Bluesens Monbus'),
('SANS', 'San Sebastián Guipuzcoa Club', NULL, NULL, 'www.guipuzcoabasket.com', 'Lagun Aro GBC'),
('SEVI', 'C.D.B. Sevilla S.A.D.', NULL, NULL, 'www.baloncestosevilla.com', 'Banca Cívica'),
('VALE', 'Valencia Basket Club S.A.D.', NULL, NULL, 'www.valenciabasket.com', 'Valencia Basket'),
('VALL', 'C.B. Valladolid S.A.D.', 'Pabellón Polideportivo Pisuerga', 6300, 'www.cbvalladolid.es', 'Blancos de Rueda Valladolid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidade`
--

CREATE TABLE `nacionalidade` (
  `codigo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `nome` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `nacionalidade`
--

INSERT INTO `nacionalidade` (`codigo`, `nome`) VALUES
('ABW', 'Aruba'),
('AFG', 'Afganistán'),
('AGO', 'Angola'),
('AIA', 'Anguilla'),
('ALA', 'Islas Gland'),
('ALB', 'Albania'),
('AND', 'Andorra'),
('ANT', 'Antillas Holandesas'),
('ARE', 'Emiratos Árabes Unidos'),
('ARG', 'Argentina'),
('ARM', 'Armenia'),
('ASM', 'Samoa Americana'),
('ATA', 'Antártida'),
('ATF', 'Territorios Australes Franceses'),
('ATG', 'Antigua y Barbuda'),
('AUS', 'Australia'),
('AUT', 'Austria'),
('AZE', 'Azerbaiyán'),
('BDI', 'Burundi'),
('BEL', 'Bélgica'),
('BEN', 'Benin'),
('BFA', 'Burkina Faso'),
('BGD', 'Bangladesh'),
('BGR', 'Bulgaria'),
('BHR', 'Bahréin'),
('BHS', 'Bahamas'),
('BIH', 'Bosnia y Herzegovina'),
('BLR', 'Bielorrusia'),
('BLZ', 'Belice'),
('BMU', 'Bermudas'),
('BOL', 'Bolivia'),
('BRA', 'Brasil'),
('BRB', 'Barbados'),
('BRN', 'Brunéi'),
('BTN', 'Bhután'),
('BVT', 'Isla Bouvet'),
('BWA', 'Botsuana'),
('CAF', 'República Centroafricana'),
('CAN', 'Canadá'),
('CCK', 'Islas Cocos'),
('CHE', 'Suiza'),
('CHL', 'Chile'),
('CHN', 'China'),
('CIV', 'Costa de Marfil'),
('CMR', 'Camerún'),
('COD', 'República Democrática del Congo'),
('COG', 'Congo'),
('COK', 'Islas Cook'),
('COL', 'Colombia'),
('COM', 'Comoras'),
('CPV', 'Cabo Verde'),
('CRI', 'Costa Rica'),
('CUB', 'Cuba'),
('CXR', 'Isla de Navidad'),
('CYM', 'Islas Caimán'),
('CYP', 'Chipre'),
('CZE', 'República Checa'),
('DEU', 'Alemania'),
('DJI', 'Yibuti'),
('DMA', 'Dominica'),
('DNK', 'Dinamarca'),
('DOM', 'República Dominicana'),
('DZA', 'Argelia'),
('ECU', 'Ecuador'),
('EGY', 'Egipto'),
('ERI', 'Eritrea'),
('ESH', 'Sahara Occidental'),
('ESP', 'España'),
('EST', 'Estonia'),
('ETH', 'Etiopía'),
('FIN', 'Finlandia'),
('FJI', 'Fiyi'),
('FLK', 'Islas Malvinas'),
('FRA', 'Francia'),
('FRO', 'Islas Feroe'),
('FSM', 'Micronesia'),
('GAB', 'Gabón'),
('GBR', 'Reino Unido'),
('GEO', 'Georgia'),
('GHA', 'Ghana'),
('GIB', 'Gibraltar'),
('GIN', 'Guinea'),
('GLP', 'Guadalupe'),
('GMB', 'Gambia'),
('GNB', 'Guinea-Bissau'),
('GNQ', 'Guinea Ecuatorial'),
('GRC', 'Grecia'),
('GRD', 'Granada'),
('GRL', 'Groenlandia'),
('GTM', 'Guatemala'),
('GUF', 'Guayana Francesa'),
('GUM', 'Guam'),
('GUY', 'Guyana'),
('HKG', 'Hong Kong'),
('HMD', 'Islas Heard y McDonald'),
('HND', 'Honduras'),
('HRV', 'Croacia'),
('HTI', 'Haití'),
('HUN', 'Hungría'),
('IDN', 'Indonesia'),
('IND', 'India'),
('IOT', 'Territorio Británico del Océano Índico'),
('IRL', 'Irlanda'),
('IRN', 'Irán'),
('IRQ', 'Iraq'),
('ISL', 'Islandia'),
('ISR', 'Israel'),
('ITA', 'Italia'),
('JAM', 'Jamaica'),
('JOR', 'Jordania'),
('JPN', 'Japón'),
('KAZ', 'Kazajstán'),
('KEN', 'Kenia'),
('KGZ', 'Kirguistán'),
('KHM', 'Camboya'),
('KIR', 'Kiribati'),
('KNA', 'San Cristóbal y Nevis'),
('KOR', 'Corea del Sur'),
('KWT', 'Kuwait'),
('LAO', 'Laos'),
('LBN', 'Líbano'),
('LBR', 'Liberia'),
('LBY', 'Libia'),
('LCA', 'Santa Lucía'),
('LIE', 'Liechtenstein'),
('LKA', 'Sri Lanka'),
('LSO', 'Lesotho'),
('LTU', 'Lituania'),
('LUX', 'Luxemburgo'),
('LVA', 'Letonia'),
('MAC', 'Macao'),
('MAR', 'Marruecos'),
('MCO', 'Mónaco'),
('MDA', 'Moldavia'),
('MDG', 'Madagascar'),
('MDV', 'Maldivas'),
('MEX', 'México'),
('MHL', 'Islas Marshall'),
('MLI', 'Malí'),
('MLT', 'Malta'),
('MMR', 'Myanmar'),
('MNE', 'Montenegro'),
('MNG', 'Mongolia'),
('MNP', 'Islas Marianas del Norte'),
('MOZ', 'Mozambique'),
('MRT', 'Mauritania'),
('MSR', 'Montserrat'),
('MTQ', 'Martinica'),
('MUS', 'Mauricio'),
('MWI', 'Malawi'),
('MYS', 'Malasia'),
('MYT', 'Mayotte'),
('NAM', 'Namibia'),
('NCL', 'Nueva Caledonia'),
('NER', 'Níger'),
('NFK', 'Isla Norfolk'),
('NGA', 'Nigeria'),
('NIC', 'Nicaragua'),
('NIU', 'Niue'),
('NLD', 'Países Bajos'),
('NOR', 'Noruega'),
('NPL', 'Nepal'),
('NRU', 'Nauru'),
('NZL', 'Nueva Zelanda'),
('OMN', 'Omán'),
('PAK', 'Pakistán'),
('PAN', 'Panamá'),
('PCN', 'Islas Pitcairn'),
('PER', 'Perú'),
('PHL', 'Filipinas'),
('PLW', 'Palau'),
('PNG', 'Papúa Nueva Guinea'),
('POL', 'Polonia'),
('PRI', 'Puerto Rico'),
('PRK', 'Corea del Norte'),
('PRT', 'Portugal'),
('PRY', 'Paraguay'),
('PSE', 'Palestina'),
('PYF', 'Polinesia Francesa'),
('QAT', 'Qatar'),
('REU', 'Reunión'),
('ROU', 'Rumania'),
('RUS', 'Rusia'),
('RWA', 'Ruanda'),
('SAU', 'Arabia Saudí'),
('SDN', 'Sudán'),
('SEN', 'Senegal'),
('SGP', 'Singapur'),
('SGS', 'Islas Georgias del Sur y Sandwich del Sur'),
('SHN', 'Santa Helena'),
('SJM', 'Svalbard y Jan Mayen'),
('SLB', 'Islas Salomón'),
('SLE', 'Sierra Leona'),
('SLV', 'El Salvador'),
('SMR', 'San Marino'),
('SOM', 'Somalia'),
('SPM', 'San Pedro y Miquelón'),
('SRB', 'Serbia'),
('STP', 'Santo Tomé y Príncipe'),
('SUR', 'Surinam'),
('SVK', 'Eslovaquia'),
('SVN', 'Eslovenia'),
('SWE', 'Suecia'),
('SWZ', 'Suazilandia'),
('SYC', 'Seychelles'),
('SYR', 'Siria'),
('TCA', 'Islas Turcas y Caicos'),
('TCD', 'Chad'),
('TGO', 'Togo'),
('THA', 'Tailandia'),
('TJK', 'Tayikistán'),
('TKL', 'Tokelau'),
('TKM', 'Turkmenistán'),
('TLS', 'Timor Oriental'),
('TON', 'Tonga'),
('TTO', 'Trinidad y Tobago'),
('TUN', 'Túnez'),
('TUR', 'Turquía'),
('TUV', 'Tuvalu'),
('TWN', 'Taiwán'),
('TZA', 'Tanzania'),
('UGA', 'Uganda'),
('UKR', 'Ucrania'),
('UMI', 'Islas ultramarinas de Estados Unidos'),
('URY', 'Uruguay'),
('USA', 'Estados Unidos'),
('UZB', 'Uzbekistán'),
('VAT', 'Ciudad del Vaticano'),
('VCT', 'San Vicente y las Granadinas'),
('VEN', 'Venezuela'),
('VGB', 'Islas Vírgenes Británicas'),
('VIR', 'Islas Vírgenes de los Estados Unidos'),
('VNM', 'Vietnam'),
('VUT', 'Vanuatu'),
('WLF', 'Wallis y Futuna'),
('WSM', 'Samoa'),
('YEM', 'Yemen'),
('ZAF', 'Sudáfrica'),
('ZMB', 'Zambia'),
('ZWE', 'Zimbabue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_type` enum('gerente','entrenador') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `user_type`, `name`) VALUES
(3, 'gerente@equipo.org', '$2y$10$nY.mloqqixC138G08Z9iV./bc7Ycq9qFcFT8..C8coe0lwwrkYRsO', 'gerente', 'Gerente A'),
(4, 'entrenador@equipo.org', '$2y$10$ZlgDa14aeZkYAxzPNl1koOTeAE16qgnj4lr7zq5AV7DLD/0/0QKe6', 'entrenador', 'Entrenador A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xogador`
--

CREATE TABLE `xogador` (
  `numero_licencia` int UNSIGNED NOT NULL,
  `codigo_equipo` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `numero` tinyint UNSIGNED NOT NULL,
  `nome` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `posicion` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nacionalidade` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ficha` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `estatura` decimal(3,2) UNSIGNED NOT NULL,
  `data_nacemento` date NOT NULL,
  `temporadas` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `xogador`
--

INSERT INTO `xogador` (`numero_licencia`, `codigo_equipo`, `numero`, `nome`, `posicion`, `nacionalidade`, `ficha`, `estatura`, `data_nacemento`, `temporadas`) VALUES
(25220, 'ESTU', 0, 'Clark, Daniel', 'F', NULL, 'JFL', 2.10, '1990-11-24', 6),
(25221, 'ESTU', 4, 'Fernández, Jaime', 'B', 'ESP', 'JFL', 1.84, '1995-08-20', 2),
(25222, 'ESTU', 5, 'Lofton, Chris', 'E', 'USA', 'EXT', 1.88, '1987-07-23', 2),
(25223, 'ESTU', 6, 'Deane, Willie', 'E', 'BGR', 'EUR', 1.88, '1981-04-27', 1),
(25224, 'ESTU', 7, 'Driesen, Yannick', 'P', 'BEL', 'EUR', 2.16, '1990-12-28', 5),
(25225, 'ESTU', 9, 'Simmons, Cedric', 'P', 'BGR', 'EUR', 2.06, '1987-12-01', 1),
(25226, 'ESTU', 10, 'Jiménez, Carlos', 'A', 'ESP', 'JFL', 2.05, '1977-02-11', 13),
(25227, 'ESTU', 11, 'Granger, Jayson', 'B', 'ITA', 'JFL', 1.90, '1991-09-07', 5),
(25228, 'ESTU', 12, 'Gabriel, Germán', 'P', 'ESP', 'JFL', 2.07, '1982-02-23', 5),
(25229, 'ESTU', 14, 'De la Fuente, R.', 'A', 'ESP', 'JFL', 2.00, '1978-10-10', 1),
(25230, 'ESTU', 16, 'Lobo, Álvaro', 'E', 'ESP', 'JFL', 1.83, '1993-06-08', 1),
(25231, 'ESTU', 17, 'Medori, Javier', 'A', 'ESP', 'JFL', 2.00, '1995-12-03', 1),
(25232, 'ESTU', 21, 'Kirksay, Tariq', 'A', 'FRA', 'EUR', 1.99, '1981-07-16', 1),
(25233, 'ESTU', 22, 'Bullock, Louis', 'E', 'USA', 'EXT', 1.85, '1977-01-18', 1),
(25234, 'ESTU', 35, 'Nogueira, Lucas', 'P', 'BRA', 'EXT', 2.12, '1994-11-17', 1),
(25235, 'MANR', 4, 'Palsson, Haukur', 'A', 'ISL', 'EUR', 1.97, '1993-05-25', 1),
(25236, 'MANR', 5, 'Asselin, Josh', 'P', 'DOM', 'COT', 2.10, '1980-05-07', 3),
(25237, 'MANR', 6, 'Rodríguez, Javi', 'B', 'ESP', 'JFL', 1.88, '1980-01-16', 3),
(25238, 'MANR', 8, 'Montañez, Román', 'E', 'ESP', 'JFL', 1.91, '1980-08-15', 7),
(25239, 'MANR', 11, 'Hernández, Alex', 'B', 'ESP', 'JFL', 1.89, '1991-09-25', 2),
(25240, 'MANR', 13, 'Gladyr, Sergiy', 'A', 'UKR', 'EUR', 1.97, '1990-04-22', 3),
(25241, 'MANR', 14, 'Doellman, Justin', 'F', 'USA', 'EXT', 2.04, '1986-01-26', 1),
(25242, 'MANR', 16, 'Cerqueira, Fernando', 'B', 'ESP', 'JFL', 1.92, '1994-06-18', 1),
(25243, 'MANR', 17, 'Hanga, Adam', 'A', 'HUN', 'EUR', 1.99, '1990-09-18', 1),
(25244, 'MANR', 19, 'Kody, Johan', 'P', 'CMR', 'JFL', 2.07, '1994-01-12', 1),
(25245, 'MANR', 19, 'Ibaka, Igor', 'P', 'COG', 'JFL', 2.03, '1994-11-06', 1),
(25246, 'MANR', 19, 'Solé, Sergi', 'A', 'ESP', 'JFL', 1.99, '1995-05-05', 1),
(25247, 'MANR', 20, 'Achara, Kieron', 'P', 'GBR', 'EUR', 2.07, '1985-09-08', 1),
(25248, 'MANR', 22, 'Downs, Micah', 'A', 'USA', 'EXT', 2.01, '1988-01-12', 1),
(25249, 'MANR', 24, 'Oriola, Pierre', 'F', 'ESP', 'JFL', 2.06, '1994-11-05', 3),
(25250, 'SEVI', 4, 'Tepic, Milenko', 'E', 'SRB', 'EUR', 2.02, '1988-04-22', 1),
(25251, 'SEVI', 5, 'Triguero, Juan José', 'P', 'ESP', 'JFL', 2.12, '1985-02-08', 4),
(25252, 'SEVI', 6, 'Pámpano, Ricardo', 'E', 'ESP', '', 1.89, '1994-12-28', 2),
(25253, 'SEVI', 7, 'Balvin, Ondrej', 'P', 'CZE', 'EUR', 2.17, '1994-01-13', 2),
(25254, 'SEVI', 8, 'Satoransky, Tomas', 'B', 'CZE', 'JFL', 2.01, '1993-12-13', 3),
(25255, 'SEVI', 10, 'Urtasun, Txemi', 'E', 'ESP', 'JFL', 1.93, '1985-04-07', 2),
(25256, 'SEVI', 11, 'Calloway, Earl', 'B', 'BGR', 'EUR', 1.90, '1985-04-18', 3),
(25257, 'SEVI', 12, 'Izquierdo, Antonio', 'E', 'ESP', 'JFL', 1.94, '1994-04-16', 1),
(25258, 'SEVI', 14, 'Jasen, Pancho', 'A', 'ITA', 'EUR', 1.98, '1979-11-26', 1),
(25259, 'SEVI', 15, 'Sastre, Joan', 'A', 'ESP', 'JFL', 2.01, '1993-10-03', 3),
(25260, 'SEVI', 16, 'Rubio, Guille', 'F', 'ESP', 'JFL', 2.02, '1984-04-27', 1),
(25261, 'SEVI', 21, 'Bogdanovic, Luka', 'F', 'SRB', 'EUR', 2.03, '1986-12-28', 1),
(25262, 'SEVI', 23, 'English, Carl', 'E', 'CAN', 'EXT', 1.96, '1982-12-28', 1),
(25263, 'SEVI', 40, 'Davis, Paul', 'P', 'USA', 'EXT', 2.11, '1986-01-07', 2),
(25264, 'VALL', 6, 'Uriz, Ricardo', 'B', 'ESP', 'JFL', 1.88, '1982-01-15', 2),
(25265, 'VALL', 7, 'García, Diego', 'E', 'ITA', 'EUR', 1.90, '1981-07-26', 3),
(25266, 'VALL', 8, 'Zamora, Jhornan José', 'E', 'ESP', 'JFL', 1.93, '1990-02-22', 1),
(25267, 'VALL', 9, 'Udrih, Samo', 'E', 'SVN', 'EUR', 1.95, '1981-07-08', 1),
(25268, 'VALL', 10, 'López, Isaac', 'E', 'ESP', 'JFL', 1.96, '1980-11-12', 3),
(25269, 'VALL', 11, 'Martín, Nacho', 'F', 'ESP', 'JFL', 2.05, '1984-07-16', 2),
(25270, 'VALL', 16, 'Hdez-Sonseca, E.', 'P', 'ESP', 'JFL', 2.12, '1985-01-21', 1),
(25271, 'VALL', 18, 'Dumas, Stephane', 'B', 'FRA', 'EUR', 1.90, '1980-05-22', 4),
(25272, 'VALL', 20, 'Robinson, Jason', 'A', 'USA', 'EXT', 1.96, '1982-08-26', 2),
(25273, 'VALL', 21, 'Sarmiento, Arturo', 'A', 'ESP', 'JFL', 1.91, '1995-08-11', 2),
(25274, 'VALL', 22, 'Arteaga, Víctor', 'F', 'ESP', 'JFL', 2.09, '1994-12-20', 1),
(25275, 'VALL', 24, 'Borchardt, Curtis', 'P', 'USA', 'EXT', 2.10, '1982-08-28', 1),
(25276, 'VALL', 25, 'Songaila, Darius', 'F', 'LTU', 'EUR', 2.06, '1979-02-17', 1),
(25277, 'OBRA', 4, 'Hopkins, Bernard', 'F', 'ESP', 'JFL', 1.97, '1974-07-27', 1),
(25278, 'OBRA', 5, 'Rodríguez, Andrés', 'B', 'PRI', 'EXT', 1.84, '1982-03-01', 1),
(25279, 'OBRA', 6, 'Cabanas, Mario', 'P', 'ESP', 'JFL', 2.07, '1986-06-13', 1),
(25280, 'OBRA', 7, 'Bulfoni, Javier', 'E', 'ITA', 'EUR', 1.94, '1978-09-09', 2),
(25281, 'OBRA', 9, 'Ere, Ebi', 'A', 'NGA', 'COT', 1.95, '1983-05-01', 1),
(25282, 'OBRA', 11, 'Palacio, Milt', 'B', 'BLZ', 'COT', 1.93, '1979-11-08', 1),
(25283, 'OBRA', 13, 'Washington, Deron', 'A', 'DEU', 'EUR', 2.00, '1987-10-06', 1),
(25284, 'OBRA', 14, 'Kendall, Levon', 'P', 'IRL', 'EUR', 2.09, '1986-08-12', 1),
(25285, 'OBRA', 15, 'Junyent, Oriol', 'P', 'ESP', 'JFL', 2.08, '1978-04-02', 2),
(25286, 'OBRA', 17, 'Nguema, Richard', 'B', 'ESP', 'JFL', 1.92, '1989-06-06', 1),
(25287, 'OBRA', 21, 'Lasme, Stephane', 'P', 'GAB', 'COT', 2.04, '1984-07-02', 1),
(25288, 'OBRA', 33, 'Corbacho, Alberto', 'A', 'ESP', 'JFL', 2.01, '1986-09-07', 1),
(25289, 'CAI', 8, 'Wright, Bracey', 'E', 'USA', 'EXT', 1.91, '1986-02-28', 1),
(25290, 'CAI', 9, 'Van Rossom, Sam', 'B', 'BEL', 'EUR', 1.88, '1988-07-25', 2),
(25291, 'CAI', 10, 'Hettsheimeir, R.', 'P', 'ESP', 'EUR', 2.08, '1988-08-18', 2),
(25292, 'CAI', 11, 'Stefansson, Jon', 'E', 'ISL', 'EUR', 1.96, '1984-03-07', 1),
(25293, 'CAI', 12, 'Almazán, Pablo', 'A', 'ESP', 'JFL', 2.00, '1990-07-27', 1),
(25294, 'CAI', 16, 'Cabezas, Carlos', 'B', 'ESP', 'JFL', 1.86, '1982-02-24', 2),
(25295, 'CAI', 17, 'Marín, Javier', 'B', 'ESP', 'JFL', 1.93, '1995-09-06', 2),
(25296, 'CAI', 21, 'Archibald, Robert', 'P', 'GBR', 'EUR', 2.12, '1981-09-01', 1),
(25297, 'CAI', 23, 'Dobos, Laszlo', 'P', 'HUN', 'EUR', 2.19, '1995-11-14', 1),
(25298, 'CAI', 31, 'Fontet, Albert', 'P', 'ESP', 'JFL', 2.12, '1987-09-28', 1),
(25299, 'CAI', 33, 'Toppert, Chad', 'A', 'DEU', 'EUR', 1.99, '1987-11-17', 2),
(25300, 'CAI', 34, 'Aguilar, Pablo', 'F', 'ESP', 'JFL', 2.03, '1991-03-03', 2),
(25301, 'BASK', 4, 'Ribas, Pau', 'B', 'ESP', 'JFL', 1.96, '1988-01-21', 4),
(25302, 'BASK', 5, 'Prigioni, Pablo', 'B', 'ESP', 'JFL', 1.86, '1978-08-04', 7),
(25303, 'BASK', 7, 'Van Oostrum, Devon', 'B', 'GBR', 'JFL', 1.93, '1994-07-14', 1),
(25304, 'BASK', 11, 'Bjelica, Milko', 'F', 'MNE', 'EUR', 2.07, '1986-09-28', 1),
(25305, 'BASK', 19, 'San Emeterio, F.', 'E', 'ESP', 'JFL', 1.99, '1985-10-07', 5),
(25306, 'BASK', 22, 'Heurtel, Thomas', 'B', 'FRA', 'EUR', 1.89, '1990-09-20', 1),
(25307, 'BASK', 24, 'Oleson, Brad', 'E', 'ESP', 'JFL', 1.91, '1984-06-04', 4),
(25308, 'BASK', 30, 'Lampe, Maciej', 'F', 'SWE', 'JFL', 2.10, '1986-04-27', 1),
(25309, 'BASK', 33, 'Teletovic, Mirza', 'F', 'BIH', 'EUR', 2.06, '1987-12-22', 7),
(25310, 'BASK', 42, 'Calbarro, Unai', 'F', 'ESP', 'JFL', 2.05, '1991-02-07', 1),
(25311, 'BASK', 44, 'Bjelica, Nemanja', 'A', 'SRB', 'EUR', 2.09, '1989-11-16', 3),
(25312, 'BASK', 55, 'Nocioni, Andrés', 'A', 'ITA', 'EUR', 2.03, '1981-02-04', 6),
(25313, 'BARC', 8, 'Sada, Víctor', 'B', 'ESP', 'JFL', 1.92, '1985-03-22', 8),
(25314, 'BARC', 9, 'Huertas, Marcelinho', 'B', 'ITA', 'EUR', 1.90, '1984-02-13', 1),
(25315, 'BARC', 11, 'Navarro, Juan Carlos', 'E', 'ESP', 'JFL', 1.91, '1982-10-16', 14),
(25316, 'BARC', 16, 'García, Iván', 'A', 'ESP', 'JFL', 2.05, '1988-06-19', 3),
(25317, 'BARC', 17, 'Vázquez, Fran', 'P', 'ESP', 'JFL', 2.09, '1984-12-23', 6),
(25318, 'BARC', 18, 'Wallace, CJ', 'F', 'COG', 'COT', 2.06, '1984-02-09', 1),
(25319, 'BARC', 20, 'Ingles, Joe', 'A', 'GBR', 'EUR', 2.03, '1989-02-15', 2),
(25320, 'BARC', 21, 'Ndong, Boniface', 'P', 'SEN', 'EUR', 2.13, '1979-05-07', 3),
(25321, 'BARC', 22, 'Rabaseda, Xavi', 'A', 'ESP', 'JFL', 1.98, '1990-01-13', 4),
(25322, 'BARC', 23, 'Mbaye, Papa', 'P', 'SEN', 'JFL', 2.08, '1992-03-19', 1),
(25323, 'BARC', 24, 'Pérez, Josep', 'B', 'ESP', 'JFL', 1.84, '1995-08-05', 1),
(25324, 'BARC', 25, 'Lorbek, Erazem', 'F', 'SVN', 'EUR', 2.09, '1985-12-11', 3),
(25325, 'BARC', 31, 'Eidson, Chuck', 'A', 'USA', 'EXT', 2.02, '1982-12-20', 1),
(25326, 'BARC', 33, 'Mickeal, Pete', 'A', 'USA', 'EXT', 1.99, '1979-08-26', 3),
(25327, 'JOVE', 4, 'Trias, Jordi', 'F', 'ESP', 'JFL', 2.08, '1982-10-04', 2),
(25328, 'JOVE', 6, 'Bassas, Ferran', 'B', 'ESP', 'JFL', 1.81, '1993-05-10', 1),
(25329, 'JOVE', 9, 'Llovet, Nacho', 'P', 'ESP', 'JFL', 2.02, '1992-09-14', 2),
(25330, 'JOVE', 11, 'Oliver, Albert', 'B', 'ESP', 'JFL', 1.87, '1980-03-19', 3),
(25331, 'JOVE', 12, 'Báez, Eulis', 'F', 'ESP', 'EUR', 2.01, '1983-08-04', 1),
(25332, 'JOVE', 13, 'Obasohan, Derrick', 'A', 'NGA', 'COT', 2.00, '1982-10-21', 1),
(25333, 'JOVE', 14, 'Todorovic, M.', 'F', 'MNE', 'JFL', 2.06, '1993-02-14', 2),
(25334, 'JOVE', 15, 'Jeter, Pooh', 'B', 'USA', 'EXT', 1.79, '1985-02-28', 1),
(25335, 'JOVE', 16, 'Ventura, Albert', 'E', 'ESP', 'JFL', 1.91, '1993-09-12', 2),
(25336, 'JOVE', 17, 'Norel, Henk', 'P', 'NLD', 'EUR', 2.12, '1989-12-22', 6),
(25337, 'JOVE', 19, 'Tomàs, Pere', 'A', 'ESP', 'JFL', 2.02, '1991-11-28', 5),
(25338, 'JOVE', 21, 'Williams, Latavious', 'P', 'USA', 'EXT', 2.02, '1990-05-22', 1),
(25339, 'JOVE', 22, 'Jelínek, David', 'E', 'CZE', 'JFL', 1.95, '1992-11-28', 3),
(25340, 'JOVE', 24, 'Barrera, Alex', 'E', 'ESP', 'JFL', 1.96, '1993-04-12', 1),
(25341, 'JOVE', 31, 'Barton, Lubos', 'A', 'CZE', 'EUR', 2.02, '1981-04-11', 4),
(25342, 'JOVE', 40, 'Van Lacke, Federico', 'E', 'ESP', 'JFL', 1.91, '1982-10-02', 1),
(25343, 'BILB', 4, 'Fisher, Josh', 'E', 'ESP', 'JFL', 1.89, '1982-09-17', 2),
(25344, 'BILB', 7, 'Jackson, Aaron', 'B', 'USA', 'EXT', 1.93, '1987-08-17', 2),
(25345, 'BILB', 11, 'Mavroeidis, D.', 'P', 'GRC', 'EUR', 2.08, '1987-11-24', 2),
(25346, 'BILB', 13, 'Banic, Marko', 'F', 'HRV', 'EUR', 2.05, '1986-06-18', 7),
(25347, 'BILB', 15, 'Mumbrú, Álex', 'A', 'ESP', 'JFL', 2.02, '1981-11-10', 3),
(25348, 'BILB', 17, 'Hervelle, Axel', 'F', 'BEL', 'EUR', 2.05, '1984-03-26', 3),
(25349, 'BILB', 21, 'Fischer, D´or', 'P', 'USA', 'EXT', 2.11, '1983-12-26', 1),
(25350, 'BILB', 31, 'López, Raül', 'B', 'ESP', 'JFL', 1.82, '1981-11-13', 1),
(25351, 'BILB', 33, 'Samb, Mamadou', 'F', 'ESP', 'JFL', 2.08, '1991-09-06', 1),
(25352, 'BILB', 34, 'Vasileiadis, Kostas', 'A', 'GRC', 'EUR', 2.00, '1985-11-21', 2),
(25353, 'BILB', 44, 'Grimau, Roger', 'E', 'ESP', 'JFL', 1.96, '1980-01-03', 1),
(25354, 'BILB', 45, 'Blums, Janis', 'E', 'LVA', 'EUR', 1.90, '1983-04-03', 4),
(25355, 'GRAN', 0, 'Haynes, Marquez', 'E', 'GEO', 'EUR', 1.88, '1988-09-04', 1),
(25356, 'GRAN', 4, 'Dowdell, Zabian', 'B', 'USA', 'EXT', 1.91, '1986-08-19', 1),
(25357, 'GRAN', 7, 'Savané, Sitapha', 'P', 'ESP', 'JFL', 2.01, '1980-07-15', 8),
(25358, 'GRAN', 8, 'Bramos, Michael', 'E', 'GRC', 'EUR', 1.96, '1988-01-17', 2),
(25359, 'GRAN', 9, 'Palacios, Juan', 'F', 'COL', 'EXT', 2.03, '1986-11-22', 1),
(25360, 'GRAN', 11, 'Bellas, Tomás', 'B', 'ESP', 'JFL', 1.85, '1989-02-09', 3),
(25361, 'GRAN', 15, 'López, Alejandro', 'E', 'ESP', '', 1.89, '1992-03-01', 3),
(25362, 'GRAN', 17, 'Nelson, Spencer', 'P', 'AZE', 'EUR', 2.03, '1982-06-09', 2),
(25363, 'GRAN', 19, 'Alvarado, Óscar', 'B', 'ESP', 'JFL', 1.84, '1993-01-12', 3),
(25364, 'GRAN', 33, 'Beirán, Javier', 'A', 'ESP', 'JFL', 2.00, '1988-11-04', 2),
(25365, 'GRAN', 34, 'Ekperigin, Laurence', 'P', 'GBR', 'EUR', 2.02, '1989-01-20', 1),
(25366, 'GRAN', 41, 'Rey, Xavi', 'P', 'ESP', 'JFL', 2.09, '1989-05-26', 2),
(25367, 'GRAN', 50, 'Santana, Fabio', 'B', 'ESP', 'JFL', 1.88, '1994-05-02', 2),
(25368, 'SANS', 5, 'Papamakarios, M.', 'E', 'GRC', 'EUR', 1.92, '1982-04-04', 1),
(25369, 'SANS', 7, 'Panko, Andy', 'A', 'USA', 'EXT', 2.04, '1979-10-16', 4),
(25370, 'SANS', 8, 'Neto, Raulzinho', 'B', 'ITA', 'EUR', 1.84, '1993-05-07', 1),
(25371, 'SANS', 9, 'Vidal, Sergi', 'E', 'ESP', 'JFL', 1.98, '1982-02-23', 1),
(25372, 'SANS', 11, 'Lasa, Lander', 'A', 'ESP', 'JFL', 1.93, '1989-08-23', 2),
(25373, 'SANS', 13, 'Doblas, David', 'P', 'ESP', 'JFL', 2.06, '1983-01-26', 5),
(25374, 'SANS', 14, 'Salgado, Javier', 'B', 'ESP', 'JFL', 1.80, '1982-06-12', 2),
(25375, 'SANS', 18, 'Olaizola, Julen', 'F', 'ESP', 'JFL', 2.02, '1994-10-16', 1),
(25376, 'SANS', 19, 'Motos, Mikel', 'E', 'ESP', 'JFL', 1.92, '1994-06-16', 1),
(25377, 'SANS', 20, 'Baron Jr., Jimmy', 'E', 'USA', 'EXT', 1.91, '1987-07-25', 2),
(25378, 'SANS', 32, 'Ogide, Andy', 'P', 'NGA', 'COT', 2.04, '1989-10-09', 1),
(25379, 'SANS', 44, 'Lorant, Peter', 'F', 'HUN', 'EUR', 2.06, '1987-03-03', 1),
(25380, 'SANS', 51, 'Betts, Andrew', 'P', 'GBR', 'EUR', 2.17, '1978-11-04', 1),
(25381, 'ALI', 5, 'Freire, Rafael', 'B', 'ESP', 'JFL', 1.88, '1993-01-19', 1),
(25382, 'ALI', 6, 'Ordín, Nacho', 'B', 'ESP', 'JFL', 1.84, '1979-05-19', 1),
(25383, 'ALI', 7, 'Astilleros, Fabio', 'A', 'ESP', 'JFL', 1.90, '1995-04-14', 1),
(25384, 'ALI', 8, 'Jódar, Alberto', 'A', 'ESP', 'JFL', 2.04, '1992-07-06', 1),
(25385, 'ALI', 9, 'Llompart, Pedro', 'B', 'ESP', 'JFL', 1.85, '1983-06-18', 3),
(25386, 'ALI', 10, 'Rautins, Andy', 'E', 'USA', 'EXT', 1.93, '1988-10-07', 1),
(25387, 'ALI', 11, 'Urtasun, Alex', 'E', 'ESP', 'JFL', 1.93, '1985-09-24', 2),
(25388, 'ALI', 11, 'Miñarro, Germán', 'E', 'ESP', 'JFL', 1.75, '1995-01-23', 1),
(25389, 'ALI', 12, 'Dewar, Benjamin', 'A', 'FRA', 'EUR', 1.96, '1983-11-27', 1),
(25390, 'ALI', 19, 'Stojic, Mario', 'A', 'DEU', 'EUR', 1.98, '1981-02-23', 4),
(25391, 'ALI', 23, 'Kone, Mohamed', 'P', 'FRA', 'EUR', 2.11, '1982-08-21', 1),
(25392, 'ALI', 24, 'Ellis, Tyrone', 'E', 'GEO', 'EUR', 1.93, '1979-10-20', 1),
(25393, 'ALI', 31, 'Barnes, Lamont', 'P', 'USA', 'EUR', 2.08, '1980-02-16', 1),
(25394, 'ALI', 55, 'Ivanov, Kaloyan', 'F', 'BGR', 'EUR', 2.05, '1987-05-12', 1),
(25395, 'FUEN', 4, 'Mainoldi, Leo', 'F', 'ITA', 'EUR', 2.02, '1986-09-15', 4),
(25396, 'FUEN', 7, 'Hall, Mike', 'F', 'USA', 'EXT', 2.03, '1986-04-01', 1),
(25397, 'FUEN', 7, 'Fall, Massine', 'P', 'SEN', '', 2.08, '1994-02-16', 1),
(25398, 'FUEN', 8, 'Laviña, Ferran', 'E', 'ESP', 'JFL', 1.92, '1978-05-07', 3),
(25399, 'FUEN', 9, 'Vega, Javier', 'F', 'ESP', 'JFL', 2.05, '1989-01-11', 6),
(25400, 'FUEN', 10, 'Colom, Quino', 'B', 'ESP', 'JFL', 1.88, '1990-11-12', 3),
(25401, 'FUEN', 12, 'Blanco, Saúl', 'E', 'ESP', 'JFL', 1.94, '1986-04-05', 5),
(25402, 'FUEN', 13, 'Laso, Adrián', 'F', 'ESP', 'JFL', 2.05, '1992-01-16', 2),
(25403, 'FUEN', 14, 'Joseph, Robert', 'F', 'HTI', 'COT', 2.04, '1979-09-27', 1),
(25404, 'FUEN', 15, 'Diouf, Michel', 'F', 'SEN', 'JFL', 2.10, '1990-08-03', 1),
(25405, 'FUEN', 21, 'Cortaberría, Jon', 'E', 'ESP', 'JFL', 2.00, '1983-09-06', 3),
(25406, 'FUEN', 23, 'Sánchez, Sergio', 'B', 'ESP', 'JFL', 1.89, '1982-11-24', 2),
(25407, 'FUEN', 31, 'Ffriend, Kimani', 'P', 'JAM', 'COT', 2.11, '1979-07-04', 1),
(25408, 'FUEN', 33, 'Muñoz, Álvaro', 'A', 'ESP', 'JFL', 1.96, '1992-01-23', 3),
(25409, 'MADR', 4, 'Tomic, Ante', 'P', 'HRV', 'EUR', 2.17, '1988-12-09', 3),
(25410, 'MADR', 6, 'Sanz, Jorge', 'B', 'ESP', 'JFL', 1.88, '1994-09-16', 2),
(25411, 'MADR', 7, 'Pocius, Martynas', 'A', 'LTU', 'EUR', 1.96, '1987-09-25', 1),
(25412, 'MADR', 8, 'Suárez, Carlos', 'A', 'ESP', 'JFL', 2.02, '1987-04-25', 2),
(25413, 'MADR', 9, 'Reyes, Felipe', 'P', 'ESP', 'JFL', 2.04, '1981-06-19', 8),
(25414, 'MADR', 11, 'Díez, Daniel', 'A', 'ESP', 'JFL', 2.01, '1994-11-15', 1),
(25415, 'MADR', 12, 'Mirotic, Nikola', 'F', 'ESP', 'JFL', 2.08, '1992-12-05', 3),
(25416, 'MADR', 13, 'Rodríguez, Sergio', 'B', 'ESP', 'JFL', 1.90, '1988-12-13', 2),
(25417, 'MADR', 14, 'Velickovic, Novica', 'F', 'SRB', 'EUR', 2.05, '1988-04-07', 3),
(25418, 'MADR', 16, 'Begic, Mirza', 'P', 'SVN', 'EUR', 2.16, '1987-02-01', 2),
(25419, 'MADR', 20, 'Carroll, Jaycee', 'E', 'AZE', 'EUR', 1.88, '1984-08-08', 1),
(25420, 'MADR', 22, 'Singler, Kyle', 'A', 'USA', 'EXT', 2.03, '1989-05-06', 1),
(25421, 'MADR', 23, 'Llull, Sergio', 'B', 'ESP', 'JFL', 1.90, '1989-10-08', 6),
(25422, 'MURC', 4, 'Jasen, Juan Ignacio', 'E', 'ESP', 'EUR', 1.96, '1987-01-09', 1),
(25423, 'MURC', 5, 'Augustine, James', 'F', 'USA', 'EXT', 2.08, '1985-06-11', 1),
(25424, 'MURC', 6, 'Toledo, Carlos', 'A', 'ESP', 'JFL', 1.98, '1991-07-13', 1),
(25425, 'MURC', 7, 'Udoka, Ime', 'A', 'NGA', 'COT', 1.98, '1979-08-25', 1),
(25426, 'MURC', 8, 'Douby, Quincy', 'E', 'USA', 'EXT', 1.91, '1985-06-17', 1),
(25427, 'MURC', 9, 'Méndez, Adrián', 'A', 'ESP', 'JFL', 1.95, '1995-07-05', 1),
(25428, 'MURC', 10, 'Sekulic, Blagota', 'P', 'MNE', 'EUR', 2.10, '1983-01-19', 1),
(25429, 'MURC', 11, 'Franch, Josep', 'B', 'ESP', 'JFL', 1.90, '1992-03-27', 1),
(25430, 'MURC', 14, 'Rivero, Pedro', 'B', 'ESP', 'JFL', 1.86, '1981-04-14', 1),
(25431, 'MURC', 15, 'Pérez, Sergio', 'A', 'ESP', 'JFL', 2.04, '1981-07-07', 1),
(25432, 'MURC', 20, 'Barlow, David', 'A', 'AUS', 'EUR', 2.05, '1985-07-06', 1),
(25433, 'MURC', 31, 'Miso, Andrés', 'E', 'ESP', 'JFL', 1.99, '1984-03-14', 1),
(25434, 'MURC', 34, 'Rejón, Guillermo', 'F', 'ESP', 'JFL', 2.06, '1978-11-20', 1),
(25435, 'MURC', 44, 'Grimau, Jordi', 'E', 'ESP', 'JFL', 1.97, '1985-12-21', 1),
(25436, 'MALA', 5, 'Rodríguez, Berni', 'E', 'ESP', 'JFL', 1.97, '1982-09-15', 13),
(25437, 'MALA', 6, 'Rowland, EJ', 'B', 'BGR', 'EUR', 1.88, '1984-05-11', 1),
(25438, 'MALA', 7, 'Lima, Augusto Cesar', 'F', 'ESP', 'JFL', 2.06, '1993-09-08', 3),
(25439, 'MALA', 8, 'DeVries, Troy', 'E', 'USA', 'EXT', 1.93, '1984-03-14', 1),
(25440, 'MALA', 9, 'Valters, Kristaps', 'B', 'LVA', 'EUR', 1.91, '1983-09-28', 1),
(25441, 'MALA', 10, 'Peric, Hrvoje', 'A', 'HRV', 'EUR', 2.03, '1987-11-15', 1),
(25442, 'MALA', 12, 'Darden, Tremmell', 'A', 'USA', 'EXT', 1.94, '1983-11-27', 1),
(25443, 'MALA', 15, 'Garbajosa, Jorge', 'P', 'ESP', 'JFL', 2.06, '1979-01-11', 4),
(25444, 'MALA', 16, 'Abrines, Álex', 'A', 'ESP', 'JFL', 1.96, '1995-08-08', 1),
(25445, 'MALA', 17, 'Kuzmic, Ognjen', 'P', 'BIH', 'EUR', 2.14, '1991-04-18', 1),
(25446, 'MALA', 19, 'Freeland, Joel', 'F', 'GBR', 'EUR', 2.08, '1988-04-14', 3),
(25447, 'MALA', 21, 'Zoric, Luka', 'F', 'HRV', 'EUR', 2.11, '1986-08-16', 1),
(25448, 'MALA', 22, 'Sinanovic, Nedzad', 'P', 'ESP', 'JFL', 2.22, '1984-12-28', 2),
(25449, 'MALA', 25, 'Díaz, Alberto', 'B', 'ESP', 'JFL', 1.88, '1995-02-22', 1),
(25450, 'VALE', 0, 'San Miguel, Rodrigo', 'B', 'ESP', 'JFL', 1.86, '1986-05-22', 1),
(25451, 'VALE', 4, 'Markovic, Stefan', 'B', 'SRB', 'EUR', 1.97, '1989-07-13', 1),
(25452, 'VALE', 6, 'Ogilvy, AJ', 'P', 'IRL', 'EUR', 2.11, '1990-08-23', 1),
(25453, 'VALE', 8, 'Newley, Brad', 'A', 'AUS', 'EXT', 2.00, '1986-03-15', 1),
(25454, 'VALE', 9, 'Claver, Victor', 'A', 'ESP', 'JFL', 2.07, '1990-12-06', 7),
(25455, 'VALE', 13, 'Faverani, Vitor', 'P', 'ESP', 'JFL', 2.10, '1989-02-04', 1),
(25456, 'VALE', 16, 'Navarro, Juanlu', 'F', 'ESP', 'JFL', 1.95, '1992-03-17', 2),
(25457, 'VALE', 16, 'Pérez, Alberto', 'B', 'ESP', 'JFL', 1.87, '1996-05-27', 1),
(25458, 'VALE', 17, 'Martínez, Rafa', 'E', 'ESP', 'JFL', 1.90, '1983-09-19', 4),
(25459, 'VALE', 20, 'Pietrus, Florent', 'F', 'FRA', 'EUR', 2.02, '1982-03-26', 4),
(25460, 'VALE', 22, 'De Colo, Nando', 'B', 'FRA', 'EUR', 1.95, '1989-02-20', 3),
(25461, 'VALE', 32, 'Abia, Larry', 'E', 'ESP', 'JFL', 1.96, '1995-02-21', 2),
(25462, 'VALE', 33, 'Caner-Medley, Nik', 'F', 'AZE', 'EUR', 2.03, '1985-03-19', 1),
(25463, 'VALE', 34, 'Pla, Guillem', 'P', 'ESP', 'JFL', 2.00, '1992-11-06', 1),
(25464, 'VALE', 55, 'Dean, Taquan', 'E', 'USA', 'EXT', 1.93, '1985-05-12', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `nacionalidade`
--
ALTER TABLE `nacionalidade`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `UNIQUE_email` (`email`);

--
-- Indices de la tabla `xogador`
--
ALTER TABLE `xogador`
  ADD PRIMARY KEY (`numero_licencia`),
  ADD KEY `fk_xogador_equipo` (`codigo_equipo`),
  ADD KEY `fk_xogador_nacionalidade` (`nacionalidade`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `xogador`
--
ALTER TABLE `xogador`
  MODIFY `numero_licencia` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25465;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `xogador`
--
ALTER TABLE `xogador`
  ADD CONSTRAINT `fk_xogador_equipo` FOREIGN KEY (`codigo_equipo`) REFERENCES `equipo` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_xogador_nacionalidade` FOREIGN KEY (`nacionalidade`) REFERENCES `nacionalidade` (`codigo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
