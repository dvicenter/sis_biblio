-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-07-2013 a las 19:31:27
-- Versión del servidor: 5.5.31-0ubuntu0.13.04.1
-- Versión de PHP: 5.4.9-4ubuntu2.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sis_biblio`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMAccion`(IN pIdAbm TINYINT, IN pId_accion TINYINT(4), IN pAccion VARCHAR(10))
BEGIN
IF pIdAbm = 0
      THEN 
        SELECT tb.id_accion, tb.accion FROM tbl_accion tb;
        ELSE
        IF pIdAbm = 1
        THEN
          INSERT INTO tbl_accion(accion) VALUES (pAccion);
         ELSE 
          IF pIdAbm=2
          THEN
            UPDATE tbl_accion set accion=pAccion WHERE id_accion=pId_accion;
            COMMIT;
          ELSE 
          IF pIdAbm = 3
           THEN
            DELETE FROM tbl_accion WHERE id_accion=pId_accion;
            COMMIT;
          END IF;
        END IF;
      END IF;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMComponente`(IN pIdAbm TINYINT, IN pId_componente INT (11), IN pComponente VARCHAR(100), IN pDescripcion_componente VARCHAR(100))
BEGIN
IF pIdAbm = 0
      THEN 
        SELECT tbl.id_componente, tbl.componente, tbl.descripcion_componente FROM tbl_componente tbl;
ELSE
       IF pIdAbm = 1
      THEN
      INSERT INTO tbl_componente(componente,descripcion_componente) VALUES (pComponente,pDescripcion_componente);
      ELSE 
 IF pIdAbm=2
      THEN
      UPDATE tbl_componente set componente=pComponente WHERE id_componente=pId_componente;
      COMMIT;
      ELSE 
 IF pIdAbm = 3
      THEN
      DELETE FROM tbl_componente WHERE id_componente=pId_componente;
      COMMIT;
  END IF;
  END IF;
  END IF;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMComponenteAccion`(IN pIdAbm TINYINT, IN pIdRolComponenteAccion INT, IN pIdRol BIGINT, IN pIdComponenteAccion INT)
BEGIN
IF pIdAbm=0 THEN
	
	SELECT `tbl_componente_accion`.`id_componente_accion`,`tbl_accion`.`accion`,`tbl_componente`.`componente` FROM tbl_componente_accion
	LEFT JOIN `sis_biblio`.`tbl_accion` ON `tbl_componente_accion`.`id_accion` = `tbl_accion`.`id_accion` 
	LEFT JOIN `sis_biblio`.`tbl_componente` ON `tbl_componente_accion`.`id_componente` = `tbl_componente`.`id_componente` ;

	ELSE
	  IF pIdAbm=1 THEN
		INSERT INTO tbl_rol_componente_accion(id_rol_componente_accion,id_rol,id_componente_accion) values (pIdRolComponenteAccion,pIdRol,pIdComponenteAccion);
	    ELSE
		  IF pIdAbm=2 THEN
			DELETE FROM tbl_rol_componente_accion WHERE id_rol_componente_accion in (pIdRolComponenteAccion);
		  END IF;
	    END IF;
	  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMRol`(IN pIdAbm TINYINT, IN pIdRol INT,IN pRol VARCHAR(50), IN pDescripcion VARCHAR(200))
BEGIN
 IF pIdAbm = 0
      THEN 
        SELECT tbl.id_rol, tbl.rol FROM tbl_rol tbl;
    ELSE
      IF pIdAbm = 1
        THEN
          INSERT INTO tbl_rol(rol, descripcion) VALUES (pRol, pDescripcion);
      ELSE
        IF pIdAbm = 2
          THEN
            UPDATE tbl_rol set rol = pRol,descripcion = pDescripcion Where  id_rol = pIdRol;
            commit;
          ELSE 
          IF pIdAbm=3 THEN
              DELETE FROM tbl_rol WHERE tbl_rol.id_rol=pIdRol;
            END IF;
        END IF;
     END IF;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMUsuario`(IN pIdAbm TINYINT, IN pId_usuario BIGINT (20), IN pUsuario VARCHAR(50), IN pContrasenia VARCHAR(100), IN pId_sujeto BIGINT(20), IN pActive CHAR(1))
BEGIN
IF pIdAbm = 0
      THEN 
       SELECT
        tbl.id_usuario,
        tbl.id_sujeto,
        viw.sujeto,
        tbl.usuario,
        tbl.contrasenia,
        tbl.active
      FROM
        viw_sujeto viw
          INNER JOIN tbl_usuario tbl
            ON viw.id_sujeto = tbl.id_sujeto;
      ELSE
       IF pIdAbm = 1
      THEN
      INSERT INTO tbl_usuario(usuario,contrasenia,id_sujeto,active) VALUES (pUsuario,pContrasenia,pId_sujeto,pActive);
      ELSE 
 IF pIdAbm=2
      THEN
      UPDATE tbl_usuario tbl set 
        tbl.usuario=pUsuario,
        tbl.contrasenia=pContrasenia,
        tbl.active=pActive
        WHERE id_usuario=pId_usuario;
      COMMIT;
      ELSE 
 IF pIdAbm = 3
      THEN
      DELETE FROM tbl_usuario WHERE id_usuario=pId_usuario;
      COMMIT;
      ELSE
  IF pIdAbm=4
    THEN
    SET pActive=0;
      UPDATE tbl_usuario tbl set tbl.active=0 WHERE tbl.id_usuario=pId_usuario;
    commit;
    END IF;
  END IF;
  END IF;
  END IF;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMUsuarioRol`(IN pIdAbm TINYINT, IN pIdUsuarioRol INT, IN pIdUsuario BIGINT, IN pIdRol INT)
BEGIN
 IF pIdAbm=1 THEN
    INSERT INTO tbl_usuario_rol(id_rol,id_usuario) values (pIdRol,pIdUsuario);
  ELSE
    IF pIdAbm=2 THEN
        DELETE FROM tbl_usuario_rol WHERE id_usuario_rol in (pIdUsuarioRol);
      END IF;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRAPREstadoPlanTesis`(IN pIdPlanTesis BIGINT, IN pIdEstado INT)
BEGIN
  UPDATE tbl_plan_tesis tbl SET
    tbl.id_estado_plan_tesis=pIdEstado
