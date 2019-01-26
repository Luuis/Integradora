-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.37-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bolsadetrabajo
CREATE DATABASE IF NOT EXISTS `bolsadetrabajo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bolsadetrabajo`;

-- Volcando estructura para tabla bolsadetrabajo.calificacion
CREATE TABLE IF NOT EXISTS `calificacion` (
  `id_calificacion` int(11) NOT NULL AUTO_INCREMENT,
  `cali_curso` int(11) NOT NULL,
  `cali_cuenta` int(11) NOT NULL,
  `cali_calificacion` decimal(2,2) unsigned NOT NULL,
  `cali_fecha_hora` datetime NOT NULL,
  PRIMARY KEY (`id_calificacion`),
  KEY `calificacion_curso` (`cali_curso`),
  KEY `calificacion_cuenta` (`cali_cuenta`),
  CONSTRAINT `calificacion_cuenta` FOREIGN KEY (`cali_cuenta`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `calificacion_curso` FOREIGN KEY (`cali_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.calificacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.capacitador
CREATE TABLE IF NOT EXISTS `capacitador` (
  `capa_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `capa_nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `capa_telefono` bigint(10) unsigned NOT NULL,
  `capa_dir_num_int` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `capa_dir_num_ext` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `capa_dir_localidad` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `capa_dir_municipio` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `capa_dir_estado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `capa_no_tarjeta` bigint(16) unsigned DEFAULT NULL,
  PRIMARY KEY (`capa_cuenta`),
  CONSTRAINT `capacitador_id_cuenta` FOREIGN KEY (`capa_cuenta`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.capacitador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `capacitador` DISABLE KEYS */;
/*!40000 ALTER TABLE `capacitador` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `cate_nombre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.categoria: ~54 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id_categoria`, `cate_nombre`) VALUES
	(1, 'Agencia de publicidad'),
	(2, 'Agrícola'),
	(3, 'Alfarería y cerámica'),
	(4, 'Alimentación'),
	(5, 'Anime y manga'),
	(6, 'Aseguradora'),
	(7, 'Asistencia sanitaria'),
	(8, 'Banco'),
	(9, 'Bienes raíces'),
	(10, 'Casa de moda'),
	(11, 'Construcción'),
	(12, 'Cosmética'),
	(13, 'Cristalería'),
	(14, 'Editoriales'),
	(15, 'Electrodomésticos'),
	(16, 'Electrónica'),
	(17, 'Encuestadora'),
	(18, 'Energía'),
	(19, 'Entretenimiento'),
	(20, 'Envasado'),
	(21, 'Establecimiento comercial'),
	(22, 'Fabricación'),
	(23, 'Fabricante de armas'),
	(24, 'Fabricante de baterías'),
	(25, 'Fabricante de herramientas'),
	(26, 'Fabricante de instrumentos musicales'),
	(27, 'Fabricante de material fotográfico'),
	(28, 'Fabricante de vehículos'),
	(29, 'Farmacéutica'),
	(30, 'Ferrocarriles'),
	(31, 'Forestal'),
	(32, 'Fotografía'),
	(33, 'Franquicia'),
	(34, 'Industria aeroespacial'),
	(35, 'Informática'),
	(36, 'Ingeniería'),
	(37, 'Joyería'),
	(38, 'Logística'),
	(39, 'Medios de comunicación'),
	(40, 'Minería'),
	(41, 'Papelera'),
	(42, 'Química'),
	(43, 'Relaciones públicas'),
	(44, 'Relojera'),
	(45, 'Seguridad'),
	(46, 'Servicios financieros'),
	(47, 'Servicios sanitarios'),
	(48, 'Siderurgia y metalurgia'),
	(49, 'Tabacalera'),
	(50, 'Telecomunicaciones'),
	(51, 'Textil'),
	(52, 'Transporte'),
	(53, 'Turismo'),
	(54, 'Vinícola');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.cuenta
CREATE TABLE IF NOT EXISTS `cuenta` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `cuen_rol` int(11) NOT NULL,
  `cuen_correo` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `cuen_contrasena` varchar(44) COLLATE latin1_spanish_ci NOT NULL,
  `cuen_salt` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  UNIQUE KEY `cuenta_correo` (`cuen_correo`),
  KEY `cuenta_rol` (`cuen_rol`),
  CONSTRAINT `cuenta_rol` FOREIGN KEY (`cuen_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.cuenta: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` (`id_cuenta`, `cuen_rol`, `cuen_correo`, `cuen_contrasena`, `cuen_salt`) VALUES
	(1, 1, 'admin@bolsadetrabajo.com', 'z6coEuht5rWHskHiaMlDGbGl2rzxSN7EsGR8pkZz09w=', 'i0IgZQyyMDM1XO68i0EfaLaf8gei2m');
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.curriculum
CREATE TABLE IF NOT EXISTS `curriculum` (
  `id_curriculum` int(11) NOT NULL AUTO_INCREMENT,
  `curr_cuenta` int(11) NOT NULL,
  `curr_fecha_subida` datetime NOT NULL,
  PRIMARY KEY (`id_curriculum`),
  KEY `curriculum_cuenta` (`curr_cuenta`),
  CONSTRAINT `curriculum_cuenta` FOREIGN KEY (`curr_cuenta`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.curriculum: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `curs_nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `curs_descripcion` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `curs_precio` decimal(5,2) unsigned NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.curso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.curso_comprado
CREATE TABLE IF NOT EXISTS `curso_comprado` (
  `cuco_curso` int(11) NOT NULL,
  `cuco_cuenta` int(11) NOT NULL,
  `cuco_fecha_hora` datetime NOT NULL,
  KEY `curso_comprado_curso` (`cuco_curso`),
  KEY `curso_comprado_cuenta` (`cuco_cuenta`),
  CONSTRAINT `curso_comprado_cuenta` FOREIGN KEY (`cuco_cuenta`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `curso_comprado_curso` FOREIGN KEY (`cuco_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.curso_comprado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `curso_comprado` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_comprado` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.cv_datos_familiares
CREATE TABLE IF NOT EXISTS `cv_datos_familiares` (
  `cvdf_curriculum` int(11) NOT NULL,
  `cvdf_nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `cvdf_parentesco` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvdf_vive` tinyint(1) NOT NULL DEFAULT '0',
  `cvdf_finado` tinyint(1) NOT NULL DEFAULT '0',
  `cvdf_dir_num_int` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cvdf_dir_num_ext` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cvdf_dir_localidad` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvdf_dir_municipio` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvdf_dir_estado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvdf_ocupacion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  KEY `cvdf_curriculum` (`cvdf_curriculum`),
  CONSTRAINT `cvdf_curriculum` FOREIGN KEY (`cvdf_curriculum`) REFERENCES `curriculum` (`id_curriculum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.cv_datos_familiares: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cv_datos_familiares` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_datos_familiares` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.cv_experiencia_laboral
CREATE TABLE IF NOT EXISTS `cv_experiencia_laboral` (
  `cvel_curriculum` int(11) NOT NULL,
  `cvel_nombre_empresa` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvel_dir_num_int` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cvel_dir_num_ext` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cvel_dir_localidad` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvel_dir_municipio` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvel_dir_estado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvel_telefono` bigint(10) unsigned NOT NULL,
  `cvel_puesto` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvel_funciones` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `cvel_nombre_jefe` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `cvel_anio_inicio` year(4) NOT NULL DEFAULT '2000',
  `cvel_anio_fin` year(4) NOT NULL DEFAULT '2000',
  KEY `cvel_curriculum` (`cvel_curriculum`),
  CONSTRAINT `cvel_curriculum` FOREIGN KEY (`cvel_curriculum`) REFERENCES `curriculum` (`id_curriculum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.cv_experiencia_laboral: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cv_experiencia_laboral` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_experiencia_laboral` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.cv_formacion_academica
CREATE TABLE IF NOT EXISTS `cv_formacion_academica` (
  `cvfa_curriculum` int(11) NOT NULL AUTO_INCREMENT,
  `cvfa_nivel` int(11) NOT NULL,
  `cvfa_nombre_institucion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvfa_dir_num_int` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cvfa_dir_num_ext` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cvfa_dir_localidad` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvfa_dir_municipio` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvfa_dir_estado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvfa_tiulo_certificado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvfa_anio_inicio` year(4) NOT NULL,
  `cvfa_anio_fin` year(4) NOT NULL,
  `cvfa_estado` int(1) unsigned NOT NULL,
  PRIMARY KEY (`cvfa_curriculum`),
  KEY `cvfa_nivel` (`cvfa_nivel`),
  CONSTRAINT `cvfa_curriculum` FOREIGN KEY (`cvfa_curriculum`) REFERENCES `curriculum` (`id_curriculum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cvfa_nivel` FOREIGN KEY (`cvfa_nivel`) REFERENCES `nivel_academico` (`id_nivel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.cv_formacion_academica: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cv_formacion_academica` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_formacion_academica` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.cv_referencias_personales
CREATE TABLE IF NOT EXISTS `cv_referencias_personales` (
  `cvrp_curriculum` int(11) NOT NULL,
  `cvrp_nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `cvrp_dir_num_int` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cvrp_dir_num_ext` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cvrp_dir_localidad` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvrp_dir_municipio` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvrp_dir_estado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvrp_telefono` bigint(10) NOT NULL,
  `cvrp_relacion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cvrp_tiempo_conociendo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  KEY `cvrp_curriculum` (`cvrp_curriculum`),
  CONSTRAINT `cvrp_curriculum` FOREIGN KEY (`cvrp_curriculum`) REFERENCES `curriculum` (`id_curriculum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.cv_referencias_personales: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cv_referencias_personales` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_referencias_personales` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.empleador
CREATE TABLE IF NOT EXISTS `empleador` (
  `empl_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `empl_estado_civil` int(11) NOT NULL,
  `empl_nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `empl_ap_pat` varchar(50) CHARACTER SET latin1 NOT NULL,
  `empl_ap_mat` varchar(50) CHARACTER SET latin1 NOT NULL,
  `empl_sexo` enum('M','F') CHARACTER SET latin1 NOT NULL,
  `empl_telefono` bigint(10) unsigned NOT NULL,
  `empl_fecha_nacimiento` date NOT NULL,
  `empl_curp` varchar(18) CHARACTER SET latin1 NOT NULL,
  `empl_cedula_prof` varchar(10) CHARACTER SET latin1 NOT NULL,
  `empl_dir_num_int` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `empl_dir_num_ext` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `empl_dir_localidad` varchar(50) CHARACTER SET latin1 NOT NULL,
  `empl_dir_municipio` varchar(50) CHARACTER SET latin1 NOT NULL,
  `empl_dir_estado` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`empl_cuenta`),
  KEY `empleador_estado_civil` (`empl_estado_civil`),
  CONSTRAINT `empleador_estado_civil` FOREIGN KEY (`empl_estado_civil`) REFERENCES `estado_civil` (`id_estado_civil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.empleador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empleador` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleador` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.estado_civil
CREATE TABLE IF NOT EXISTS `estado_civil` (
  `id_estado_civil` int(11) NOT NULL AUTO_INCREMENT,
  `esci_nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_estado_civil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.estado_civil: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.evaluacion_curso
CREATE TABLE IF NOT EXISTS `evaluacion_curso` (
  `id_eval_curso` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `evcu_cuenta` int(11) NOT NULL,
  `evcu_curso` int(11) NOT NULL,
  `evcu_fecha_hora` datetime NOT NULL,
  `evcu_calificacion` decimal(2,1) NOT NULL,
  `evcu_comentario` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_eval_curso`),
  KEY `evaluacion_curso_cuenta` (`evcu_cuenta`),
  KEY `evaluacion_curso_curso` (`evcu_curso`),
  CONSTRAINT `evaluacion_curso_cuenta` FOREIGN KEY (`evcu_cuenta`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluacion_curso_curso` FOREIGN KEY (`evcu_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bolsadetrabajo.evaluacion_curso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `evaluacion_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_curso` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.evaluacion_empresa
CREATE TABLE IF NOT EXISTS `evaluacion_empresa` (
  `id_eval_empresa` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `evem_empleador` int(11) NOT NULL,
  `evem_reclutador` int(11) NOT NULL,
  `evem_calificacion` decimal(2,1) NOT NULL,
  `evem_comentario` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_eval_empresa`),
  KEY `evem_reclutador` (`evem_reclutador`),
  KEY `evem_empleador` (`evem_empleador`),
  CONSTRAINT `evem_empleador` FOREIGN KEY (`evem_empleador`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evem_reclutador` FOREIGN KEY (`evem_reclutador`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.evaluacion_empresa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `evaluacion_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_empresa` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.feria_de_empleo
CREATE TABLE IF NOT EXISTS `feria_de_empleo` (
  `id_feria` int(11) NOT NULL AUTO_INCREMENT,
  `feri_nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `feri_fecha` date NOT NULL,
  PRIMARY KEY (`id_feria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.feria_de_empleo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `feria_de_empleo` DISABLE KEYS */;
/*!40000 ALTER TABLE `feria_de_empleo` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.mensajes
CREATE TABLE IF NOT EXISTS `mensajes` (
  `id_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `mens_remitente` int(11) NOT NULL,
  `mens_destinatario` int(11) NOT NULL,
  `mens_texto` text COLLATE latin1_spanish_ci NOT NULL,
  `mens_archivo` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `mens_fecha_hora` datetime NOT NULL,
  `mens_leido` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_mensaje`),
  KEY `mensajes_remitente` (`mens_remitente`),
  KEY `mensajes_destinatario` (`mens_destinatario`),
  CONSTRAINT `mensajes_destinatario` FOREIGN KEY (`mens_destinatario`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mensajes_remitente` FOREIGN KEY (`mens_remitente`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.mensajes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.nivel_academico
CREATE TABLE IF NOT EXISTS `nivel_academico` (
  `id_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `niac_nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.nivel_academico: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `nivel_academico` DISABLE KEYS */;
INSERT INTO `nivel_academico` (`id_nivel`, `niac_nombre`) VALUES
	(1, 'Bachillerato'),
	(2, 'Educación profesional técnica'),
	(3, 'Técnico superior'),
	(4, 'Licenciatura'),
	(5, 'Ingeniería'),
	(6, 'Posgrado');
/*!40000 ALTER TABLE `nivel_academico` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.plan
CREATE TABLE IF NOT EXISTS `plan` (
  `id_plan` int(11) NOT NULL AUTO_INCREMENT,
  `plan_nombre` varchar(50) NOT NULL,
  `plan_precio` decimal(5,2) unsigned NOT NULL,
  `plan_num_vacantes` int(3) unsigned NOT NULL,
  `plan_tiempo` time NOT NULL,
  PRIMARY KEY (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bolsadetrabajo.plan: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.plan_comprado
CREATE TABLE IF NOT EXISTS `plan_comprado` (
  `id_plan_comprado` int(11) NOT NULL AUTO_INCREMENT,
  `plco_plan` int(11) NOT NULL,
  `plco_cuenta` int(11) NOT NULL,
  `plco_fecha` datetime NOT NULL,
  `plco_fecha_limite` datetime NOT NULL,
  PRIMARY KEY (`id_plan_comprado`),
  KEY `plan_comprado_plan` (`plco_plan`),
  KEY `plan_comprado_cuenta` (`plco_cuenta`),
  CONSTRAINT `plan_comprado_cuenta` FOREIGN KEY (`plco_cuenta`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plan_comprado_plan` FOREIGN KEY (`plco_plan`) REFERENCES `plan` (`id_plan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.plan_comprado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `plan_comprado` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_comprado` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.postulacion
CREATE TABLE IF NOT EXISTS `postulacion` (
  `id_postulacion` int(11) NOT NULL AUTO_INCREMENT,
  `post_vacante` int(11) NOT NULL,
  `post_cuenta` int(11) NOT NULL,
  `post_curriculum` int(11) NOT NULL,
  `post_comentario` varchar(500) CHARACTER SET latin1 NOT NULL,
  `post_fecha_hora` datetime NOT NULL,
  `post_estado` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_postulacion`),
  KEY `postulacion_vacante` (`post_vacante`),
  KEY `postulacion_cuenta` (`post_cuenta`),
  KEY `postulacion_curriculum` (`post_curriculum`),
  CONSTRAINT `postulacion_cuenta` FOREIGN KEY (`post_cuenta`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postulacion_curriculum` FOREIGN KEY (`post_curriculum`) REFERENCES `curriculum` (`id_curriculum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postulacion_vacante` FOREIGN KEY (`post_vacante`) REFERENCES `vacante` (`id_vacante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.postulacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `postulacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `postulacion` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.reclutador
CREATE TABLE IF NOT EXISTS `reclutador` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `recl_categoria` int(11) NOT NULL,
  `recl_nombre_empresa` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `recl_dir_num_int` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `recl_dir_num_ext` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `recl_dir_localidad` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `recl_dir_municipio` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `recl_dir_estado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `recl_telefono` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `reclutador_categoria` (`recl_categoria`),
  CONSTRAINT `reclutador_categoria` FOREIGN KEY (`recl_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.reclutador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `reclutador` DISABLE KEYS */;
/*!40000 ALTER TABLE `reclutador` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.rol: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id_rol`, `rol_nombre`) VALUES
	(1, 'Bolsa de Trabajo'),
	(2, 'Empleador'),
	(3, 'Reclutador'),
	(4, 'Capacitador');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla bolsadetrabajo.vacante
CREATE TABLE IF NOT EXISTS `vacante` (
  `id_vacante` int(11) NOT NULL AUTO_INCREMENT,
  `vaca_categoria` int(11) NOT NULL,
  `vaca_compra` int(11) NOT NULL,
  `vaca_titulo` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `vaca_detalles` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `vaca_requisitos` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `vaca_paga` decimal(10,0) NOT NULL,
  `vaca_tipo_paga` enum('S','Q','M') COLLATE latin1_spanish_ci NOT NULL,
  `vaca_estado` int(1) NOT NULL,
  `vaca_fecha` datetime NOT NULL,
  PRIMARY KEY (`id_vacante`),
  KEY `vacante_categoria` (`vaca_categoria`),
  KEY `vacante_compra` (`vaca_compra`),
  CONSTRAINT `vacante_categoria` FOREIGN KEY (`vaca_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vacante_compra` FOREIGN KEY (`vaca_compra`) REFERENCES `plan_comprado` (`id_plan_comprado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla bolsadetrabajo.vacante: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vacante` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacante` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

CREATE USER 'bolsa_admin'@'%' IDENTIFIED BY 'X7nuSOGe';
GRANT INSERT, UPDATE, SELECT, EXECUTE  ON *.* TO 'bolsa_admin'@'%';

CREATE USER 'bolsa_empleador'@'%' IDENTIFIED BY 'Cedi5IXi';
GRANT EXECUTE  ON *.* TO 'bolsa_empleador'@'%';

CREATE USER 'bolsa_reclutador'@'%' IDENTIFIED BY 'y38E6a6A';
GRANT EXECUTE  ON *.* TO 'bolsa_reclutador'@'%';

CREATE USER 'bolsa_capacitador'@'%' IDENTIFIED BY 'V7vabO1o';
GRANT EXECUTE  ON *.* TO 'bolsa_capacitador'@'%';

FLUSH PRIVILEGES;
