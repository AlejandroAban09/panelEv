-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-01-2026 a las 11:23:58
-- Versión del servidor: 10.5.27-MariaDB-cll-lve
-- Versión de PHP: 8.1.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hgrrctpa_wppinc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargados`
--

CREATE TABLE `encargados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `tienda_id` int(11) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_menu` varchar(50) DEFAULT NULL,
  `current_ticket_id` int(11) DEFAULT NULL,
  `last_evidence_ack_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `encargados`
--

INSERT INTO `encargados` (`id`, `nombre`, `telefono`, `email`, `tienda_id`, `activo`, `created_at`, `updated_at`, `status_menu`, `current_ticket_id`, `last_evidence_ack_at`) VALUES
(1, 'Alfredo Puc', '529995555335', 'alfredo@navegantes.mx', 4, 1, '2025-12-12 17:45:45', '2026-01-05 17:02:44', 'inicio', 12, '2025-12-30 13:59:51'),
(2, 'Jesus Medrano', '529999008080', 'nav.alfredo06@gmail.com', 3, 1, '2025-12-16 12:47:26', '2026-01-05 17:40:11', 'inicio', 17, '2025-12-30 16:59:38'),
(3, 'José Pérez Sánchez', '529999000000', 'juanpesa@dunosusa.com.mx', 2, 1, '2025-12-16 13:00:14', '2026-01-05 17:22:49', NULL, NULL, NULL),
(4, 'Cristofer Torres', '529991275612', 'cristofer.torres@dunosusa.com.mx', 120, 1, '2026-01-06 09:14:25', '2026-01-06 10:48:35', 'inicio', 20, NULL),
(5, 'Guido Espadas Madera', '529992784778', 'guido.espadas@dunosusa.com.mx', 261, 1, '2026-01-06 12:23:48', '2026-01-06 12:30:53', 'esperando_tipo', 22, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evidencias`
--

CREATE TABLE `evidencias` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `tipo_archivo` varchar(50) NOT NULL,
  `url_storage` varchar(300) NOT NULL,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  `tamano_bytes` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `wa_media_id` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `evidencias`
--

INSERT INTO `evidencias` (`id`, `ticket_id`, `tipo_archivo`, `url_storage`, `nombre_archivo`, `tamano_bytes`, `created_at`, `wa_media_id`) VALUES
(1, 1, 'image', 'uploads/incidencias/1/image_693cad3b372ad.jpeg', 'image_693cad3b372ad.jpeg', 129177, '2025-12-12 18:03:08', NULL),
(2, 1, 'document', 'uploads/incidencias/1/document_693cad77627bf.pdf', 'document_693cad77627bf.pdf', 93773, '2025-12-12 18:04:07', NULL),
(3, 2, 'image', 'uploads/incidencias/2/image_6941af5b7daf1.jpeg', 'image_6941af5b7daf1.jpeg', 72039, '2025-12-16 13:13:32', NULL),
(4, 2, 'audio', 'uploads/incidencias/2/audio_6941af709f0e8.ogg; codecs=opus', 'audio_6941af709f0e8.ogg; codecs=opus', 21129, '2025-12-16 13:13:53', NULL),
(5, 2, 'document', 'uploads/incidencias/2/document_6941af8124bf9.png', 'document_6941af8124bf9.png', 20643, '2025-12-16 13:14:10', NULL),
(6, 2, 'video', 'uploads/incidencias/2/video_6941af9fd2821.mp4', 'video_6941af9fd2821.mp4', 1769691, '2025-12-16 13:14:40', NULL),
(7, 3, 'image', 'uploads/incidencias/3/image_6945d382cd23a.jpeg', 'image_6945d382cd23a.jpeg', 199491, '2025-12-19 16:36:51', NULL),
(8, 3, 'image', 'uploads/incidencias/3/image_6945d3837395b.jpeg', 'image_6945d3837395b.jpeg', 16246, '2025-12-19 16:36:52', NULL),
(9, 4, 'image', 'uploads/incidencias/4/image_6945de5e4da31.jpeg', 'image_6945de5e4da31.jpeg', 29083, '2025-12-19 17:23:10', NULL),
(10, 4, 'image', 'uploads/incidencias/4/image_6945de5dbf49c.jpeg', 'image_6945de5dbf49c.jpeg', 45828, '2025-12-19 17:23:11', NULL),
(11, 5, 'image', 'uploads/incidencias/5/image_6945e3e1eb078.jpeg', 'image_6945e3e1eb078.jpeg', 16246, '2025-12-19 17:46:42', '855836483836910'),
(12, 5, 'image', 'uploads/incidencias/5/image_6945e3e48161c.jpeg', 'image_6945e3e48161c.jpeg', 29083, '2025-12-19 17:46:45', '25535926689359619'),
(13, 6, 'image', 'uploads/incidencias/6/image_69542f2866d95.jpeg', 'image_69542f2866d95.jpeg', 91490, '2025-12-30 13:59:37', '1608631790565625'),
(14, 6, 'image', 'uploads/incidencias/6/image_69542f33b2e3d.jpeg', 'image_69542f33b2e3d.jpeg', 214862, '2025-12-30 13:59:48', '806933182369009'),
(15, 7, 'image', 'uploads/incidencias/7/image_6954588bd0729.jpeg', 'image_6954588bd0729.jpeg', 156885, '2025-12-30 16:56:13', '1443051327385303'),
(16, 8, 'image', 'uploads/incidencias/8/image_6954595633a2a.jpeg', 'image_6954595633a2a.jpeg', 177834, '2025-12-30 16:59:35', '1154767443313757'),
(17, 8, 'image', 'uploads/incidencias/8/image_6954595b9242a.jpeg', 'image_6954595b9242a.jpeg', 82471, '2025-12-30 16:59:40', '2341972536236708'),
(18, 12, 'image', 'uploads/incidencias/12/image_695592aa0208b.jpeg', 'image_695592aa0208b.jpeg', 74640, '2025-12-31 15:16:27', '1362488161734773'),
(19, 12, 'image', 'uploads/incidencias/12/image_695592ba1438b.jpeg', 'image_695592ba1438b.jpeg', 270642, '2025-12-31 15:16:42', '1162374936058634'),
(20, 12, 'image', 'uploads/incidencias/12/image_695592bd7abf9.jpeg', 'image_695592bd7abf9.jpeg', 91490, '2025-12-31 15:16:46', '25164223846612521'),
(21, 13, 'image', 'uploads/incidencias/13/image_6958133c718f2.jpeg', 'image_6958133c718f2.jpeg', 130412, '2026-01-02 12:49:33', '1362590302269433'),
(22, 13, 'document', 'uploads/incidencias/13/document_69581377160dd.png', 'document_69581377160dd.png', 8547254, '2026-01-02 12:50:32', '1334497265359203'),
(23, 14, 'image', 'uploads/incidencias/14/image_695c0588e15e2.jpeg', 'image_695c0588e15e2.jpeg', 248664, '2026-01-05 12:40:09', '860863536813133'),
(24, 14, 'video', 'uploads/incidencias/14/video_695c05be26db3.mp4', 'video_695c05be26db3.mp4', 1021792, '2026-01-05 12:41:02', '1119043183508420'),
(25, 15, 'image', 'uploads/incidencias/15/image_695c06ca13be5.jpeg', 'image_695c06ca13be5.jpeg', 284342, '2026-01-05 12:45:30', '1593213721716018'),
(26, 15, 'video', 'uploads/incidencias/15/video_695c06e73a777.mp4', 'video_695c06e73a777.mp4', 1536730, '2026-01-05 12:46:00', '2228715017652425'),
(27, 16, 'image', 'uploads/incidencias/16/image_695c07e110854.jpeg', 'image_695c07e110854.jpeg', 246526, '2026-01-05 12:50:10', '852012747716769'),
(28, 16, 'video', 'uploads/incidencias/16/video_695c07e93ec29.mp4', 'video_695c07e93ec29.mp4', 480250, '2026-01-05 12:50:18', '1205453387666389'),
(29, 17, 'video', 'uploads/incidencias/17/video_695c1cea02db9.mp4', 'video_695c1cea02db9.mp4', 480250, '2026-01-05 14:19:55', '1584014722789489'),
(30, 17, 'image', 'uploads/incidencias/17/image_695c1cfca8612.jpeg', 'image_695c1cfca8612.jpeg', 284454, '2026-01-05 14:20:13', '2247360025756207'),
(31, 18, 'document', 'uploads/incidencias/18/document_695d27ad883bd.plain', 'document_695d27ad883bd.plain', 14055, '2026-01-06 09:18:06', '1247448043922742'),
(32, 18, 'image', 'uploads/incidencias/18/image_695d27df864dc.jpeg', 'image_695d27df864dc.jpeg', 7127, '2026-01-06 09:18:56', '1621232185552829'),
(33, 19, 'image', 'uploads/incidencias/19/image_695d2a2179453.jpeg', 'image_695d2a2179453.jpeg', 124313, '2026-01-06 09:28:34', '920764587254040'),
(34, 20, 'document', 'uploads/incidencias/20/document_695d3cde5c33b.plain', 'document_695d3cde5c33b.plain', 6, '2026-01-06 10:48:30', '908300718200787'),
(35, 21, 'image', 'uploads/incidencias/21/image_695d54bc5a9a9.jpeg', 'image_695d54bc5a9a9.jpeg', 199271, '2026-01-06 12:30:21', '730928543032423');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `encargado_id` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `ruta_zip` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pendiente',
  `created_at` datetime DEFAULT current_timestamp(),
  `closed_at` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `enviado_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `encargado_id`, `tienda_id`, `tipo_id`, `descripcion`, `ruta_zip`, `status`, `created_at`, `closed_at`, `closed_by`, `enviado_at`) VALUES