WHERE tbl.id_plan_tesis=pIdPlanTesis;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCCNSComponenteAccion`(IN pIdCns TINYINT, IN pIdComponente INT, IN pLimit INT)
BEGIN
  IF pIdCns=1 THEN
SELECT
  tblc.id_componente,
  tblca.id_componente_accion,
  tblc.componente
FROM
  tbl_componente_accion tblca
  INNER JOIN tbl_componente tblc
    ON tblca.id_componente = tblc.id_componente
  WHERE tblc.id_componente=pIdComponente;
    ELSE IF pIdCns=2 THEN
      SET @pLimit=pLimit;
      SET @pIdComponente=pIdComponente;
     PREPARE STMT FROM   'SELECT
          tblc.id_componente,tblca.id_componente_accion,tblc.componente
        FROM
        tbl_componente_accion tblca
        INNER JOIN tbl_componente tblc
          ON tblca.id_componente = tblc.id_componente
        WHERE tblc.id_componente=? ORDER BY tblca.id_componente_accion DESC LIMIT ?';
      EXECUTE STMT USING @pIdComponente,@pLimit;
      END IF;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSAccion`(IN pIdCns INT, IN pInicio INT, IN pFinal INT)
BEGIN
declare pTotal int;
SET @inicio=pInicio;
SET @fin=pFinal;

IF pIdCns = 1 THEN
    set @pTotal=(select count(id_accion) from tbl_accion);
    PREPARE STMT FROM "SELECT id_accion, accion, ? as Total FROM tbl_accion LIMIT ?,?";
    EXECUTE STMT USING @pTotal,@inicio,@fin;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSAsesor`()
BEGIN
 SELECT
  viw.id_docente,
  viw.id_sujeto,
  viw.Docente,
  viw.activo
FROM
  viw_docente viw
  WHERE viw.activo='1';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSEscuela`()
BEGIN
SELECT
  tbl.id_escuela,
  tbl.escuela
FROM
  tbl_escuela tbl
  WHERE tbl.estado=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSFacultad`()
BEGIN
SELECT
  tbl.id_facultad,
  tbl.facultad
FROM
  tbl_facultad tbl
  WHERE tbl.activo=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSInformePractica`(IN pTipoCns TINYINT ,IN pIdTipoMaterial TINYINT, IN pIdAlumno BIGINT)
BEGIN
  IF pTipoCns=1 THEN
SELECT
  viw.id_material_bibliografico,
  viw.id_alumno,
  viw.alumno,
  viw.docente,
  viw.titulo,
  viw.introduccion,
  viw.objetivo,
  viw.resumen,
  viw.conclusion
FROM
  viw_material_bibliografico_interno_alumno viw
  WHERE viw.id_tipo_material_bibliografico=pIdTipoMaterial AND
  viw.id_alumno=pIdAlumno;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSListar_rol_componente_accion`(IN pIdCns TINYINT, IN pIdRol INT(11), IN pLimit TINYINT)
BEGIN
 IF pIdCns=1 THEN
SELECT 	`tbl_rol_componente_accion`.`id_rol_componente_accion`,
		`tbl_rol`.`id_rol`,
		`tbl_componente_accion`.`id_componente_accion`,
		`tbl_componente`.`componente`,
		`tbl_accion`.`accion` 
FROM tbl_rol_componente_accion

LEFT JOIN `sis_biblio`.`tbl_componente_accion` ON `tbl_rol_componente_accion`.`id_componente_accion` = `tbl_componente_accion`.`id_componente_accion` 
LEFT JOIN `sis_biblio`.`tbl_rol` ON `tbl_rol_componente_accion`.`id_rol` = `tbl_rol`.`id_rol` 
LEFT JOIN `sis_biblio`.`tbl_accion` ON `tbl_componente_accion`.`id_accion` = `tbl_accion`.`id_accion` 
LEFT JOIN `sis_biblio`.`tbl_componente` ON `tbl_componente_accion`.`id_componente` = `tbl_componente`.`id_componente` 
WHERE tbl_rol.id_rol = pIdRol;
  ELSE IF pIdCns=2 THEN
    set @Limit=pLimit;
    set @IdRol=pIdRol;
PREPARE STMT FROM 'SELECT 	`tbl_rol_componente_accion`.`id_rol_componente_accion`,
		`tbl_rol`.`id_rol`,
		`tbl_componente_accion`.`id_componente_accion`,
		`tbl_componente`.`componente`,
		`tbl_accion`.`accion` 
FROM tbl_rol_componente_accion

LEFT JOIN `sis_biblio`.`tbl_componente_accion` ON `tbl_rol_componente_accion`.`id_componente_accion` = `tbl_componente_accion`.`id_componente_accion` 
LEFT JOIN `sis_biblio`.`tbl_rol` ON `tbl_rol_componente_accion`.`id_rol` = `tbl_rol`.`id_rol` 
LEFT JOIN `sis_biblio`.`tbl_accion` ON `tbl_componente_accion`.`id_accion` = `tbl_accion`.`id_accion` 
LEFT JOIN `sis_biblio`.`tbl_componente` ON `tbl_componente_accion`.`id_componente` = `tbl_componente`.`id_componente` 
WHERE tbl_rol.id_rol=?
    ORDER BY tbl_rol_componente_accion.id_rol_componente_accion DESC LIMIT ?';
        EXECUTE STMT USING @IdRol,@Limit;
        END IF;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSListar_rol_usuario`(IN pIdCns TINYINT,IN pId_usuario BIGINT(20),IN pLimit TINYINT)
BEGIN
 IF pIdCns=1 THEN
SELECT
  tbl_usuario_rol.id_usuario_rol,
  tbl_usuario.id_usuario,
  tbl_rol.id_rol,
  tbl_rol.rol
FROM
  tbl_usuario_rol
  INNER JOIN tbl_rol
    ON tbl_usuario_rol.id_rol = tbl_rol.id_rol
  INNER JOIN tbl_usuario
    ON tbl_usuario_rol.id_usuario = tbl_usuario.id_usuario

   where tbl_usuario.id_usuario=pId_usuario;
  ELSE IF pIdCns=2 THEN
    set @Limit=pLimit;
    set @IdUsuario=pId_usuario;
PREPARE STMT FROM 'SELECT
  tbl_usuario_rol.id_usuario_rol,
  tbl_usuario.id_usuario,
  tbl_rol.id_rol,
  tbl_rol.rol
