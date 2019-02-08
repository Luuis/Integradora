-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.14 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5301
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para banco
DROP DATABASE IF EXISTS `banco`;
CREATE DATABASE IF NOT EXISTS `banco` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `banco`;

-- Volcando estructura para tabla banco.banco
CREATE TABLE IF NOT EXISTS `banco` (
  `id_banco` int(11) NOT NULL,
  `banc_nombre` int(11) NOT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla banco.banco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;

-- Volcando estructura para tabla banco.movimiento
CREATE TABLE IF NOT EXISTS `movimiento` (
  `id_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `movi_tarjeta` int(11) NOT NULL,
  `movi_descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `movi_fecha` datetime NOT NULL,
  `movi_costo` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `movi_tarjeta` (`movi_tarjeta`),
  CONSTRAINT `movi_tarjeta` FOREIGN KEY (`movi_tarjeta`) REFERENCES `tarjeta` (`id_tarjeta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla banco.movimiento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;

-- Volcando estructura para tabla banco.tarjeta
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `tarj_banco` int(11) NOT NULL,
  `tarj_numero` bigint(16) unsigned NOT NULL,
  `tarj_ccv` int(3) unsigned zerofill NOT NULL,
  `tarj_nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `tarj_app` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `tarj_apm` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `tarj_exp_mes` int(2) unsigned zerofill NOT NULL,
  `tarj_exp_anio` int(10) unsigned zerofill NOT NULL,
  `tarj_saldo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_tarjeta`),
  KEY `tarj_banco` (`tarj_banco`),
  CONSTRAINT `tarj_banco` FOREIGN KEY (`tarj_banco`) REFERENCES `banco` (`id_banco`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla banco.tarjeta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