(1, 1, 1, 1, NULL, 'uploads/incidencias/1/ticket_1_20251212181208.zip', 'cerrado', '2025-12-12 17:57:24', '2025-12-19 01:14:12', 1, '2025-12-12 18:12:08'),
(2, 2, 2, 9, NULL, 'uploads/incidencias/2/ticket_2_20251216131709.zip', 'abierto', '2025-12-16 13:12:06', NULL, NULL, '2025-12-16 13:17:10'),
(3, 1, 1, 3, NULL, 'uploads/incidencias/3/ticket_3_20251219164246.zip', 'abierto', '2025-12-19 16:35:08', NULL, NULL, '2025-12-19 16:42:46'),
(4, 1, 1, 2, NULL, 'uploads/incidencias/4/ticket_4_20251219174409.zip', 'abierto', '2025-12-19 17:22:05', NULL, NULL, '2025-12-19 17:44:09'),
(5, 1, 1, 6, NULL, 'uploads/incidencias/5/ticket_5_20251219174807.zip', 'abierto', '2025-12-19 17:45:07', NULL, NULL, '2025-12-19 17:48:07'),
(6, 1, 1, 3, NULL, 'uploads/incidencias/6/ticket_6_20251230140016.zip', 'abierto', '2025-12-30 13:58:54', NULL, NULL, '2025-12-30 14:00:16'),
(8, 2, 2, 6, NULL, 'uploads/incidencias/8/ticket_8_20251230170120.zip', 'cerrado', '2025-12-30 16:58:51', '2025-12-30 17:05:52', 1, '2025-12-30 17:01:20'),
(9, 1, 1, NULL, NULL, NULL, 'abierto', '2025-12-31 15:00:32', NULL, NULL, NULL),
(10, 1, 1, NULL, NULL, NULL, 'abierto', '2025-12-31 15:03:30', NULL, NULL, NULL),
(11, 1, 1, NULL, NULL, NULL, 'abierto', '2025-12-31 15:09:53', NULL, NULL, NULL),
(12, 1, 1, 3, NULL, 'uploads/incidencias/12/ticket_12_20251231151656.zip', 'cerrado', '2025-12-31 15:15:01', '2026-01-02 12:47:52', 1, '2025-12-31 15:16:56'),
(13, 2, 2, 3, NULL, 'uploads/incidencias/13/ticket_13_20260102125039.zip', 'cerrado', '2026-01-02 12:48:12', '2026-01-02 12:54:35', 1, '2026-01-02 12:50:48'),
(14, 2, 2, 8, NULL, 'uploads/incidencias/14/ticket_14_20260105124108.zip', 'abierto', '2026-01-05 12:39:01', NULL, NULL, '2026-01-05 12:41:08'),
(15, 2, 2, 8, NULL, 'uploads/incidencias/15/ticket_15_20260105124607.zip', 'cerrado', '2026-01-05 12:44:26', '2026-01-06 10:40:34', 4, '2026-01-05 12:46:09'),
(16, 2, 2, 8, NULL, 'uploads/incidencias/16/ticket_16_20260105125024.zip', 'cerrado', '2026-01-05 12:49:08', '2026-01-05 12:52:19', 1, '2026-01-05 12:50:24'),
(17, 2, 2, 3, NULL, 'uploads/incidencias/17/ticket_17_20260105142020.zip', 'cerrado', '2026-01-05 14:17:53', '2026-01-05 14:24:52', 1, '2026-01-05 14:20:20'),
(18, 4, 120, 3, NULL, 'uploads/incidencias/18/ticket_18_20260106091920.zip', 'cerrado', '2026-01-06 09:16:35', '2026-01-06 10:40:27', 4, '2026-01-06 09:19:20'),
(19, 4, 120, 3, NULL, 'uploads/incidencias/19/ticket_19_20260106092834.zip', 'cerrado', '2026-01-06 09:27:24', '2026-01-06 10:40:15', 4, '2026-01-06 09:28:34'),
(20, 4, 120, 3, NULL, 'uploads/incidencias/20/ticket_20_20260106104833.zip', 'cerrado', '2026-01-06 10:41:53', '2026-01-06 11:24:31', 5, '2026-01-06 10:48:33'),
(21, 5, 261, 7, NULL, 'uploads/incidencias/21/ticket_21_20260106123028.zip', 'abierto', '2026-01-06 12:28:53', NULL, NULL, '2026-01-06 12:30:28'),
(22, 5, 261, NULL, NULL, NULL, 'abierto', '2026-01-06 12:30:51', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `centro_costo` varchar(10) DEFAULT NULL,
  `estado` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `municipio` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `supervisor` varchar(150) DEFAULT NULL,
  `gerente` varchar(150) DEFAULT NULL,
  `director` varchar(150) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tiendas`
--

INSERT INTO `tiendas` (`id`, `nombre`, `centro_costo`, `estado`, `municipio`, `direccion`, `supervisor`, `gerente`, `director`, `activo`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'BAZAR', '1002', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/6Mw5oSNyW5oBoJos6', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(2, 'GRAN DUNOSUSA', '1003', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/UZcwFPsTxcRrMoqp6', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(3, 'TICUL', '1004', 'YUCATAN', 'TICUL ', 'https://goo.gl/maps/7qQdVkUbP2Q9uPPj8', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(4, 'COCOS', '1005', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/L6ApKQGWgoSFfHjK8', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(5, 'SUCURSAL 54', '1006', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/gdfNqCtKFVWy8dA87', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(6, 'OXKUTZCAB', '1007', 'YUCATAN', 'OXKUTZCAB', 'https://goo.gl/maps/tHZRWFVZicGUWcms5', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(7, 'PROGRESO 1', '1008', 'YUCATAN', 'PROGRESO', 'https://goo.gl/maps/6SQGoa3iDYaTjohh6', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(8, 'TIXKOKOB', '1009', 'YUCATAN', 'TIXKOKOB', 'https://goo.gl/maps/YfyCEoU5XvNVG2ym6', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(9, 'MOTUL', '1010', 'YUCATAN', 'MOTUL', 'https://goo.gl/maps/hFGterMX3Z2TEVts9', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(10, 'SUC. 69', '1011', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/QRDMukAHXE1egPHdA', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(11, 'SUC. 59', '1012', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/iDLNXvjtYbF4J6Ar5', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(12, 'ACANCEH', '1013', 'YUCATAN', 'ACANCEH', 'https://goo.gl/maps/w5XqBeUEp99Y1Vrh7', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(13, 'PACABTUN', '1014', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/j9qQVmbnjqv6GsXm6', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(14, 'YUCALPETEN', '1016', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/m4A5DtHnw3BDrVvn6', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(15, 'TIZIMIN', '1017', 'YUCATAN', 'TIZIMIN', 'https://goo.gl/maps/noD2RsWfXAC5KePo8', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(16, 'SUC. 42', '1018', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/VrgomPo7URcTH1746', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(17, 'CORDEMEX', '1020', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/3fHao5ArT6gqCUVR9', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(18, 'PROGRESO PLAZA', '1021', 'YUCATAN', 'PROGRESO', 'https://goo.gl/maps/2sG9TTrxFFGGfYi4A', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(19, 'KANASIN', '1022', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/VVkMJGjJLgptPaEK8', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(20, 'CHENKU', '1023', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/CNKXFThKY4RReN5c9', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(21, 'UMAN', '1025', 'YUCATAN', 'UMÁN', 'https://goo.gl/maps/QpLgoUtEufW2VEpE9', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(22, 'MERCEDES BARRERA', '1026', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/2dU7PxaZuchw4xHL6', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(23, 'CASCADA', '1028', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/y5eV9kaVQVRhpwxv5', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(24, 'IZAMAL', '1029', 'YUCATAN', 'IZAMAL ', 'https://goo.gl/maps/FxA8DRu8YDDvZ8Du8', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(25, 'MOTUL 2', '1032', 'YUCATAN', 'MOTUL', 'https://goo.gl/maps/p4Uwt35h6vgkzbVH9', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(26, 'MAXCANU', '1033', 'YUCATAN', 'MAXCANU', 'https://goo.gl/maps/1DMKt1GyNP4NmeWK9', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(27, 'SUC. 54-A', '1034', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/crvSWLGRj7pxhtzZ7', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(28, 'AMALIA SOLORZANO', '1035', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/p7M6NqfVRTdXHzZV7', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(29, 'JUAN PABLO XOCLAN', '1036', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/9NWeiwSnVNfyu2X3A', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(30, 'VICENTE SOLIS', '1037', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Stn4Jj8z4WtKfvs7A', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(31, 'FUENTE MAYA', '1038', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/PxYsGcQzy6ErHUMz7', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(32, 'CHUBURNA', '1039', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/EV5tZML5tCs3GKyh9', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(33, 'DZIDZANTUN', '1040', 'YUCATAN', 'DZIDZANTUN', 'https://goo.gl/maps/q4vcarQt2CRtCYNx6', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(34, 'MONTEALBAN', '1041', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/6zK6bRnrV17eXUgN6', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(35, 'HUNUCMA', '1042', 'YUCATAN', 'HUNUCMA', 'https://goo.gl/maps/oQ8CTuJWryj8DcFGA', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(36, 'JACINTO CANEK', '1043', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/k8Gq1SVAJxEaRk6L6', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(37, 'PETO', '1044', 'YUCATAN', 'PETO', 'https://goo.gl/maps/ogj199epQ49NhJpR8', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(38, 'HALACHO', '1045', 'YUCATAN', 'HALACHO', 'https://goo.gl/maps/NKEeFDUzcen41uVx8', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(39, 'MOTUL 3', '1046', 'YUCATAN', 'MOTUL', 'https://goo.gl/maps/jTnKGTFVPddXqjE67', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(40, 'TICUL 2', '1047', 'YUCATAN', 'TICUL ', 'https://goo.gl/maps/J9gibRSWHY62F9ib7', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(41, 'FRANCISCO DE MONTEJO', '1048', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/9BriFJHJrJ2QBNW87', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(42, 'ITZAES', '1049', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/xTJKDk486SrVWE6V6', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(43, 'VALLE DORADO', '1050', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/99yULzQRPHsmQSjw9', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(44, 'TULIPANES', '1051', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Zd3bkacAiyNwEtjN8', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(45, 'VALLADOLID', '1053', 'YUCATAN', 'VALLADOLID', 'https://goo.gl/maps/8jN8Af5kaDDPcF3X8', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(46, 'TEKAX', '1054', 'YUCATAN', 'TEKAX', 'https://goo.gl/maps/yFxaE7A2GdEYZQoC9', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(47, 'SUC. 67', '1057', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/p9qWa9unbGLPiEfU9', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(48, 'TIZIMIN 2', '1059', 'YUCATAN', 'TIZIMIN', 'https://goo.gl/maps/fJJhQjmXHu9F8w7S7', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(49, 'SAN SEBASTIAN', '1060', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/BToHM8LdSmSUxb5b6', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(50, 'FRANCISCO DE MONTEJO 2', '1061', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/aVC6WGJ1t1rFok6z7', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(51, 'COLONIA MAYA', '1063', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/zZkpt8F2iXVMr2Aa6', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(52, 'TIZIMIN 3', '1064', 'YUCATAN', 'TIZIMIN', 'https://goo.gl/maps/zh4ttUZ7LcVXYPiP8', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(53, 'MIRAFLORES', '1066', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/e3tBS3hidMcvpXu97', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(54, 'UMAN 2', '1067', 'YUCATAN', 'UMÁN', 'https://goo.gl/maps/awL3GiQWAxy4vVRc7', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(55, 'CHEMAX', '1068', 'YUCATAN', 'CHEMAX', 'https://goo.gl/maps/myzPtGw48uhCG8LX6', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(56, 'TEKIT', '1069', 'YUCATAN', 'TEKIT', 'https://goo.gl/maps/B1dKk8ys5CX8o3yBA', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(57, 'EL PORVENIR', '1070', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/KSKUfS1ExQQwz39a8', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(58, 'CHUMINOPOLIS', '1071', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/QFBdy5hZxJq13sUq5', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(59, 'VALLADOLID MERCADO', '1072', 'YUCATAN', 'VALLADOLID', 'https://goo.gl/maps/7Xqva9WckpndUjqT9', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(60, 'MULSAY', '1073', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/NKHgrkRS38TRR3986', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(61, 'AVENIDA 128', '1075', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Z3gu4Uj7JQ5aD3jLA', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(62, 'TECOH', '1076', 'YUCATAN', 'TECOH', 'https://goo.gl/maps/6hpQjUL8hGfgDC976', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(63, 'LOS REYES', '1077', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/DboffNgYS2AxZedf6', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(64, 'PLAN DE AYALA', '1078', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/fD8s9BPqtQrZVYfy8', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(65, 'PORTES GIL', '1079', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/iZwnaVtsbvcougjTA', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(66, 'SUC. 50 SUR', '1080', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/ADEm21Tfnt2QZKsV7', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(67, 'NUEVA MULCHECHEN', '1082', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/4cyGfu6qPHC4mQdm7', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(68, 'OXKUTZCAB 2', '1083', 'YUCATAN', 'OXKUTZCAB', 'https://goo.gl/maps/mKsc31E2hryRowCD6', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(69, 'DOLORES OTERO', '1084', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/HhpNu2qLmrUwHpNZA', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(70, 'FRACC. DEL SUR', '1085', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/yZuzbKWS7Ei11jYx8', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(71, 'SUC. 61', '1086', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/t86KP3pwccuFJ3ce6', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(72, 'CIRCUITO COLONIAS', '1088', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/NQJNxPDjEhet1NpV8', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(73, 'EMILIANO ZAPATA SUR III', '1089', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Lw5UjgAgFDGw6HdP8', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(74, 'TEMOZON', '1090', 'YUCATAN', 'TEMOZON', 'https://goo.gl/maps/4TNtcrTsDQZZmHex8', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(75, 'SALVADOR ALVARADO SUR', '1091', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/viGMRACnAo6mjGY59', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(76, 'HOMUN', '1092', 'YUCATAN', 'HOMUN', 'https://goo.gl/maps/4WwK33HLtguysubS9', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(77, 'ALEMAN', '1093', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/1rRzFg4Ajsk4MJAY6', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(78, 'PROGRESO 4', '1094', 'YUCATAN', 'PROGRESO', 'https://goo.gl/maps/NjPGWVRyRvnvrWHQ6', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(79, 'CINCO COLONIAS', '1095', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/8xrWuMav3Dw4Nk8f7', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(80, 'CHOLUL', '1096', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/tp6TemVuiGTZnfps5', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(81, 'BOJORQUEZ', '1097', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/DW1b3KLmVZHouzrN9', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(82, 'AV. MADERO', '1098', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Zbu2CJ3uB35CdaMp8', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(83, 'FRACC. EL ROBLE', '1099', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/McYiv9ShtJHLA1Aw6', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(84, 'NORA QUINTANA', '1100', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/mji155aYYzoTJtE17', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(85, 'FCO VILLA PONIENTE', '1101', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/CKnGm1BR93DpCj4c8', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(86, 'AZCORRA', '1102', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/MgyGuTozBNbnvudP9', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(87, 'VERGEL 2', '1103', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/TS8gBhFhZQSEGYdJ8', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(88, 'BACA', '1104', 'YUCATAN', 'BACA', 'https://goo.gl/maps/bkPPGtnzY8qVpKSb7', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(89, 'DIAZ ORDAZ', '1106', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/yATv4MMWoy29mdJ7A', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(90, 'COLONIA OBRERA', '1107', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/h6BmtDqv7aqJmWmo8', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(91, 'MACROPLAZA', '1108', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/cwyfrbNtiCtQCKaBA', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(92, 'UMAN ITZINCAB', '1109', 'YUCATAN', 'UMÁN', 'https://goo.gl/maps/1qVaierUUV1Ltwy68', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(93, 'MIGUEL HIDALGO MÉRIDA', '1110', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/bmbr7KEfuakoe6S9A', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(94, 'MELITON SALAZAR', '1112', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/ZMF2WoowuYbko49P8', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(95, 'JUAN PABLO 2', '1113', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Y6NuCFXkfjL5qpzD7', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(96, 'IZAMAL 2', '1114', 'YUCATAN', 'IZAMAL ', 'https://goo.gl/maps/KWjr3jizr1RR2U7s9', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(97, 'JUAN B. SOSA', '1115', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/1xzoSpTf5oCbYxtA7', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(98, 'SEYE', '1116', 'YUCATAN', 'SEYE', 'https://goo.gl/maps/oV8BdwVHperis6fm8', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(99, 'TIXCACAL OPICHEN', '1117', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/TibGHit5WfahBzfm6', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(100, 'MULSAY IGLU', '1118', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/TLafTYVsgkmfUNmB7', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(101, 'NUEVA FRANCISCO DE MONTEJO 3', '1120', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/eoeT8HujQZBTe6bKA', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(102, 'TIZIMIN 4', '1121', 'YUCATAN', 'TIZIMIN', 'https://goo.gl/maps/oUC4Mkd4nQKN3gsA8', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(103, 'SUC. 58', '1122', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/rkHQKQuqkvAaQXpx8', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(104, 'KANASIN 3', '1123', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/M1dxcRkNhsweyaNb7', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(105, 'KANASIN 4', '1124', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/o8Eq2pZkUyDxKQbt8', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(106, 'KANASIN 5', '1125', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/Enqv2SvHGhTfgSn36', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(107, 'SALVADOR ALVARADO ORIENTE', '1127', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/MKYG2VCPRTQ6y7TS9', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(108, 'MUNA', '1128', 'YUCATAN', 'MUNA', 'https://goo.gl/maps/c9LhoG3QcJd7odXN6', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(109, 'SAN ANTONIO KAUA', '1129', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/TnVj5rDNF8FSnTeXA', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(110, 'CIUDAD CAUCEL 1', '1130', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/CJtM5bEVVs8y5odY9', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(111, 'MIRAFLORES 2', '1131', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/TaziyujuCGU2qkE26', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(112, 'KANASIN GRANJAS', '1132', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/Y378M52x1A6JSWeK7', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(113, 'LAS AMERICAS', '1134', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/rdatEFTcPZAA1BVS7', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(114, 'VALLADOLID 3', '1136', 'YUCATAN', 'VALLADOLID', 'https://goo.gl/maps/Ts2K1R3o4ia2soRr8', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(115, 'CAUCEL PUEBLO', '1137', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/3UZojQ4eyZHYNvrc8', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(116, 'SAN JOSE TECOH 1', '1138', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/KosTuZhfp4ZUkiuG7', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(117, 'KANASIN FCO VILLA', '1139', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/uwi1fBY2uEWm2VAN6', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(118, 'KANSIN XELPAC', '1140', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/h9CqpYyYu86QvuuWA', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(119, 'SUC. 67 CENTRO', '1141', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/XfdjBEETCxMwaGTY9', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(120, 'BRISAS', '1142', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/bs4N5ZA7ZshLrd1D6', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(121, 'CELESTUN', '1143', 'YUCATAN', 'CELESTUN', 'https://goo.gl/maps/P2W7trjSj6puYPFp8', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(122, 'PROGRESO 5', '1145', 'YUCATAN', 'PROGRESO', 'https://goo.gl/maps/ZLY59rjsRrQWzRon8', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(123, 'CHEMBECH', '1146', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/f5s6dxJDVt5p2WmZ7', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(124, 'MEXICO ORIENTE', '1148', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Neu9ZGGTXRa2xXzR6', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(125, 'FRANCISO DE MONTEJO 4', '1149', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/TSD14y64vAaVNi156', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(126, 'TIZIMIN MERCADO (5)', '1151', 'YUCATAN', 'TIZIMIN', 'https://goo.gl/maps/zGLQA6w1VGqExVE57', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(127, 'VALLADOLID 4', '1152', 'YUCATAN', 'VALLADOLID', 'https://goo.gl/maps/bkep51a7Atisar2eA', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(128, 'TEKAX 2', '1153', 'YUCATAN', 'TEKAX', 'https://goo.gl/maps/aAyqgs9CvBgPaHUX8', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(129, 'HOCTUN', '1154', 'YUCATAN', 'HOCTUN', 'https://goo.gl/maps/7mu6Hwdy7Xc2sg229', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(130, 'PETO 2', '1155', 'YUCATAN', 'PETO', 'https://goo.gl/maps/jEnTBU6v89wT1VuXA', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(131, 'ALAMOS DEL SUR', '1157', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/1quGToKJ42g54BLs8', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(132, 'MARIA LUISA', '1158', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Mbwdr8f4vCMqybwaA', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(133, 'ACANCEH 2', '1160', 'YUCATAN', 'ACANCEH', 'https://goo.gl/maps/kff1AjhSHyLY53d78', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(134, 'HUNUCMA 2', '1161', 'YUCATAN', 'HUNUCMA', 'https://goo.gl/maps/sMrNjoTuX48LuuZX9', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(135, 'UMAN 3', '1162', 'YUCATAN', 'UMÁN', 'https://goo.gl/maps/J1WtWhuS3Zi8WBZLA', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(136, 'COL. MÉRIDA', '1163', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/eYZbENm2XrFS7TNr8', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(137, 'SAN ANTONIO XLUCH III', '1164', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/ENYkaBNxL4bTy3LF9', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(138, 'ESPITA', '1165', 'YUCATAN', 'ESPITA ', 'https://goo.gl/maps/xb7ANvyLg117xYq39', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(139, 'SAN PEDRO CHOLUL', '1166', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/VKcRyQySPT1Lojzu8', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(140, 'TIMUCUY', '1167', 'YUCATAN', 'TIMUCUY', 'https://goo.gl/maps/Urzy3JakQaXfAYh1A', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(141, 'SANTA MARÍA', '1168', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/8snaaY46mPtWk3jp8', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(142, 'LAS AMERICAS 2', '1169', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/b2CXAQVALtKA3Npg6', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(143, 'NUEVA LIMONES', '1170', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/UsP8CSxfde2kVwfN9', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(144, 'TZUCACAB', '1171', 'YUCATAN', 'TZUCACAB', 'https://goo.gl/maps/JSCQzBGARZv67QJcA', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(145, 'LOS HEROES', '1172', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/TJmHgRrREvfGVb2P6', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(146, 'PISTE', '1173', 'YUCATAN', 'TINUM ', 'https://goo.gl/maps/QgQLrQvVP2DmqYVX7', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(147, 'CIUDAD CAUCEL 2', '1174', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Pj6HBW4XL1qxfsbw7', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(148, 'JARDINES DE MULSAY', '1175', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/P7G6DF1tTSgfvfgz6', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(149, 'CIUDAD CAUCEL 4', '1176', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/rNXkAsLTYEFpVSBe7', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(150, 'TEABO', '1177', 'YUCATAN', 'TEABO ', 'https://goo.gl/maps/Xrt5fESpiX7sEpUH8', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(151, 'OXKUTZCAB 3', '1178', 'YUCATAN', 'OXKUTZCAB', 'https://goo.gl/maps/9BUiAkQMG1EQKhwy8', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(152, 'MAXCANU 2', '1179', 'YUCATAN', 'MAXCANU', 'https://goo.gl/maps/BHA4rwHA7ESUWqEm6', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(153, 'CIUDAD CAUCEL 3', '1180', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/HfjP6KFV8uWGmH5G8', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(154, 'TIXKOKOB 2', '1181', 'YUCATAN', 'TIXKOKOB', 'https://goo.gl/maps/CvSnL6M8hasBYHhf9', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(155, 'BUCTZOTZ', '1182', 'YUCATAN', 'BUCTZOTZ', 'https://goo.gl/maps/aMnftmTkyScAmjAh8', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(156, 'NUEVA REFORMA AGRARIA', '1183', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/e41VutPxVCP6z2EE6', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(157, 'PASEOS DE VERGEL', '1184', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/X3LWsRxD1SFk8WaN9', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(158, 'EMILIANO ZAPATA SUR 2', '1185', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/HmoTZNZsfrXFSkXv8', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(159, 'PROGRESO 6', '1186', 'YUCATAN', 'PROGRESO', 'https://goo.gl/maps/AAigcwBKCX24QoPZ9', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(160, 'CHIXCHULUB PUERTO', '1187', 'YUCATAN', 'PROGRESO', 'https://goo.gl/maps/X5yjd2ES48q2V1ie8', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(161, 'HUNUCMA 3', '1188', 'YUCATAN', 'HUNUCMA', 'https://goo.gl/maps/KarmznuAt9XkHeGy9', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(162, 'KINCHIL', '1189', 'YUCATAN', 'KINCHIL', 'https://goo.gl/maps/NneaT3aqUZHemKeJ9', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(163, 'VALLADOLID 5', '1190', 'YUCATAN', 'VALLADOLID', 'https://goo.gl/maps/AD6uhrY8CwoazS967', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(164, 'GARCÍA GINERES 2', '1191', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/AFt3ojvKUoCcRhSe9', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(165, 'HALACHO 2', '1192', 'YUCATAN', 'HALACHO', 'https://goo.gl/maps/2gvsHhxK8zz8iJGA8', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(166, 'MOTUL 4', '1193', 'YUCATAN', 'MOTUL', 'https://goo.gl/maps/WGkmQfnipWySohWW9', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(167, 'JARDINES DEL NORTE', '1195', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/8u9sopvDjWr6ioV56', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(168, 'ALTABRISA ', '1196', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/z59M8GyrnJpvv7wX7', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(169, 'SAN JOSE TECOH 2', '1197', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/xnEW8fXcWQzB1Qqk6', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(170, 'TIXPEHUAL', '1198', 'YUCATAN', 'TIXPEHUAL', 'https://goo.gl/maps/Vfe54TJKT88pfwFo9', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(171, 'CACALCHEN', '1199', 'YUCATAN', 'CACALCHEN', 'https://goo.gl/maps/YgQBJD2TvcKt5QwT8', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(172, 'KANASIN CENTRO', '1200', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/v54xisrqkugpMZta6', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(173, 'AZCORRA 2 ', '1201', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/pmjEMLwh2UyKcssCA', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(174, 'FLAMBOYANES', '1202', 'YUCATAN', 'PROGRESO', 'https://goo.gl/maps/v4nqMLJZGTRjUm668', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(175, 'DZILAM GONZALEZ', '1203', 'YUCATAN', 'DZILAM GONZALEZ', 'https://goo.gl/maps/L5eG1Ps4myykQcez5', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(176, 'ALEMAN 2', '1204', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/FhukNMjcXpmnBBBYA', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(177, 'RESIDENCIAL PENSIONES', '1205', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/sBSzqhnHqdca7rm7A', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(178, 'UMAN 4', '1206', 'YUCATAN', 'UMÁN', 'https://goo.gl/maps/TW3mXHb5ij2hevZ6A', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(179, 'SAN ANTONIO CINTA', '1207', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/7mF7NC4omivZySTo7', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(180, 'CONKAL 2', '1209', 'YUCATAN', 'CONKAL', 'https://goo.gl/maps/BPLUnUQy36MkAxFCA', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(181, 'CHELEM', '1210', 'YUCATAN', 'PROGRESO', 'https://goo.gl/maps/QNJnruHcjaLVJyKY7', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(182, 'KANASIN VILLAS OTE 2', '1211', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/FmhLAPGhfgeeijWD9', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(183, 'CANSACAB', '1212', 'YUCATAN', 'CANSACAB', 'https://goo.gl/maps/BqmS8AAc7sreqBkv8', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(184, 'SAN MARCOS NOCOH', '1213', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/wqcpn4yfqjpeWANj6', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(185, 'CHICHI SUAREZ', '1214', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Kr8cyBzmLakA7uD67', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(186, 'PASEOS DE OPICHEN', '1215', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/PHSMeYUb7cr4NU99A', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(187, 'AKIL 2', '1216', 'YUCATAN', 'AKIL', 'https://goo.gl/maps/oG7TveP6BZVd9kVT6', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(188, 'PETO 3', '1217', 'YUCATAN', 'PETO', 'https://goo.gl/maps/utmA7LC2id17VZYw5', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(189, 'OXKUTZCAB 4', '1218', 'YUCATAN', 'OXKUTZCAB', 'https://goo.gl/maps/votbgFdcBJeFoSjv6', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(190, 'RIO LAGARTOS', '1219', 'YUCATAN', 'RIO LAGARTOS', 'https://goo.gl/maps/FmFH9p8oqDonSvTK8', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(191, 'KANASIN JARDINES DE SAN P', '1220', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/TkYemXgw6jxLsydC9', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(192, 'FRANCISCO DE MONTEJO 5', '1221', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/SYinjERV9rgL25tZA', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(193, 'CHUBURNA 2', '1222', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/NTkwmCQ2cdREEBY88', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(194, 'KANASIN RENACIMIENTO', '1223', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/221aG4UHre5yaNa56', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(195, 'MOTUL 5', '1224', 'YUCATAN', 'MOTUL', 'https://goo.gl/maps/P9voMK7NoMJz5ynf7', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(196, 'TEMOZON NORTE', '1225', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/B2J7t9ZT3bGtQVR69', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(197, 'MONTES DE AME', '1227', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/WuB9F4KtPZ9bgAqG7', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(198, 'NUEVA MELCHOR OCAMPO', '1228', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/nRXitS1hGVL3CJSd7', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(199, 'CHICHIMILA', '1229', 'YUCATAN', 'CHICHIMILA', 'https://goo.gl/maps/3tcvjfp4hTF9fJTS6', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(200, 'KANASIN CUAUHTEMOC', '1230', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/ixSj5QPMXKXN195v6', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(201, 'VALLADOLID 6', '1231', 'YUCATAN', 'VALLADOLID', 'https://goo.gl/maps/RBesjdE7hY2VBh3w5', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(202, 'TEKAX 3', '1232', 'YUCATAN', 'TEKAX', 'https://goo.gl/maps/dTDAk9nDGqyfraD2A', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(203, 'FELIPE CARRILLO PUERTO MID', '1234', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/i7SotNT4w4ojg6wn9', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(204, 'SUCILÁ', '1235', 'YUCATAN', 'SUCILÁ', 'https://goo.gl/maps/u5QoLVFaToMraPJd9', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(205, 'BOULEVARES DE ORIENTE', '1236', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/NJd1dF8c53KhXyKTA', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(206, 'LA ESPERANZA', '1237', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/SHCe6KZSHs8cSVBZ7', 'IRVIN ESCALANTE', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(207, 'SAN VICENTE CHUBURNA', '1238', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/d9jdhTkrwgrxtGqM6', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(208, 'CIUDAD CAUCEL 5', '1239', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/jXxQZvGFdLbccUmt5', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(209, 'CHOLUL 2', '1240', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/pDZJHfpbeuQKgWm46', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(210, 'VALLADOLID 7', '1241', 'YUCATAN', 'VALLADOLID', 'https://goo.gl/maps/5tZez9Qes4gVvy4k6', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(211, 'TEMAX', '1243', 'YUCATAN', 'TEMAX', 'https://goo.gl/maps/spsPmKNc6kCwZHq28', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(212, 'GRAN SANTA FE', '1244', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/TKGYPd19CQX35CAH8', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(213, 'TICUL 3', '1245', 'YUCATAN', 'TICUL ', 'https://goo.gl/maps/WWRcPD12DXeKNUiXA', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(214, 'LOS PINOS', '1246', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/ybJy1v9BTn9QVvuv7', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(215, 'TICUL 4', '1247', 'YUCATAN', 'TICUL ', 'https://goo.gl/maps/8fR4X6sNRCPquqk77', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(216, 'REAL MONTEJO', '1248', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/9jaXqAa6Jp9Rs1wL6', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(217, 'VILLAS DEL MAYAB', '1250', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/ZFnfYawJhL1PzJS59', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(218, 'JOSE MARIA ITURRALDE', '1251', 'YUCATAN', 'MÉRIDA', 'https://maps.app.goo.gl/mUufN7nkihyn1qzj9', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(219, 'MER GUADALUPANA', '1252', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/xzswN34vQukGN9zFA', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(220, 'VALLADOLID 8', '1253', 'YUCATAN', 'VALLADOLID', 'https://goo.gl/maps/BrDgQCYCxW1ry8tE6', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(221, 'SANTA ROSA', '1254', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/NFjihVrGHn5inLtD7', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(222, 'TELCHAC PUEBLO', '1255', 'YUCATAN', 'TELCHAC PUEBLO', 'https://goo.gl/maps/i8dsEdM3TMQUSHYy9', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(223, 'SISAL ', '1256', 'YUCATAN', 'HUNUCMA', 'https://goo.gl/maps/VgAYsCp7pQ3sXB2N8', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(224, 'CHIXCHULUB PUERTO 2', '1257', 'YUCATAN', 'PROGRESO', 'https://goo.gl/maps/ZJzPa5PzFc82ppQY9', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(225, 'PEDRO INFANTE ', '1258', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/nZ1mqAWbpRV3dnxRA', 'EMILIO MEDINA', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(226, 'TIXKOKOB 3', '1259', 'YUCATAN', 'TIXKOKOB', 'https://goo.gl/maps/aUEiG9kvGySn7YA16', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(227, 'IZAMAL 3', '1260', 'YUCATAN', 'IZAMAL ', 'https://goo.gl/maps/ofcSbHnrwp5dzKQh8', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(228, 'NUEVA CONKAL 1', '1261', 'YUCATAN', 'CONKAL', 'https://goo.gl/maps/ttJXqKWZuyF9JDmL8', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(229, 'BICENTENARIO', '1262', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/GzKnfsgUTp84XpnD6', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(230, 'PENSIONES LA CEIBA ', '1263', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/UvcNZ8ME8raY72pF7', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(231, 'SANTA CRUZ ', '1264', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/6Gsk6CG3dofHE4xG7', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(232, 'UMAN SAN LORENZO', '1265', 'YUCATAN', 'UMÁN', 'https://goo.gl/maps/SB1DnFeRFKxL5wZh8', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(233, 'SALVADOR ALVARADO ORIENTE 2', '1266', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/is47uopEdKoNWZPT7', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(234, 'CIUDAD CAUCEL 6', '1267', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/Jfxt9J5kDMGdUMWK6', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(235, 'UMAN PIEDRA DE AGUA 1', '1268', 'YUCATAN', 'UMÁN', 'https://goo.gl/maps/GrJuhJDrRYdxkV4N8', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(236, 'SAN MARCOS SUSTENTABLE', '1269', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/P5nN9zQ9C4RNxwwA8', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(237, 'DZIDZANTUN 2', '1270', 'YUCATAN', 'DZIDZANTUN', 'https://goo.gl/maps/T3DrXLV77vABzbTa6', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(238, 'URZAIZ', '1271', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/FR65hVSyQf9NG9mh9', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(239, 'IXIL', '1272', 'YUCATAN', 'IXIL', 'https://goo.gl/maps/utATzV6zkh5SGY1K9', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(240, 'CIUDAD CAUCEL 7', '1274', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/utATzV6zkh5SGY1K9', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(241, 'BACA 2', '1275', 'YUCATAN', 'BACA', 'https://goo.gl/maps/5ojW38vysCVzAP8t9', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(242, 'CELESTUN 2', '1276', 'YUCATAN', 'CELESTUN', 'https://goo.gl/maps/Ea1w8StCoduuNgd27', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(243, 'MOTUL 7', '1277', 'YUCATAN', 'MOTUL', 'https://goo.gl/maps/XidbDNKMPCcPCS9A6', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(244, 'DZILAM DE BRAVO ', '1278', 'YUCATAN', 'DZILAM DE BRAVO', 'https://goo.gl/maps/u3JpEpuF61QNzW6h9', 'BETZAYDA ALVAREZ', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(245, 'CRI CRI ', '1279', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/WBE4i6DsWfPFKiD3A', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(246, 'TECOH 3', '1280', 'YUCATAN', 'TECOH', 'https://goo.gl/maps/ketcYHoxmbUXtkp56', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(247, 'SOTUTA', '1281', 'YUCATAN', 'SOTUTA', 'https://goo.gl/maps/4hJr29BW9aiuVbfJ7', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(248, 'TIZIMIN 6 ', '1282', 'YUCATAN', 'TIZIMIN', 'https://goo.gl/maps/orNwsk7hFCd6z8cX7', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(249, 'KANTUNIL ', '1283', 'YUCATAN', 'KANTUNIL', 'https://goo.gl/maps/7J7MZBkqqgc1nhpU9', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(250, 'BUCTZOTZ 2', '1284', 'YUCATAN', 'BUCTZOTZ', 'https://goo.gl/maps/47FLHRjCeYGW8vq27', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(251, 'KERIGMA', '1285', 'YUCATAN', 'MÉRIDA', 'https://maps.app.goo.gl/d16yUYCP3HS9Gg5p7', 'FERNANDO GOMEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(252, 'DZOYOLA', '1286', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/ukRwcdPahsNhMT6v8', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(253, 'VILLA BONITA', '1287', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/cxXh8m2LvcUwCPT78', 'JUAN CHALE', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(254, 'CONKAL 3', '1288', 'YUCATAN', 'CONKAL', 'https://goo.gl/maps/qaRpAcRb56g51Ehn6', 'PEDRO CHIQUINI', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(255, 'LOS HEROES 2', '1289', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/qHjbfKTcaHfKzn9D9', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(256, 'HALACHO 3', '1290', 'YUCATAN', 'HALACHO', 'https://goo.gl/maps/9BdLhQKBHZs33RiLA', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(257, 'ACANCEH 3', '1291', 'YUCATAN', 'ACANCEH', 'https://goo.gl/maps/pRMBpFiMTXZmxCy4A', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(258, 'CUZAMÁ', '1292', 'YUCATAN', 'CUZAMÁ', 'https://goo.gl/maps/WqbjGwCKGsE9jEse8', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(259, 'EL ROBLE 2', '1293', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/uuVFuqHYanmqbwbU6', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(260, 'KANASIN CERRITO ', '1294', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/T7z7T6aP3P2kxAox8', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(261, 'DUNO ESCUELA ', '1295', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/eeUFQSbbukXV8PhE9', 'GUIDO ESPADAS', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(262, 'KANASIN LEONA VICARIO', '1296', 'YUCATAN', 'KANASIN', 'https://goo.gl/maps/z5YFzhTBprF3wFi1A', 'JACOBO CRUZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(263, 'HUNUCMA 4', '1297', 'YUCATAN', 'HUNUCMA', 'https://goo.gl/maps/3kAQQ5pvKACM8KcC9', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(264, 'MUNA 2', '1298', 'YUCATAN', 'MUNA', 'https://goo.gl/maps/rXwcyBVwtmDHpfbP6', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(265, 'HOMUN 2 ', '1299', 'YUCATAN', 'HOMUN', 'https://goo.gl/maps/CqJgXb86qrmXgQ9z6', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(266, 'CHABLEKAL', '1301', 'YUCATAN', 'MÉRIDA', 'https://maps.app.goo.gl/y5Cd24zyATCr5EaA9', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(267, 'CIUDAD CAUCEL 8', '1302', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/hQHzGVkCt5UpNXrK7', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(268, 'NUEVA REFORMA AGRARIA 2', '1303', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/RGny9JfgAWcWHDFg6', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(269, 'UMAN PIEDRA DE AGUA 2', '1304', 'YUCATAN', 'UMÁN', 'https://goo.gl/maps/3ypM9ynbT8JpRCpM7', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(270, 'UMAN PIEDRA DE AGUA 3', '1305', 'YUCATAN', 'UMÁN', 'https://goo.gl/maps/GrJuhJDrRYdxkV4N8', 'CINDY POLANCO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(271, 'CIUDAD CAUCEL 9 ', '1306', 'YUCATAN', 'MÉRIDA', 'https://goo.gl/maps/z16WSeS6QZ1BLEYh7', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(272, 'CIUDAD CAUCEL 10', '1307', 'YUCATAN', 'MÉRIDA', 'https://maps.app.goo.gl/3WEDCPyDhoPmWfnU8', 'ADOLFO TUN', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(273, 'TZUCACAB 2', '1308', 'YUCATAN', 'TZUCACAB', 'https://goo.gl/maps/3DjMAtdyEmxZr8c67', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(274, 'TELCHAC PUERTO', '1309', 'YUCATAN', 'TELCHAC PUERTO', 'https://goo.gl/maps/igJNKw5pMByxHERw7', 'SHOMARA MENDEZ', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(275, 'CHICXULUB COSTERA', '1310', 'YUCATAN', 'PROGRESO', 'https://goo.gl/maps/x64NFEoh9vQQ8nhG7', 'MANUEL CIME', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(276, 'PISTE 2', '1311', 'YUCATAN', 'TINUM ', 'https://maps.app.goo.gl/3XnjW3oFdRT6Zejn7', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(277, 'MAXCANU 3', '1312', 'YUCATAN', 'MAXCANU', 'https://maps.app.goo.gl/7o5j4Pd58BX2tCMU7', 'ADRIAN ACEVEDO', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(278, 'IZAMAL 4', '1313', 'YUCATAN', 'IZAMAL ', 'https://maps.app.goo.gl/4Nq3UCEhfMyNMkvY6', 'IRMA HERRERA', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(279, 'SEYE 2', '1314', 'YUCATAN', 'SEYE', 'https://maps.app.goo.gl/y9sxdPmnaqmEEijc9', 'JUAN ESPINOLA', 'EMMANUEL FLOTA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(280, 'LOS HEROES 3', '1315', 'YUCATAN', 'MÉRIDA', 'https://maps.app.goo.gl/2UFKTaP7FNQ3WJpS9', 'YULI NARVAEZ', 'ERNESTO AVILA', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(281, 'CAMPECHE 16', '2001', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/eeXRyCCHZa7J3ydj8', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(282, 'CAMPECHE MERCADO', '2002', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/sRDDkDfn1KDE2vDy9', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(283, 'CHAMPOTON', '2003', 'CAMPECHE', 'CHAMPOTÓN', 'https://goo.gl/maps/jWz9LLEWvGxpbj9r6', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(284, 'CAMPECHE SANTA ANA', '2004', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/cgiD9cVd3AYSk8GQ8', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(285, 'CAMPECHE SANTA LUCIA', '2006', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/LWs455Akam388HdM8', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(286, 'HECELCHAKAN', '2007', 'CAMPECHE', 'HECELCHAKÁN', 'https://goo.gl/maps/sG5fQbTbJBzYg4mq9', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(287, 'ESCARCEGA 1', '2008', 'CAMPECHE', 'ESCÁRCEGA', 'https://goo.gl/maps/J5fMXRiWzJmQL3f29', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(288, 'CAMPECHE SANTA LUCIA II', '2010', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/jZ1cjzsetnScCsCM9', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(289, 'HOPELCHEN', '2011', 'CAMPECHE', 'HOPELCHÉN', 'https://goo.gl/maps/BEiXj4FTyU2eJP6u9', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(290, 'ESCARCEGA 2', '2012', 'CAMPECHE', 'ESCÁRCEGA', 'https://goo.gl/maps/LCGmoTBm5CmixgJz8', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tiendas` (`id`, `nombre`, `centro_costo`, `estado`, `municipio`, `direccion`, `supervisor`, `gerente`, `director`, `activo`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(291, 'SEYBAPLAYA', '2013', 'CAMPECHE', 'SEYABAPLAYA', 'https://goo.gl/maps/QQkT5PzGXLYp8mGY7', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(292, 'CAMPECHE KALA', '2014', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/7vtusNMe5xnvCW8F7', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(293, 'CD CARMEN COLOSIO', '2015', 'CAMPECHE', 'CARMEN', 'https://goo.gl/maps/8bjNi5b1CMVpyVsEA', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(294, 'CD. DEL CARMEN TECOLUTLA', '2016', 'CAMPECHE', 'CARMEN', 'https://goo.gl/maps/SWMHeCrKNJgo2RyVA', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(295, 'DZILBALCHE CAMPECHE', '2017', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/rxAy1AjHgkNxpuRS7', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(296, 'AV.CENTRAL CAMPECHE', '2018', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/rVNDFsP5GNMtAREx7', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(297, 'CHAMPOTÓN 2', '2019', 'CAMPECHE', 'CHAMPOTÓN', 'https://goo.gl/maps/5afEGr4SpVezaPPq6', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(298, 'ESCARCEGA 3', '2020', 'CAMPECHE', 'ESCÁRCEGA', 'https://goo.gl/maps/RVC3XaVhhHFjT7PK9', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(299, 'CANDELARIA 1', '2021', 'CAMPECHE', 'CANDELARIA', 'https://goo.gl/maps/RSFKRkJD6PGMSfwC8', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(300, 'CD CARMEN SAN CARLOS', '2022', 'CAMPECHE', 'CARMEN', 'https://goo.gl/maps/zs2UCPaiNuAEHm6Y7', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(301, 'CAMP AV LOPEZ MATEOS', '2023', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/u2t7J77tttEhtkkW9', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(302, 'CD CARMEN MERCADO', '2024', 'CAMPECHE', 'CARMEN', 'https://goo.gl/maps/4pBXgSgG4yVbSGYn6', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(303, 'AV 10 DE JULIO', '2026', 'CAMPECHE', 'CARMEN', 'https://goo.gl/maps/NB44tSiCcyXNRYa6A', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(304, 'CHAMPOTÓN 3', '2027', 'CAMPECHE', 'CHAMPOTÓN', 'https://goo.gl/maps/F346gxSaiGLCDyTL8', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(305, 'SAMULA', '2028', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/cCtQ1KQZL9ZguKeo6', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(306, 'PALMA REAL', '2029', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/qYakuvC17HLbBcGTA', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(307, 'SAN ANTONIO', '2030', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/mCx86zqxCBGHgK2d8', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(308, 'CD DEL CARMEN MORELOS', '2031', 'CAMPECHE', 'CARMEN', 'https://goo.gl/maps/VSq3TWcZ1AA6oAJR8', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(309, 'HOPELCHEN 2', '2032', 'CAMPECHE', 'HOPELCHÉN', 'https://goo.gl/maps/YGV7jtbAs4KMH2xi9', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(310, 'VOLCANES', '2033', 'CAMPECHE', 'CARMEN', 'https://goo.gl/maps/LZ9nUMT26hrHQjc39', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(311, 'CALKINI 2', '2034', 'CAMPECHE', 'CALKINÍ', 'https://goo.gl/maps/V6rcj9NaHzLBXszE6', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(312, 'POMUCH', '2035', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/VSZBkRNxG9haRyYG7', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(313, 'CHAMPOTÓN 4', '2036', 'CAMPECHE', 'CHAMPOTÓN', 'https://goo.gl/maps/SiXR3tUrcGFJZx3w9', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(314, 'TENABO', '2037', 'CAMPECHE', 'TENABO', 'https://goo.gl/maps/NP9QyBdydWVeM4rz8', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(315, 'CALKINI MERCADO', '2038', 'CAMPECHE', 'CALKINÍ', 'https://goo.gl/maps/ftkeWgppkyBgM4G99', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(316, 'XPUJIL', '2039', 'CAMPECHE', 'CALAKMUL', 'https://goo.gl/maps/wQNdvvrqXYMHSNSD8', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(317, 'ESCARCEGA 4', '2040', 'CAMPECHE', 'ESCÁRCEGA', 'https://goo.gl/maps/h3FUo1SYysj1LCTN6', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(318, 'SABANCUY', '2041', 'CAMPECHE', 'CARMEN', 'https://goo.gl/maps/ZVGSkru3LzfRYA5S6', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(319, 'PALIZADA', '2042', 'CAMPECHE', 'PALIZADA', 'https://goo.gl/maps/K6QUy1Cpd51PrX8T9', 'JUAN FERRAEZ', 'GILMER CASTILLO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(320, 'NUNKINI', '2043', 'CAMPECHE', 'CALKINÍ', 'https://goo.gl/maps/MiEuCJvRV4CH7GbJ6', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(321, 'CANDELARIA 2 ', '2044', 'CAMPECHE', 'CANDELARIA', 'https://goo.gl/maps/KTcFjgT2LrU67NA77', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(322, 'CHAMPOTÓN 5', '2045', 'CAMPECHE', 'CHAMPOTÓN', 'https://goo.gl/maps/9R4Ckd9dtf5wYGgp8', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(323, 'EL POLVORIN ', '2046', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/tCcKaT62CnEvH9aU9', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(324, 'CHINA CAMPECHE', '2047', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/xrVNpdm4QSwh3jK89', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(325, 'CAMPECHE CENTRO', '2048', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/tGRcE1TEChqmG9FF6', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(326, 'BECAL', '2049', 'CAMPECHE', 'CALKINÍ', 'https://goo.gl/maps/ToYrBF2ZEraRWA9t6', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(327, 'CAMPECHE MORELOS', '2051', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/ds7pbYrBnvWgvDo66', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(328, 'CAMPECHE GRANJAS', '2052', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/BYDWp27LBDxdF4XFA', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(329, 'ESCARCEGA MORELOS', '2053', 'CAMPECHE', 'ESCÁRCEGA', 'https://goo.gl/maps/aW1GFFZd3dET59eX9', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(330, 'PLANCHAC', '2054', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/LbTabrrhXiVQPCZw6', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(331, 'DZIBALCHEN', '2055', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/dk4onWnEtEjMdZQ26', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(332, 'CAMPECHE PRESIDENTES', '2057', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/DpYMsGon6xbSXya69', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(333, 'CALKINI 4', '2059', 'CAMPECHE', 'CALKINÍ', 'https://goo.gl/maps/yrDEKttqDRvBfcfMA', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(334, 'CALKINI 5', '2060', 'CAMPECHE', 'CALKINÍ', 'https://goo.gl/maps/zsiDBdYsjM69gaii8', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(335, 'CAMPECHE FIDEL VELAZQUEZ', '2061', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/T96nYscASYeAUogM7', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(336, 'KANISTE', '2062', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/4bubsSBNSDRLkqpNA', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(337, 'CAMPECHE MONTECRISTO', '2063', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/jhgdF9UEWqwMua4L9', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(338, 'CAMPECHE TOMAS AZNAR', '2064', 'CAMPECHE', 'CAMPECHE', 'https://g.page/dunosusa-tomas-aznar?share', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(339, 'POMUCH 2', '2065', 'CAMPECHE', 'HECELCHAKÁN', 'https://goo.gl/maps/6SAzQMp1StMDc7qG7', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(340, 'ISLA AGUADA ', '2066', 'CAMPECHE', 'CARMEN', 'https://goo.gl/maps/qxnz8B9VxwvVZ7Ke8', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(341, 'CANDELARIA 3', '2067', 'CAMPECHE', 'CANDELARIA', 'https://goo.gl/maps/BnLjE9XMwtNACQCB6', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(342, 'BOLONCHEN ', '2068', 'CAMPECHE', 'HOPELCHÉN', 'https://goo.gl/maps/ExmpBmoqqPSnPhan7', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(343, 'HOPELCHEN 3', '2069', 'CAMPECHE', 'HOPELCHÉN', 'https://goo.gl/maps/G1kjqLRLyHAhJNtr5', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(344, 'MINAS ', '2070', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/PYVtZY5zdiBcxaDCA', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(345, 'XPUJIL 2', '2072', 'CAMPECHE', 'CALAKMUL', 'https://goo.gl/maps/CKDdrjmdK8Nxy7xo8', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(346, 'BELLAVISTA ', '2074', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/pHHHehajVbNx58GZA', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(347, 'EJIDO FELIPE CARRILLO PUERTO', '2076', 'CAMPECHE', 'CHAMPOTÓN', 'https://goo.gl/maps/17XzZ5UsCD96a6a89', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(348, 'CAMPECHE SIGLO XXI', '2077', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/nHL2ekprxnvHQRD49', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(349, 'ESCARCEGA 6', '2078', 'CAMPECHE', 'ESCÁRCEGA', 'https://goo.gl/maps/TQ2apzHKgNciAiATA', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(350, 'CAMPECHE BONFIL', '2079', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/BE9YfGu4LoMm4MWX9', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(351, 'RAMON ESPINOLA', '2080', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/gJWYUHZPbPqfMG49A', 'JOSUE JURADO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(352, 'EDZNÁ', '2081', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/oUJk7zmKtsriJkuz5', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(353, '2082 AV. PERIFERICA', '2082', 'CAMPECHE', 'CARMEN', 'https://goo.gl/maps/ZfnTbugnu5xMPEgz7', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(354, 'HOPELCHEN 4', '2084', 'CAMPECHE', 'HOPELCHÉN', 'https://goo.gl/maps/mHURu53TeAbyLwsT9', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(355, 'ESCARCEGA 7', '2085', 'CAMPECHE', 'ESCÁRCEGA', 'https://goo.gl/maps/EA2g6MbAbaPkWWZx5', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(356, 'CHAMPOTÓN 6', '2086', 'CAMPECHE', 'CHAMPOTÓN', 'https://goo.gl/maps/a6UZtK2p9dVXeqtL9', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(357, 'CHAMPOTÓN 7', '2087', 'CAMPECHE', 'CHAMPOTÓN', 'https://goo.gl/maps/FiABoeySQiZo4UuW6', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(358, 'CALKINI 6', '2088', 'CAMPECHE', 'CALKINÍ', 'https://goo.gl/maps/yAqw9t2N1RBdDZeKA', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(359, 'ESCARCEGA 8 ', '2089', 'CAMPECHE', 'ESCÁRCEGA', 'https://goo.gl/maps/QTKQzWZr6Ld2yvwH6', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(360, 'CALKINI 7 FÁTIMA', '2090', 'CAMPECHE', 'CALKINÍ', 'https://goo.gl/maps/gkWjUpFuWk1EdsvL9', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(361, 'HECELCHAKAN 2', '2091', 'CAMPECHE', 'HECELCHAKÁN', 'https://goo.gl/maps/o62xXXNfzjAJT5H78', 'ROBERTO TAMAYO', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(362, 'CMP LERMA CENTRO', '2092', 'CAMPECHE', 'CAMPECHE', 'https://goo.gl/maps/UoSkokdotxCtAgKB6', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(363, 'TENABO 2', '2093', 'CAMPECHE', 'TENABO', 'https://maps.app.goo.gl/zoMEYHQEBxtjJQJ36', 'GERARDO DOMÍNGUEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(364, 'CHAMPOTON TAJONAL', '2095', 'CAMPECHE', 'CHAMPOTÓN', 'https://maps.app.goo.gl/7mhpRhZqys7FbEcb8', 'LUIS CRUZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(365, 'ESCARCEGA 10', '2096', 'CAMPECHE', 'ESCÁRCEGA', 'https://maps.app.goo.gl/Ywyu4zTYgoZp6eou5', 'GABRIEL HERNÁNDEZ', 'JOSE SOLIS', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(366, 'YAXCHILAN', '3002', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/75GAXQBifSzqG9Qq5', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(367, 'COMALCALCO', '3003', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/uJLKLdtkbneoKXnT9', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(368, 'TULUM CANCUN', '3004', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/eBUdq2pULaccBPdS6', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(369, 'NIÑOS HEROES CANCUN', '3005', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/zzMN2DB4m96wCL866', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(370, 'CHETUMAL', '3007', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/wZ6WXP8bypvrMnZJ9', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(371, 'PLAYA DEL CARMEN 2', '3008', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/4Nm6h5uiq5ZHQXwu6', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(372, 'TALLERES CANCUN', '3009', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/57xq1uUrBXUnhAHX8', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(373, 'RUTA 7', '3010', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/CnxsU5rWV1ZUSgbS7', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(374, 'COZUMEL 2', '3011', 'QUINTANA ROO', 'COZUMEL', 'https://goo.gl/maps/oWtaBej2rqCP7AAs6', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(375, 'TULUM PUEBLO ', '3012', 'QUINTANA ROO', 'TULUM', 'https://goo.gl/maps/DNSh7MYaA6DBM5paA', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(376, 'FELIPE CARRILLO PUERTO', '3013', 'QUINTANA ROO', 'FELIPE CARRILLO PUERTO', 'https://goo.gl/maps/2NHAefWw2QeSmgpf8', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(377, 'COZUMEL 3', '3015', 'QUINTANA ROO', 'COZUMEL', 'https://goo.gl/maps/6imKzS3uPYuMgJVd8', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(378, 'BONFIL', '3016', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/ueCWGDnxGbmGrEad6', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(379, 'PLAYA DEL CARMEN 3', '3017', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/K4RY4u6gJBYeDFwq8', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(380, 'LA LUNA CANCUN', '3019', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/LeJFr5anKF3kB4xm8', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(381, 'GUADALUPANA CANCUN', '3020', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/kAvHiMgKN8N3S8dJ7', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(382, 'PUERTO MORELOS', '3021', 'QUINTANA ROO', 'PUERTO MORELOS', 'https://goo.gl/maps/e3JWMdjRmfQxVGG96', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(383, 'AV. LEONA VICARIO', '3022', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/tGMeBedFVrLec22e9', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(384, 'EJIDO LEONA VICARIO', '3023', 'QUINTANA ROO', 'PUERTO MORELOS', 'https://goo.gl/maps/4fj8txLkVRUKxb6k9', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(385, 'NIÑOS HEROES 2', '3024', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/WbKit73fMZi48ikk7', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(386, 'RANCHO VIEJO', '3025', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/NqPSX3DXhJdWTj8y8', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(387, 'PLAYA DEL CARMEN EJIDO', '3026', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/8LSG2VvYzRmwLnQ19', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(388, 'KABAH', '3027', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/BeqKoR2G63tTjD5DA', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(389, 'RUTA 4', '3028', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/KtdqTr6zWYNREFpa8', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(390, 'NAPOLES', '3029', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/5gdNRxMAhB9D8q4m8', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(391, 'MACHUXAC', '3031', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/fKfW8SXwacEsYCDZ8', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(392, 'TIERRA MAYA', '3032', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/dsZx8isZcVyuVEoQA', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(393, 'CHETUMAL CONSTITUYENTES', '3033', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/ALPC7um9RmjAazpV8', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(394, 'ROJO GOMEZ', '3034', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/oqGBgkpxgt7Nze546', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(395, 'NICHUPTE', '3035', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/iqwcjCostCkzYZVV8', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(396, 'REGION 237', '3036', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/WTBYK7Dgs7VhLeFf6', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(397, 'GUADALUPE VICTORIA CHETUMAL', '3037', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/KYg77XkAiQWHBnuH6', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(398, '3 REYES', '3038', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/ZCMVSANvGhaW8Mj1A', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(399, 'RUTA 5', '3039', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/HScFQZtrZvPXQ1nW9', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(400, 'KANTUNILKIN', '3040', 'QUINTANA ROO', 'LÁZARO CÁRDENAS', 'https://goo.gl/maps/GGGqkebDravJiHWM6', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(401, 'PLAYA AV. CONSTITUYENTES', '3041', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/VYB5FCyRmYLC4qYA8', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(402, 'BONAMPAK', '3042', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/DsYonqDSQMDFTEB19', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(403, 'CORALES', '3044', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/tuE6eY7bKoQWwURK7', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(404, 'COZUMEL 4', '3046', 'QUINTANA ROO', 'COZUMEL', 'https://goo.gl/maps/6KvMvZL75GHmCrDw8', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(405, 'RANCHO VIEJO 2', '3047', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/h5LKatFvebFZ2EnK8', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(406, 'VILLAS OTOCH ABEDUL', '3049', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/zrUTBJhectXa3WDh9', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(407, 'PLAYA AV. 115', '3051', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/aUvJeoUCvWLrgt3X7', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(408, 'VILLAS OTOCH LAUREL', '3052', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/6NprLhHmU815v9fu6', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(409, 'TULUM PUEBLO 2', '3053', 'QUINTANA ROO', 'TULUM', 'https://goo.gl/maps/fEVewN61iCHGfAgz6', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(410, 'CHETUMAL CENTRO', '3054', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/dnVKzo22emfNpZag6', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(411, 'ISLA MUJERES', '3055', 'QUINTANA ROO', 'ISLA MUJERES', 'https://goo.gl/maps/LEVet4W9g5U8Sxxa9', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(412, 'VILLAS OTOCH PARAISO', '3056', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/ymJfCqfj7uJRSppb8', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(413, 'PUERTO MORELOS 2', '3057', 'QUINTANA ROO', 'PUERTO MORELOS', 'https://goo.gl/maps/3SpL2mhv5N9eZbW99', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(414, 'PLAYA DEL CARMEN LAS FLORES', '3059', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/mDkbmgeiq2UKSRqT8', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(415, 'PASEO LAS PALMAS', '3061', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/NHcnMEYZqjQB9egg8', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(416, 'PLAYA DEL CARMEN GUADALUPANA', '3063', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/THwERWvXkiyMrsok7', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(417, 'FELIPE CARRILLO PUERTO 2', '3064', 'QUINTANA ROO', 'FELIPE CARRILLO PUERTO', 'https://goo.gl/maps/FZ2nPT7iwjHwe7MT7', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(418, 'EL MILAGRO', '3065', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/72Et39WDbaiYUFcUA', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(419, 'AVANTE', '3066', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/f3Y4NZ1j8AeVhUot6', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(420, 'HACIENDA REAL', '3067', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/1me7XF4jEB9RSDMr9', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(421, 'COZUMEL SAN GERVASIO', '3068', 'QUINTANA ROO', 'COZUMEL', 'https://goo.gl/maps/kWZkP9aLJN6vDQJv8', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(422, 'PUERTO AVENTURAS', '3069', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/8uEJhoNbNHhitERq9', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(423, 'MIGUEL HIDALGO CANCUN', '3070', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/jwPS8TuU7JYDQFyT9', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(424, 'PLAYA BOSQUE REAL', '3071', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/ohuzDfgLHouoCafW6', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(425, 'JOSÉ MARÍA MORELOS 1', '3072', 'QUINTANA ROO', 'JOSÉ MARÍA MORELOS', 'https://goo.gl/maps/3PgesL4SBkyE6Ugt7', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(426, 'GALAXIAS DEL SOL', '3073', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/KjMYz7rvoRK3CHxN6', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(427, 'PLAYA GONZALO GUERRERO', '3076', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/w5MNwXZjy4MWVvSE8', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(428, 'VILLAS DEL REY', '3077', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/erzCwquNFTKBUN4y7', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(429, 'PRADO NORTE', '3078', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/NBAhF3EXwxLwMiMU9', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(430, 'CIUDAD NATURA', '3079', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/NwZFWifNzYNAUM7BA', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(431, 'COZUMEL SAN MIGUEL', '3081', 'QUINTANA ROO', 'COZUMEL', 'https://goo.gl/maps/BCk2zG3JFsSQKLUJA', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(432, 'ISLA MUJERES 2', '3082', 'QUINTANA ROO', 'ISLA MUJERES', 'https://goo.gl/maps/EDDjU5Ws8rc65JzP6', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(433, 'LOPEZ PORTILLO 2', '3083', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/SXszDpCEJuirXxvS7', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(434, 'CHETUMAL JARDINES', '3084', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/w6LXXivR9E8VtJneA', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(435, 'RANCHO VIEJO 3', '3086', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/DtVGfToUCPWf1UPV9', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(436, 'LA LUNA 2 ', '3087', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/uRLubn1hch2PnrKZ7', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(437, 'COZUMEL MERCADO', '3089', 'QUINTANA ROO', 'COZUMEL', 'https://goo.gl/maps/b5ADx2JTWuKnp8DZ9', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(438, 'NICHUPTE 2', '3090', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/pVFiJ5xUDDfcYKpU7', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(439, 'PUERTO MORELOS 3*', '3091', 'QUINTANA ROO', 'PUERTO MORELOS', 'https://goo.gl/maps/UiL69kpH3RNBJRzZ8', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(440, 'CANCUN EL ROBLE', '3093', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/XjN1iBF9UHF1zaF79', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(441, 'KABAH 2', '3094', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/hdBBDiQS6iu3ZyyPA', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(442, 'CHETUMAL LAS AMERICAS 2', '3095', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/aCS47rxu3C3wvY1UA', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(443, 'TULUM PUEBLO 3', '3096', 'QUINTANA ROO', 'TULUM', 'https://goo.gl/maps/u5FLbW84uK6aL9bx5', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(444, 'HACIENDA REAL 2', '3097', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/uSaC6MexpaAc675S7', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(445, 'CHETUMAL CARIBE', '3098', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/xyPYjC1zXvwwgxzB9', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(446, 'QUINTAS DEL CARIBE', '3100', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/sSKU5TZAYZt35i4T6', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(447, '20 DE NOVIEMBRE', '3101', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/QJk31AV3LHYLBPAHA', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(448, 'VILLAS OTOCH PARAISO 2', '3102', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/pSQ87YoAxH1UZ9Bk7', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(449, 'COSTA MAYA', '3103', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/nU4JnGVD4rLm8Umm6', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(450, 'COZUMEL MIRAFLORES', '3104', 'QUINTANA ROO', 'COZUMEL', 'https://goo.gl/maps/AqXEyh3YvR2AkN56A', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(451, 'PLAYA CARMEN COLOSIO 2', '3106', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/7MuvyZMQBBm3raLy8', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(452, 'MIGUEL HIDALGO CANCUN 2', '3107', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/bZV1jp8PioTFT8uC7', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(453, 'CANCUN LA LAJA', '3108', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/T8ipCEBytEzZMMAw8', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(454, 'NUEVA COZUMEL 2', '3109', 'QUINTANA ROO', 'COZUMEL', 'https://goo.gl/maps/kVKAzYenMKEekpu29', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(455, 'HOLBOX', '3110', 'QUINTANA ROO', 'LÁZARO CÁRDENAS', 'https://goo.gl/maps/B55mtfCpBEDeEZEo7', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(456, 'NUEVA COZUMEL 1', '3111', 'QUINTANA ROO', 'COZUMEL', 'https://goo.gl/maps/CV52VqP8gx9PKMp39', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(457, 'JOSÉ MARÍA MORELOS 2', '3112', 'QUINTANA ROO', 'JOSÉ MARÍA MORELOS', 'https://goo.gl/maps/T3iJ1mxnPLEuuU3g8', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(458, 'PLAYA VILLAS DEL SOL', '3113', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/yUtSpUK2Jt4Ugm2EA', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(459, 'FELIPE CARRILLO PUERTO 3', '3114', 'QUINTANA ROO', 'FELIPE CARRILLO PUERTO', 'https://goo.gl/maps/vnqCkDQJ3R6uRDMt7', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(460, 'PLAYA LAS PALMAS 2 ', '3115', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/wZ9bnH588eNnVqFv6', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(461, 'PUERTO MAYA', '3117', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/hwvHiX8DpYQh9H599', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(462, 'EL LIMONERO', '3118', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/ms3bDM9kAPkyk4Xa9', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(463, 'NUEVA PARAISO MAYA', '3119', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/ZPSqgpjSRSiyDChHA', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(464, 'REGIÓN 95', '3120', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/2tEaMbyNERxvQ78j8', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(465, 'CANCUN VILLAS DEL MAR PLUS', '3122', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/ne8N7uvquaWTmLqD9', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(466, 'FELIPE CARRILLO PUERTO 4', '3123', 'QUINTANA ROO', 'FELIPE CARRILLO PUERTO', 'https://goo.gl/maps/TB62ucW1rHKDoSXr6', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(467, 'BACALAR MERCADO', '3124', 'QUINTANA ROO', 'BACALAR', 'https://goo.gl/maps/gbEFea1zEDTihxwb8', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(468, 'BACALAR CENTRO', '3125', 'QUINTANA ROO', 'BACALAR', 'https://goo.gl/maps/HwtZhRafHFiUoGQ39', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(469, 'CANCUN PETUNIAS', '3126', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/uzdGqsddswArFPPQ9', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(470, 'FELIPE CARRILLO PUERTO 5', '3127', 'QUINTANA ROO', 'FELIPE CARRILLO PUERTO', 'https://goo.gl/maps/Evcg8Y6HLA13XZyo6', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(471, 'CHETUMAL PACTO OBRERO', '3128', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/LrTxpxQK5Hx5ZUTA7', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(472, 'NIÑOS HEROES 3', '3129', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/2WU4yEf1mhwQ1rgS8', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(473, 'CANCÚN CHAC MOOL', '3130', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/zwb8bY4wVTg727fa7', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(474, 'VILLAS DEL MAR PLUS 2', '3131', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/QrK3jkjEVsieje8D8', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(475, 'ARCOS PARAÍSO', '3132', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/P96MGqXPvZeDD1Vv9', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(476, 'CHETUMAL MIRAFLORES', '3133', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/zervKpKd4nTxx58r7', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(477, 'TULUM PUEBLO 4 ', '3134', 'QUINTANA ROO', 'TULUM', 'https://goo.gl/maps/zJ27BUbFxhD6nppC6', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(478, 'VILLAS OTOCH PARAISO 3', '3136', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/2sPKATBo6XkgRLHC6', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(479, 'CANCÚN HOSPITAL GENERAL', '3138', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/vweBugDkHGvUUNCd6', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(480, 'PLAYA JOYA REAL ', '3140', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/CN6NNwiKoQmacCueA', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(481, 'PLAYA VILLAS DEL CARMEN PLUS', '3141', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/Xo9Ts9gQ4fitnWvM7', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(482, 'PLAYA VILLAS LAS PERLAS ', '3142', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/8EoGtWfkP5TqBkTR9', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(483, 'ISLA MUJERES 3 ', '3143', 'QUINTANA ROO', 'ISLA MUJERES', 'https://goo.gl/maps/MSxv5QcEiZ5twRGt9', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(484, 'PLAYA LAS FLORES 2', '3144', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/vW1UoaHu9frzW5jL6', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(485, 'PLAYA PESCADORES', '3145', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/TpyLwkkRY8HBxpzX6', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(486, 'PLAYA PESCADORES 2', '3146', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/GZDM8afBgP2Aa8mq9', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(487, 'PLAYA AVENIDA XEL - HA ', '3147', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/8PrwBpabJRyFUFQD7', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(488, 'PLAYA DEL CARMEN AZULEJOS', '3148', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://goo.gl/maps/apYv9hmN587a4whc8', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(489, 'NICTÉ ', '3149', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/ieCS6VQqAtwawbdq9', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(490, 'PARAÍSO MAYA 2', '3150', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/p62AXpB9nZXU3e5R9', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(491, 'MAHAHUAL', '3151', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/xmccvd3335SxhHsH7', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(492, 'KANTUNILKIN 2', '3152', 'QUINTANA ROO', 'LÁZARO CÁRDENAS', 'https://maps.app.goo.gl/ZnC6eZH2dv2vWtkU8', 'MEDEL PAT', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(493, 'ISLA COMORES PASEOS DEL MAR ', '3153', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/zXPBGwKTjHPomh9J7', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(494, 'PRADO NORTE 2', '3154', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/7jRiKS9sPRWudd338', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(495, 'MAGDALENA CIELO NUEVO', '3156', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/bGxEeQZLXZRU4pTD7', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(496, 'TULUM 5 MAYA PAX', '3157', 'QUINTANA ROO', 'TULUM', 'https://goo.gl/maps/vcmZqHRAxanTZASEA', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(497, 'TULUM 6 SATELITE SUR', '3158', 'QUINTANA ROO', 'TULUM', 'https://goo.gl/maps/QJgAcukJTBuiANss8', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(498, 'VILLAS DEL SOL (PLAYA EL EDEN)', '3159', 'QUINTANA ROO', 'SOLIDARIDAD', 'https://maps.app.goo.gl/mrLfnwqGkEpbqe8c9', 'ADRIANA GARCIA', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(499, 'TULUM 7 ALDEA TULUM', '3160', 'QUINTANA ROO', 'TULUM', 'https://maps.app.goo.gl/p7ZryRUm6b1QRGZu7', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(500, 'CALDERITAS', '3161', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/Sxqm8hTTGikCyKwUA', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(501, 'BACALAR 4', '3162', 'QUINTANA ROO', 'BACALAR', 'https://maps.app.goo.gl/mj2JYMtDSFUJESGy5', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(502, 'TULUM 8 TUMBEN KAA', '3163', 'QUINTANA ROO', 'TULUM', 'https://maps.app.goo.gl/Ws2WsVBWuoQ8wK1r5', 'PAUL PECH', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(503, 'NUEVA CHUNHUHUB', '3164', 'QUINTANA ROO', 'FELIPE CARRILLO PUERTO', 'https://goo.gl/maps/4eaWTPPNvPLK9iKU8', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(504, 'BB ARBOLEDAS', '3501', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/gyEHX7EPwDDGTEeYA', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(505, 'BB CH BACALAR', '3502', 'QUINTANA ROO', 'BACALAR', 'https://goo.gl/maps/2BFtERrntWyTqUsb7', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(506, 'BB CARIBE', '3503', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/QCNMYDr441grDn8w9', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(507, 'BB CARRANZA', '3504', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/GytTcTGcm2NTMEmR7', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(508, 'BB CHETUMAL', '3506', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/Pkjg9Gt2eziV9Bmj8', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(509, 'BB CONFEDERACIÓN', '3507', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/jFP4HwnqmRjRJxxSA', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(510, 'BB HUAY PIX', '3508', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/TGfNbMdXyZtXEGmTA', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(511, 'BB CH LIMONES', '3509', 'QUINTANA ROO', 'BACALAR ', 'https://goo.gl/maps/ixUhGvtvRW4fFhM88', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(512, 'BB CH MAHAHUAL', '3510', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/FwAT1KwVdh81vvrk6', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(513, 'BB MACHUXAC', '3511', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/LwrDBaq4kNgZXzsR8', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(514, 'BB PAYO OBISPO', '3512', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/U32LBREnPSMn27j28', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(515, 'BB PLUTARCO', '3513', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/oHmC9BcK2yofqWrC7', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(516, 'BB ROJO GOMEZ', '3514', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/KtkMJtAZhdgfEscg9', 'IVAN FLOTA', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(517, 'BBC MATRIZ CANCUN', '3515', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/g4mFHomggbP8KxWt8', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(518, 'BBC CENTENARIO', '3516', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/8izYZJdiV5FmF5YC8', 'FAUSTO CHALE', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(519, 'BBC RANCHO VIEJO', '3517', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/C3vyqpCbZZVt6NeUA', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(520, 'BBC AV. LEONA VICARIO', '3518', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/D3bETUQ45Hwi7Cxs6', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(521, 'BBC REGIÓN 100', '3519', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/BRhS4yEjiWp1JEHY8', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(522, 'BBC REGIÓN 101', '3520', 'QUINTANA ROO', 'BENITO JUÁREZ', 'https://goo.gl/maps/zu9P768MBcaNraZB7', 'TINGLE MAY', 'JESUS SANCHEZ', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(523, 'BB MATRIZ CHETUMAL', '3521', 'QUINTANA ROO', 'OTHÓN P BLANCO', 'https://goo.gl/maps/qbe22VQwEEGfcFrG6', 'TOMAS MOEN', 'ALEJANDRO BERMEJO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(524, 'FRONTERA 1', '5001', 'TABASCO', 'CENTLA', 'https://goo.gl/maps/16w2UbRkPKuyDzny6', 'JUAN FERRAEZ', 'GILMER CASTILLO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(525, 'TENOSIQUE 1', '5002', 'TABASCO', 'TENOSIQUE', 'https://goo.gl/maps/npH2m5X9KbfAkytF8', 'JUAN FERRAEZ', 'GILMER CASTILLO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(526, 'EMILIANO ZAPATA 1', '5003', 'TABASCO', 'EMILIANO ZAPATA', 'https://goo.gl/maps/cHJ2Mt1Z4oNy4qe7A', 'JUAN FERRAEZ', 'GILMER CASTILLO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(527, 'BALANCAN', '5004', 'TABASCO', 'BALANCAN', 'https://goo.gl/maps/mi4HpNU295YokpTk8', 'JUAN FERRAEZ', 'GILMER CASTILLO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(528, 'TENOSIQUE 2', '5007', 'TABASCO', 'TENOSIQUE', 'https://goo.gl/maps/CyyDphjqyVEWUdydA', 'JUAN FERRAEZ', 'GILMER CASTILLO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(529, 'CIUDAD PEMEX', '5010', 'TABASCO', 'MACUSPANA', 'https://goo.gl/maps/KPsUH1zjn2HGsCn28', 'JUAN FERRAEZ', 'GILMER CASTILLO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(530, 'BENITO JUÁREZ', '5013', 'TABASCO', 'MACUSPANA', 'https://goo.gl/maps/6Zitj7siqSNADqNJ7', 'JUAN FERRAEZ', 'GILMER CASTILLO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(531, 'CHIAPAS PALENQUE', '6001', 'CHIAPAS', 'PALENQUE', 'https://goo.gl/maps/hTfig4NfRktnTqTb7', 'JUAN FERRAEZ', 'GILMER CASTILLO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(532, 'CHIAPAS COMITAN 1', '6003', 'CHIAPAS', 'COMITAN', 'https://goo.gl/maps/QaN4VQomXRaALuow8', 'GREGORIO LOPEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(533, 'CHIAPAS VILLAFLORES', '6004', 'CHIAPAS', 'VILLAFLORES', 'https://goo.gl/maps/mQhRzhSyxE37Y2ny8', 'DIEGO HERNANDEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(534, 'CHIAPAS LAS ROSAS', '6005', 'CHIAPAS', 'LAS ROSAS', 'https://goo.gl/maps/jPtrtte1ccpZbAzi9', 'GREGORIO LOPEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(535, 'NUEVA COMITAN 2', '6006', 'CHIAPAS', 'COMITAN', 'https://goo.gl/maps/nSUULP2mvA7TAQM16', 'GREGORIO LOPEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(536, 'CHIAPAS OCOZOCOAUTLA', '6007', 'CHIAPAS', 'OCOZOCOAUTLA', 'https://goo.gl/maps/4PZJwZKVAkVDNSiT7', 'DIEGO HERNANDEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(537, 'CHIAPAS TEOPISCA', '6008', 'CHIAPAS', 'TEOPISCA', 'https://goo.gl/maps/znSbLXojyacBABDa6', 'GREGORIO LOPEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(538, 'CHIAPAS COMITAN 3', '6010', 'CHIAPAS', 'COMITAN', 'https://goo.gl/maps/kQuR9CyPeuw7ojHY9', 'GREGORIO LOPEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(539, 'CHIAPAS VENUSTIANO CARRANZA', '6011', 'CHIAPAS', 'VENUSTIANO CARRANZA', 'https://goo.gl/maps/bdokCiYMwctGXUmq6', 'GREGORIO LOPEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(540, 'CHIAPAS SAN CRISTOBAL 1', '6012', 'CHIAPAS', 'SAN CRISTOBAL', 'https://maps.app.goo.gl/UPc4H4CTL6v4cPMs8', 'DIEGO HERNANDEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(541, 'TUXTLA SANTA MARIA', '6014', 'CHIAPAS', 'TUXTLA GUTIERREZ', 'https://goo.gl/maps/NLWsqoxYj9cfZdDp8', 'DIEGO HERNANDEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(542, 'SAN JOSE TERAN', '6015', 'CHIAPAS', 'TUXTLA GUTIERREZ', 'https://goo.gl/maps/G3VzQJHKtJvFpQVq9', 'DIEGO HERNANDEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(543, 'CHIAPAS ACALA', '6016', 'CHIAPAS', 'ACALA', 'https://goo.gl/maps/fKjhJWV4BhS8FDr66', 'DIEGO HERNANDEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(544, 'LAS MARGARITAS', '6018', 'CHIAPAS', 'LAS MARGARITAS', 'https://goo.gl/maps/Ed3GPDY2WioDMaCy7', 'GREGORIO LOPEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(545, 'VENUSTIANO CARRANZA 2', '6019', 'CHIAPAS', 'VENUSTIANO CARRANZA', 'https://goo.gl/maps/49P215UJQ6piuRcE6', 'GREGORIO LOPEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(546, 'COLON ', '6020', 'CHIAPAS', 'TUXTLA GUTIERREZ', 'https://goo.gl/maps/C5iSrvKkuBWS5TpS6', 'DIEGO HERNANDEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(547, 'NIÑO DE ATOCHA', '6021', 'CHIAPAS', 'TUXTLA GUTIERREZ', 'https://goo.gl/maps/2VbjV5XR69eSWZgW8', 'DIEGO HERNANDEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(548, 'TUXTLA BONAMPAK', '6022', 'CHIAPAS', 'TUXTLA GUTIERREZ', 'https://goo.gl/maps/nNT1GxtUYsziLZBi7', 'DIEGO HERNANDEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(549, 'CATAZAJA', '6024', 'CHIAPAS', 'CATAZAJA', 'https://goo.gl/maps/isrYt95aEJubfzia9', 'JUAN FERRAEZ', 'GILMER CASTILLO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(550, 'TUXTLA PATRIA NUEVA', '6026', 'CHIAPAS', 'TUXTLA GUTIERREZ', 'https://goo.gl/maps/ZvkrravHQqjnBSDh8', 'DIEGO HERNANDEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL),
(551, 'COMITAN LAS FLORES', '6028', 'CHIAPAS', 'COMITAN', 'https://goo.gl/maps/WSVTHbuGMn6Sdt2YA', 'GREGORIO LOPEZ', 'ELIOS ALVARADO', 'GILMER CASTILLO', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_incidencia`
--

CREATE TABLE `tipos_incidencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `emails_notificacion` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipos_incidencia`
--

INSERT INTO `tipos_incidencia` (`id`, `nombre`, `descripcion`, `emails_notificacion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Tesorería', NULL, 'somos@navegantes.mx', 1, '2025-12-12 17:43:51', '2026-01-05 13:44:54'),
(2, 'Mantenimiento', NULL, 'somos@navegantes.mx', 1, '2025-12-16 12:44:10', '2026-01-05 13:45:27'),
(3, 'Informática', '', 'gpo.soporte@dunosusa.com.mx', 1, '2025-12-16 12:44:26', '2026-01-06 09:16:12'),
(4, 'CEDIS', NULL, 'somos@navegantes.mx', 1, '2025-12-16 12:44:39', '2026-01-05 13:45:27'),
(5, 'Contraloría', NULL, 'somos@navegantes.mx', 1, '2025-12-16 12:44:56', '2026-01-05 13:45:27'),
(6, 'Comercial', NULL, 'somos@navegantes.mx', 1, '2025-12-16 12:45:14', '2026-01-05 13:45:28'),
(7, 'Supervisión', NULL, 'somos@navegantes.mx', 1, '2025-12-16 12:45:27', '2026-01-05 13:45:28'),
(8, 'Nómina', NULL, 'jesus@navegantes.mx', 1, '2025-12-16 12:45:43', '2026-01-05 13:45:28'),
(9, 'Jurídico', '', 'jesus@navegantes.mx, omar@dunosusa.com.mx', 1, '2025-12-16 12:45:56', '2026-01-05 14:16:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` int(11) DEFAULT NULL,
  `tipo_id` varchar(30) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `rol`, `tipo_id`, `activo`, `created_at`) VALUES
(1, 'Administrador', 'admin', 'bf019414f607bdf1149c9afd586f972f6e9c1764', 1, NULL, 1, '2025-12-05 10:31:23'),
(2, 'Informatica', 'info', 'fd760a08e5f13d22e23b58f6b156460f8605d087', 2, '6,3,2', 1, '2025-12-31 14:57:16'),
(3, 'jorge ruiz', 'admin1', '0f3fde0103dd44077c040215a2fabd09a097aecc', 2, '9,8', 1, '2026-01-05 12:34:42'),
(4, 'Administrador DNS', 'admindns', 'bf019414f607bdf1149c9afd586f972f6e9c1764', 1, NULL, 1, '2026-01-05 17:31:45'),
(5, 'Carlos Berzunza', 'CarlosBerzunza', 'bba2d1bec283dd3b90add09797a9235b08069064', 2, '3', 1, '2026-01-06 09:15:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wa_inbound_messages`
--

CREATE TABLE `wa_inbound_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wa_message_id` varchar(80) NOT NULL,
  `wa_from` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `wa_inbound_messages`
--

INSERT INTO `wa_inbound_messages` (`id`, `wa_message_id`, `wa_from`, `created_at`) VALUES
(1, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMDcxMEVEMkM4NEY3ODI2RDI2QjI5QTE5Rjc1QzQwAA', '5219995555335', '2025-12-19 16:33:26'),
(2, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDNzNDNEUwMDcyRDg2NDgyMUZEQTQ1MUI1QkZBMzhCAA', '5219995555335', '2025-12-19 16:34:28'),
(3, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDNzFBOTlGNjBGNDgwMDREQjg5OEQwREUzOUZFQzMwAA', '5219995555335', '2025-12-19 16:35:08'),
(4, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDNDI3QTU3Qzg0NTE0ODk3ODlDRUVBN0Q0RjAyQTA0AA', '5219995555335', '2025-12-19 16:35:45'),
(5, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDRjlFMzZEMDkwODkxNTNCNUVBMDE4QzA3MEJERUMyAA', '5219995555335', '2025-12-19 16:36:50'),
(6, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMEIwNjdFQ0NDMTM4RDkyMDlGOTQxQ0NCRjA0RTlEAA', '5219995555335', '2025-12-19 16:36:51'),
(7, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDNTA2NzE1MDg3NkRDREIwQ0I0QzZGMEI4Q0U1RDc2AA', '5219995555335', '2025-12-19 16:36:51'),
(8, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDN0YyODAxREIyRjcwQzMyN0JCMzgxRjdGOTQ3OTA3AA', '5219995555335', '2025-12-19 16:42:46'),
(9, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDRDIzODU0QTdDOEJCRUE3MzRCMTZCQ0QzQTA2MEY0AA', '5219995555335', '2025-12-19 17:21:40'),
(10, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDREMzMjlFMThCNDNCRUFCNjAxNjAxODNDM0YxQkJBAA', '5219995555335', '2025-12-19 17:22:05'),
(11, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDQ0VBN0Y1NTkyNDQ4MkY0OEZBRDBGRUM4ODBERTUzAA', '5219995555335', '2025-12-19 17:22:25'),
(13, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDNDY4NEVGRTJGRDQzMzhCMkM4QzgwMTJGNUMzNjcwAA', '5219995555335', '2025-12-19 17:23:09'),
(14, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDRURCQjFEREY2RkZGODIyQzNCQzAwRENGODFFQjVGAA', '5219995555335', '2025-12-19 17:23:09'),
(15, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMDJGREFFQ0MxQUU2M0M2NUU0NEM1ODIzNTNDNEZDAA', '5219995555335', '2025-12-19 17:23:10'),
(16, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDQzhCQjRDNjk3RjlEMUE5MkQ0NDI3NzExMjgzRjY3AA', '5219995555335', '2025-12-19 17:44:09'),
(17, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDRjAxMjQwRDFDQTA1MzdFQzA4MjI0NDI2NzBEOTFGAA', '5219995555335', '2025-12-19 17:44:41'),
(18, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDOERGM0IzNjJGQjY3QzdCMDQ4Mjg2NzkyNjc3ODMzAA', '5219995555335', '2025-12-19 17:45:07'),
(19, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMDZCRkFBM0FCMTQ1MTNCNUQ1NURERjkwMDRGRTMwAA', '5219995555335', '2025-12-19 17:45:19'),
(20, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMzZFNUM2ODY1RUZCMjFGMEIwRTk3QzVDREI1RTVCAA', '5219995555335', '2025-12-19 17:46:41'),
(21, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMUY0NkY1ODI2OUVCQTgyNjlFQjVFNDI0NERBNDY5AA', '5219995555335', '2025-12-19 17:46:42'),
(22, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDQkFDOEQ3RUJBRjBDRTY1MDg3NzdFNTg4NzZCQzE2AA', '5219995555335', '2025-12-19 17:46:44'),
(23, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDOUExRjdFRTA3OTJDNjExRjVDODBCNzg4OEUxQkJGAA', '5219995555335', '2025-12-19 17:48:07'),
(24, 'ABGGFlA5Fpa', '16315551181', '2025-12-30 12:55:55'),
(25, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMjNEMjYwMDVBNzM5RDJDQTI5NjU4RjdGOUE5OTk2AA', '5219995555335', '2025-12-30 13:56:15'),
(26, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMEVFOTMyQzNCMEQ3ODFEN0RGOTlFNzdDMjM3RkIwAA', '5219995555335', '2025-12-30 13:58:54'),
(27, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMkUzQ0E5MTVBN0U3RUQwODlGQ0Q4MEVGOUJDOEY5AA', '5219995555335', '2025-12-30 13:59:12'),
(28, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDNzEyODdGQjZCMjM5RUE2M0JDMUJENEFCNERDRUREAA', '5219995555335', '2025-12-30 13:59:36'),
(29, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDRDQ0ODA0RDkwODdEMkRFODhEOEI5MkNDMkIyOEU3AA', '5219995555335', '2025-12-30 13:59:36'),
(30, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDRjA5RDBGN0I3RUYzNjBFNkYwQkYxQzcyNEQ4NUQzAA', '5219995555335', '2025-12-30 13:59:47'),
(31, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDNjJFQzk4QTA4REJFMEM0M0JCODJGNTgxRkVFMjA3AA', '5219995555335', '2025-12-30 14:00:16'),
(32, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBRUM4RjU2MTJGNzFFNjk3NkUzAA==', '5219999008080', '2025-12-30 16:49:27'),
(33, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMkI2QjVCRDk4ODUxREI2NUI4AA==', '5219999008080', '2025-12-30 16:52:10'),
(34, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBOUQzNDRENDJBMEQwQTJGRjIzAA==', '5219999008080', '2025-12-30 16:55:12'),
(35, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBOTUxREI3MkY4Rjg1NjA4QUIyAA==', '5219999008080', '2025-12-30 16:55:39'),
(36, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMjY1QzlCRDlDNjM1N0Q2N0Y3AA==', '5219999008080', '2025-12-30 16:56:10'),
(37, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMTI4NzFBRDU5NTE1RDQ4MEVFAA==', '5219999008080', '2025-12-30 16:56:11'),
(38, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBRkNGQTE4QzkyOTVERUQ2MTZBAA==', '5219999008080', '2025-12-30 16:58:20'),
(39, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMTExOTkzQTU4NzU0MEM1MzI3AA==', '5219999008080', '2025-12-30 16:58:51'),
(40, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBRUI3RTZFMkZCNUZENEU3MkQ1AA==', '5219999008080', '2025-12-30 16:59:00'),
(41, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMzcyRDBDRTY0NTgxRTM2OTFFAA==', '5219999008080', '2025-12-30 16:59:34'),
(42, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMjEzOEFGQ0UxMThDNTc2RTYzAA==', '5219999008080', '2025-12-30 16:59:39'),
(43, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMjhFRjBCQTc5Q0I3QTY4NzlBAA==', '5219999008080', '2025-12-30 17:01:20'),
(44, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDNzU5NDQ3QkI5QTk4MjFBOUY2MTE4RUFGRUM2Qzk4AA', '5219995555335', '2025-12-31 15:00:32'),
(46, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDOEZDNjE3MDc0REUzQjhGREFEMjc2QjdFNzhGMjJEAA', '5219995555335', '2025-12-31 15:03:30'),
(48, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDQzY5NUVFMDhCMDJDMjJDNTlFQTk4MzRDMTIwNTI3AA', '5219995555335', '2025-12-31 15:09:53'),
(50, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDOEYxNjlGNDJEMTA4ODk4MUM0NTk1RDIxOEM2MjM2AA', '5219995555335', '2025-12-31 15:15:01'),
(52, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDQ0NBQzIzNjY1QkM4RDkzMzREMURCRjM4N0EyRTJEAA', '5219995555335', '2025-12-31 15:15:51'),
(53, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDQzJBRDgyQzE4MThEOEVCQkNGNzRBRDQ3NTRDNkYzAA', '5219995555335', '2025-12-31 15:16:25'),
(54, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDRjkwMTFCQjNEQzBFNjZCQjI4NTU0ODE2M0UzRUQ0AA', '5219995555335', '2025-12-31 15:16:41'),
(55, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDNTNFNTY5REVGRTU4MTY5MzBGMEUyRDYxQ0QzQkYzAA', '5219995555335', '2025-12-31 15:16:42'),
(56, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMjk5RkQ2RDc2QjgxMkI2NUQ4OERCNUI1NTU3NDJCAA', '5219995555335', '2025-12-31 15:16:45'),
(57, 'wamid.HBgNNTIxOTk5NTU1NTMzNRUCABIYIEFDMUJDMjY2Njg0QUFBREM4RDQ1NDQ0Rjg5MzU1NDM5AA', '5219995555335', '2025-12-31 15:16:52'),
(58, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBRjU5QTE1MTkzQjhGODg3RDJDAA==', '5219999008080', '2026-01-02 12:48:12'),
(59, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMkU0RURFQjE2QUU3QzMzODg1AA==', '5219999008080', '2026-01-02 12:48:35'),
(60, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBODExNUMxNzAyRTJDQzdGMjA4AA==', '5219999008080', '2026-01-02 12:49:32'),
(61, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMjQ0MDg4NTI3RDQ1MTNBRTk3AA==', '5219999008080', '2026-01-02 12:50:31'),
(62, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBNEZFQUFBNDVGREVGQ0MwMzdCAA==', '5219999008080', '2026-01-02 12:50:37'),
(64, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBQjVGRTM2NjQyQTdDMUY4RDZCAA==', '5219999008080', '2026-01-05 12:39:00'),
(65, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBRjJGRkUxMTIzMjU4RDU4OUM1AA==', '5219999008080', '2026-01-05 12:39:52'),
(66, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMEM5NUJGRkQ3NTc4RDdFMzVDAA==', '5219999008080', '2026-01-05 12:40:08'),
(67, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBOEIyNkZDOENGQTNDMUU2M0ZGAA==', '5219999008080', '2026-01-05 12:41:02'),
(68, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBQjBEQTgwQjZFRkJCOTlEQjdBAA==', '5219999008080', '2026-01-05 12:41:07'),
(69, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMkE5RkYwMUY2NzE1QjlFODYzAA==', '5219999008080', '2026-01-05 12:44:26'),
(70, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBODcwNUZCNEEwNUE2RjMwODE2AA==', '5219999008080', '2026-01-05 12:45:04'),
(71, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMDIwQTM2NTY2QkVDQjc4MTREAA==', '5219999008080', '2026-01-05 12:45:30'),
(72, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBNDdDMzJBRjA0RTlEMjEyNzg2AA==', '5219999008080', '2026-01-05 12:45:59'),
(73, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMEZBNkYyMDEyRUE0QUFGMkE4AA==', '5219999008080', '2026-01-05 12:45:59'),
(75, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBRjAzN0FCNzc1MTZFNjczRDI5AA==', '5219999008080', '2026-01-05 12:49:08'),
(76, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBREY4NTc2REI2RUJEMkQxMkIyAA==', '5219999008080', '2026-01-05 12:49:42'),
(77, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBQTE3QUMwQzJFQjE4NUQyREM1AA==', '5219999008080', '2026-01-05 12:50:09'),
(78, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMzgxMjcwM0FBNzI2QjEyMDBCAA==', '5219999008080', '2026-01-05 12:50:17'),
(79, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBMTRFMkY4RTdBNjc3RTdGM0QxAA==', '5219999008080', '2026-01-05 12:50:18'),
(80, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBOUFGQTc2QkE5QzlFNjRBRDA0AA==', '5219999008080', '2026-01-05 14:17:52'),
(81, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBNEVBREI1QTlEN0M2RThGMjlGAA==', '5219999008080', '2026-01-05 14:19:04'),
(82, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBRUU4MkE5NUU0MzU1NzZEMzlFAA==', '5219999008080', '2026-01-05 14:19:53'),
(83, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBNTNBM0IzNTM3OEU2MjQzODdEAA==', '5219999008080', '2026-01-05 14:20:12'),
(84, 'wamid.HBgNNTIxOTk5OTAwODA4MBUCABIYFDNBOTdBMUI1MDM3MUZGMzAwNkE0AA==', '5219999008080', '2026-01-05 14:20:17'),
(85, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYIEFDQjZCQkY4RTYyOTdBRjg5M0M4NENDNzNEQTI1MkQxAA', '5219991275612', '2026-01-06 08:58:07'),
(86, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjBEQTM3MTBCRUY3NTlBOTFGQjgA', '5219991275612', '2026-01-06 09:16:35'),
(87, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjBBRjA3MjI4MzNDODlCRkE5QTEA', '5219991275612', '2026-01-06 09:16:59'),
(88, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjA4RDNFRDhBMUUwNTQ2MjcxNTYA', '5219991275612', '2026-01-06 09:18:05'),
(89, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjA2MUI0Njc1Qjk4MzIxNTk1OTMA', '5219991275612', '2026-01-06 09:18:55'),
(90, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjA1RDRDMTcwRDNEODk0QjY5NkYA', '5219991275612', '2026-01-06 09:19:02'),
(91, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjA3RDQxNDVDREIxMkYxRTBCNjAA', '5219991275612', '2026-01-06 09:19:09'),
(92, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjA2NEUyQTdDODA0NkVEMDRGMzMA', '5219991275612', '2026-01-06 09:19:09'),
(93, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjA4QkFCQzdDQzgxMTI3MDNDREYA', '5219991275612', '2026-01-06 09:19:11'),
(94, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjBDQ0Q5QjdFQjc4MUU0QTI0QjAA', '5219991275612', '2026-01-06 09:19:11'),
(95, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjBFRkYzMTY0MDhGMTZBMDY5MjcA', '5219991275612', '2026-01-06 09:19:13'),
(96, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYIEFDQUE1QjY1RjI0MDAwQjNGQzIwODJGNDc1NUUwRTNFAA', '5219991275612', '2026-01-06 09:27:24'),
(97, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYIEFDMzdGNDlDRDFGNTY2ODA5NUY3MEY0RjkzQ0I4OTQ3AA', '5219991275612', '2026-01-06 09:27:37'),
(98, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYIEFDMDA4RkNGNTk5MDlBNTYxQzNERjUxRkNEQkU0Mjg2AA', '5219991275612', '2026-01-06 09:27:52'),
(99, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYIEFDQzlFOEJCMzI4ODUyNDEwMzU3RjhCMUY3NzU0NTU2AA', '5219991275612', '2026-01-06 09:28:19'),
(100, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYIEFDNjA4NUI3MEIyN0QyQkM0MUVENzA5Nzk5RUYyRjlGAA', '5219991275612', '2026-01-06 09:28:31'),
(101, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYIEFDRjRFQ0UyODhCREVBMjU2MDZEMjBCMDI0MDYyNjZCAA', '5219991275612', '2026-01-06 09:28:33'),
(102, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYIEFDODI5QjRGOUNFRDk3ODU4MUZDNTBGRkYzNUM0RURCAA', '5219991275612', '2026-01-06 10:41:53'),
(103, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYIEFDNUExMTlEMEZEMkE2MTE3NkZEQkM1NkU5MkVBNjA0AA', '5219991275612', '2026-01-06 10:42:15'),
(104, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjA4MzM4QTM2MkY4MEUwQ0ZCQkUA', '5219991275612', '2026-01-06 10:43:02'),
(105, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjA1OEM4MDU0NjMyOENGOTRGQzYA', '5219991275612', '2026-01-06 10:43:04'),
(107, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjBFMTVGN0RFREZFREUwRUI3M0UA', '5219991275612', '2026-01-06 10:44:04'),
(109, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjA2QkE0QkFCQ0FGRDYyRTNBRjMA', '5219991275612', '2026-01-06 10:46:03'),
(110, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjAzN0Y5ODVEQzA5QTlBNTUxOTkA', '5219991275612', '2026-01-06 10:46:03'),
(111, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjAxRkM5OTA5NjVFODQ0QzBGMjEA', '5219991275612', '2026-01-06 10:46:04'),
(112, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjAzOTZBRDNGMENBRkM3NUUwMDcA', '5219991275612', '2026-01-06 10:46:04'),
(113, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjBEQjgzMTg3NkRDNkI4OEM3NDkA', '5219991275612', '2026-01-06 10:46:07'),
(115, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjAyQ0QyNUVBNTE3RDdDQzM5ODcA', '5219991275612', '2026-01-06 10:48:30'),
(116, 'wamid.HBgNNTIxOTk5MTI3NTYxMhUCABIYFjNFQjBFRDY0MDcyMUE5RTZDRDE5QzkA', '5219991275612', '2026-01-06 10:48:30'),
(117, 'wamid.HBgNNTIxOTk5Mjc4NDc3OBUCABIYIEFDMDNEMzNFRTE1NkE4RDVERjU5Mjc2QjkxRTI2QUI1AA', '5219992784778', '2026-01-06 12:28:53'),
(118, 'wamid.HBgNNTIxOTk5Mjc4NDc3OBUCABIYFjNFQjAyQzk3M0NFNjgwQjdFQTRCNDcA', '5219992784778', '2026-01-06 12:29:35'),
(119, 'wamid.HBgNNTIxOTk5Mjc4NDc3OBUCABIYFjNFQjA3OEQxMkE0REQ3MTcyOTVBMEIA', '5219992784778', '2026-01-06 12:30:20'),
(120, 'wamid.HBgNNTIxOTk5Mjc4NDc3OBUCABIYFjNFQjBDNEY5RjFFMTE2QzAwM0RBOTkA', '5219992784778', '2026-01-06 12:30:27'),
(121, 'wamid.HBgNNTIxOTk5Mjc4NDc3OBUCABIYFjNFQjA3QTk5NzUzNUZBMzE5QTMzNUEA', '5219992784778', '2026-01-06 12:30:51'),
(122, 'wamid.HBgNNTIxOTk5Mjc4NDc3OBUCABIYFjNFQjAwNTI0OTcyMTJCQzcwNUJGQUMA', '5219992784778', '2026-01-06 12:31:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `_tiendas`
--

CREATE TABLE `_tiendas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `centro_costo` varchar(20) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `_tiendas`
--

INSERT INTO `_tiendas` (`id`, `nombre`, `centro_costo`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Hoctun', '1154', 1, '2025-12-12 17:44:02', '2025-12-12 17:44:02'),
(2, 'Altabrisa', '1196', 1, '2025-12-16 12:46:37', '2025-12-16 12:46:37');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `encargados`
--
ALTER TABLE `encargados`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `telefono` (`telefono`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`) USING BTREE,
  ADD KEY `tienda_id` (`tienda_id`) USING BTREE;

--
-- Indices de la tabla `evidencias`
--
ALTER TABLE `evidencias`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `uq_ticket_media` (`ticket_id`,`wa_media_id`),
  ADD KEY `ticket_id` (`ticket_id`) USING BTREE;

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `encargado_id` (`encargado_id`) USING BTREE,
  ADD KEY `tienda_id` (`tienda_id`) USING BTREE,
  ADD KEY `tipo_id` (`tipo_id`) USING BTREE;

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `tipos_incidencia`
--
ALTER TABLE `tipos_incidencia`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `usuario` (`usuario`) USING BTREE;

--
-- Indices de la tabla `wa_inbound_messages`
--
ALTER TABLE `wa_inbound_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_wa_message_id` (`wa_message_id`),
  ADD KEY `idx_wa_from` (`wa_from`);

--
-- Indices de la tabla `_tiendas`
--
ALTER TABLE `_tiendas`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `centro_costo` (`centro_costo`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `encargados`
--
ALTER TABLE `encargados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `evidencias`
--
ALTER TABLE `evidencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=552;

--
-- AUTO_INCREMENT de la tabla `tipos_incidencia`
--
ALTER TABLE `tipos_incidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `wa_inbound_messages`
--
ALTER TABLE `wa_inbound_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de la tabla `_tiendas`
--
ALTER TABLE `_tiendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