FROM
  tbl_usuario_rol
  INNER JOIN tbl_rol
    ON tbl_usuario_rol.id_rol = tbl_rol.id_rol
  INNER JOIN tbl_usuario
    ON tbl_usuario_rol.id_usuario = tbl_usuario.id_usuario

   where tbl_usuario.id_usuario=?
    ORDER BY tbl_usuario_rol.id_usuario_rol DESC LIMIT ?';
        EXECUTE STMT USING @IdUsuario,@Limit;
        END IF;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSMaterialBibliograficoXAsesor`(IN pIdDocente BIGINT)
BEGIN
SELECT
  viw.id_material_bibliografico,
  viw.titulo,
  viw.introduccion,
  viw.objetivo,
  viw.resumen,
  viw.conclusion
FROM
  viw_material_bibliografico_interno_alumno viw
  WHERE viw.id_docente=pIdDocente
GROUP BY viw.id_material_bibliografico;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSPlanTesis`(IN pIdCns TINYINT, IN pIdPlanTesis INT)
BEGIN
  -- El listado de las tesis que estan en proceso
  IF pIdCns=1 THEN
    SELECT
      tbl.id_plan_tesis as 'id_plan_tesis',
      viwd.id_docente as 'id_docente',
      viwa.id_alumno as 'id_alumno',
      viwa.id_facultad as 'id_facultad',
      viwa.alumno as 'tesista', 
      viwa.escuela_abreviatura AS 'abreaviatura_escuela',
      tbl.titulo as 'titulo',
      viwd.docente as 'asesor'
    FROM
      viw_alumno viwa
      INNER JOIN tbl_plan_tesis tbl
        ON viwa.id_alumno = tbl.id_alumno
      INNER JOIN viw_docente viwd
        ON viwd.id_docente = tbl.id_docente
    WHERE tbl.id_estado_plan_tesis=1
    ORDER BY tbl.id_plan_tesis desc;
    -- Busqueda de una tesis determinada
    ELSE IF pIdCns=2 THEN
      SELECT
        tbl.id_plan_tesis as 'id_plan_tesis',
        viwd.id_docente as 'id_docente',
        viwa.id_alumno as 'id_alumno',
        viwa.id_facultad as 'id_facultad',
        viwa.alumno as 'tesista', 
        viwa.escuela_abreviatura AS 'abreaviatura_escuela',
        tbl.titulo as 'titulo',
        viwd.docente as 'asesor',
        tbl.introduccion as 'introduccion',
        tbl.objetivo as 'objetivo',
        tbl.resumen as 'resumen',
        tbl.conclusion as 'conclusion'
      FROM
        viw_alumno viwa
        INNER JOIN tbl_plan_tesis tbl
          ON viwa.id_alumno = tbl.id_alumno
        INNER JOIN viw_docente viwd
          ON viwd.id_docente = tbl.id_docente
      WHERE tbl.id_estado_plan_tesis!=2
        and tbl.id_plan_tesis=pIdPlanTesis;
       END IF;
   END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSSujeto`()
BEGIN
SELECT
  viw.id_sujeto,
  viw.sujeto
FROM
  viw_sujeto viw;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRINSMaterialBibliografico`(IN pCodigoMaterialBibliografico VARCHAR(40), IN pTitulo VARCHAR(300), IN pIntroduccion TEXT, IN pObjetivo TEXT, IN pResumen TEXT, IN pConclusion TEXT, IN pAnio YEAR, IN pPortada VARCHAR(200), IN pNumeroPagina SMALLINT, IN pEditorial VARCHAR(100), IN pVolumen INT, IN pTomo VARCHAR(3), IN pContenido VARCHAR(100), IN pidTipoMaterialBibliografico TINYINT, IN pIdTematica INT, IN pActivo CHAR(1))
