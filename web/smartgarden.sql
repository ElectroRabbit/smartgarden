-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para smartgarden
CREATE DATABASE IF NOT EXISTS `smartgarden` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smartgarden`;

-- Volcando estructura para tabla smartgarden.consejos
CREATE TABLE IF NOT EXISTS `consejos` (
  `IDCONSEJO` int NOT NULL AUTO_INCREMENT,
  `CONSEJO` text COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`IDCONSEJO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla smartgarden.consejos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla smartgarden.datos
CREATE TABLE IF NOT EXISTS `datos` (
  `IDDATO` int NOT NULL AUTO_INCREMENT,
  `IDDISPOSITIVO` int NOT NULL,
  `FECHADATO` timestamp NOT NULL,
  `TEMPERATURA` float DEFAULT NULL,
  `HUMEDAD_AMB` int DEFAULT NULL,
  `HUMEDAD_SUELO` int DEFAULT NULL,
  `LUMINOSIDAD` int DEFAULT NULL,
  `NIVELAGUA` smallint DEFAULT NULL,
  `LLUVIA` int DEFAULT NULL,
  PRIMARY KEY (`IDDATO`),
  KEY `FK_TIENE` (`IDDISPOSITIVO`),
  CONSTRAINT `FK_TIENE` FOREIGN KEY (`IDDISPOSITIVO`) REFERENCES `dispositivos` (`IDDISPOSITIVO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla smartgarden.datos: ~45 rows (aproximadamente)
INSERT INTO `datos` (`IDDATO`, `IDDISPOSITIVO`, `FECHADATO`, `TEMPERATURA`, `HUMEDAD_AMB`, `HUMEDAD_SUELO`, `LUMINOSIDAD`, `NIVELAGUA`, `LLUVIA`) VALUES
	(1, 1, '2023-11-01 17:10:10', 25, 50, 1, 0, 0, NULL),
	(2, 1, '2023-11-01 17:19:39', 25, 49, 1, 0, 0, NULL),
	(3, 1, '2023-11-01 17:20:41', 25, 49, 1, 0, 0, NULL),
	(4, 1, '2023-11-01 17:21:42', 25, 49, 1, 0, 0, NULL),
	(5, 1, '2023-11-01 17:22:43', 25, 49, 1, 0, 0, NULL),
	(6, 1, '2023-11-01 17:23:45', 25, 49, 1, 0, 0, NULL),
	(7, 1, '2023-11-01 17:24:46', 25, 49, 1, 0, 0, NULL),
	(8, 1, '2023-11-01 17:25:47', 25, 49, 1, 0, 0, NULL),
	(9, 1, '2023-11-01 17:26:48', 25, 49, 1, 0, 0, NULL),
	(10, 1, '2023-11-01 17:27:49', 25, 49, 1, 0, 0, NULL),
	(11, 1, '2023-11-01 17:28:50', 25, 49, 1, 0, 0, NULL),
	(12, 1, '2023-11-01 19:25:59', 25, 46, 1, 0, 0, NULL),
	(13, 1, '2023-11-01 19:27:01', 25, 46, 1, 0, 0, NULL),
	(14, 1, '2023-11-01 19:28:02', 25, 46, 1, 0, 0, NULL),
	(15, 1, '2023-11-01 19:29:03', 25, 46, 1, 0, 0, NULL),
	(16, 1, '2023-11-01 19:30:04', 25, 46, 1, 0, 0, NULL),
	(17, 1, '2023-11-01 19:31:05', 25, 46, 1, 0, 0, NULL),
	(18, 1, '2023-11-01 19:32:06', 25, 47, 1, 0, 0, NULL),
	(19, 1, '2023-11-01 19:32:44', 25, 47, 1, 0, 0, NULL),
	(20, 1, '2023-11-01 19:33:18', 25, 47, 1, 0, 0, NULL),
	(21, 1, '2023-11-01 19:34:19', 25, 47, 1, 0, 0, NULL),
	(22, 1, '2023-11-01 19:35:20', 25, 47, 1, 0, 0, NULL),
	(23, 1, '2023-11-01 19:36:21', 25, 48, 1, 0, 0, NULL),
	(24, 1, '2023-11-01 19:37:22', 25, 48, 1, 0, 0, NULL),
	(25, 1, '2023-11-01 19:38:24', 25, 47, 1, 0, 0, NULL),
	(26, 1, '2023-11-01 19:39:36', 25, 47, 1, 0, 0, NULL),
	(27, 1, '2023-11-01 19:40:37', 25, 47, 1, 0, 0, NULL),
	(28, 1, '2023-11-01 19:49:28', 25, 46, 1, 0, 0, NULL),
	(29, 1, '2023-11-01 19:50:29', 25, 46, 1, 0, 0, NULL),
	(30, 1, '2023-11-01 19:51:30', 25, 46, 1, 0, 0, NULL),
	(31, 1, '2023-11-01 19:52:32', 25, 46, 1, 0, 0, NULL),
	(32, 1, '2023-11-01 19:53:33', 25, 46, 1, 0, 0, NULL),
	(33, 1, '2023-11-01 19:54:34', 25, 46, 1, 0, 0, NULL),
	(34, 1, '2023-11-01 19:55:36', 25, 47, 1, 0, 0, NULL),
	(35, 1, '2023-11-01 19:56:37', 25, 46, 1, 0, 0, NULL),
	(36, 1, '2023-11-01 19:57:38', 25, 46, 1, 0, 0, NULL),
	(37, 1, '2023-11-01 19:58:39', 25, 46, 1, 0, 0, NULL),
	(38, 1, '2023-11-01 19:59:41', 25, 46, 1, 0, 0, NULL),
	(39, 1, '2023-11-01 20:00:42', 25, 46, 1, 0, 0, NULL),
	(40, 1, '2023-11-01 20:01:43', 25, 46, 1, 0, 0, NULL),
	(41, 1, '2023-11-01 20:02:44', 25, 45, 1, 0, 0, NULL),
	(42, 1, '2023-11-01 20:03:46', 25, 46, 1, 0, 0, NULL),
	(43, 1, '2023-11-01 20:04:11', 25, 46, 1, 0, 0, NULL),
	(44, 1, '2023-11-01 20:05:12', 25, 46, 1, 0, 0, NULL),
	(45, 1, '2023-11-01 20:06:14', 25, 46, 1, 0, 0, NULL),
	(46, 1, '2023-11-01 20:07:15', 25, 46, 1, 0, 0, NULL),
	(47, 1, '2023-11-01 20:08:18', 25, 46, 1, 0, 0, NULL),
	(48, 1, '2023-11-01 20:09:20', 26, 47, 1, 0, 0, NULL),
	(49, 1, '2023-11-01 20:10:21', 25, 46, 1, 0, 0, NULL),
	(50, 1, '2023-11-01 20:11:22', 24, 46, 1, 0, 0, NULL),
	(51, 1, '2023-11-01 20:12:24', 26, 46, 1, 0, 0, NULL);

-- Volcando estructura para tabla smartgarden.dispositivos
CREATE TABLE IF NOT EXISTS `dispositivos` (
  `IDDISPOSITIVO` int NOT NULL AUTO_INCREMENT,
  `SERIEDISPOSITIVO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `IDUSUARIO` int NOT NULL,
  `NOMBREPLANTA` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ALIASDISPOSITIVO` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ESTADODISPOSITIVO` smallint DEFAULT NULL,
  `FECHAMANUFACTURA` timestamp NOT NULL,
  PRIMARY KEY (`IDDISPOSITIVO`),
  KEY `FK_POSEE` (`IDUSUARIO`),
  KEY `FK_TIENE_UN` (`NOMBREPLANTA`),
  CONSTRAINT `FK_POSEE` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuarios` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE_UN` FOREIGN KEY (`NOMBREPLANTA`) REFERENCES `plantas` (`NOMBREPLANTA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla smartgarden.dispositivos: ~1 rows (aproximadamente)
INSERT INTO `dispositivos` (`IDDISPOSITIVO`, `SERIEDISPOSITIVO`, `IDUSUARIO`, `NOMBREPLANTA`, `ALIASDISPOSITIVO`, `ESTADODISPOSITIVO`, `FECHAMANUFACTURA`) VALUES
	(1, 'IPST_001', 1, 'Planta Común', NULL, NULL, '2023-11-01 14:57:07');

-- Volcando estructura para tabla smartgarden.listausuarios
CREATE TABLE IF NOT EXISTS `listausuarios` (
  `CODIGOLISTA` int NOT NULL AUTO_INCREMENT,
  `IDUSUARIO` int NOT NULL,
  `IDMENSAJE` int NOT NULL,
  `ESTADOMENSAJE` tinyint(1) NOT NULL,
  PRIMARY KEY (`CODIGOLISTA`),
  KEY `FK_ES_PARTE_DE` (`IDUSUARIO`),
  KEY `FK_SE_ENTREGAN_A_UNA` (`IDMENSAJE`),
  CONSTRAINT `FK_ES_PARTE_DE` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuarios` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SE_ENTREGAN_A_UNA` FOREIGN KEY (`IDMENSAJE`) REFERENCES `mensajes` (`IDMENSAJE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla smartgarden.listausuarios: ~0 rows (aproximadamente)

-- Volcando estructura para tabla smartgarden.mensajes
CREATE TABLE IF NOT EXISTS `mensajes` (
  `IDMENSAJE` int NOT NULL AUTO_INCREMENT,
  `AUTORMENSAJE` varchar(35) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ASUNTOMENSAJE` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `FECHAMENSAJE` timestamp NOT NULL,
  `MENSAJE` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `TIPOMENSAJE` smallint NOT NULL,
  `ESTADOMENSAJE` tinyint(1) NOT NULL,
  PRIMARY KEY (`IDMENSAJE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla smartgarden.mensajes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla smartgarden.notificaciones
CREATE TABLE IF NOT EXISTS `notificaciones` (
  `IDNOTIFICACION` int NOT NULL AUTO_INCREMENT,
  `AUTORNOTIFICACION` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ASUNTONOTIFICACION` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `FECHANOTIFICACION` timestamp NOT NULL,
  `NOTIFICACION` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `TIPONOTIFICACION` smallint NOT NULL,
  `ESTADONOTIFICACION` tinyint(1) NOT NULL,
  PRIMARY KEY (`IDNOTIFICACION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla smartgarden.notificaciones: ~0 rows (aproximadamente)

-- Volcando estructura para tabla smartgarden.plantas
CREATE TABLE IF NOT EXISTS `plantas` (
  `NOMBREPLANTA` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `NOMCIENTPLANTA` varchar(25) COLLATE utf8mb4_spanish_ci NOT NULL,
  `IMGPLANTA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`NOMBREPLANTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla smartgarden.plantas: ~0 rows (aproximadamente)
INSERT INTO `plantas` (`NOMBREPLANTA`, `NOMCIENTPLANTA`, `IMGPLANTA`) VALUES
	('Planta Común', 'Plantitus', 'https://img.freepik.com/vector-gratis/planta-emoji_78370-262.jpg');

-- Volcando estructura para tabla smartgarden.reportes
CREATE TABLE IF NOT EXISTS `reportes` (
  `IDREPORTE` int NOT NULL AUTO_INCREMENT,
  `IDUSUARIO` int NOT NULL,
  `TIPOREPORTE` smallint NOT NULL,
  `REPORTE` text COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`IDREPORTE`),
  KEY `FK_GENERA` (`IDUSUARIO`),
  CONSTRAINT `FK_GENERA` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuarios` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla smartgarden.reportes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla smartgarden.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `IDUSUARIO` int NOT NULL AUTO_INCREMENT,
  `NOMBREUSUARIO` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `APELLIDOUSUARIO` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  `EMAILUSUARIO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `PASSWORDUSUARIO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `FECHAALTAUSUARIO` timestamp NULL DEFAULT NULL,
  `AVATARUSUARIO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DISPOSSELECUSUARIO` int DEFAULT '1',
  `IDFBUSUARIO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IDUSUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla smartgarden.usuarios: ~0 rows (aproximadamente)
INSERT INTO `usuarios` (`IDUSUARIO`, `NOMBREUSUARIO`, `APELLIDOUSUARIO`, `EMAILUSUARIO`, `PASSWORDUSUARIO`, `FECHAALTAUSUARIO`, `AVATARUSUARIO`, `DISPOSSELECUSUARIO`, `IDFBUSUARIO`) VALUES
	(1, 'Roberto', 'Vargas', 'rvargas@smartgarden.cl', '123456', '2023-10-19 17:56:59', '', 1, NULL),
	(2, 'Juanito', 'Perez', 'jperez@gmail.com', '12345678', '2023-11-04 04:16:21', NULL, 1, NULL),
	(3, 'Jorge', 'Guzman', 'jguzman@gmail.com', '1234', '2023-11-04 04:22:48', NULL, 1, NULL),
	(4, 'Andrea', 'Pereira', 'apereira@gmail.com', '12345678', '2023-11-04 17:35:23', NULL, 1, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