BEGIN
  INSERT INTO tbl_material_bibliografico (codigo_material_bibliografico,titulo,introduccion,objetivo,resumen,conclusion,anio,portada,numero_pagina,editorial,volumen,tomo,contenido,id_tipo_material_bibliografico,id_tematica,activo)
     VALUES (pCodigoMaterialBibliografico,pTitulo,pIntroduccion,pObjetivo,pResumen,pConclusion,pAnio,pPortada,pNumeroPagina,pEditorial,pVolumen,pTomo,pContenido,pidTipoMaterialBibliografico,pIdTematica,pActivo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRINSSolicitudConstancia`(IN pTitulo VARCHAR(300),IN pIntroduccion text,IN pObjetivo text,IN pResumen TEXT, IN pConclusion TEXT,IN pCorreo VARCHAR(50),IN pActivo CHAR(1),IN pIdSujeto BIGINT,IN pIdDocente BIGINT)
BEGIN
     SET @pidAlumno = (SELECT tbl.id_alumno FROM  tbl_alumno tbl  WHERE tbl.id_sujeto=pIdSujeto);
    INSERT INTO tbl_plan_tesis(titulo,introduccion,objetivo,resumen,conclusion,activo,correo,id_alumno,id_docente,id_estado_plan_tesis)
       VALUES (pTitulo,pIntroduccion,pObjetivo,pResumen,pConclusion,1,pCorreo,@pidAlumno,pIdDocente,1);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_accion`
--

CREATE TABLE IF NOT EXISTS `tbl_accion` (
  `id_accion` tinyint(4) NOT NULL AUTO_INCREMENT,
  `accion` varchar(10) NOT NULL,
  PRIMARY KEY (`id_accion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=3276 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tbl_accion`
--

INSERT INTO `tbl_accion` (`id_accion`, `accion`) VALUES
(1, 'Insertar'),
(3, 'Modifica'),
(4, 'Eliminar'),
(5, 'Consultar'),
(6, 'Buscar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_alumno`
--

CREATE TABLE IF NOT EXISTS `tbl_alumno` (
  `id_alumno` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero_carnet` varchar(20) DEFAULT NULL,
  `condicion_alumno` tinyint(4) NOT NULL,
  `id_sujeto` bigint(20) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `Reftbl_escuela10` (`id_escuela`),
  KEY `Reftbl_sujeto8` (`id_sujeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2730 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tbl_alumno`
--

INSERT INTO `tbl_alumno` (`id_alumno`, `numero_carnet`, `condicion_alumno`, `id_sujeto`, `id_escuela`) VALUES
(1, '0332101030', 1, 1, 1),
(2, '0332101028', 1, 2, 1),
(3, '0332101036', 1, 3, 1),
(4, '0332101029', 2, 4, 1),
(5, '0332090210', 2, 5, 1),
(6, '0332090211', 3, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_autor_externo`
--

CREATE TABLE IF NOT EXISTS `tbl_autor_externo` (
  `id_autor_externo` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `origen` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_autor_externo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_autor_externo_material_bibliografico`
--

CREATE TABLE IF NOT EXISTS `tbl_autor_externo_material_bibliografico` (
  `id_autor_externo_material_bibliografico` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_autor_externo` bigint(20) NOT NULL,
  `id_material_bibliografico` bigint(20) NOT NULL,
  PRIMARY KEY (`id_autor_externo_material_bibliografico`),
  KEY `Reftbl_autor_externo26` (`id_autor_externo`),
  KEY `Reftbl_material_biliografico27` (`id_material_bibliografico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_autor_interno`
--

CREATE TABLE IF NOT EXISTS `tbl_autor_interno` (
  `id_autor_interno` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tipo_autor_interno` bigint(20) NOT NULL,
  `id_alumno` bigint(20) NOT NULL,
  PRIMARY KEY (`id_autor_interno`),
  KEY `Reftbl_alumno12` (`id_alumno`),
  KEY `Reftbl_tipo_autor_interno3` (`id_tipo_autor_interno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tbl_autor_interno`
--

INSERT INTO `tbl_autor_interno` (`id_autor_interno`, `id_tipo_autor_interno`, `id_alumno`) VALUES
(1, 1, 5),
(2, 3, 6),
(3, 3, 2),
(4, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_autor_interno_material_bibliografico`
--

CREATE TABLE IF NOT EXISTS `tbl_autor_interno_material_bibliografico` (
  `id_autor_interno_material_bibliografico` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_autor_interno` bigint(20) NOT NULL,
  `id_material_bibliografico` bigint(20) NOT NULL,
  `id_docente` bigint(20) NOT NULL,
  PRIMARY KEY (`id_autor_interno_material_bibliografico`),
  KEY `FK_tbl_autor_interno_material_bibliografico_tbl_docente` (`id_docente`),
  KEY `Reftbl_autor_interno5` (`id_autor_interno`),
  KEY `Reftbl_material_biliografico6` (`id_material_bibliografico`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tbl_autor_interno_material_bibliografico`
--

INSERT INTO `tbl_autor_interno_material_bibliografico` (`id_autor_interno_material_bibliografico`, `id_autor_interno`, `id_material_bibliografico`, `id_docente`) VALUES
(1, 1, 1, 3),
(2, 2, 1, 3),
(3, 3, 4, 3),
(4, 4, 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_componente`
--

CREATE TABLE IF NOT EXISTS `tbl_componente` (
  `id_componente` int(11) NOT NULL AUTO_INCREMENT,
  `componente` varchar(100) NOT NULL,
  `descripcion_componente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_componente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2048 AUTO_INCREMENT=93 ;

--
-- Volcado de datos para la tabla `tbl_componente`
--

INSERT INTO `tbl_componente` (`id_componente`, `componente`, `descripcion_componente`) VALUES
(77, 'Módulo de Acción', ''),
(84, 'Módulo de Componente', ''),
(86, 'Módulo de Rol', ''),
(87, 'Módulo de Usuario', ''),
(89, 'Módulo Solicitar Constancia', ''),
(90, 'Módulo Comparación de Tesis', ''),
(91, 'Módulo de Asignación de Roles', ''),
(92, 'Módulo de Asignación', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_componente_accion`
--

CREATE TABLE IF NOT EXISTS `tbl_componente_accion` (
  `id_componente_accion` int(11) NOT NULL AUTO_INCREMENT,
  `id_accion` tinyint(4) NOT NULL,
  `id_componente` int(11) NOT NULL,
  PRIMARY KEY (`id_componente_accion`),
  KEY `Reftbl_accion29` (`id_accion`),
  KEY `Reftbl_componente30` (`id_componente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=3276 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tbl_componente_accion`
--

INSERT INTO `tbl_componente_accion` (`id_componente_accion`, `id_accion`, `id_componente`) VALUES
(1, 1, 77),
(2, 3, 77),
(3, 4, 77),
(4, 1, 84),
(5, 5, 84);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_docente`
--

CREATE TABLE IF NOT EXISTS `tbl_docente` (
  `id_docente` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo_docente` int(11) NOT NULL,
  `codigo_personal` char(6) DEFAULT NULL,
  `condicion` char(1) NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `id_sujeto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_docente`),
  KEY `Reftbl_sujeto9` (`id_sujeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=5461 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tbl_docente`
--

INSERT INTO `tbl_docente` (`id_docente`, `codigo_docente`, `codigo_personal`, `condicion`, `observacion`, `id_sujeto`) VALUES
(1, 1234, '1234', '1', NULL, 1),
(3, 6654, NULL, '2', NULL, 2),
(4, 2312, NULL, '1', NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_escuela`
--

CREATE TABLE IF NOT EXISTS `tbl_escuela` (
  `id_escuela` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escuela` char(4) NOT NULL,
  `escuela` varchar(200) NOT NULL,
  `escuela_abreviatura` varchar(20) DEFAULT NULL,
  `estado` char(1) NOT NULL,
  `id_facultad` int(11) NOT NULL,
  PRIMARY KEY (`id_escuela`),
  KEY `Reftbl_facultad7` (`id_facultad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=3276 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tbl_escuela`
--

INSERT INTO `tbl_escuela` (`id_escuela`, `codigo_escuela`, `escuela`, `escuela_abreviatura`, `estado`, `id_facultad`) VALUES
(1, '01', 'INGENIERIA DE SISTEMAS', 'EAPIS', '1', 1),
(2, '02', 'INGENIERIA INFORMATICA', 'EAPII', '0', 1),
(3, '03', 'INGENIERIA INDUSTRIAL', 'EAPII', '1', 1),
(4, '04', 'MEDICINA', 'EAPM', '1', 1),
(5, '05', 'ENFERMERIA', 'EAPE', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estado_plan_tesis`
--

CREATE TABLE IF NOT EXISTS `tbl_estado_plan_tesis` (
  `id_estado_plan_tesis` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(30) NOT NULL,
  `color` varchar(25) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`id_estado_plan_tesis`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=5461 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tbl_estado_plan_tesis`
--

INSERT INTO `tbl_estado_plan_tesis` (`id_estado_plan_tesis`, `estado`, `color`, `active`) VALUES
(1, 'Proceso', 'amarillo', '1'),
(2, 'Rechazado', 'rojo', '1'),
(3, 'Aprobado', 'verde', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_facultad`
--

CREATE TABLE IF NOT EXISTS `tbl_facultad` (
  `id_facultad` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_facultad` char(2) NOT NULL,
  `facultad` varchar(200) NOT NULL,
  `abreviatura_facultad` varchar(255) DEFAULT NULL,
  `activo` char(1) NOT NULL,
  PRIMARY KEY (`id_facultad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tbl_facultad`
--

INSERT INTO `tbl_facultad` (`id_facultad`, `codigo_facultad`, `facultad`, `abreviatura_facultad`, `activo`) VALUES
(1, '01', 'INGENIERIA', 'FI', '1'),
(2, '02', 'MEDICINA', 'FM', '1'),
(3, '03', 'EDUCACION', 'FE', '1'),
(4, '04', 'CONTABILIDAD', 'FC', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_material_bibliografico`
--

CREATE TABLE IF NOT EXISTS `tbl_material_bibliografico` (
  `id_material_bibliografico` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo_material_bibliografico` varchar(40) DEFAULT NULL,
  `titulo` varchar(300) NOT NULL,
  `introduccion` text,
  `objetivo` text,
  `resumen` text,
  `conclusion` text,
  `anio` year(4) NOT NULL,
  `portada` varchar(200) DEFAULT NULL,
  `numero_pagina` smallint(6) DEFAULT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `volumen` int(11) DEFAULT NULL,
  `tomo` varchar(3) DEFAULT NULL,
  `contenido` varchar(100) DEFAULT NULL,
  `id_tipo_material_bibliografico` tinyint(4) NOT NULL,
  `id_tematica` int(11) NOT NULL,
  `activo` char(1) NOT NULL,
  PRIMARY KEY (`id_material_bibliografico`),
  KEY `Reftbl_tematica15` (`id_tematica`),
  KEY `Reftbl_tipo_material_bibliografico4` (`id_tipo_material_bibliografico`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tbl_material_bibliografico`
--

INSERT INTO `tbl_material_bibliografico` (`id_material_bibliografico`, `codigo_material_bibliografico`, `titulo`, `introduccion`, `objetivo`, `resumen`, `conclusion`, `anio`, `portada`, `numero_pagina`, `editorial`, `volumen`, `tomo`, `contenido`, `id_tipo_material_bibliografico`, `id_tematica`, `activo`) VALUES
(1, '0987', 'TESIS1', 'INTRODUCCION1', 'OBJETIVO2', 'RESUMEN3', 'CONCLUSION4', 2013, NULL, 100, NULL, NULL, NULL, NULL, 1, 2, '1'),
(3, '1234', 'TESSI2', 'INTRO', 'OBJ', 'RESUM', 'CONL', 2012, NULL, 12, NULL, NULL, NULL, NULL, 1, 2, '1'),
(4, '2344', 'INFORM', 'DE PRACTICA', 'PRIMERA ', 'QUE SE', 'PONE', 2012, NULL, 200, NULL, NULL, NULL, NULL, 3, 2, '1'),
(5, '4567', 'TESIS3', 'INTOTESIS', 'OBJTESIS', 'RESUMTESIS', 'CONCLUSTESIS', 2000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_material_bibliografico_docente`
--

CREATE TABLE IF NOT EXISTS `tbl_material_bibliografico_docente` (
  `id_material_bibliografico_docente` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_material_bibliografico` bigint(20) NOT NULL,
  `id_docente` bigint(20) NOT NULL,
  PRIMARY KEY (`id_material_bibliografico_docente`),
  KEY `FK_docente_material_bibliografico` (`id_docente`),
  KEY `FK_material_bibliografico_docente` (`id_material_bibliografico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_plan_tesis`
--

CREATE TABLE IF NOT EXISTS `tbl_plan_tesis` (
  `id_plan_tesis` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(300) NOT NULL,
  `introduccion` text,
  `objetivo` text NOT NULL,
  `resumen` text,
  `conclusion` text,
  `activo` char(1) NOT NULL,
  `observacion` text,
  `correo` varchar(50) DEFAULT NULL,
  `id_alumno` bigint(20) NOT NULL,
  `id_docente` bigint(20) NOT NULL,
  `id_estado_plan_tesis` int(11) NOT NULL,
  PRIMARY KEY (`id_plan_tesis`),
  KEY `Reftbl_alumno23` (`id_alumno`),
  KEY `Reftbl_docente24` (`id_docente`),
  KEY `Reftbl_estado_plan_tesis32` (`id_estado_plan_tesis`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1489 AUTO_INCREMENT=35 ;

--
-- Volcado de datos para la tabla `tbl_plan_tesis`
--

INSERT INTO `tbl_plan_tesis` (`id_plan_tesis`, `titulo`, `introduccion`, `objetivo`, `resumen`, `conclusion`, `activo`, `observacion`, `correo`, `id_alumno`, `id_docente`, `id_estado_plan_tesis`) VALUES
(2, 'MONOGRAFIA1', 'INTRO1', 'OBJETIVO1', 'RESUMEN1', 'CONCLUSION1', '1', NULL, '0332101028@injfsc.edu.pe', 1, 1, 2),
(3, 'MONOGRAFIA2', 'INTRO2', 'OBJETIVO2', 'RESUMEN2', 'CONCLUSION2', '1', NULL, '0332101029@injfsc.edu.pe', 2, 3, 2),
(4, 'MONOGRAFIA3', 'INTRO3', 'OBJETIVO3', 'RESUMEN3', 'CONCLUSION3', '1', NULL, '0332101030@injfsc.edu.pe', 3, 3, 2),
(5, 'MONOGRAFIA4', 'INTRO4', 'OBJETIVO4', 'RESUMEN4', 'CONCLUSION4', '1', NULL, '0332101031@injfsc.edu.pe', 4, 3, 2),
(28, 'MONOGRAFIA5', 'INTRO5', 'OBJETIVO5', 'RESUMEN5', 'CONCLUSION5', '1', NULL, '0332101032@injfsc.edu.pe', 1, 4, 1),
(29, 'MONOGRAFIA6', 'INTRO6', 'OBJETIVO6', 'RESUMEN6', 'CONCLUSION6', '1', NULL, '0332101034@injfsc.edu.pe', 3, 4, 1),
(30, 'MONOGRAFIA7', 'INTRO7', 'OBJETIVO7', 'RESUMEN7', 'CONCLUSION7', '1', NULL, '0332101033@injfsc.edu.pe', 2, 3, 2),
(31, 'MONOGRAFIA8', 'INTRO8', 'OBJETIVO8', 'RESUMEN8', 'CONCLUSION8', '1', NULL, '0332101035@injfsc.edu.pe', 4, 3, 2),
(32, 'MONOGRAFIA9', 'INTRO9', 'OBJETIVO9', 'RESUMEN9', 'CONCLUSION9', '1', NULL, '0332101036@injfsc.edu.pe', 4, 3, 1),
(33, 'TÉSIS NUMERO 100', 'INTRODUCCIÓN 100', 'OBJETIVO 100', 'RESUMEN 100', 'CONCLUSIÓN 100', '1', NULL, '0332101040@unjfsc.edu.pe', 1, 3, 1),
(34, 'TÉSIS200', 'INTRO200', 'OBJETIVO200', 'RESUMEN200', 'CONCLUSION200', '1', NULL, 'cesar@hotmail.com', 1, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol`
--

CREATE TABLE IF NOT EXISTS `tbl_rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=3276 AUTO_INCREMENT=68 ;

--
-- Volcado de datos para la tabla `tbl_rol`
--

INSERT INTO `tbl_rol` (`id_rol`, `rol`, `descripcion`) VALUES
(63, 'Administrador', ''),
(64, 'Tester', ''),
(65, 'Jefe de Biblioteca Central', ''),
(66, 'Asistenta de Biblioteca', ''),
(67, 'Visitante', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol_componente_accion`
--

CREATE TABLE IF NOT EXISTS `tbl_rol_componente_accion` (
  `id_rol_componente_accion` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_componente_accion` int(11) NOT NULL,
  PRIMARY KEY (`id_rol_componente_accion`),
  KEY `Reftbl_componente_accion31` (`id_componente_accion`),
  KEY `Reftbl_rol22` (`id_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tbl_rol_componente_accion`
--

INSERT INTO `tbl_rol_componente_accion` (`id_rol_componente_accion`, `id_rol`, `id_componente_accion`) VALUES
(9, 63, 1),
(10, 63, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sujeto`
--

CREATE TABLE IF NOT EXISTS `tbl_sujeto` (
  `id_sujeto` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_registro` date NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `estado_civil` char(1) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `telefono_fijo` varchar(15) DEFAULT NULL,
  `telefono_movil` varchar(15) DEFAULT NULL,
  `email_institucional` varchar(50) DEFAULT NULL,
  `email_personal` varchar(50) DEFAULT NULL,
  `activo` char(1) NOT NULL,
  PRIMARY KEY (`id_sujeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2730 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tbl_sujeto`
--

INSERT INTO `tbl_sujeto` (`id_sujeto`, `fecha_registro`, `apellido_paterno`, `apellido_materno`, `primer_nombre`, `segundo_nombre`, `fecha_nacimiento`, `dni`, `direccion`, `estado_civil`, `sexo`, `telefono_fijo`, `telefono_movil`, `email_institucional`, `email_personal`, `activo`) VALUES
(1, '2013-06-24', 'Morales', 'Flores', 'Victor', 'Angel', '1994-06-28', '76771971', 'Calle Bellavista', 'S', 'M', '1234567', '123456', '', NULL, '1'),
(2, '2013-06-10', 'Nicho', 'Diaz', 'Cesar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(3, '2013-06-12', 'Valladares', 'Loza', 'Deyvis', 'J', '2013-06-12', '12345678', 'al lado', 'S', 'M', '23', NULL, NULL, NULL, '1'),
(4, '2013-06-21', 'Gonzales', 'Angulo', 'Karina', NULL, NULL, NULL, NULL, 'S', 'F', NULL, NULL, NULL, NULL, '1'),
(5, '2013-06-04', 'Grados', 'Manrique', 'Kelly', NULL, NULL, NULL, NULL, 'S', 'F', NULL, NULL, NULL, NULL, '1'),
(6, '2013-06-12', 'Vicente', 'Rojas', 'Diego', NULL, NULL, NULL, NULL, 'S', 'M', NULL, NULL, NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tematica`
--

CREATE TABLE IF NOT EXISTS `tbl_tematica` (
  `id_tematica` int(11) NOT NULL AUTO_INCREMENT,
  `tematica` varchar(100) NOT NULL,
  `descripcion_tematica` varchar(100) DEFAULT NULL,
  `estado_tematica` char(1) NOT NULL,
  PRIMARY KEY (`id_tematica`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2730 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tbl_tematica`
--

INSERT INTO `tbl_tematica` (`id_tematica`, `tematica`, `descripcion_tematica`, `estado_tematica`) VALUES
(1, 'Ciencias', NULL, '1'),
(2, 'Ingeniería', NULL, '1'),
(3, 'Medicina', NULL, '1'),
(4, 'Contabilidad', NULL, '1'),
(5, 'Matemática', NULL, '1'),
(6, 'Física', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_autor_interno`
--

CREATE TABLE IF NOT EXISTS `tbl_tipo_autor_interno` (
  `id_tipo_autor_interno` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_autor_interno` varchar(25) NOT NULL,
  `descripcion_tipo_autor_interno` varchar(250) DEFAULT NULL,
  `estado_tipo_autor_interno` char(1) NOT NULL,
  PRIMARY KEY (`id_tipo_autor_interno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=3276 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tbl_tipo_autor_interno`
--

INSERT INTO `tbl_tipo_autor_interno` (`id_tipo_autor_interno`, `tipo_autor_interno`, `descripcion_tipo_autor_interno`, `estado_tipo_autor_interno`) VALUES
(1, 'Alumno', NULL, '1'),
(2, 'Egresado', NULL, '0'),
(3, 'Bachiller', NULL, '1'),
(4, 'Tesista', NULL, '1'),
(5, 'Titulado', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_material_bibliografico`
--

CREATE TABLE IF NOT EXISTS `tbl_tipo_material_bibliografico` (
  `id_tipo_material_bibliografico` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipo_material_bibliografico` varchar(100) NOT NULL,
  `descripcion_tipo_material_bibliografico` varchar(250) DEFAULT NULL,
  `estado_tipo_material_bibliografico` char(1) NOT NULL,
  PRIMARY KEY (`id_tipo_material_bibliografico`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=5461 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tbl_tipo_material_bibliografico`
--

INSERT INTO `tbl_tipo_material_bibliografico` (`id_tipo_material_bibliografico`, `tipo_material_bibliografico`, `descripcion_tipo_material_bibliografico`, `estado_tipo_material_bibliografico`) VALUES
(1, 'Tesis', NULL, '1'),
(2, 'Monografía', NULL, '1'),
(3, 'Informe de Práctica', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `id_sujeto` bigint(20) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `Reftbl_sujeto18` (`id_sujeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=5461 AUTO_INCREMENT=69 ;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `usuario`, `contrasenia`, `id_sujeto`, `active`) VALUES
(24, 'admin', '123', 1, '1'),
(67, 'cesarcnd', 'cesarnicho', 2, '1'),
(68, 'user', 'user', 3, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario_rol`
--

CREATE TABLE IF NOT EXISTS `tbl_usuario_rol` (
  `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_usuario_rol`),
  KEY `Reftbl_rol16` (`id_rol`),
  KEY `Reftbl_usuario17` (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=3276 AUTO_INCREMENT=117 ;

--
-- Volcado de datos para la tabla `tbl_usuario_rol`
--

INSERT INTO `tbl_usuario_rol` (`id_usuario_rol`, `id_rol`, `id_usuario`) VALUES
(39, 63, 24),
(111, 66, 24),
(112, 67, 24),
(115, 64, 24),
(116, 63, 67);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viw_alumno`
--
CREATE TABLE IF NOT EXISTS `viw_alumno` (
`id_sujeto` bigint(20)
,`id_alumno` bigint(20)
,`id_facultad` int(11)
,`id_escuela` int(11)
,`alumno` varchar(204)
,`numero_carnet` varchar(20)
,`facultad` varchar(200)
,`abreviatura_facultad` varchar(255)
,`escuela` varchar(200)
,`escuela_abreviatura` varchar(20)
,`email_institucional` varchar(50)
,`email_personal` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viw_docente`
--
CREATE TABLE IF NOT EXISTS `viw_docente` (
`id_docente` bigint(20)
,`codigo_docente` int(11)
,`codigo_personal` char(6)
,`id_sujeto` bigint(20)
,`fecha_registro` date
,`docente` varchar(204)
,`fecha_nacimiento` date
,`dni` varchar(15)
,`direccion` varchar(250)
,`estado_civil` char(1)
,`sexo` char(1)
,`telefono_fijo` varchar(15)
,`telefono_movil` varchar(15)
,`email_institucional` varchar(50)
,`email_personal` varchar(50)
,`activo` char(1)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viw_material_bibliografico_interno_alumno`
--
CREATE TABLE IF NOT EXISTS `viw_material_bibliografico_interno_alumno` (
`id_material_bibliografico` bigint(20)
,`id_docente` bigint(20)
,`id_alumno` bigint(20)
,`id_autor_interno` bigint(20)
,`id_tipo_autor_interno` bigint(20)
,`alumno` varchar(204)
,`docente` varchar(204)
,`id_facultad` int(11)
,`id_escuela` int(11)
,`facultad` varchar(200)
,`abreviatura_facultad` varchar(255)
,`escuela` varchar(200)
,`escuela_abreviatura` varchar(20)
,`titulo` varchar(300)
,`introduccion` text
,`objetivo` text
,`resumen` text
,`conclusion` text
,`anio` year(4)
,`id_tematica` int(11)
,`id_tipo_material_bibliografico` tinyint(4)
,`activo` char(1)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viw_sujeto`
--
CREATE TABLE IF NOT EXISTS `viw_sujeto` (
`id_sujeto` bigint(20)
,`sujeto` varchar(204)
,`dni` varchar(15)
,`direccion` varchar(250)
,`email_institucional` varchar(50)
,`email_personal` varchar(50)
,`activo` char(1)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viw_usuario`
--
CREATE TABLE IF NOT EXISTS `viw_usuario` (
`id_usuario` bigint(20)
,`id_sujeto` bigint(20)
,`sujeto` varchar(204)
,`usuario` varchar(50)
,`contrasenia` varchar(100)
,`active` char(1)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `viw_alumno`
--
DROP TABLE IF EXISTS `viw_alumno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_alumno` AS select `viw`.`id_sujeto` AS `id_sujeto`,`tbla`.`id_alumno` AS `id_alumno`,`tblf`.`id_facultad` AS `id_facultad`,`tble`.`id_escuela` AS `id_escuela`,`viw`.`sujeto` AS `alumno`,`tbla`.`numero_carnet` AS `numero_carnet`,`tblf`.`facultad` AS `facultad`,`tblf`.`abreviatura_facultad` AS `abreviatura_facultad`,`tble`.`escuela` AS `escuela`,`tble`.`escuela_abreviatura` AS `escuela_abreviatura`,`viw`.`email_institucional` AS `email_institucional`,`viw`.`email_personal` AS `email_personal` from (((`tbl_escuela` `tble` join `tbl_facultad` `tblf` on((`tble`.`id_facultad` = `tblf`.`id_facultad`))) join `tbl_alumno` `tbla` on((`tbla`.`id_escuela` = `tble`.`id_escuela`))) join `viw_sujeto` `viw` on((`tbla`.`id_sujeto` = `viw`.`id_sujeto`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `viw_docente`
--
DROP TABLE IF EXISTS `viw_docente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_docente` AS select `tbl_d`.`id_docente` AS `id_docente`,`tbl_d`.`codigo_docente` AS `codigo_docente`,`tbl_d`.`codigo_personal` AS `codigo_personal`,`tbl_s`.`id_sujeto` AS `id_sujeto`,`tbl_s`.`fecha_registro` AS `fecha_registro`,concat(ifnull(`tbl_s`.`apellido_paterno`,''),' ',ifnull(`tbl_s`.`apellido_materno`,''),', ',ifnull(`tbl_s`.`primer_nombre`,''),' ',ifnull(`tbl_s`.`segundo_nombre`,'')) AS `docente`,`tbl_s`.`fecha_nacimiento` AS `fecha_nacimiento`,`tbl_s`.`dni` AS `dni`,`tbl_s`.`direccion` AS `direccion`,`tbl_s`.`estado_civil` AS `estado_civil`,`tbl_s`.`sexo` AS `sexo`,`tbl_s`.`telefono_fijo` AS `telefono_fijo`,`tbl_s`.`telefono_movil` AS `telefono_movil`,`tbl_s`.`email_institucional` AS `email_institucional`,`tbl_s`.`email_personal` AS `email_personal`,`tbl_s`.`activo` AS `activo` from (`tbl_docente` `tbl_d` join `tbl_sujeto` `tbl_s` on((`tbl_d`.`id_sujeto` = `tbl_s`.`id_sujeto`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `viw_material_bibliografico_interno_alumno`
--
DROP TABLE IF EXISTS `viw_material_bibliografico_interno_alumno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_material_bibliografico_interno_alumno` AS select `tbl1`.`id_material_bibliografico` AS `id_material_bibliografico`,`viw2`.`id_docente` AS `id_docente`,`viw1`.`id_alumno` AS `id_alumno`,`tbl2`.`id_autor_interno` AS `id_autor_interno`,`tbl2`.`id_tipo_autor_interno` AS `id_tipo_autor_interno`,`viw1`.`alumno` AS `alumno`,`viw2`.`docente` AS `docente`,`viw1`.`id_facultad` AS `id_facultad`,`viw1`.`id_escuela` AS `id_escuela`,`viw1`.`facultad` AS `facultad`,`viw1`.`abreviatura_facultad` AS `abreviatura_facultad`,`viw1`.`escuela` AS `escuela`,`viw1`.`escuela_abreviatura` AS `escuela_abreviatura`,`tbl3`.`titulo` AS `titulo`,`tbl3`.`introduccion` AS `introduccion`,`tbl3`.`objetivo` AS `objetivo`,`tbl3`.`resumen` AS `resumen`,`tbl3`.`conclusion` AS `conclusion`,`tbl3`.`anio` AS `anio`,`tbl3`.`id_tematica` AS `id_tematica`,`tbl3`.`id_tipo_material_bibliografico` AS `id_tipo_material_bibliografico`,`tbl3`.`activo` AS `activo` from ((((`tbl_autor_interno_material_bibliografico` `tbl1` join `tbl_autor_interno` `tbl2` on((`tbl1`.`id_autor_interno` = `tbl2`.`id_autor_interno`))) join `tbl_material_bibliografico` `tbl3` on((`tbl1`.`id_material_bibliografico` = `tbl3`.`id_material_bibliografico`))) join `viw_alumno` `viw1` on((`viw1`.`id_alumno` = `tbl2`.`id_alumno`))) join `viw_docente` `viw2` on((`viw2`.`id_docente` = `tbl1`.`id_docente`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `viw_sujeto`
--
DROP TABLE IF EXISTS `viw_sujeto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_sujeto` AS select `tbl`.`id_sujeto` AS `id_sujeto`,concat(ifnull(`tbl`.`apellido_paterno`,''),' ',ifnull(`tbl`.`apellido_materno`,''),', ',ifnull(`tbl`.`primer_nombre`,''),' ',ifnull(`tbl`.`segundo_nombre`,'')) AS `sujeto`,`tbl`.`dni` AS `dni`,`tbl`.`direccion` AS `direccion`,`tbl`.`email_institucional` AS `email_institucional`,`tbl`.`email_personal` AS `email_personal`,`tbl`.`activo` AS `activo` from `tbl_sujeto` `tbl` where (`tbl`.`activo` = 1);

-- --------------------------------------------------------

--
-- Estructura para la vista `viw_usuario`
--
DROP TABLE IF EXISTS `viw_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_usuario` AS select `tbl_usuario`.`id_usuario` AS `id_usuario`,`tbl_usuario`.`id_sujeto` AS `id_sujeto`,`viw_sujeto`.`sujeto` AS `sujeto`,`tbl_usuario`.`usuario` AS `usuario`,`tbl_usuario`.`contrasenia` AS `contrasenia`,`tbl_usuario`.`active` AS `active` from (`viw_sujeto` join `tbl_usuario` on((`viw_sujeto`.`id_sujeto` = `tbl_usuario`.`id_sujeto`)));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_alumno`
--
ALTER TABLE `tbl_alumno`
  ADD CONSTRAINT `Reftbl_escuela10` FOREIGN KEY (`id_escuela`) REFERENCES `tbl_escuela` (`id_escuela`),
  ADD CONSTRAINT `Reftbl_sujeto8` FOREIGN KEY (`id_sujeto`) REFERENCES `tbl_sujeto` (`id_sujeto`);

--
-- Filtros para la tabla `tbl_autor_externo_material_bibliografico`
--
ALTER TABLE `tbl_autor_externo_material_bibliografico`
  ADD CONSTRAINT `Reftbl_autor_externo26` FOREIGN KEY (`id_autor_externo`) REFERENCES `tbl_autor_externo` (`id_autor_externo`),
  ADD CONSTRAINT `Reftbl_material_biliografico27` FOREIGN KEY (`id_material_bibliografico`) REFERENCES `tbl_material_bibliografico` (`id_material_bibliografico`);

--
-- Filtros para la tabla `tbl_autor_interno`
--
ALTER TABLE `tbl_autor_interno`
  ADD CONSTRAINT `Reftbl_alumno12` FOREIGN KEY (`id_alumno`) REFERENCES `tbl_alumno` (`id_alumno`),
  ADD CONSTRAINT `Reftbl_tipo_autor_interno3` FOREIGN KEY (`id_tipo_autor_interno`) REFERENCES `tbl_tipo_autor_interno` (`id_tipo_autor_interno`);

--
-- Filtros para la tabla `tbl_autor_interno_material_bibliografico`
--
ALTER TABLE `tbl_autor_interno_material_bibliografico`
  ADD CONSTRAINT `FK_tbl_autor_interno_material_bibliografico_tbl_docente` FOREIGN KEY (`id_docente`) REFERENCES `tbl_docente` (`id_docente`),
  ADD CONSTRAINT `Reftbl_autor_interno5` FOREIGN KEY (`id_autor_interno`) REFERENCES `tbl_autor_interno` (`id_autor_interno`),
  ADD CONSTRAINT `Reftbl_material_biliografico6` FOREIGN KEY (`id_material_bibliografico`) REFERENCES `tbl_material_bibliografico` (`id_material_bibliografico`);

--
-- Filtros para la tabla `tbl_componente_accion`
--
ALTER TABLE `tbl_componente_accion`
  ADD CONSTRAINT `Reftbl_accion29` FOREIGN KEY (`id_accion`) REFERENCES `tbl_accion` (`id_accion`),
  ADD CONSTRAINT `Reftbl_componente30` FOREIGN KEY (`id_componente`) REFERENCES `tbl_componente` (`id_componente`);

--
-- Filtros para la tabla `tbl_docente`
--
ALTER TABLE `tbl_docente`
  ADD CONSTRAINT `Reftbl_sujeto9` FOREIGN KEY (`id_sujeto`) REFERENCES `tbl_sujeto` (`id_sujeto`);

--
-- Filtros para la tabla `tbl_escuela`
--
ALTER TABLE `tbl_escuela`
  ADD CONSTRAINT `Reftbl_facultad7` FOREIGN KEY (`id_facultad`) REFERENCES `tbl_facultad` (`id_facultad`);

--
-- Filtros para la tabla `tbl_material_bibliografico`
--
ALTER TABLE `tbl_material_bibliografico`
  ADD CONSTRAINT `Reftbl_tematica15` FOREIGN KEY (`id_tematica`) REFERENCES `tbl_tematica` (`id_tematica`),
  ADD CONSTRAINT `Reftbl_tipo_material_bibliografico4` FOREIGN KEY (`id_tipo_material_bibliografico`) REFERENCES `tbl_tipo_material_bibliografico` (`id_tipo_material_bibliografico`);

--
-- Filtros para la tabla `tbl_material_bibliografico_docente`
--
ALTER TABLE `tbl_material_bibliografico_docente`
  ADD CONSTRAINT `FK_docente_material_bibliografico` FOREIGN KEY (`id_docente`) REFERENCES `tbl_docente` (`id_docente`),
  ADD CONSTRAINT `FK_material_bibliografico_docente` FOREIGN KEY (`id_material_bibliografico`) REFERENCES `tbl_material_bibliografico` (`id_material_bibliografico`);

--
-- Filtros para la tabla `tbl_plan_tesis`
--
ALTER TABLE `tbl_plan_tesis`
  ADD CONSTRAINT `Reftbl_alumno23` FOREIGN KEY (`id_alumno`) REFERENCES `tbl_alumno` (`id_alumno`),
  ADD CONSTRAINT `Reftbl_docente24` FOREIGN KEY (`id_docente`) REFERENCES `tbl_docente` (`id_docente`),
  ADD CONSTRAINT `Reftbl_estado_plan_tesis32` FOREIGN KEY (`id_estado_plan_tesis`) REFERENCES `tbl_estado_plan_tesis` (`id_estado_plan_tesis`);

--
-- Filtros para la tabla `tbl_rol_componente_accion`
--
ALTER TABLE `tbl_rol_componente_accion`
  ADD CONSTRAINT `Reftbl_componente_accion31` FOREIGN KEY (`id_componente_accion`) REFERENCES `tbl_componente_accion` (`id_componente_accion`),
  ADD CONSTRAINT `Reftbl_rol22` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id_rol`);

--
-- Filtros para la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `Reftbl_sujeto18` FOREIGN KEY (`id_sujeto`) REFERENCES `tbl_sujeto` (`id_sujeto`);

--
-- Filtros para la tabla `tbl_usuario_rol`
--
ALTER TABLE `tbl_usuario_rol`
  ADD CONSTRAINT `Reftbl_rol16` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id_rol`),
  ADD CONSTRAINT `Reftbl_usuario17` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
