-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 01-10-2013 a las 22:47:55
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

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
DROP PROCEDURE IF EXISTS `SPRABMAccion`$$
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

DROP PROCEDURE IF EXISTS `SPRABMAutorInterno`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMAutorInterno`(IN pIdAbm TINYINT, IN pIdTipoAutorInterno BIGINT, IN pIdAlumno BIGINT,IN pIdAutorInterno BIGINT)
BEGIN
IF pIdAbm=1 THEN
    INSERT INTO tbl_autor_interno(id_tipo_autor_interno,id_alumno) VALUES (pIdTipoAutorInterno,pIdAlumno);
    ELSE IF pIdAbm = 2 THEN
          UPDATE tbl_autor_interno SET
            id_tipo_autor_interno = pIdTipoAutorInterno
            WHERE id_autor_interno = pIdAutorInterno;
        ELSE IF pIdAbm = 3 THEN 
        DELETE FROM tbl_autor_interno WHERE id_autor_interno=pIdAutorInterno;
       END IF;
    END IF;
  END IF;
END$$

DROP PROCEDURE IF EXISTS `SPRABMComponente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMComponente`(IN pIdAbm TINYINT, IN pId_componente INT (11), IN pComponente VARCHAR(100), IN pDescripcion_componente VARCHAR(100), IN pId_Oficina INT(11))
BEGIN
IF pIdAbm = 0
      THEN 
        SELECT
          tbl_componente.id_componente,
          tbl_componente.componente,
          tbl_componente.descripcion_componente,
          tbl_componente.id_oficina,
          tbl_oficina.oficina
        FROM
          sis_biblio.tbl_componente
        INNER JOIN sis_biblio.tbl_oficina
        ON tbl_componente.id_oficina = tbl_oficina.id_oficina;
ELSE
       IF pIdAbm = 1
      THEN
      INSERT INTO tbl_componente(componente,descripcion_componente,id_oficina) VALUES (pComponente,pDescripcion_componente,pId_Oficina);
      ELSE 
 IF pIdAbm=2
      THEN
      UPDATE tbl_componente set componente=pComponente, descripcion_componente=pDescripcion_componente, id_oficina=pId_oficina WHERE id_componente=pId_componente;
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

DROP PROCEDURE IF EXISTS `SPRABMComponenteAccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMComponenteAccion`(IN pIdAbm TINYINT, IN pIdComponenteAccion INT, IN pIdComponente INT, IN pIdAccion TINYINT)
BEGIN
IF pIdAbm=1 THEN
    INSERT INTO tbl_componente_accion (id_componente,id_accion) values (pIdComponente,pIdAccion);
  END IF;
END$$

DROP PROCEDURE IF EXISTS `SPRABMOficina`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMOficina`(IN `pIdAbm` TINYINT,IN pId_oficina INT, IN `pOficina` VARCHAR(100), IN `pDescripcion_oficina` VARCHAR(100), IN `pActivo` CHAR(1))
BEGIN
  IF pIdAbm = 1
        THEN
        INSERT INTO tbl_oficina(oficina,descripcion_oficina,activo) VALUES (pOficina,pDescripcion_oficina,pActivo);
        ELSE 
   IF pIdAbm = 2
        THEN
        UPDATE tbl_oficina set oficina=pOficina WHERE id_oficina=pId_oficina;
        COMMIT;
        ELSE 
   IF pIdAbm = 3
        THEN
        DELETE FROM tbl_oficina WHERE id_oficina=pId_oficina;
        COMMIT;
    END IF;
    END IF;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `SPRABMRol`$$
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

DROP PROCEDURE IF EXISTS `SPRABMRolComponenteAccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRABMRolComponenteAccion`(IN pIdAbm TINYINT, IN pIdRolComponenteAccion INT, IN pIdRol BIGINT, IN pIdComponenteAccion INT)
BEGIN
 IF pIdAbm=0 THEN
	
	SELECT `tbl_componente_accion`.`id_componente_accion`,`tbl_accion`.`accion`,`tbl_componente`.`componente` FROM tbl_componente_accion
	LEFT JOIN `tbl_accion` ON `tbl_componente_accion`.`id_accion` = `tbl_accion`.`id_accion` 
	LEFT JOIN `tbl_componente` ON `tbl_componente_accion`.`id_componente` = `tbl_componente`.`id_componente` ;

	ELSE
	  IF pIdAbm=1 THEN
		INSERT INTO tbl_rol_componente_accion(id_rol,id_componente_accion) values (pIdRol,pIdComponenteAccion);
	    ELSE
		  IF pIdAbm=2 THEN
			DELETE FROM tbl_rol_componente_accion WHERE id_rol_componente_accion in (pIdRolComponenteAccion);
		  END IF;
	    END IF;
	  END IF;

END$$

DROP PROCEDURE IF EXISTS `SPRABMUsuario`$$
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

DROP PROCEDURE IF EXISTS `SPRABMUsuarioRol`$$
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

DROP PROCEDURE IF EXISTS `SPRAPREstadoPlanTesis`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRAPREstadoPlanTesis`(IN pIdPlanTesis BIGINT, IN pIdEstado INT)
BEGIN
  UPDATE tbl_plan_tesis tbl SET
    tbl.id_estado_plan_tesis=pIdEstado
WHERE tbl.id_plan_tesis=pIdPlanTesis;
END$$

DROP PROCEDURE IF EXISTS `SPRCNDTesis`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNDTesis`()
BEGIN
SELECT
  viw.titulo,
  viw.alumno,
  viw.docente,
  viw.anio,
  viw.id_material_bibliografico,
  viw.id_docente,
  viw.id_alumno,
  viw.id_autor_interno,
  viw.id_tipo_autor_interno
FROM
  viw_material_bibliografico_interno_alumno viw
  WHERE viw.id_tipo_material_bibliografico=1;
END$$

DROP PROCEDURE IF EXISTS `SPRCNPermiso`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNPermiso`()
BEGIN
SELECT
  tbl_usuario.id_sujeto,
  tbl_usuario.usuario,
  tbl_rol_componente_accion.id_rol_componente_accion,
  tbl_accion.accion,
  tbl_componente.componente,
  tbl_componente.id_componente
FROM
  tbl_rol_componente_accion
  INNER JOIN tbl_rol
    ON tbl_rol_componente_accion.id_rol = tbl_rol.id_rol
  INNER JOIN tbl_usuario_rol
    ON tbl_usuario_rol.id_rol = tbl_rol.id_rol
  INNER JOIN tbl_usuario
    ON tbl_usuario_rol.id_usuario = tbl_usuario.id_usuario
  INNER JOIN tbl_componente_accion
    ON tbl_rol_componente_accion.id_componente_accion = tbl_componente_accion.id_componente_accion
  INNER JOIN tbl_componente
    ON tbl_componente_accion.id_componente = tbl_componente.id_componente
  INNER JOIN tbl_accion
    ON tbl_componente_accion.id_accion = tbl_accion.id_accion;
END$$

DROP PROCEDURE IF EXISTS `SPRCNSAccion`$$
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

DROP PROCEDURE IF EXISTS `SPRCNSAcompañante`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSAcompañante`(IN pId_sujeto INT(11))
BEGIN
  SELECT
          viw.id_sujeto,
          tbl.id_autor_interno,
          tbl.id_alumno,
          viw.alumno,
          viw.id_facultad,
          viw.id_escuela
        FROM
          tbl_autor_interno  tbl
          INNER JOIN viw_alumno viw
            ON tbl.id_alumno = viw.id_alumno
   WHERE tbl.id_tipo_autor_interno IN (4,5) AND viw.id_sujeto<>pId_sujeto;
END$$

DROP PROCEDURE IF EXISTS `SPRCNSAlumnoxUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSAlumnoxUsuario`(IN pId_Usuario INT(11))
BEGIN
  SELECT
  tbl_usuario.id_usuario,
  tbl_alumno.id_alumno
  FROM
  sis_biblio.tbl_alumno
  INNER JOIN sis_biblio.tbl_sujeto
    ON tbl_alumno.id_sujeto = tbl_sujeto.id_sujeto
  INNER JOIN sis_biblio.tbl_usuario
    ON tbl_usuario.id_sujeto = tbl_sujeto.id_sujeto
  WHERE
    tbl_usuario.id_usuario=pId_Usuario;
END$$

DROP PROCEDURE IF EXISTS `SPRCNSAsesor`$$
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

DROP PROCEDURE IF EXISTS `SPRCNSAutoresXTipoAutor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSAutoresXTipoAutor`(IN pIdCns TINYINT)
BEGIN
  IF pIdCns=1 THEN 
    SELECT
      viw.id_alumno,
      viw.id_autor_interno,
      viw.alumno
    FROM
      viw_material_bibliografico_interno_alumno viw
    WHERE
      viw.id_tipo_autor_interno IN (4,5);
    ELSE IF pIdCns = 2 THEN -- FUNCIONADA PARA LISTAR TANTO A TESIST COMO TITULADOS
          SELECT
          tbl.id_autor_interno,
          tbl.id_alumno,
          viw.alumno,
          viw.id_facultad,
          viw.id_escuela
        FROM
          tbl_autor_interno  tbl
          INNER JOIN viw_alumno viw
            ON tbl.id_alumno = viw.id_alumno
          WHERE tbl.id_tipo_autor_interno IN (4,5);
          ELSE IF pIdCns=3 THEN -- FUNCIONA PARA LISTAR SOLO A TESISTA
                SELECT
                  tbl.id_autor_interno,
                  tbl.id_alumno,
                  viw.alumno,
                  viw.id_facultad,
                  viw.id_escuela
                FROM
                  tbl_autor_interno  tbl
                  INNER JOIN viw_alumno viw
                    ON tbl.id_alumno = viw.id_alumno
                  WHERE tbl.id_tipo_autor_interno =4;
            END IF;
       END IF;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `SPRCNSComponenteAccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSComponenteAccion`(IN pIdCns TINYINT, IN pIdComponente INT, IN pLimit INT)
BEGIN
  IF pIdCns=1 THEN
SELECT
  tblc.id_componente,
  tblca.id_componente_accion,
  tblca.id_accion,
  tbla.accion
FROM
  tbl_componente_accion tblca
  INNER JOIN tbl_componente tblc
    ON tblca.id_componente = tblc.id_componente
   INNER JOIN sis_biblio.tbl_accion tbla
    ON tblca.id_accion = tbla.id_accion
  WHERE tblc.id_componente=pIdComponente;
    ELSE IF pIdCns=2 THEN
      SET @pLimit=pLimit;
      SET @pIdComponente=pIdComponente;
     PREPARE STMT FROM   'SELECT
  tblc.id_componente,
  tblca.id_componente_accion,
  tblca.id_accion,
  tbla.accion
FROM
  tbl_componente_accion tblca
  INNER JOIN tbl_componente tblc
    ON tblca.id_componente = tblc.id_componente
   INNER JOIN sis_biblio.tbl_accion tbla
    ON tblca.id_accion = tbla.id_accion
  WHERE tblc.id_componente=? ORDER BY tblca.id_componente_accion DESC LIMIT ?';
      EXECUTE STMT USING @pIdComponente,@pLimit;
      END IF;
  END IF;
END$$

DROP PROCEDURE IF EXISTS `SPRCNSEscuela`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSEscuela`()
BEGIN
SELECT
  tbl.id_escuela,
  tbl.escuela
FROM
  tbl_escuela tbl
  WHERE tbl.estado=1;
END$$

DROP PROCEDURE IF EXISTS `SPRCNSFacultad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSFacultad`()
BEGIN
SELECT
  tbl.id_facultad,
  tbl.facultad
FROM
  tbl_facultad tbl
  WHERE tbl.activo=1;
END$$

DROP PROCEDURE IF EXISTS `SPRCNSInformePractica`$$
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

DROP PROCEDURE IF EXISTS `SPRCNSListar_rol_componente_accion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSListar_rol_componente_accion`(IN pIdCns TINYINT, IN pIdRol INT(11), IN pLimit TINYINT)
BEGIN
IF pIdCns=1 THEN
SELECT 	`tbl_rol_componente_accion`.`id_rol_componente_accion`,
		`tbl_rol`.`id_rol`,
		`tbl_componente_accion`.`id_componente_accion`,
		`tbl_componente`.`componente`,
		`tbl_accion`.`accion` 
FROM tbl_rol_componente_accion

LEFT JOIN `tbl_componente_accion` ON `tbl_rol_componente_accion`.`id_componente_accion` = `tbl_componente_accion`.`id_componente_accion` 
LEFT JOIN `tbl_rol` ON `tbl_rol_componente_accion`.`id_rol` = `tbl_rol`.`id_rol` 
LEFT JOIN `tbl_accion` ON `tbl_componente_accion`.`id_accion` = `tbl_accion`.`id_accion` 
LEFT JOIN `tbl_componente` ON `tbl_componente_accion`.`id_componente` = `tbl_componente`.`id_componente` 
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

LEFT JOIN `tbl_componente_accion` ON `tbl_rol_componente_accion`.`id_componente_accion` = `tbl_componente_accion`.`id_componente_accion` 
LEFT JOIN `tbl_rol` ON `tbl_rol_componente_accion`.`id_rol` = `tbl_rol`.`id_rol` 
LEFT JOIN `tbl_accion` ON `tbl_componente_accion`.`id_accion` = `tbl_accion`.`id_accion` 
LEFT JOIN `tbl_componente` ON `tbl_componente_accion`.`id_componente` = `tbl_componente`.`id_componente` 
WHERE tbl_rol.id_rol=?
    ORDER BY tbl_rol_componente_accion.id_rol_componente_accion DESC LIMIT ?';
        EXECUTE STMT USING @IdRol,@Limit;
        END IF;
  END IF;
END$$

DROP PROCEDURE IF EXISTS `SPRCNSListar_rol_usuario`$$
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

DROP PROCEDURE IF EXISTS `SPRCNSMaterialBibliograficoXAsesor`$$
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

DROP PROCEDURE IF EXISTS `SPRCNSOficina`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSOficina`()
BEGIN

      SELECT 
          tbl.id_oficina,
          tbl.oficina
        FROM tbl_oficina tbl
        WHERE tbl.activo=1; 
END$$

DROP PROCEDURE IF EXISTS `SPRCNSPlanTesis`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSPlanTesis`(IN pIdCns TINYINT, IN pIdPlanTesis INT)
BEGIN
  -- El listado de los plan tesis que estan en proceso
  IF pIdCns=1 THEN
    SELECT
      tbl.id_plan_tesis as 'id_plan_tesis',
      viwd.id_docente as 'id_docente',
      viwa.id_alumno as 'id_alumno',
      viwa.id_facultad as 'id_facultad',
      viwa.alumno as 'solicitante', 
      viwa.escuela_abreviatura AS 'abreaviatura_escuela',
      tbl.titulo as 'titulo',
      viwd.docente as 'asesor'
    FROM
      tbl_plan_tesis tbl
  INNER JOIN viw_docente viwd
    ON tbl.id_docente = viwd.id_docente
  INNER JOIN tbl_alumno_plantesis tblap
    ON tblap.id_plan_tesis = tbl.id_plan_tesis
  INNER JOIN viw_alumno viwa
    ON viwa.id_alumno = tblap.id_alumno
    WHERE tbl.id_estado_plan_tesis =1 AND 
      tblap.solicita=1
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
        tbl_plan_tesis tbl
  INNER JOIN viw_docente viwd
    ON tbl.id_docente = viwd.id_docente
  INNER JOIN tbl_alumno_plantesis tblap
    ON tblap.id_plan_tesis = tbl.id_plan_tesis
  INNER JOIN viw_alumno viwa
    ON viwa.id_alumno = tblap.id_alumno
      WHERE tbl.id_estado_plan_tesis!=2
        and tbl.id_plan_tesis=pIdPlanTesis AND 
      tblap.solicita=1;
          ELSE IF pIdCns=3 THEN 
                SELECT
      COUNT(tbl.id_plan_tesis) as 'filas'
        FROM
          tbl_plan_tesis tbl
      INNER JOIN viw_docente viwd
        ON tbl.id_docente = viwd.id_docente
      INNER JOIN tbl_alumno_plantesis tblap
        ON tblap.id_plan_tesis = tbl.id_plan_tesis
      INNER JOIN viw_alumno viwa
        ON viwa.id_alumno = tblap.id_alumno
        WHERE tbl.id_estado_plan_tesis =1 AND 
          tblap.solicita=1;
           END IF;
       END IF;
   END IF;
END$$

DROP PROCEDURE IF EXISTS `SPRCNSSujeto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRCNSSujeto`()
BEGIN
SELECT
  viw.id_sujeto,
  viw.sujeto
FROM
  viw_sujeto viw;
END$$

DROP PROCEDURE IF EXISTS `SPRINSMaterialBibliografico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRINSMaterialBibliografico`(IN pCodigoMaterialBibliografico VARCHAR(40), IN pTitulo VARCHAR(300), IN pIntroduccion TEXT, IN pObjetivo TEXT, IN pResumen TEXT, IN pConclusion TEXT, IN pAnio YEAR, IN pPortada VARCHAR(200), IN pNumeroPagina SMALLINT, IN pEditorial VARCHAR(100), IN pVolumen INT, IN pTomo VARCHAR(3), IN pContenido VARCHAR(100), IN pidTipoMaterialBibliografico TINYINT, IN pIdTematica INT, IN pActivo CHAR(1))
BEGIN
  INSERT INTO tbl_material_bibliografico (codigo_material_bibliografico,titulo,introduccion,objetivo,resumen,conclusion,anio,portada,numero_pagina,editorial,volumen,tomo,contenido,id_tipo_material_bibliografico,id_tematica,activo)
     VALUES (pCodigoMaterialBibliografico,pTitulo,pIntroduccion,pObjetivo,pResumen,pConclusion,pAnio,pPortada,pNumeroPagina,pEditorial,pVolumen,pTomo,pContenido,pidTipoMaterialBibliografico,pIdTematica,pActivo);
  COMMIT;
END$$

DROP PROCEDURE IF EXISTS `SPRINSSolicitudConstancia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRINSSolicitudConstancia`(IN pTitulo VARCHAR(300),IN pIntroduccion text,IN pObjetivo text,IN pResumen TEXT, IN pConclusion TEXT,IN pCorreo VARCHAR(50),IN pActivo CHAR(1),IN pIdSujeto1 BIGINT,IN pIdDocente BIGINT,IN pIdSujeto2 BIGINT,IN pIns TINYINT)
BEGIN
  IF pIns=1 THEN
     SET @pidAlumno1 = (SELECT tbl.id_alumno FROM  tbl_alumno tbl  WHERE tbl.id_sujeto=pIdSujeto1);
    INSERT INTO tbl_plan_tesis(titulo,introduccion,objetivo,resumen,conclusion,activo,correo,id_docente,id_estado_plan_tesis)
       VALUES (pTitulo,pIntroduccion,pObjetivo,pResumen,pConclusion,1,pCorreo,pIdDocente,1);
  set @pIdPlanTesis:=(SELECT LAST_INSERT_ID());
  INSERT INTO tbl_alumno_plantesis (id_alumno,id_plan_tesis,solicita) VALUES (@pidAlumno1,@pIdPlanTesis,1);
    ELSE 
    IF pIns=2 THEN
        SET @pidAlumno1 = (SELECT tbl.id_alumno FROM  tbl_alumno tbl  WHERE tbl.id_sujeto=pIdSujeto1);
     SET @pidAlumno2 = (SELECT tbl.id_alumno FROM  tbl_alumno tbl  WHERE tbl.id_sujeto=pIdSujeto2);
    INSERT INTO tbl_plan_tesis(titulo,introduccion,objetivo,resumen,conclusion,activo,correo,id_docente,id_estado_plan_tesis)
       VALUES (pTitulo,pIntroduccion,pObjetivo,pResumen,pConclusion,1,pCorreo,pIdDocente,1);
  set @pIdPlanTesis:=(SELECT LAST_INSERT_ID());
    INSERT INTO tbl_alumno_plantesis (id_alumno,id_plan_tesis,solicita) VALUES (@pidAlumno1,@pIdPlanTesis,1);
    INSERT INTO tbl_alumno_plantesis (id_alumno,id_plan_tesis,solicita) VALUES (@pidAlumno2,@pIdPlanTesis,0);
      END IF;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `SPRINSTesis`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRINSTesis`(IN pIdAutorInterno BIGINT, IN pIdDocente BIGINT,IN pTitulo VARCHAR(300),IN pIntroduccion TEXT,IN pObjetivo TEXT,IN pResumen TEXT,IN pConclusion TEXT,IN pAnio YEAR,IN pNumeroPagina SMALLINT,IN pCodigoMaterialBibliografico VARCHAR(40))
BEGIN
CALL SPRINSMaterialBibliografico(pCodigoMaterialBibliografico, pTitulo,pIntroduccion ,pObjetivo ,pResumen ,pConclusion ,pAnio , '',pNumeroPagina , '', null, '', '', 1, null, 1);
set @pIdMaterialBibliografico:=(SELECT LAST_INSERT_ID());
 -- CALL SPRABMAutorInterno(2,5,pIdAutorInterno,0);
INSERT INTO tbl_autor_interno_material_bibliografico(id_autor_interno,id_material_bibliografico,id_docente) 
  VALUES (pIdAutorInterno,@pIdMaterialBibliografico,pIdDocente);
END$$

DROP PROCEDURE IF EXISTS `SPRRPTReporteNegatividad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRRPTReporteNegatividad`(IN IdPlanTesis BIGINT)
BEGIN
    SELECT
    tbl.titulo,
    (SELECT viwa.alumno 
      FROM tbl_alumno_plantesis tbl_1 
      INNER JOIN viw_alumno viwa 
      ON viwa.id_alumno = tbl_1.id_alumno WHERE tbl_1.solicita=1 AND tbl_1.id_plan_tesis=IdPlanTesis) AS alumno_solicitante,
      (SELECT viwa.alumno 
      FROM tbl_alumno_plantesis tbl_1 
      INNER JOIN viw_alumno viwa 
      ON viwa.id_alumno = tbl_1.id_alumno WHERE tbl_1.solicita=0 AND tbl_1.id_plan_tesis=IdPlanTesis) AS alumno_acompaniante,
    viwd.docente as asesor,
    viwa.escuela,
    tbl.id_estado_plan_tesis AS proceso_tramite
  FROM
    tbl_alumno_plantesis tbl_1
    INNER JOIN tbl_plan_tesis tbl
      ON tbl_1.id_plan_tesis=tbl.id_plan_tesis
      INNER JOIN viw_alumno viwa
      ON viwa.id_alumno = tbl_1.id_alumno
    INNER JOIN viw_docente viwd
      ON tbl.id_docente = viwd.id_docente
      WHERE tbl.id_plan_tesis=IdPlanTesis
      GROUP BY tbl_1.id_plan_tesis;
END$$

DROP PROCEDURE IF EXISTS `SPRUPDTesis`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRUPDTesis`(IN pIdMaterialBibliografico BIGINT, IN pIntroduccion TEXT, IN pObjetivo TEXT, IN pResumen TEXT, IN pConclusion TEXT)
BEGIN
UPDATE tbl_material_bibliografico tbl SET
tbl.introduccion=pIntroduccion,
tbl.objetivo=pObjetivo,
tbl.resumen=pResumen,
tbl.conclusion=pConclusion
  WHERE tbl.id_material_bibliografico=pIdMaterialBibliografico;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_accion`
--

DROP TABLE IF EXISTS `tbl_accion`;
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

DROP TABLE IF EXISTS `tbl_alumno`;
CREATE TABLE IF NOT EXISTS `tbl_alumno` (
  `id_alumno` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero_carnet` varchar(20) DEFAULT NULL,
  `condicion_alumno` tinyint(4) NOT NULL,
  `id_sujeto` bigint(20) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `Reftbl_escuela10` (`id_escuela`),
  KEY `Reftbl_sujeto8` (`id_sujeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1638 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tbl_alumno`
--

INSERT INTO `tbl_alumno` (`id_alumno`, `numero_carnet`, `condicion_alumno`, `id_sujeto`, `id_escuela`) VALUES
(1, '0332101030', 1, 1, 2),
(2, '0332101028', 1, 2, 2),
(3, '0332101036', 1, 3, 2),
(4, '0332101029', 2, 4, 2),
(5, '0332090210', 2, 5, 2),
(6, '0332090211', 3, 6, 2),
(7, '0332101012', 1, 7, 2),
(8, '0332101018', 1, 8, 2),
(9, '0332101019', 1, 9, 2),
(10, '0332101045', 1, 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_alumno_plantesis`
--

DROP TABLE IF EXISTS `tbl_alumno_plantesis`;
CREATE TABLE IF NOT EXISTS `tbl_alumno_plantesis` (
  `id_alumno_planTesis` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_alumno` bigint(20) NOT NULL,
  `id_plan_tesis` bigint(20) NOT NULL,
  `solicita` char(1) DEFAULT '1',
  PRIMARY KEY (`id_alumno_planTesis`),
  KEY `FK_tbl_alumno_plantesis_tbl_alumno` (`id_alumno`),
  KEY `FK_tbl_alumno_plantesis_tbl_plan_tesis` (`id_plan_tesis`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=682 AUTO_INCREMENT=45 ;

--
-- Volcado de datos para la tabla `tbl_alumno_plantesis`
--

INSERT INTO `tbl_alumno_plantesis` (`id_alumno_planTesis`, `id_alumno`, `id_plan_tesis`, `solicita`) VALUES
(1, 1, 2, '1'),
(2, 2, 3, '1'),
(3, 3, 4, '1'),
(4, 4, 5, '1'),
(5, 1, 28, '1'),
(6, 2, 29, '1'),
(7, 3, 30, '1'),
(8, 1, 38, '1'),
(9, 5, 38, '0'),
(10, 1, 39, '1'),
(11, 1, 40, '1'),
(12, 1, 41, '1'),
(13, 1, 42, '1'),
(14, 1, 43, '1'),
(15, 1, 44, '1'),
(16, 1, 45, '1'),
(17, 1, 46, '1'),
(18, 1, 47, '1'),
(19, 7, 47, '0'),
(20, 1, 48, '1'),
(21, 1, 49, '1'),
(22, 1, 50, '1'),
(23, 2, 65, '1'),
(24, 7, 65, '0'),
(25, 1, 71, '1'),
(26, 1, 72, '1'),
(27, 1, 73, '1'),
(28, 1, 74, '1'),
(29, 1, 75, '1'),
(30, 1, 76, '1'),
(31, 1, 77, '1'),
(32, 1, 78, '1'),
(33, 1, 79, '1'),
(34, 1, 80, '1'),
(35, 1, 81, '1'),
(36, 1, 82, '1'),
(37, 1, 83, '1'),
(38, 1, 84, '1'),
(39, 1, 85, '1'),
(40, 1, 86, '1'),
(41, 1, 87, '1'),
(42, 1, 88, '1'),
(43, 1, 89, '1'),
(44, 1, 90, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_autor_externo`
--

DROP TABLE IF EXISTS `tbl_autor_externo`;
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

DROP TABLE IF EXISTS `tbl_autor_externo_material_bibliografico`;
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

DROP TABLE IF EXISTS `tbl_autor_interno`;
CREATE TABLE IF NOT EXISTS `tbl_autor_interno` (
  `id_autor_interno` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tipo_autor_interno` bigint(20) NOT NULL,
  `id_alumno` bigint(20) NOT NULL,
  PRIMARY KEY (`id_autor_interno`),
  KEY `Reftbl_alumno12` (`id_alumno`),
  KEY `Reftbl_tipo_autor_interno3` (`id_tipo_autor_interno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1638 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tbl_autor_interno`
--

INSERT INTO `tbl_autor_interno` (`id_autor_interno`, `id_tipo_autor_interno`, `id_alumno`) VALUES
(1, 1, 5),
(2, 3, 6),
(3, 3, 2),
(4, 3, 3),
(5, 4, 1),
(6, 5, 4),
(7, 5, 7),
(8, 5, 8),
(9, 5, 9),
(10, 5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_autor_interno_material_bibliografico`
--

DROP TABLE IF EXISTS `tbl_autor_interno_material_bibliografico`;
CREATE TABLE IF NOT EXISTS `tbl_autor_interno_material_bibliografico` (
  `id_autor_interno_material_bibliografico` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_autor_interno` bigint(20) NOT NULL,
  `id_material_bibliografico` bigint(20) NOT NULL,
  `id_docente` bigint(20) NOT NULL,
  PRIMARY KEY (`id_autor_interno_material_bibliografico`),
  KEY `FK_tbl_autor_interno_material_bibliografico_tbl_docente` (`id_docente`),
  KEY `Reftbl_autor_interno5` (`id_autor_interno`),
  KEY `Reftbl_material_biliografico6` (`id_material_bibliografico`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1024 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `tbl_autor_interno_material_bibliografico`
--

INSERT INTO `tbl_autor_interno_material_bibliografico` (`id_autor_interno_material_bibliografico`, `id_autor_interno`, `id_material_bibliografico`, `id_docente`) VALUES
(1, 1, 1, 3),
(2, 2, 1, 4),
(3, 3, 4, 4),
(4, 4, 5, 3),
(5, 5, 6, 1),
(7, 7, 8, 3),
(8, 9, 9, 3),
(9, 8, 10, 1),
(10, 8, 11, 3),
(11, 5, 12, 1),
(12, 8, 13, 14),
(13, 8, 14, 3),
(14, 6, 15, 43),
(15, 6, 16, 43),
(16, 8, 17, 43),
(17, 8, 18, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_componente`
--

DROP TABLE IF EXISTS `tbl_componente`;
CREATE TABLE IF NOT EXISTS `tbl_componente` (
  `id_componente` int(11) NOT NULL AUTO_INCREMENT,
  `componente` varchar(100) NOT NULL,
  `descripcion_componente` varchar(100) DEFAULT NULL,
  `id_oficina` int(11) NOT NULL,
  `oficina` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_componente`),
  KEY `Reftbl_oficina1` (`id_oficina`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1489 AUTO_INCREMENT=113 ;

--
-- Volcado de datos para la tabla `tbl_componente`
--

INSERT INTO `tbl_componente` (`id_componente`, `componente`, `descripcion_componente`, `id_oficina`, `oficina`) VALUES
(77, 'Módulo de Acción', 'Accions', 26, NULL),
(84, 'Módulo de Componente', '', 1, NULL),
(86, 'Módulo de Rol', 'roles', 2, NULL),
(87, 'Módulo de Usuario', '', 1, NULL),
(89, 'Módulo Solicitar Constancia', '', 2, NULL),
(91, 'Módulo de Asignación de Roles', '', 1, NULL),
(93, 'Módulo de Asignación de Componente Acción', '', 1, NULL),
(94, 'Módulo de Asignación de Acción', '', 1, NULL),
(96, 'Módulo Control de Tesis', '', 1, NULL),
(97, 'Módulo Cargar Voucher', '', 1, NULL),
(98, 'Módulo Solicitudes por Aprobar', '', 1, NULL),
(100, 'Modulo Scooby', 'Perro', 2, NULL),
(109, 'Módulo nomb', 'hiekeh', 2, NULL),
(110, 'Módulo Alianza', 'arriba', 29, NULL),
(111, 'Modulo Súper Campeones', 'hola', 29, NULL),
(112, 'Módulo Perú Caaaaaaaaampeón', 'hola', 29, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_componente_accion`
--

DROP TABLE IF EXISTS `tbl_componente_accion`;
CREATE TABLE IF NOT EXISTS `tbl_componente_accion` (
  `id_componente_accion` int(11) NOT NULL AUTO_INCREMENT,
  `id_accion` tinyint(4) NOT NULL,
  `id_componente` int(11) NOT NULL,
  PRIMARY KEY (`id_componente_accion`),
  KEY `Reftbl_accion29` (`id_accion`),
  KEY `Reftbl_componente30` (`id_componente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1489 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `tbl_componente_accion`
--

INSERT INTO `tbl_componente_accion` (`id_componente_accion`, `id_accion`, `id_componente`) VALUES
(1, 1, 77),
(4, 1, 84),
(6, 1, 86),
(7, 1, 87),
(8, 1, 89),
(10, 1, 91),
(11, 1, 93),
(12, 1, 98),
(13, 1, 96),
(14, 1, 94),
(15, 1, 97);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_docente`
--

DROP TABLE IF EXISTS `tbl_docente`;
CREATE TABLE IF NOT EXISTS `tbl_docente` (
  `id_docente` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo_docente` varchar(10) DEFAULT NULL,
  `codigo_personal` char(6) DEFAULT NULL,
  `condicion` char(1) NOT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `id_sujeto` bigint(20) NOT NULL,
  `id_facultad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_docente`),
  KEY `FK_tbl_docente_tbl_facultad_id_facultad` (`id_facultad`),
  KEY `Reftbl_sujeto9` (`id_sujeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=199 AUTO_INCREMENT=86 ;

--
-- Volcado de datos para la tabla `tbl_docente`
--

INSERT INTO `tbl_docente` (`id_docente`, `codigo_docente`, `codigo_personal`, `condicion`, `observacion`, `id_sujeto`, `id_facultad`) VALUES
(1, 'DNU399', '1234', '1', NULL, 28, 7),
(3, 'DNI241', NULL, '2', NULL, 37, 7),
(4, 'DNU186', NULL, '1', NULL, 49, 7),
(7, 'DNI130', NULL, '1', NULL, 51, 7),
(8, 'DNU064', NULL, '1', NULL, 52, 7),
(9, 'DNU358', NULL, '1', NULL, 62, 7),
(10, 'DNU185', NULL, '1', NULL, 63, 7),
(11, 'DNU257', NULL, '1', NULL, 80, 7),
(12, 'DNU065', NULL, '1', NULL, 83, 7),
(13, 'DNQ322', NULL, '1', NULL, 91, 7),
(14, 'DNM056', NULL, '1', NULL, 106, 7),
(15, 'DNU256', NULL, '1', NULL, 112, 7),
(16, NULL, NULL, '1', NULL, 142, 7),
(17, NULL, NULL, '1', NULL, 145, 7),
(18, NULL, NULL, '1', NULL, 162, 7),
(19, NULL, NULL, '1', NULL, 169, 7),
(20, NULL, NULL, '1', NULL, 172, 7),
(21, NULL, NULL, '1', NULL, 186, 7),
(22, NULL, NULL, '1', NULL, 195, 7),
(23, NULL, NULL, '1', NULL, 196, 7),
(24, NULL, NULL, '1', NULL, 209, 7),
(25, NULL, NULL, '1', NULL, 224, 7),
(26, NULL, NULL, '1', NULL, 227, 7),
(27, NULL, NULL, '1', NULL, 233, 7),
(28, NULL, NULL, '1', NULL, 235, 7),
(29, NULL, NULL, '1', NULL, 239, 7),
(30, NULL, NULL, '1', NULL, 247, 7),
(31, NULL, NULL, '1', NULL, 252, 7),
(32, NULL, NULL, '1', NULL, 260, 7),
(33, NULL, NULL, '1', NULL, 273, 7),
(34, NULL, NULL, '1', NULL, 275, 7),
(35, NULL, NULL, '1', NULL, 277, 7),
(36, NULL, NULL, '1', NULL, 286, 7),
(37, NULL, NULL, '1', NULL, 289, 7),
(38, NULL, NULL, '1', NULL, 290, 7),
(39, NULL, NULL, '1', NULL, 298, 7),
(40, NULL, NULL, '1', NULL, 300, 7),
(41, NULL, NULL, '1', NULL, 320, 7),
(42, NULL, NULL, '1', NULL, 329, 7),
(43, NULL, NULL, '1', NULL, 338, 7),
(44, NULL, NULL, '1', NULL, 345, 7),
(45, NULL, NULL, '1', NULL, 364, 7),
(46, NULL, NULL, '1', NULL, 370, 7),
(47, NULL, NULL, '1', NULL, 373, 7),
(48, NULL, NULL, '1', NULL, 374, 7),
(49, NULL, NULL, '1', NULL, 379, 7),
(50, NULL, NULL, '1', NULL, 395, 7),
(51, NULL, NULL, '1', NULL, 428, 7),
(52, NULL, NULL, '1', NULL, 445, 7),
(53, NULL, NULL, '1', NULL, 460, 7),
(54, NULL, NULL, '1', NULL, 462, 7),
(55, NULL, NULL, '1', NULL, 477, 7),
(56, NULL, NULL, '1', NULL, 490, 7),
(57, NULL, NULL, '1', NULL, 492, 7),
(58, NULL, NULL, '1', NULL, 511, 7),
(59, NULL, NULL, '1', NULL, 517, 7),
(60, NULL, NULL, '1', NULL, 557, 7),
(61, NULL, NULL, '1', NULL, 567, 7),
(62, NULL, NULL, '1', NULL, 579, 7),
(63, NULL, NULL, '1', NULL, 583, 7),
(64, NULL, NULL, '1', NULL, 584, 7),
(65, NULL, NULL, '1', NULL, 592, 7),
(66, NULL, NULL, '1', NULL, 594, 7),
(67, NULL, NULL, '1', NULL, 748, 7),
(68, NULL, NULL, '1', NULL, 751, 7),
(69, NULL, NULL, '1', NULL, 752, 7),
(70, NULL, NULL, '1', NULL, 836, 7),
(71, NULL, NULL, '1', NULL, 839, 7),
(72, NULL, NULL, '1', NULL, 840, 7),
(73, NULL, NULL, '1', NULL, 842, 7),
(74, NULL, NULL, '1', NULL, 843, 7),
(75, NULL, NULL, '1', NULL, 844, 7),
(76, NULL, NULL, '1', NULL, 845, 7),
(77, NULL, NULL, '1', NULL, 846, 7),
(78, NULL, NULL, '1', NULL, 847, 7),
(79, NULL, NULL, '1', NULL, 848, 7),
(80, NULL, NULL, '1', NULL, 849, 7),
(81, NULL, NULL, '1', NULL, 850, 7),
(82, NULL, NULL, '1', NULL, 851, 7),
(83, NULL, NULL, '1', NULL, 852, 7),
(84, NULL, NULL, '1', NULL, 854, 7),
(85, NULL, NULL, '1', NULL, 869, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_escuela`
--

DROP TABLE IF EXISTS `tbl_escuela`;
CREATE TABLE IF NOT EXISTS `tbl_escuela` (
  `id_escuela` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escuela` char(4) NOT NULL,
  `escuela` varchar(200) NOT NULL,
  `escuela_abreviatura` varchar(20) DEFAULT NULL,
  `estado` char(1) NOT NULL,
  `id_facultad` int(11) NOT NULL,
  PRIMARY KEY (`id_escuela`),
  KEY `Reftbl_facultad7` (`id_facultad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2340 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `tbl_escuela`
--

INSERT INTO `tbl_escuela` (`id_escuela`, `codigo_escuela`, `escuela`, `escuela_abreviatura`, `estado`, `id_facultad`) VALUES
(1, '01', 'SELECCIONAR', 'EAPIS', '1', 5),
(2, '02', 'INGENIERIA SISTEMAS', 'EAPII', '0', 5),
(3, '03', 'INGENIERIA INFORMATICA', 'EAPII', '1', 5),
(4, '04', 'MEDICINA', 'EAPM', '1', 2),
(5, '05', 'ENFERMERIA', 'EAPE', '1', 2),
(6, '06', 'SELECCIONAR', ' ', '1', 1),
(7, '07', 'INGENIERIA ELECTRONICA', NULL, '1', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estado_plan_tesis`
--

DROP TABLE IF EXISTS `tbl_estado_plan_tesis`;
CREATE TABLE IF NOT EXISTS `tbl_estado_plan_tesis` (
  `id_estado_plan_tesis` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(30) NOT NULL,
  `color` varchar(25) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`id_estado_plan_tesis`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=4096 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tbl_estado_plan_tesis`
--

INSERT INTO `tbl_estado_plan_tesis` (`id_estado_plan_tesis`, `estado`, `color`, `active`) VALUES
(1, 'Proceso', 'amarillo', '1'),
(2, 'Rechazado', 'rojo', '1'),
(3, 'Aprobado', 'verde', '1'),
(4, 'Ninguno', 'blanco', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_facultad`
--

DROP TABLE IF EXISTS `tbl_facultad`;
CREATE TABLE IF NOT EXISTS `tbl_facultad` (
  `id_facultad` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_facultad` char(2) NOT NULL,
  `facultad` varchar(200) NOT NULL,
  `abreviatura_facultad` varchar(255) DEFAULT NULL,
  `activo` char(1) NOT NULL,
  PRIMARY KEY (`id_facultad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1260 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `tbl_facultad`
--

INSERT INTO `tbl_facultad` (`id_facultad`, `codigo_facultad`, `facultad`, `abreviatura_facultad`, `activo`) VALUES
(1, '00', 'SELECCIONAR', '', '1'),
(2, '06', 'EDUCACION', 'FE', '0'),
(3, '12', 'BROMATOLOGIA Y NUTRICION', 'BYN', '0'),
(4, '14', 'INGENIERIA PESQUERA', 'FIP', '0'),
(5, '04', 'CIENCIAS ECONOMICAS, CONTABLES Y FINANCIERAS', 'FCCEYF', '0'),
(6, '02', 'CIENCIAS SOCIALES', 'FCS', '0'),
(7, '03', 'INGENIERÍA', 'FI', '1'),
(8, '16', 'INGENIERIA QUIMICA Y METALURGIA', 'FIQYM', '0'),
(9, '17', 'CIENCIAS', 'FC', '0'),
(10, '05', 'CIENCIAS DE SALUD', 'FCS', '0'),
(11, '01', 'INGENIERIA AGRARIA, INDUSTRIAS Y AMBIENTAL', 'FIAYA', '0'),
(12, '10', 'CIENCIAS EMPRESARIALES', 'FCE', '0'),
(13, '08', 'DERECHO Y CIENCIAS POLITICAS', 'FDYCP', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_material_bibliografico`
--

DROP TABLE IF EXISTS `tbl_material_bibliografico`;
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
  `id_tematica` int(11) DEFAULT NULL,
  `activo` char(1) NOT NULL,
  PRIMARY KEY (`id_material_bibliografico`),
  KEY `Reftbl_tematica15` (`id_tematica`),
  KEY `Reftbl_tipo_material_bibliografico4` (`id_tipo_material_bibliografico`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=963 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `tbl_material_bibliografico`
--

INSERT INTO `tbl_material_bibliografico` (`id_material_bibliografico`, `codigo_material_bibliografico`, `titulo`, `introduccion`, `objetivo`, `resumen`, `conclusion`, `anio`, `portada`, `numero_pagina`, `editorial`, `volumen`, `tomo`, `contenido`, `id_tipo_material_bibliografico`, `id_tematica`, `activo`) VALUES
(1, '0987', 'TESIS1', 'INTRODUCCION1', 'OBJETIVO2', 'RESUMEN3', 'CONCLUSION4', 2013, NULL, 100, NULL, NULL, NULL, NULL, 1, 2, '1'),
(3, '1234', 'TESSI2', 'INTRO', 'OBJ', 'RESUM', 'CONL', 2012, NULL, 12, NULL, NULL, NULL, NULL, 1, 2, '1'),
(4, '2344', 'INFORM', 'DE PRACTICA', 'PRIMERA ', 'QUE SE', 'PONE', 2012, NULL, 200, NULL, NULL, NULL, NULL, 3, 2, '1'),
(5, '4567', 'TESIS3', 'INTOTESIS', 'OBJTESIS', 'RESUMTESIS', 'CONCLUSTESIS', 2000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '1'),
(6, '1235', 'TESIS200', 'INTRODUCCION 200', 'OBJETIVO 200', 'RESUMEN200', 'CONCLUSION200', 2020, NULL, 12, NULL, NULL, NULL, NULL, 1, 2, '1'),
(7, '12345', 'TESIS SPR', 'INTRO SPR', 'OBJ SPR', 'RESU SPR', 'CONCLU SPR', 2100, '', 1200, '', NULL, '', '', 1, NULL, '1'),
(8, '0', 'TESIS WEB', 'WEB INTRO TESIS', 'OBJT INTRO', 'RESUM INTRO', 'CONCLUS WEB', 2010, '', NULL, '', NULL, '', '', 1, NULL, '1'),
(9, '0', 'TESIS WEB2', 'CAMBIO', 'CAMBIO', 'CAMBIO', 'CAMBIO', 2010, '', NULL, '', NULL, '', '', 1, NULL, '1'),
(10, '0', 'TESIS 400', 'INTRODUCCIÓN CARÑO', 'INTRODUCCIÓN CARÑO', 'INTRODUCCIÓN CARÑO', 'INTRODUCCIÓN CARÑO', 2010, '', NULL, '', NULL, '', '', 1, NULL, '1'),
(11, '0', 'TESIS PRIMERO', 'INTROOO', 'OBJT', 'RESUMEN', 'CONCLU', 2000, '', NULL, '', NULL, '', '', 1, NULL, '1'),
(12, '0', 'TESIS 4', 'ñalskd', 'ñaldsk', 'ñalsdk', 'ñlzdkads', 2013, '', NULL, '', NULL, '', '', 1, NULL, '1'),
(13, '0', 'TESIS 5', 'ñalkdñaklsd', 'ñlasdkñlaskd', 'ñlaskdñlasd', 'ñalsdkñalsdads', 2012, '', NULL, '', NULL, '', '', 1, NULL, '1'),
(14, '0', 'TESIS DE', 'alskdlakñsjd', 'ñalsdkkñalsdk', 'ñalksdkñlasd', 'ñaldkñlaskñlds', 2012, '', NULL, '', NULL, '', '', 1, NULL, '1'),
(15, '0', 'qihiwasd', 'dsasdasd', 'asdasdasd', 'adasd', 'asdasdasd', 2013, '', NULL, '', NULL, '', '', 1, NULL, '1'),
(16, '0', 'qihiwasd', 'dsasdasd', 'asdasdasd', 'adasd', 'asdasdasd', 2013, '', NULL, '', NULL, '', '', 1, NULL, '1'),
(17, '0', 'KARINA', 'INTRO', 'ON', 'RE', 'C', 2012, '', NULL, '', NULL, '', '', 1, NULL, '1'),
(18, '0', 'CESAR', 'ñlasdkñasd', 'ñlasdkñlasd', 'ñalkdsñ', 'ñalskdasld', 2012, '', NULL, '', NULL, '', '', 1, NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_material_bibliografico_docente`
--

DROP TABLE IF EXISTS `tbl_material_bibliografico_docente`;
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
-- Estructura de tabla para la tabla `tbl_oficina`
--

DROP TABLE IF EXISTS `tbl_oficina`;
CREATE TABLE IF NOT EXISTS `tbl_oficina` (
  `id_oficina` int(11) NOT NULL AUTO_INCREMENT,
  `oficina` varchar(100) NOT NULL,
  `descripcion_oficina` varchar(100) DEFAULT NULL,
  `activo` char(1) NOT NULL,
  PRIMARY KEY (`id_oficina`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `tbl_oficina`
--

INSERT INTO `tbl_oficina` (`id_oficina`, `oficina`, `descripcion_oficina`, `activo`) VALUES
(1, 'Oficina Uno', '', '1'),
(2, 'Oficina de Biblioteca Central ', NULL, '1'),
(3, 'Usuario', NULL, '1'),
(4, 'Administración', NULL, '1'),
(5, 'Oficina de Almacén', NULL, '0'),
(6, 'Oficina de Registro', NULL, '0'),
(17, 'Oficinaaaa', 'hola', '0'),
(18, 'OficinAAAAAAAAAAAA', 'C,VBJVBJFVBD', '0'),
(19, 'Oficina............', 'nnkdvnkdv', '0'),
(20, 'dsadas', 'sdadsa', '0'),
(21, 'hghjghg', 'hghgh', '0'),
(22, 'dsadsa', 'dsadsa', '0'),
(23, 'dsadsaewq', 'ewqe', '1'),
(24, 'Oficina de Salud', ':D', '0'),
(25, 'fkljkjl', 'mlñjj', '0'),
(26, 'Oficina de sdsg', 'sfdgf', '1'),
(27, 'oficina de ksnks', 'mnmbc', '0'),
(28, 'Oficina de Deportes', 'Siiiiiiiiiiiii!!!!', '0'),
(29, 'Oficina de Cultura', 'yupiiiiiiii ^_^', '1'),
(31, 'Oficina de Comedor', 'gjsdaks', '0'),
(32, '-_', '', '1'),
(33, '{}', '', '1'),
(35, 'Oficina de Scooby Do', 'Un perrito muy travieso :D', '0'),
(36, 'Oficina tomasaaa', 'kkjdf', '1'),
(37, 'Oficina de Tobby', 'aaaaaa', '0'),
(39, 'Oficina de Aseo', 'hkfhks', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_plan_tesis`
--

DROP TABLE IF EXISTS `tbl_plan_tesis`;
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
  `id_docente` bigint(20) NOT NULL,
  `id_estado_plan_tesis` int(11) NOT NULL,
  PRIMARY KEY (`id_plan_tesis`),
  KEY `Reftbl_docente24` (`id_docente`),
  KEY `Reftbl_estado_plan_tesis32` (`id_estado_plan_tesis`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=348 AUTO_INCREMENT=91 ;

--
-- Volcado de datos para la tabla `tbl_plan_tesis`
--

INSERT INTO `tbl_plan_tesis` (`id_plan_tesis`, `titulo`, `introduccion`, `objetivo`, `resumen`, `conclusion`, `activo`, `observacion`, `correo`, `id_docente`, `id_estado_plan_tesis`) VALUES
(2, 'MONOGRAFIA1', 'INTRO1', 'OBJETIVO1', 'RESUMEN1', 'CONCLUSION1', '1', NULL, '0332101028@injfsc.edu.pe', 1, 2),
(3, 'MONOGRAFIA2', 'INTRO2', 'OBJETIVO2', 'RESUMEN2', 'CONCLUSION2', '1', NULL, '0332101029@injfsc.edu.pe', 3, 2),
(4, 'MONOGRAFIA3', 'INTRO3', 'OBJETIVO3', 'RESUMEN3', 'CONCLUSION3', '1', NULL, '0332101030@injfsc.edu.pe', 3, 2),
(5, 'MONOGRAFIA4', 'INTRO4', 'OBJETIVO4', 'RESUMEN4', 'CONCLUSION4', '1', NULL, '0332101031@injfsc.edu.pe', 3, 2),
(28, 'MONOGRAFIA5', 'INTRO5', 'OBJETIVO5', 'RESUMEN5', 'CONCLUSION5', '1', NULL, '0332101032@injfsc.edu.pe', 4, 2),
(29, 'MONOGRAFIA6', 'INTRO6', 'OBJETIVO6', 'RESUMEN6', 'CONCLUSION6', '1', NULL, '0332101034@injfsc.edu.pe', 4, 1),
(30, 'MONOGRAFIA7', 'INTRO7', 'OBJETIVO7', 'RESUMEN7', 'CONCLUSION7', '1', NULL, '0332101033@injfsc.edu.pe', 4, 3),
(31, 'MONOGRAFIA8', 'INTRO8', 'OBJETIVO8', 'RESUMEN8', 'CONCLUSION8', '1', NULL, '0332101035@injfsc.edu.pe', 3, 2),
(32, 'MONOGRAFIA9', 'INTRO9', 'OBJETIVO9', 'RESUMEN9', 'CONCLUSION9', '1', NULL, '0332101036@injfsc.edu.pe', 3, 1),
(33, 'TÉSIS NUMERO 100', 'INTRODUCCIÓN 100', 'OBJETIVO 100', 'RESUMEN 100', 'CONCLUSIÓN 100', '1', NULL, '0332101040@unjfsc.edu.pe', 3, 1),
(34, 'TÉSIS200', 'INTRO200', 'OBJETIVO200', 'RESUMEN200', 'CONCLUSION200', '1', NULL, 'cesar@hotmail.com', 4, 1),
(35, 'PRUEBA 1', 'INTRO PRUEBA', 'OBJETIVO PRUEBA', 'RESUMEN PRUEBA', 'CONCLUSION PRUEBA', '1', NULL, 'prueba@hotmail.com', 4, 1),
(36, 'SOLICITAR', 'INTRODUCCION', 'OBJETIVO', 'RESUMEN', 'CONCLUSION', '1', NULL, 'cesar2010_13@hotmail.com', 3, 1),
(37, 'SOL', 'INTRO', 'OBJ', 'RES', 'CONCL', '1', NULL, 'cesar@hotmail.com', 3, 1),
(38, 'SOLICITAR', 'INTRODUCCION', 'OBJETIVO', 'RESUMEN', 'CONCLUSION', '1', NULL, 'cesar2010_13@hotmail.com', 3, 2),
(39, 'CESAR', 'lksjdfljkdsf', 'ñsldkfkskñldf', 'ñskkñsdfkñldfs', 'ñsldfkñlsdkñlfd', '1', NULL, 'cesar@hotmail.com', 14, 3),
(40, 'TITU', 'ASASDKJLLASKJ', 'AA', 'AAA', 'AAA', '1', NULL, 'cesar@hotmail.com', 1, 3),
(41, 'TITU', 'INTRO', 'OBJ', 'RESU', 'CON', '1', NULL, 'cesar2010_13@hot.com', 14, 2),
(42, 'DOS', 'INTRO', 'OBG', 'RESI', 'CON', '1', NULL, 'cesar@hotmail.com', 52, 3),
(43, 'gyfgy', 'hgaidsughasui', 'ñlaskdñaslkd', 'ñalkdñlasdk', 'ñalskdñasldk', '1', NULL, 'c@hotmail.com', 1, 2),
(44, 'CESAR', 'cesar', 'luis', 'nicho', 'diaz', '1', NULL, 'cesar@hotmail.com', 3, 3),
(45, 'PLAN DE TESIS', 'INTRODUCCIÓN PLAN DE TESIS', 'OBJETIVO PLAN DE TESIS', 'RESUMEN PLAN DE TESIS', 'CONCLUCIÓN PLAN DE TESIS', '1', NULL, 'cesar2010_13@hotmail.com', 52, 1),
(46, 'PLAN DE TESIS1', 'INTRO PLAN DE TRSIS1', 'RESUMEN PLAN DE TESIS 1', 'RESUMEN PLAN DE TESIS 1', 'CONCLUSIÓN PLAN DE TESIS 1', '1', NULL, 'cesar2010_13@hotmail.com', 52, 1),
(47, 'PLAN DE TESIS2', 'INTRO', 'OBJ', 'RESUM', 'CONCLUSI', '1', NULL, 'cesar@hotmail.com', 52, 3),
(48, 'TITU', 'kajsdklasjd', 'añlskdlañsdkas', 'lañkdsñlaskdlas', 'añldskñaslkdlas', '1', NULL, 'cesar@hotmail.com', 3, 3),
(49, 'TITU', 'LADKJSLASKDJ', 'LÑAKDÑLADSK', 'ÑLASKDÑALSD', 'ÑALSDKÑASLDK', '1', NULL, 'cesar@hotmail.com', 1, 2),
(50, 'MKJBIUK', 'rgdf', 'ffd', 'dgrdf', 'xdfg', '1', NULL, 'fdgv@micorreo.com', 40, 2),
(51, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', '', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(52, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', '', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(53, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', '', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(54, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(55, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(56, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(57, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(58, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(59, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(60, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(61, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(62, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(63, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(64, 'soporte', 'mi trabajo', 'mi trabjao', 'mi trabajo', 'mi trabaj', '1', NULL, 'sopotelo@hotmail.com', 85, 1),
(65, 'PRIMERO', 'INTRO', 'OBJ', 'RES', '', '1', NULL, 'cesar2010_13@hotmail.com', 52, 1),
(66, 'CLAROS', 'INTROD', 'OBJ', 'RESU', '', '1', NULL, 'cesar@hotm.com', 16, 1),
(67, 'CLAROS', 'INTROD', 'OBJ', 'RESU', '', '1', NULL, 'cesar@hotm.com', 16, 1),
(68, 'CLAROS', 'INTROD', 'OBJ', 'RESU', '', '1', NULL, 'cesar@hotm.com', 16, 1),
(69, 'CLAROS', 'INTROD', 'OBJ', 'RESU', '', '1', NULL, 'cesar@hotm.com', 16, 1),
(70, 'CLAROS', 'INTROD', 'OBJ', 'RESU', '', '1', NULL, 'cesar@hotm.com', 16, 1),
(71, 'Tesis', 'ccccvg', 'hklj', 'bkjj', 'undefined', '1', NULL, 'marletlnt09@hotmail.com', 45, 1),
(72, 'dgdg', 'dgdg', 'ggggg', 'aaaa', 'undefined', '1', NULL, 'nxbb@hotmail.com', 1, 1),
(73, 'Prueba1', 'aasas', 'asdd', 'jcdc', 'undefined', '1', NULL, 'mar@gmail.com', 3, 1),
(74, 'Pruebaaaa', 'aaaaa', 'ccccccccccccccccc', 'tyyyu', 'undefined', '1', NULL, 'sdd@hotmail.com', 10, 1),
(75, 'Tesis Software', 'sdsada', 'dsad', 'dsada', 'undefined', '1', NULL, 'dey@gmail.com', 56, 1),
(76, 'Tesis de Sistemas', 'shhs', 'hclkdhcdliuc', 'jbcdbc', 'undefined', '1', NULL, 'marle@gmail.com', 15, 1),
(77, 'TESIS informacion', 'dsadsa', 'sadasdsa', 'rtreter', 'undefined', '1', NULL, 'leito@hotmail.com', 41, 1),
(78, 'Tesis Civil', 'dsadas', 'Hdsada', 'dsadsa', 'undefined', '1', NULL, 'lkq@hotmail.com', 7, 1),
(79, 'COSTOS', 'dasdasdas', 'dsadasd', 'dsadsa', 'undefined', '1', NULL, 'arturo@gmail.com', 12, 1),
(80, 'Sistemas Operativos', 'HOla', 'hoa', 'hola', 'undefined', '1', NULL, 'artur@gmail.com', 46, 1),
(81, 'dasda', 'dasda', 'ccc', 'dd', 'undefined', '1', NULL, 'dsadas@gmail.com', 37, 1),
(82, 'jh', 'ddsadsad', 'mlfd', 'ln', 'undefined', '1', NULL, 'correo@gmail.com', 11, 1),
(83, 'Tesis final', 'nkkdjx', 'ccrdhg', 'nnmcdjx', 'undefined', '1', NULL, 'msxsjx@hotmail.com', 63, 1),
(84, 'Tesis base de datos ', 'abc', 'cba', 'bac', 'undefined', '1', NULL, 'hafhsd@hotmail.com', 1, 1),
(85, 'Tesis de khkshas', 'bxsjggcs', 'gdyctutcu', 'vysaju2txjgz', 'undefined', '1', NULL, 'fhsffs@hotmail.com', 46, 1),
(86, 'ingadsa', 'dsadsa', 'dsadsa', 'asdsadsa', 'undefined', '1', NULL, 'de@hotmail.com', 29, 1),
(87, 'tesis', 'dasdas', 'dadsada', 'dsad', 'undefined', '1', NULL, 'cd@gmail.com', 30, 1),
(88, 'dasdas', 'dasdsa', 'dsadas', 'dsadsadsa', 'undefined', '1', NULL, 'dp@gmail.com', 14, 1),
(89, 'Tesis de Investigación', 'nskxksxks', 'bjcdjmchdm', 'bjddjdcjd', 'undefined', '1', NULL, 'marle@hotmail.com', 23, 1),
(90, 'dsadsa', 'qqwq', 'qqq', 'qq', 'undefined', '1', NULL, 'e@gmail.com', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol`
--

DROP TABLE IF EXISTS `tbl_rol`;
CREATE TABLE IF NOT EXISTS `tbl_rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2730 AUTO_INCREMENT=70 ;

--
-- Volcado de datos para la tabla `tbl_rol`
--

INSERT INTO `tbl_rol` (`id_rol`, `rol`, `descripcion`) VALUES
(63, 'Administrador', ''),
(64, 'Tester', ''),
(65, 'Jefe de Biblioteca Central', ''),
(66, 'Asistenta de Biblioteca', ''),
(67, 'Visitante', ''),
(69, 'Alumno', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol_componente_accion`
--

DROP TABLE IF EXISTS `tbl_rol_componente_accion`;
CREATE TABLE IF NOT EXISTS `tbl_rol_componente_accion` (
  `id_rol_componente_accion` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_componente_accion` int(11) NOT NULL,
  PRIMARY KEY (`id_rol_componente_accion`),
  KEY `Reftbl_componente_accion31` (`id_componente_accion`),
  KEY `Reftbl_rol22` (`id_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=682 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `tbl_rol_componente_accion`
--

INSERT INTO `tbl_rol_componente_accion` (`id_rol_componente_accion`, `id_rol`, `id_componente_accion`) VALUES
(1, 63, 1),
(3, 63, 4),
(5, 64, 1),
(7, 64, 4),
(14, 64, 6),
(15, 64, 7),
(16, 64, 8),
(17, 64, 10),
(18, 64, 11),
(19, 64, 12),
(20, 64, 13),
(21, 64, 14),
(22, 63, 6),
(23, 63, 7),
(24, 63, 8),
(25, 63, 10),
(26, 63, 11),
(27, 63, 12),
(28, 63, 13),
(29, 63, 14),
(30, 63, 15),
(31, 65, 12),
(32, 65, 13),
(33, 69, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sujeto`
--

DROP TABLE IF EXISTS `tbl_sujeto`;
CREATE TABLE IF NOT EXISTS `tbl_sujeto` (
  `id_sujeto` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_registro` date NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `tercer_nombre` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `estado_civil` char(1) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `telefono_fijo` varchar(15) DEFAULT NULL,
  `telefono_movil` varchar(15) DEFAULT NULL,
  `email_institucional` varchar(50) DEFAULT NULL,
  `email_personal` varchar(50) DEFAULT NULL,
  `activo` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_sujeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=134 AUTO_INCREMENT=870 ;

--
-- Volcado de datos para la tabla `tbl_sujeto`
--

INSERT INTO `tbl_sujeto` (`id_sujeto`, `fecha_registro`, `apellido_paterno`, `apellido_materno`, `primer_nombre`, `segundo_nombre`, `tercer_nombre`, `fecha_nacimiento`, `dni`, `direccion`, `estado_civil`, `sexo`, `telefono_fijo`, `telefono_movil`, `email_institucional`, `email_personal`, `activo`) VALUES
(1, '2013-06-24', 'Morales', 'Flores', 'Victor', 'Angel', NULL, '1994-06-28', '76771971', 'Calle Bellavista', 'S', 'M', '1234567', '123456', '', NULL, '1'),
(2, '2013-06-10', 'Nicho', 'Diaz', 'Cesar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(3, '2013-06-12', 'Valladares', 'Loza', 'Deyvis', 'J', NULL, '2013-06-12', '12345678', 'al lado', 'S', 'M', '23', NULL, NULL, NULL, '1'),
(4, '2013-06-21', 'Gonzales', 'Angulo', 'Karina', NULL, NULL, NULL, NULL, NULL, 'S', 'F', NULL, NULL, NULL, NULL, '1'),
(5, '2013-06-04', 'Grados', 'Manrique', 'Kelly', NULL, NULL, NULL, NULL, NULL, 'S', 'F', NULL, NULL, NULL, NULL, '1'),
(6, '2013-06-12', 'Vicente', 'Rojas', 'Diego', NULL, NULL, NULL, NULL, NULL, 'S', 'M', NULL, NULL, NULL, NULL, '1'),
(7, '2013-07-01', 'Portilla', 'Villavicencio', 'Nadine', '', NULL, '2013-07-01', '9876543', NULL, 'S', 'F', '7654345', NULL, NULL, NULL, '1'),
(8, '2013-07-01', 'Castillo', 'Montoya', 'Nataly', NULL, NULL, '2013-07-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(9, '2013-07-02', 'Ruiz', 'Huaman', 'Leandro', NULL, NULL, '2013-07-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(10, '2013-07-04', 'Valverde', 'Flores', 'Arturo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(11, '2013-07-09', 'Figueroa', 'Damian', 'Marlene', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(15, '2013-07-20', 'ABARCA', 'RODRIGUEZ', 'JOAQUIN', 'JOSE', '', NULL, '15740291', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(16, '2013-07-20', 'ACEVEDO', 'HOSPINA', 'HILARIO', 'FELIX', '', NULL, '15611981', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(17, '2013-07-20', 'AGUERO', 'ROJAS', 'VICTOR', '', '', NULL, '15612117', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(18, '2013-07-20', 'AGUILAR', 'CLAROS', 'CESAR', 'GUILLERMO', '', NULL, '07534926', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(19, '2013-07-20', 'AGUILAR', 'LUNA VICTORIA', 'MIGUEL', 'ANGEL', '', NULL, '17854491', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(20, '2013-07-20', 'AGUIRRE', 'ORTIZ', 'CIRILA', 'MARGOT', '', NULL, '15617268', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(21, '2013-07-20', 'AGUIRRE', 'SUAREZ', 'VILLANERY', '', '', NULL, '07673698', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(22, '2013-07-20', 'AGURTO', 'TAVARA', 'ELVIA', 'MERCEDES', '', NULL, '15594016', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(23, '2013-07-20', 'AHUMADA', 'ABANTO', 'CESAR', 'AUGUSTO', '', NULL, '10147233', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(24, '2013-07-20', 'AIRAHUACHO', 'BAUTISTA', 'FELIX', 'ESTEBAN', '', NULL, '40769786', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(25, '2013-07-20', 'ALANYA', 'DE GAMBOA', 'LIDIA', '', '', NULL, '15758234', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(26, '2013-07-20', 'ALARCON', 'SALAS', 'JOSE', '', '', NULL, '15614226', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(27, '2013-07-20', 'ALBITRES', 'INFANTES', 'JHONNY', 'JAVIER', '', NULL, '18067237', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(28, '2013-07-20', 'ALCANTARA', 'PAREDES', 'RONALD', 'EIMER', '', NULL, '17925220', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(29, '2013-07-20', 'ALFARO', 'CRUZ', 'SARELA', 'CARMELA', '', NULL, '08488439', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(30, '2013-07-20', 'ALOR', 'HERBOZO', 'ISAUL', 'MAURICIO', '', NULL, '15685716', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(31, '2013-07-20', 'ALOR', 'SOLORZANO', 'RICARDO', 'ANIBAL', '', NULL, '15601207', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(32, '2013-07-20', 'ALTAMIRANO', 'JULCA', 'YAMANDU', 'DAUBERT', '', NULL, '15612374', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(33, '2013-07-20', 'ALVARADO', 'ROSALES', 'MANUEL', 'ANASTACIO', '', NULL, '07232719', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(34, '2013-07-20', 'ALVAREZ', 'QUINTEROS', 'CARMEN', 'DEL PILAR', '', NULL, '15600961', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(35, '2013-07-20', 'ALVINO', 'GUEMBES', 'VICTOR', 'ELEAZAR', '', NULL, '15616007', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(36, '2013-07-20', 'ALVITES', 'VIGO', 'SEGUNDO', 'ROLANDO', '', NULL, '26620605', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(37, '2013-07-20', 'AMADO', 'SOTELO', 'JULIO', 'FABIAN', '', NULL, '15592951', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(38, '2013-07-20', 'AMARO', 'PALOMINO', 'JESUS', 'EGO', '', NULL, '19913682', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(39, '2013-07-20', 'ANDRADE', 'GIRON', 'DANIEL', 'CRISTOBAL', '', NULL, '15613150', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(40, '2013-07-20', 'ANDRES', 'AVALOS', 'JOEL', 'ROQUE', '', NULL, '19027832', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(41, '2013-07-20', 'ANSELMO', 'ARRUNATEGUI', 'JUANA', 'MARIA', '', NULL, '16752469', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(42, '2013-07-20', 'APOLINARIO', 'RIVERA', 'FELIPA', 'HINMER', 'HILEM', NULL, '15688054', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(43, '2013-07-20', 'APONTE', 'GUEVARA', 'CARMEN', 'LALI', '', NULL, '07418508', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(44, '2013-07-20', 'ARAGON', 'ROSADIO', 'RODOLFO', 'JORGE', '', NULL, '15756607', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(45, '2013-07-20', 'ARANA', 'RIZABAL', 'GLADYS', 'VICTORIA', '', NULL, '16010726', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(46, '2013-07-20', 'ARANDA', 'BAZALAR DE TORERO', 'CARMEN', 'ROSA', '', NULL, '15603334', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(47, '2013-07-20', 'ARANDA', 'BAZALAR', 'NICANOR', 'DARIO', '', NULL, '15586303', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(48, '2013-07-20', 'ARAUJO', 'ADAME', 'LUIS', 'GONZAGA', '', NULL, '15599112', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(49, '2013-07-20', 'AREVALO', 'FLORES', 'HENRY', 'MARCIAL', '', NULL, '15723233', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(50, '2013-07-20', 'ARIAS', 'MARTINEZ', 'LUIS', 'MIGUEL', '', NULL, 'X102878', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(51, '2013-07-20', 'ARIAS', 'PITTMAN', 'JOSE', 'AUGUSTO', '', NULL, '15590435', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(52, '2013-07-20', 'ARMAS', 'INGA', 'MOISES', 'EMILIO', '', NULL, '10057606', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(53, '2013-07-20', 'ARONI', 'MEJIA', 'JAQUELINE', 'VICTORIA', '', NULL, '15592693', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(54, '2013-07-20', 'ATANACIO', 'ROJAS', 'JAIME', 'MARCOS', '', NULL, '15981156', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(55, '2013-07-20', 'AYALA', 'ARIADELA', 'LIZARDO', '', '', NULL, '08799309', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(56, '2013-07-20', 'AYALA', 'OCROSPOMA', 'VIRGINIA', 'ISABEL', '', NULL, '41095591', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(57, '2013-07-20', 'AYALA', 'ROBLES', 'CIRO', 'FELIX', '', NULL, '15584298', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(58, '2013-07-20', 'BACILIO', 'ALVARADO', 'ADELFIO', '', '', NULL, '17886942', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(59, '2013-07-20', 'BAILON', 'OSORIO', 'OSCAR', 'ALBERTO', '', NULL, '31663048', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(60, '2013-07-20', 'BALDEOS', 'ARDIAN', 'LUIS', 'ALBERTO', '', NULL, '15612744', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(61, '2013-07-20', 'BARBA', 'HERRERA', 'MIGUEL', 'VICTOR', '', NULL, '15705830', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(62, '2013-07-20', 'BARRENECHEA', 'ALVARADO', 'JULIO', 'CESAR', '', NULL, '31923723', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(63, '2013-07-20', 'BARRERA', 'LOZA', 'ANA', 'DORIS', 'MAGDALENA', NULL, '15727274', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(64, '2013-07-20', 'BARRETO', 'MEZA', 'JESUS', 'GUSTAVO', '', NULL, '15589980', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(65, '2013-07-20', 'BARRIOS', 'BALDEON', 'JUANA', 'REYMUNDA', '', NULL, '21073611', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(66, '2013-07-20', 'BAUTISTA', 'JUAN DE DIOS', 'LELIS', '', '', NULL, '15596695', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(67, '2013-07-20', 'BAUTISTA', 'LOYOLA', 'FRANCISCO', '', '', NULL, '15744389', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(68, '2013-07-20', 'BAZALAR', 'BAZALAR', 'MANUEL', 'JESUS', '', NULL, '15592170', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(69, '2013-07-20', 'BAZALAR', 'NICHO', 'SANTIAGO', 'RAFAEL', '', NULL, '15647317', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(70, '2013-07-20', 'BAZAN', 'BAUTISTA', 'RONNEL', 'EDGAR', '', NULL, '18010195', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(71, '2013-07-20', 'BECERRA', 'GUEVARA', 'RAFAEL', 'WILFREDO', '', NULL, '08288436', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(72, '2013-07-20', 'BECERRA', 'VERA', 'CHARITO', 'EMPERATRIZ', '', NULL, '28105116', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(73, '2013-07-20', 'BEDON', 'LOPEZ', 'NILDA', 'ESTELISTA', '', NULL, '15639897', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(74, '2013-07-20', 'BEDON', 'MARRON', 'TEOFILO', 'ADRIAN', '', NULL, '09455527', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(75, '2013-07-20', 'BENAVENTE', 'RAMIREZ', 'EUSTORGIO', 'GODOY', '', NULL, '15646678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(76, '2013-07-20', 'BENDEZU', 'RIVERA', 'MAXIMO', 'AURELIO', '', NULL, '09136343', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(77, '2013-07-20', 'BENITES', 'REQUENA', 'EDUARDO', 'SIGIFREDO', '', NULL, '25664823', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(78, '2013-07-20', 'BENZA', 'PFLUCKER', 'MANUEL', 'GERMAN', '', NULL, '10141365', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(79, '2013-07-20', 'BERMEJO', 'SANCHEZ', 'FREDY', 'RUPERTO', '', NULL, '17881275', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(80, '2013-07-20', 'BERNAL', 'VALLADARES', 'CARLOS', 'ENRIQUE', '', NULL, '15614554', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(81, '2013-07-20', 'BERNAL', 'VALLADARES', 'VERONICA', 'FELICITA', '', NULL, '18190005', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(82, '2013-07-20', 'BERNUY', 'CASAHUAMAN', 'RICARDO', '', '', NULL, '08578021', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(83, '2013-07-20', 'BLAS', 'FLORES', 'HERALDO', 'ERASMO', '', NULL, '15608533', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(84, '2013-07-20', 'BORJA', 'GAVEDIA', 'JOSE', 'MANUEL', '', NULL, '15598871', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(85, '2013-07-20', 'BRAVO', 'GRANADOS', 'JORGE', 'LUIS', '', NULL, '15586171', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(86, '2013-07-20', 'BRAVO', 'MONTOYA', 'JULIA', 'MARINA', '', NULL, '15724272', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(87, '2013-07-20', 'BRAVO', 'NUÑEZ', 'CARMEN', 'ROSA', '', NULL, '15581004', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(88, '2013-07-20', 'BRITO', 'DIAZ', 'AUGUSTO', 'RAMIRO', '', NULL, '15583068', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(89, '2013-07-20', 'BRITO', 'VEGA', 'WILFREDO', '', '', NULL, '15614036', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(90, '2013-07-20', 'BRUNO', 'MALPICA', 'FRIDA', 'GEORGINA', '', NULL, '15722875', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(91, '2013-07-20', 'BRUNO', 'ROMERO', 'CARLOS', 'ALBERTO', '', NULL, '15603896', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(92, '2013-07-20', 'BUSTAMANTE', 'ABAD', 'RICARDO', '', '', NULL, '15605838', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(93, '2013-07-20', 'BUSTAMANTE', 'HOCES', 'WILDER', '', '', NULL, '15585145', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(94, '2013-07-20', 'CABANILLAS', 'JAUREGUI', 'TOMASA', 'HORMECINDA', '', NULL, '15592173', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(95, '2013-07-20', 'CABELLO', 'BLANCO', 'JAQUELINE', 'JESSICA', '', NULL, '16018969', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(96, '2013-07-20', 'CABILLAS', 'OROPEZA', 'VILMA', 'ROSARIO', '', NULL, '15615596', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(97, '2013-07-20', 'CABRERA', 'CABANILLAS', 'ARMANDO', 'EMILIO', '', NULL, '15583968', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(98, '2013-07-20', 'CABRERA', 'GIURISICH', 'IVAN', 'ALFREDO', '', NULL, '15608752', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(99, '2013-07-20', 'CACERES', 'ESTRADA', 'OLGA', 'BENICIA', '', NULL, '15582588', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(100, '2013-07-20', 'CADAGAN', 'CRUZ', 'JORGE', 'MARTIN', '', NULL, '09238010', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(101, '2013-07-20', 'CADENAS', 'CALDERON', 'PABLO', 'CESAR', '', NULL, '15850223', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(102, '2013-07-20', 'CAJALEON', 'ASENCIOS', 'DELIA', 'HAYDEE', '', NULL, '10616474', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(103, '2013-07-20', 'CALDAS', 'BERMUDEZ', 'FELIPE', '', '', NULL, '15609989', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(104, '2013-07-20', 'CALDERON', 'CARRASCO', 'FLORES', 'IGNACIO', '', NULL, '15590393', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(105, '2013-07-20', 'CALDERON', 'DE LOS RIOS', 'HELBER', 'DANILO', '', NULL, '15600811', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(106, '2013-07-20', 'CALVA', 'MOREIRA', 'JAIME', 'ALBERTO', '', NULL, '25830474', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(107, '2013-07-20', 'CALVO', 'RIVERA', 'IRINA', 'PATRICIA', '', NULL, '03650434', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(108, '2013-07-20', 'CAMARENA', 'LINO', 'EUDOSIA', 'ADELA', '', NULL, '06251508', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(109, '2013-07-20', 'CAMARENA', 'LINO', 'OLIMPIA', 'MARTHA', '', NULL, '15582569', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(110, '2013-07-20', 'CAMOS', 'PICHILINGUE', 'PILAR', 'ROSARIO', '', NULL, '15586955', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(111, '2013-07-20', 'CAMPOS', 'DIAZ', 'ANGEL', 'HUGO', '', NULL, '15619145', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(112, '2013-07-20', 'CANALES', 'CHANGANAQUI', 'ALDO', 'MANUEL', '', NULL, '15646300', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(113, '2013-07-20', 'CANALES', 'FUSTER', 'JORGE', 'SAMUEL', '', NULL, '15594200', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(114, '2013-07-20', 'CANO', 'CURIOSO', 'RAUL', 'MANUEL', '', NULL, '15585905', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(115, '2013-07-20', 'CANO', 'GONZALES', 'TERESA', 'CATALINA', '', NULL, '15582443', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(116, '2013-07-20', 'CARBAJAL', 'ROMERO', 'JULIO', 'VICTOR', '', NULL, '15586679', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(117, '2013-07-20', 'CARDENAS', 'CHANG', 'ALBERTO', 'JOSE', '', NULL, '08697971', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(118, '2013-07-20', 'CARDENAS', 'SALDAÑA', 'LUIS', 'ALBERTO', '', NULL, '32766171', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(119, '2013-07-20', 'CARLOS', 'LECCA', 'HERCULANO', '', '', NULL, '06820156', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(120, '2013-07-20', 'CARO', 'SOTO', 'FELIX', 'GIL', '', NULL, '32124959', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(121, '2013-07-20', 'CARQUIN', 'ARDIAN', 'ISAEL', 'ROBERTO', '', NULL, '15582246', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(122, '2013-07-20', 'CARRASCO', 'DIAZ', 'SERGIO', 'OSWALDO', '', NULL, '15655337', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(123, '2013-07-20', 'CARREÑO', 'CISNEROS', 'EDGARDO', 'OCTAVIO', '', NULL, '03631561', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(124, '2013-07-20', 'CARREÑO', 'MUNDO', 'HUMBERTO', '', '', NULL, '15843945', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(125, '2013-07-20', 'CARREÑO', 'RAMIREZ', 'DANILO', 'HUGO', '', NULL, '15589843', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(126, '2013-07-20', 'CARRERA', 'HUARANGA', 'ELIFIO', '', '', NULL, '15607911', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(127, '2013-07-20', 'CARRERA', 'SALVADOR', 'WESSEL', 'MARTIN', '', NULL, '06154033', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(128, '2013-07-20', 'CARRILLO', 'TORRES', 'VICTORIA', 'FLOR', '', NULL, '15724523', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(129, '2013-07-20', 'CASTAÑEDA', 'CARRION', 'YOLANDA', 'MARIANELA', '', NULL, '15598277', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(130, '2013-07-20', 'CASTAÑEDA', 'CHINGA', 'ANGELICA', '', '', NULL, '15639623', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(131, '2013-07-20', 'CASTILLO', 'ALVA DE GUERRA', 'MARGOT', 'ALBINA', '', NULL, '15587333', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(132, '2013-07-20', 'CASTILLO', 'AMADO', 'JULIO', 'CESAR', '', NULL, '15595915', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(133, '2013-07-20', 'CASTILLO', 'BEDON', 'FLOR', 'MARIA', '', NULL, '32122165', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(134, '2013-07-20', 'CASTILLO', 'CORZO', 'ADRIANA', 'MARIA', '', NULL, '15842593', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(135, '2013-07-20', 'CASTILLO', 'MORE', 'FRANCISCO', '', '', NULL, '15589942', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(136, '2013-07-20', 'CELEDONIO', 'DIAZ', 'ISABEL', 'ELCIRA', '', NULL, '08682572', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(137, '2013-07-20', 'CENTENO', 'ROBLES', 'ROGER', 'CIPRIANO', '', NULL, '15612873', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(138, '2013-07-20', 'CERNA', 'MOLINA', 'WALTER', 'CORNELIO', '', NULL, '15744377', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(139, '2013-07-20', 'CIPRIANO', 'BAUTISTA', 'JOHNNY', 'GREGORIO', '', NULL, '15732636', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(140, '2013-07-20', 'CISNEROS', 'TEJEIRA', 'MAXIMO', '', '', NULL, '23904230', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(141, '2013-07-20', 'CLAROS', 'GUERRERO', 'EDITH', 'MERYLUZ', '', NULL, '15742746', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(142, '2013-07-20', 'CLAROS', 'VASQUEZ', 'CARLOS', 'ORLANDO', '', NULL, '15648641', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(143, '2013-07-20', 'COCA', 'RAMIREZ', 'VICTOR', 'RAUL', '', NULL, '15601160', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(144, '2013-07-20', 'COLLANTES', 'CHANG', 'JOSE', 'LUIS', '', NULL, '15611334', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(145, '2013-07-20', 'COLLANTES', 'ROSALES', 'VICTOR', 'MANUEL', '', NULL, '15623586', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(146, '2013-07-20', 'COLLANTES', 'VILCHEZ', 'YULISSA', 'NOVALI', '', NULL, '15739554', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(147, '2013-07-20', 'COLLAZOS', 'BELTRAN', 'FRANCISCO', 'EDUARDO', '', NULL, '10205904', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(148, '2013-07-20', 'CONDE', 'CURIÑAUPA', 'REGULO', '', '', NULL, '10177373', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(149, '2013-07-20', 'CONDE', 'SALINAS', 'CARLOS', 'HUMBERTO', '', NULL, '15584582', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(150, '2013-07-20', 'CONDOR', 'PERALDO', 'LILIA', 'RUTH', '', NULL, '15725242', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(151, '2013-07-20', 'CONDOR', 'PERALDO', 'TANIA', 'MIRTHA', '', NULL, '41544567', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(152, '2013-07-20', 'CONTRERAS', 'LIZA', 'SERGIO', 'EDUARDO', '', NULL, '08787108', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(153, '2013-07-20', 'CONTRERAS', 'ROMERO', 'JUAN', '', '', NULL, '15583529', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(154, '2013-07-20', 'CORCINO', 'DE TORRES', 'EDELMIRA', '', '', NULL, '15645183', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(155, '2013-07-20', 'CORDOVA', 'MATOS', 'JUANA', 'PAULA', '', NULL, '15583431', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(156, '2013-07-20', 'CORDOVA', 'ROJAS', 'JUAN', '', '', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(157, '2013-07-20', 'CORNEJO', 'BAZALAR', 'PASCUAL', 'FERNANDO', '', NULL, '15580744', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(158, '2013-07-20', 'CORNELIO', 'VICUÑA', 'MOISES', 'LUIS', '', NULL, '15613382', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(159, '2013-07-20', 'CORONADO', 'ESPINOZA', 'JESUS', 'JACOBO', '', NULL, '15591398', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(160, '2013-07-20', 'COTOS', 'DURAN', 'DESIDERIO', 'ELIAS', '', NULL, '07243334', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(161, '2013-07-20', 'CRIOLLO', 'LAOS', 'PEDRO', 'LORENZO', '', NULL, '68245231', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(162, '2013-07-20', 'CRUZ', 'CASTAÑEDA', 'CARLOS', 'MANUEL', '', NULL, '80593441', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(163, '2013-07-20', 'CUELLAR', 'REYES', 'JOSE', 'DEL CARMEN', '', NULL, '15581946', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(164, '2013-07-20', 'CUENCA', 'VELASQUEZ', 'ROSA', 'ELENA', '', NULL, '08470430', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(165, '2013-07-20', 'CUEVAS', 'HUARI', 'EDGARDO', 'WASHINGTON', '', NULL, '21842249', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(166, '2013-07-20', 'CURAY', 'OBALLE', 'MARIA', 'ISABEL', '', NULL, '15758088', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(167, '2013-07-20', 'CHANG', 'CHANG', 'CESAR', 'ERASMO', '', NULL, '15591685', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(168, '2013-07-20', 'CHANGA', 'HUERTAS', 'GERARDO', '', '', NULL, '15614156', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(169, '2013-07-20', 'CHAPARRO', 'ORTIZ', 'JORGE', 'EMILIO', '', NULL, '15588110', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(170, '2013-07-20', 'CHAVEZ', 'BARBERY', 'LUIS', 'MIGUEL', '', NULL, '15759159', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(171, '2013-07-20', 'CHAVEZ', 'PAJARES', 'JULIA', 'ROSA', '', NULL, '06205717', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(172, '2013-07-20', 'CHAVEZ', 'ZAVALETA', 'RAUL', '', '', NULL, '10765451', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(173, '2013-07-20', 'CHERREPANO', 'MANRIQUE', 'REYNALDO', 'FRANCISCO', '', NULL, '15642834', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(174, '2013-07-20', 'CHIHUALA', 'PECHE', 'JAIME', 'LUIS', '', NULL, '17844449', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(175, '2013-07-20', 'CHILET', 'ANDAVIZA', 'SOLEDAD', 'UMELIA', '', NULL, '15606522', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(176, '2013-07-20', 'CHIRITO', 'LAURENCIO', 'SILVIA', 'ISABEL', '', NULL, '15737431', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(177, '2013-07-20', 'CHIROQUE', 'SERNAQUE', 'DOMINGO', '', '', NULL, '15601138', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(178, '2013-07-20', 'CHU', 'ESTRADA', 'WILLIAN', 'ESTEBAN', '', NULL, '08170338', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(179, '2013-07-20', 'CHUCO', 'ARIAS', 'OBDULIO', 'EFIGENIO', '', NULL, '20880826', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(180, '2013-07-20', 'CHUQUILIN', 'ARBILDO', 'JUAN', 'ORLANDO', '', NULL, '33577662', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(181, '2013-07-20', 'CHUQUILIN', 'TERAN', 'CARLOS', 'MIGUEL', '', NULL, '17914074', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(182, '2013-07-20', 'DE LA CRUZ', 'AQUINO', 'HERMINIA', 'EFIGENIA', '', NULL, '15598223', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(183, '2013-07-20', 'DE LA CRUZ', 'DURAN', 'RICARDO', '', '', NULL, '15580888', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(184, '2013-07-20', 'DE LA CRUZ', 'PARDO', 'DANTE', '', '', NULL, '15727305', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(185, '2013-07-20', 'DE LOS RIOS', 'CABANILLAS', 'JOSE', 'EMILIO', '', NULL, '15592878', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(186, '2013-07-20', 'DE LOS SANTOS', 'GARCIA', 'JUAN', 'CARLOS', '', NULL, '15741150', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(187, '2013-07-20', 'DE LOS SANTOS', 'RONCEROS', 'DELFINA', 'CORALI', '', NULL, '15596090', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(188, '2013-07-20', 'DEL SOLAR', 'LA ROSA', 'OSWALDO', 'FEDERICO', '', NULL, '15591696', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(189, '2013-07-20', 'DELGADO', 'BENITES', 'FRANCISCO', 'JAVIER', '', NULL, '19669351', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(190, '2013-07-20', 'DELGADO', 'OLANO', 'JORGE', 'ISAC', '', NULL, '15608874', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(191, '2013-07-20', 'DELGADO', 'VENTOCILLA', 'MARCO', 'ANTONIO', '', NULL, '15581692', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(192, '2013-07-20', 'DEXTRE', 'MENDOZA', 'RODOLFO', 'WILLIAN', '', NULL, '15637996', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(193, '2013-07-20', 'DIAZ', 'CABALLERO', 'CARMEN', 'ZOILA', '', NULL, '15593461', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(194, '2013-07-20', 'DIAZ', 'PILLASCA', 'HERMILA', 'BELBA', '', NULL, '15601607', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(195, '2013-07-20', 'DIAZ', 'VALLADARES', 'CESAR', 'ARMANDO', '', NULL, '15689062', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(196, '2013-07-20', 'DIAZ', 'VASQUEZ', 'ALEX', 'LUIS', '', NULL, '09313658', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(197, '2013-07-20', 'DIAZ', 'VEGA', 'ENRIQUE', 'UBALDO', '', NULL, '15739242', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(198, '2013-07-20', 'DIONICIO', 'MEJIA', 'EDDA', 'MALVINA', '', NULL, '15600762', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(199, '2013-07-20', 'DOMINGUEZ', 'RUIZ', 'FELIX', 'ANTONIO', '', NULL, '15740208', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(200, '2013-07-20', 'DONAYRE', 'HUAMAN', 'ORIETA', 'RUTH', '', NULL, '15613252', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(201, '2013-07-20', 'DONAYRE', 'NAVARRO', 'MARIA', 'AURORA', 'DEL ROSARIO', NULL, '15727974', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(202, '2013-07-20', 'DUEÑAS', 'SANCHEZ', 'BENIGNO', 'FELIX', '', NULL, '15584447', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(203, '2013-07-20', 'DURAND', 'GONZALES', 'ISABEL', 'TERESA', '', NULL, '15595724', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(204, '2013-07-20', 'ECHEGARAY', 'ROMERO', 'HECTOR', 'ORLANDO', '', NULL, '15607816', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(205, '2013-07-20', 'ENCARNACION', 'VALENTIN', 'NEL', 'FERNANDO', '', NULL, '15738537', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(206, '2013-07-20', 'ESCALANTE', 'APAESTEGUI', 'AUGUSTO', 'MARIANO', '', NULL, '22269063', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(207, '2013-07-20', 'ESCUDERO', 'ESCUDERO', 'MELCHOR', 'EPIFANIO', '', NULL, '15624326', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(208, '2013-07-20', 'ESCURRA', 'ESTRADA', 'CRISTIAN', 'IVAN', '', NULL, '17633022', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(209, '2013-07-20', 'ESPEZUA', 'SERRANO', 'VICTOR', 'FREDY', '', NULL, '01229502', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(210, '2013-07-20', 'ESPINO', 'HERNANDEZ', 'ROQUE', 'JACINTO', '', NULL, '21405508', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(211, '2013-07-20', 'ESPINOZA', 'CARHUACHAGUA', 'OVIDIO', '', '', NULL, '08658585', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(212, '2013-07-20', 'ESPINOZA', 'DE SANCHEZ', 'SILVIA', 'MARIANELLA', '', NULL, '15758120', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(213, '2013-07-20', 'ESPINOZA', 'FERNANDEZ', 'CARLOS', 'APRANIO', '', NULL, '06800802', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(214, '2013-07-20', 'ESPINOZA', 'ROSALES', 'JULIAN', 'PEDRO', '', NULL, '20052056', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(215, '2013-07-20', 'ESPINOZA', 'VIZQUERRA', 'MARIELA', '', '', NULL, '16017477', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(216, '2013-07-20', 'ESQUIVEL', 'GRADOS', 'JOSE', 'THEODULO', '', NULL, '18119520', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(217, '2013-07-20', 'ESTRADA', 'CHOQUE', 'EFRAIN', 'ADEMAR', '', NULL, '08802473', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(218, '2013-07-20', 'ESTUPIÑAN', 'CHUMBES', 'CRISTINA', 'LILLIAN', '', NULL, '15603428', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(219, '2013-07-20', 'ESTUPIÑAN', 'NICHO', 'JESUS', 'EDILBERTO', '', NULL, '15689934', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(220, '2013-07-20', 'EVANGELISTA', 'BENITES', 'VICTOR', 'ANDRES', '', NULL, '17809460', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(221, '2013-07-20', 'FALCON', 'CERNA', 'AIDA', 'NERIDA', '', NULL, '15852942', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(222, '2013-07-20', 'FALCON', 'EVANGELISTA', 'MAXIMA', 'ZOILA', '', NULL, '15582488', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(223, '2013-07-20', 'FARRO', 'LUCAS', 'YSMELDA', '', '', NULL, '15593761', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(224, '2013-07-20', 'FARRO', 'PACIFICO', 'EDWIN', 'IVAN', '', NULL, '15735619', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(225, '2013-07-20', 'FARROMEQUE', 'MEZA', 'MARIA', 'DEL ROSARIO', '', NULL, '15584804', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(226, '2013-07-20', 'FARROÑAN', 'SANTISTEBAN', 'JOSE', 'NATIVIDAD', '', NULL, '17520386', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(227, '2013-07-20', 'FELICIANO', 'AMADO', 'JORGE', 'LUIS', '', NULL, '15598329', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(228, '2013-07-20', 'FELLES', 'LEANDRO', 'DORI', 'UDULIA', '', NULL, '15729545', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(229, '2013-07-20', 'FERNANDEZ', 'BURGOS', 'GILBERTO', 'ENRIQUE', '', NULL, '15613275', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(230, '2013-07-20', 'FERNANDEZ', 'GUZMAN', 'PERFECTA', 'ZOBEIDA', '', NULL, '15582544', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(231, '2013-07-20', 'FERNANDEZ', 'HERRERA', 'FREDESVINDO', '', '', NULL, '40588728', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(232, '2013-07-20', 'FIESTAS', 'URBINA', 'CARLOS', 'JOB', '', NULL, '15581254', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(233, '2013-07-20', 'FIGUEROA', 'REVILLA', 'JORGE', 'MARTIN', '', NULL, '06722809', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(234, '2013-07-20', 'FLORES', 'BRICEÑO', 'RANULFO', '', '', NULL, '17937576', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(235, '2013-07-20', 'FLORES', 'CUETO', 'JUAN', 'JOSE', '', NULL, '09593196', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(236, '2013-07-20', 'FLORES', 'PEREZ', 'EDWIN', 'MOSIAH', '', NULL, '15756408', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(237, '2013-07-20', 'FLORES', 'SALDAÑA', 'OSWALDO', 'FRANCISCO', '', NULL, '15582719', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(238, '2013-07-20', 'FLORES', 'ZUMARAN', 'MARIA', 'SILVIA', '', NULL, '08050332', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(239, '2013-07-20', 'GALINDO', 'SANTIAGO', 'ADOLFO', '', '', NULL, '21857989', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(240, '2013-07-20', 'GALVEZ', 'TORRES', 'EDWIN', 'GUILLERMO', '', NULL, '15592688', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(241, '2013-07-20', 'GALLARDO', 'BAZAN', 'ELADIO', 'CESAR', '', NULL, '17828005', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(242, '2013-07-20', 'GALLEGOS', 'SOLIS', 'CESAR', 'HUMBERTO', '', NULL, '15603691', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(243, '2013-07-20', 'GAMARRA', 'LOPEZ', 'OLGA', 'MARINA', '', NULL, '07929485', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(244, '2013-07-20', 'GARAY', 'GUTIERREZ', 'VICTOR', 'HUGO', '', NULL, '06603414', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(245, '2013-07-20', 'GARAY', 'VALLENAS', 'OSCAR', 'CIRILO', '', NULL, '07225053', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(246, '2013-07-20', 'GARCIA', 'ALOR', 'LUCIANO', 'AMADOR', '', NULL, '15583286', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(247, '2013-07-20', 'GARCIA', 'CANALES', 'LUCY', '', '', NULL, '15715156', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(248, '2013-07-20', 'GARCIA', 'CHAPOÑAN', 'ABRAHAM', 'WILLIAM', '', NULL, '17548877', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(249, '2013-07-20', 'GARCIA', 'PAREDES', 'JOSE', '', '', NULL, '08776986', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(250, '2013-07-20', 'GARCIA', 'VASQUEZ', 'LEA', '', '', NULL, '04063579', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(251, '2013-07-20', 'GARIVAY', 'TORRES', 'FLOR', 'DE MARIA', '', NULL, '15587359', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(252, '2013-07-20', 'GARRIDO', 'OYOLA', 'JOSE', 'ANTONIO', '', NULL, '15725918', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(253, '2013-07-20', 'GAVEDIA', 'GARCIA DE HIJAR', 'GLADYS', 'MARGOT', '', NULL, '15855951', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(254, '2013-07-20', 'GAVIDIA', 'CHAVEZ', 'WILLIAMS', 'GUSTAVO', '', NULL, '15613314', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(255, '2013-07-20', 'GIL', 'QUEVEDO', 'WALTER', 'STALIN', '', NULL, '32384169', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(256, '2013-07-20', 'GIRON', 'GARCIA', 'LUIS', 'ARNALDO', '', NULL, '15605039', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(257, '2013-07-20', 'GIRON', 'NATIVIDAD', 'CARMEN', 'ROSA', '', NULL, '15604206', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(258, '2013-07-20', 'GONZALES', 'AÑORGA', 'CARLOS', 'MAXIMO', '', NULL, '15762004', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(259, '2013-07-20', 'GONZALES', 'BALDEON', 'AUGUSTO', 'CLEMENTE', '', NULL, '06030439', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(260, '2013-07-20', 'GONZALES', 'BUSTAMANTE', 'MARTIN', 'ISMAEL', '', NULL, '15737946', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(261, '2013-07-20', 'GONZALES', 'FERNANDEZ', 'JULIO', 'GREGORIO', '', NULL, '08733880', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(262, '2013-07-20', 'GONZALES', 'RIVERA', 'ALDO', 'WASHINGTON', '', NULL, '15596423', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(263, '2013-07-20', 'GONZALES', 'RIVERA', 'ZILBERT', '', '', NULL, '15604728', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(264, '2013-07-20', 'GONZALES', 'TORRES', 'LUIS', 'ROLANDO', '', NULL, '17835252', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(265, '2013-07-20', 'GONZALEZ', 'ALVA', 'ANTONIO', 'ELIAS', '', NULL, '15610472', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(266, '2013-07-20', 'GONZALEZ', 'CASTILLO', 'AURELIO', 'REMY', '', NULL, '17928957', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(267, '2013-07-20', 'GOÑY', 'AMERI', 'CARLOS', 'FRANCISCO', '', NULL, '15726541', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(268, '2013-07-20', 'GRADOS', 'ALOR', 'MARY', 'LUZ', '', NULL, '15649785', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(269, '2013-07-20', 'GRADOS', 'BAZALAR', 'JOHANN', 'MARTIN', '', NULL, '15763777', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(270, '2013-07-20', 'GUERRA', 'LAZO', 'CAYO', 'EDUARDO', '', NULL, '15615248', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(271, '2013-07-20', 'GUERRERO', 'HURTADO', 'EMMA', 'DEL ROSARIO', '', NULL, '15611490', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(272, '2013-07-20', 'GUERRERO', 'HURTADO', 'FELICIA', 'ANTONIA', '', NULL, '15611948', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(273, '2013-07-20', 'GUERRERO', 'HURTADO', 'JULIO', 'ENRIQUE', '', NULL, '15580855', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(274, '2013-07-20', 'GUERRERO', 'ROMERO', 'RUBEN', '', '', NULL, '15603092', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(275, '2013-07-20', 'GUTIERREZ', 'ASCON', 'JAIME', 'EDUARDO', '', NULL, '17810336', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(276, '2013-07-20', 'GUTIERREZ', 'BRAVO', 'CARLOS', 'ALBERTO', '', NULL, '15616035', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(277, '2013-07-20', 'GUZMAN', 'ESPINOSA', 'MARCO', 'ARTURO', '', NULL, '15612608', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(278, '2013-07-20', 'GUZMAN', 'SANCHEZ', 'WILLIAM', 'ANDRES', '', NULL, '06015776', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(279, '2013-07-20', 'HENRIQUEZ', 'SUAREZ', 'MILAGRO', 'ROSARIO', '', NULL, '15580053', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(280, '2013-07-20', 'HERNANDEZ', 'MOLINA', 'SEGUNDO', 'ABSALON', '', NULL, '15589217', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(281, '2013-07-20', 'HERRERA', 'ASIN', 'MARIO', 'ENRIQUE', '', NULL, '15584318', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(282, '2013-07-20', 'HERRERA', 'DE MACEDO', 'ZOILA', 'FLOR', '', NULL, '15581688', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(283, '2013-07-20', 'HERRERA', 'VEGA', 'HECTOR', 'ALEXIS', '', NULL, '40337667', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(284, '2013-07-20', 'HIJAR', 'DIAZ', 'ROSA', 'MERCEDES', '', NULL, '15609655', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(285, '2013-07-20', 'HIJAR', 'GUZMAN', 'RAYMUNDO', 'JAVIER', '', NULL, '15685212', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(286, '2013-07-20', 'HIJAR', 'TENA', 'ALEJANDRO', '', '', NULL, '15646227', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(287, '2013-07-20', 'HONORIO', 'DURAND', 'ZOILA', 'FELIPA', '', NULL, '10495712', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(288, '2013-07-20', 'HUACHUA', 'HUARANCCA', 'FREDY', 'JAVIER', '', NULL, '15609670', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(289, '2013-07-20', 'HUAMAN', 'TENA', 'ANGEL', '', '', NULL, '15644224', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(290, '2013-07-20', 'HUAMAN', 'TENA', 'NOE', '', '', NULL, '09202515', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(291, '2013-07-20', 'HUARANGA', 'GARCIA', 'VICTOR', 'AUGUSTO', '', NULL, '15601776', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(292, '2013-07-20', 'HUAYNA', 'DUEÑAS', 'LUIS', 'ALBERTO', '', NULL, '06057350', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(293, '2013-07-20', 'HUERTA', 'FALCON', 'WILDER', 'DAVID', '', NULL, '41938161', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(294, '2013-07-20', 'HURTADO', 'POMA', 'JUAN', 'ROLANDO', '', NULL, '21082204', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(295, '2013-07-20', 'HURTADO', 'ZAMORA', 'MARIA', 'MELITTA', '', NULL, '17801831', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(296, '2013-07-20', 'IMAN', 'MENDOZA', 'JAIME', '', '', NULL, '40936175', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(297, '2013-07-20', 'INCA', 'SOLLER', 'ROSA', 'ADRIANA', '', NULL, '07148621', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(298, '2013-07-20', 'INFANTE', 'MARCHAN', 'HUGO', '', '', NULL, '15739367', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(299, '2013-07-20', 'IPANAQUE', 'ROÑA', 'JUAN', 'MANUEL', '', NULL, '32952515', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(300, '2013-07-20', 'JAMANCA', 'ALBERTO', 'TEODORICO', '', '', NULL, '15604418', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(301, '2013-07-20', 'JAUREGUI', 'NONGRADOS', 'NAPOLEON', '', '', NULL, '32853299', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(302, '2013-07-20', 'JAUREGUI', 'PANDAL', 'TONY', 'AURELIO', '', NULL, '07657380', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(303, '2013-07-20', 'JIMENEZ', 'ESCOBEDO', 'MANUEL', 'JOSE', '', NULL, '32793485', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(304, '2013-07-20', 'JIMENEZ', 'FERNANDEZ', 'WILMER', 'MAGNO', '', NULL, '10136141', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(305, '2013-07-20', 'JIMENEZ', 'QUINTEROS', 'GABRIELA', 'MABEL', '', NULL, '15731006', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(306, '2013-07-20', 'JUAN DE DIOS', 'LEON', 'HERNAN', 'ELOY', '', NULL, '15593874', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(307, '2013-07-20', 'JUAREZ', 'MARTINEZ', 'JUAN', 'MIGUEL', '', NULL, '16754186', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(308, '2013-07-20', 'KREDERDT', 'ARAUJO', 'JORGE', 'EDWALD', '', NULL, '08188126', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(309, '2013-07-20', 'LA CRUZ', 'ALPISTE', 'MIGUEL', 'ARTURO', '', NULL, '09273587', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(310, '2013-07-20', 'LA CRUZ', 'AREVALO', 'LUIS', 'ALBERTO', '', NULL, '15612160', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(311, '2013-07-20', 'LA CRUZ', 'BERNAL', 'JAIME', '', '', NULL, '15583923', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(312, '2013-07-20', 'LA CRUZ', 'ORBE', 'SERGIO', '', '', NULL, '40125003', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(313, '2013-07-20', 'LA CRUZ', 'SALVADOR', 'CESAR', 'ANDRES', '', NULL, '15686202', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(314, '2013-07-20', 'LA ROSA', 'CALLE', 'GABRIELA', 'ALCIRA', '', NULL, '15616869', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(315, '2013-07-20', 'LA ROSA', 'FABIAN', 'MARTHA', 'JULIA', '', NULL, '15598381', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(316, '2013-07-20', 'LA ROSA', 'GUEVARA', 'MARIA', 'MAGDALENA', '', NULL, '07682298', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(317, '2013-07-20', 'LA ROSA', 'LINARES', 'LUIS', 'ENRIQUE', '', NULL, '15602589', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(318, '2013-07-20', 'LA ROSA', 'REGALADO', 'ALDO', 'REMIGIO', '', NULL, '40768186', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(319, '2013-07-20', 'LANDAURO', 'VENTOCILLA', 'WILLIAM', 'CARLOS', '', NULL, '15586632', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(320, '2013-07-20', 'LAOS', 'BERNAL', 'ALDO', 'FELIPE', '', NULL, '15614107', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(321, '2013-07-20', 'LAOS', 'FERNANDEZ', 'ELENA', 'LUISA', '', NULL, '15602414', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(322, '2013-07-20', 'LAVALLE', 'PEÑA', 'GUIDO', 'FABIAN', '', NULL, '15725665', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(323, '2013-07-20', 'LAZARO', 'DIOSES', 'JAIME', 'TEODOSIO', '', NULL, '25600263', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(324, '2013-07-20', 'LEANDRO', 'ROCA', 'JAIME', 'DAVID', '', NULL, '15594015', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(325, '2013-07-20', 'LECCA', 'ASCATE', 'DANIEL', '', '', NULL, '15731334', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(326, '2013-07-20', 'LEDEZMA', 'SANTOS', 'TEOFILO', '', '', NULL, '18878433', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(327, '2013-07-20', 'LEGUA', 'CARDENAS', 'JOSE', 'ANTONIO', '', NULL, '08832152', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(328, '2013-07-20', 'LEON', 'HICHPAS', 'ANTOLINA', '', '', NULL, '07662228', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(329, '2013-07-20', 'LEON', 'JULCA', 'MANUEL', 'ANTONIO', '', NULL, '15643515', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(330, '2013-07-20', 'LEON', 'MANRIQUE', 'BRUNILDA', 'EDITH', '', NULL, '15605671', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(331, '2013-07-20', 'LEON', 'VILCA', 'HERMINIA', '', '', NULL, '15722528', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(332, '2013-07-20', 'LEON', 'YOVERA', 'RAMON', '', '', NULL, '15595224', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(333, '2013-07-20', 'LIMACHI', 'QQUESO', 'NILA', 'JUANA', '', NULL, '23991384', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(334, '2013-07-20', 'LINARES', 'CABRERA', 'VICTOR', 'JOSELITO', '', NULL, '15728073', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(335, '2013-07-20', 'LINDO', 'OYOLA', 'HENRY', 'FREDDY', '', NULL, '15692763', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(336, '2013-07-20', 'LINGAN', 'HERNANDEZ', 'VICTOR', 'RAUL', '', NULL, '06194590', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(337, '2013-07-20', 'LINO', 'CHILET', 'GUSTAVO', 'LUIS', '', NULL, '15614077', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(338, '2013-07-20', 'LINO', 'ESCOBAR', 'ERLO', 'WILFREDO', '', NULL, '15608475', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(339, '2013-07-20', 'LINO', 'TORERO', 'YESSICA', 'YULISSA', '', NULL, '15738338', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(340, '2013-07-20', 'LIOO', 'JORDAN DE BALDEOS', 'FLOR', 'DE MARIA', '', NULL, '15612743', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(341, '2013-07-20', 'LIZA', 'DELGADO', 'JUAN', 'JOSE', '', NULL, '08191517', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(342, '2013-07-20', 'LIZARRAGA', 'ZAVALETA', 'BENIGNO', 'BENITO', '', NULL, '08278655', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(343, '2013-07-20', 'LOLOY', 'ANAYA', 'EDUARDO', 'GENARO', '', NULL, '18204094', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(344, '2013-07-20', 'LOPEZ', 'BALAREZO', 'JORGE', 'ADALBERTO', '', NULL, '17928898', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(345, '2013-07-20', 'LOPEZ', 'JIMENEZ', 'ALFREDO', 'EDGAR', '', NULL, '15605331', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(346, '2013-07-20', 'LOZA', 'LANDA', 'ROBERTO', 'CARLOS', '', NULL, '15760787', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(347, '2013-07-20', 'LOZANO', 'VASQUEZ', 'KATHELIN', 'ALEXANDRA', '', NULL, '09637974', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(348, '2013-07-20', 'LUIS', 'OLIVAS', 'DIONICIO', 'BELISARIO', '', NULL, '15651224', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(349, '2013-07-20', 'LUNA', 'GARCIA DE FLORES', 'GLADYS', 'MARINA', '', NULL, '15614163', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(350, '2013-07-20', 'LUNA', 'NEYRA', 'MIGUEL', 'ANGEL', '', NULL, '15707284', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(351, '2013-07-20', 'LUNA', 'SANTOS', 'ANGEL', 'ONZARI', '', NULL, '15595255', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(352, '2013-07-20', 'LLAÑEZ', 'BUSTAMANTE DE ALOR', 'SOLEDAD', 'DIONISIA', '', NULL, '15689024', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(353, '2013-07-20', 'LLERENA', 'DELGADO', 'MERCEDES', 'CARMELA', 'DEL SOCORRO', NULL, '15582575', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(354, '2013-07-20', 'MACAVILCA', 'TICLAYAURI', 'EDWIN', 'ANTONIO', '', NULL, '23015970', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(355, '2013-07-20', 'MACEDO', 'BARRERA', 'EUFEMIO', 'MAGNO', '', NULL, '15612229', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(356, '2013-07-20', 'MACEDO', 'FIGUEROA', 'JULIO', '', '', NULL, '15591634', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(357, '2013-07-20', 'MACEDO', 'FIGUEROA', 'ROMULO', '', '', NULL, '15595922', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(358, '2013-07-20', 'MACEDO', 'ROJAS', 'BENJAMIN', 'ALONSO', 'VANNEVAR', NULL, '15739919', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(359, '2013-07-20', 'MAGUIÑA', 'ARNAO', 'ERNESTO', 'ANDRES', '', NULL, '15617502', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(360, '2013-07-20', 'MAGUIÑA', 'MAZA', 'RUFINO', 'MAXIMO', '', NULL, '15733560', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(361, '2013-07-20', 'MAMANI', 'SALCEDO', 'BERTHA', 'LUZ', '', NULL, '07152414', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(362, '2013-07-20', 'MANDAMIENTO', 'GRADOS', 'ELISEO', 'OMAR', '', NULL, '15760260', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(363, '2013-07-20', 'MANES', 'CANGANA', 'GABRIEL', 'ALBERTO', '', NULL, '40484352', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(364, '2013-07-20', 'MANRIQUE', 'QUIÑONEZ', 'JAVIER', 'ALBERTO', '', NULL, '15646920', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(365, '2013-07-20', 'MARCELO', 'ANGULO', 'NORVINA', 'MARLENA', '', NULL, '15766260', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(366, '2013-07-20', 'MARCELO', 'CASTILLO', 'HENRY', 'WILLIAM', '', NULL, '07801377', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(367, '2013-07-20', 'MARCELO', 'HERRERA', 'MILAGROS', 'DEL PILAR', '', NULL, '15761080', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(368, '2013-07-20', 'MARCELO', 'HUAMAN', 'JUAN', 'SILVINO', '', NULL, '15598024', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(369, '2013-07-20', 'MARCELO', 'RODRIGUEZ', 'LUIS', 'ALFREDO', '', NULL, '15580435', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(370, '2013-07-20', 'MARIN', 'RODRIGUEZ', 'WILLIAM', 'JOEL', '', NULL, '40398872', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(371, '2013-07-20', 'MARQUEZ', 'VALENCIA', 'POLICARPO', 'DIOMEDES', '', NULL, '15759625', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(372, '2013-07-20', 'MARROQUIN', 'CARDENAS', 'CARMEN', 'ANGELINA', '', NULL, '15603673', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(373, '2013-07-20', 'MARTINEZ', 'CHAFALOTE', 'ULISES', 'ROBERT', '', NULL, '15616588', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(374, '2013-07-20', 'MARTINEZ', 'INFANTES', 'PEDRO', 'PABLO', '', NULL, '15590438', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(375, '2013-07-20', 'MARTINEZ', 'LA ROSA', 'FERNANDEZ', 'BERTHA', '', NULL, '15591212', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(376, '2013-07-20', 'MARTINEZ', 'LOLI', 'MARITZA', 'ISABEL', '', NULL, '15606250', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(377, '2013-07-20', 'MARTINEZ', 'NAMAY', 'SEGUNDO', 'ELEODORO', '', NULL, '15604475', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(378, '2013-07-20', 'MATOS', 'PINEDA', 'LUIS', 'ALBERTO', '', NULL, '15612877', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(379, '2013-07-20', 'MAURICIO', 'BARZOLA', 'SULPICIO', 'UBALDO', '', NULL, '07111623', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(380, '2013-07-20', 'MAURICIO', 'GRADOS', 'JOSE', 'ALCIDES', '', NULL, '15686456', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(381, '2013-07-20', 'MAYA', 'SILVA', 'FRANCISCO', 'RODRIGO', '', NULL, '15619198', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(382, '2013-07-20', 'MAZUELOS', 'CARDOZA', 'SERGIO', 'RAFAEL', '', NULL, '15721713', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(383, '2013-07-20', 'MAZUELOS', 'CARDOZO', 'CESAR', 'MARCELINO', '', NULL, '15601335', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(384, '2013-07-20', 'MEDINA', 'SIESQUEN', 'MARIA', 'DEL PILAR', '', NULL, '15761304', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(385, '2013-07-20', 'MEDRANO', 'VERGARA', 'ROMAN', 'PATRICIO', '', NULL, '15581745', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(386, '2013-07-20', 'MEDRANO', 'VIZARRES', 'JULIO', '', '', NULL, '15733973', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(387, '2013-07-20', 'MEJIA', 'DOMINGUEZ', 'CECILIA', 'MAURA', '', NULL, '15636319', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(388, '2013-07-20', 'MEJIA', 'GARCIA', 'JORGE', 'LUIS', '', NULL, '15645059', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(389, '2013-07-20', 'MENDOZA', 'ASCURRA', 'JORGE', 'LUIS', '', NULL, '16654763', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(390, '2013-07-20', 'MENDOZA', 'CRUZ', 'MANUEL', 'ANGEL', '', NULL, '15599141', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(391, '2013-07-20', 'MENDOZA', 'FLORES', 'CRISTIAN', 'MILTON', '', NULL, '16711622', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(392, '2013-07-20', 'MENDOZA', 'NIETO', 'ERONCIO', '', '', NULL, '06723932', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(393, '2013-07-20', 'MENDOZA', 'ROJAS', 'JULIA', '', '', NULL, '06032424', NULL, NULL, '', NULL, NULL, NULL, NULL, '1');
INSERT INTO `tbl_sujeto` (`id_sujeto`, `fecha_registro`, `apellido_paterno`, `apellido_materno`, `primer_nombre`, `segundo_nombre`, `tercer_nombre`, `fecha_nacimiento`, `dni`, `direccion`, `estado_civil`, `sexo`, `telefono_fijo`, `telefono_movil`, `email_institucional`, `email_personal`, `activo`) VALUES
(394, '2013-07-20', 'MENDOZA', 'VIRU', 'CRISTINA', 'BERNARDINA', '', NULL, '15586360', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(395, '2013-07-20', 'MEYHUAY', 'FIDEL', 'JUAN', 'CARLOS', '', NULL, '15681861', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(396, '2013-07-20', 'MEZA', 'AGUIRRE', 'MARIA', 'ROSARIO', '', NULL, '17859377', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(397, '2013-07-20', 'MEZA', 'COLLANTES', 'LUIS', 'EDUARDO', '', NULL, '15607639', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(398, '2013-07-20', 'MEZA', 'MARTEL', 'EDITH', 'TELMA', '', NULL, '15736105', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(399, '2013-07-20', 'MEZA', 'SANTILLAN', 'JUAN', 'JAIME', '', NULL, '15615228', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(400, '2013-07-20', 'MILAN', 'MATTA', 'BARTOLOME', 'EDUARDO', '', NULL, '10536234', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(401, '2013-07-20', 'MILLAN', 'BAZAN', 'CESAR', 'AUGUSTO', '', NULL, '07525127', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(402, '2013-07-20', 'MINAYA', 'GUTIERREZ', 'POMPEYO', '', '', NULL, '15580153', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(403, '2013-07-20', 'MINAYA', 'POZO', 'OLGA', '', '', NULL, '15596233', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(404, '2013-07-20', 'MIRANDA', 'CABRERA', 'DANTON', 'JORGE', '', NULL, '07046189', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(405, '2013-07-20', 'MONTALBAN', 'CHINININ', 'CESAR', 'AGUSTO', '', NULL, '18021555', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(406, '2013-07-20', 'MONTEMAYOR', 'MANTILLA', 'JOSE', 'MIGUEL', '', NULL, '15611342', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(407, '2013-07-20', 'MONTES', 'CARRASCO', 'LAURA', '', '', NULL, '15600925', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(408, '2013-07-20', 'MONZON', 'HOYOS', 'JOSE', 'FELICIANO', '', NULL, '23865029', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(409, '2013-07-20', 'MONZON', 'PESANTES', 'HECTOR', 'CIRO', '', NULL, '06752254', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(410, '2013-07-20', 'MORALES', 'ESCOBAR', 'DELVIS', 'BEDER', '', NULL, '15693113', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(411, '2013-07-20', 'MORALES', 'FARIAS', 'EULOGIO', 'NAPOLEON', '', NULL, '17801417', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(412, '2013-07-20', 'MORALES', 'GALVEZ', 'TELMO', 'RAUL', '', NULL, '15759830', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(413, '2013-07-20', 'MORALES', 'GAMARRA', 'HENRY', 'ANTONIO', '', NULL, '15735709', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(414, '2013-07-20', 'MORENO', 'MANTILLA', 'BENIGNO', 'WALTER', '', NULL, '15741030', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(415, '2013-07-20', 'MORENO', 'RIVERA', 'NORMA', 'ADELA', '', NULL, '06218725', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(416, '2013-07-20', 'MORENO', 'VEGA', 'JOSE', 'LUIS', '', NULL, '15663289', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(417, '2013-07-20', 'MUGURUZA', 'CRISPIN', 'NORMA', 'ELVIRA', '', NULL, '15593678', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(418, '2013-07-20', 'MUÑOZ', 'VILELA', 'ALGEMIRO', 'JULIO', '', NULL, '15736557', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(419, '2013-07-20', 'NARVASTA', 'TORRES', 'ISRAEL', '', '', NULL, '15614197', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(420, '2013-07-20', 'NATIVIDAD', 'HUASUPOMA', 'DELICIAS', 'EUFEMIA', '', NULL, '15740030', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(421, '2013-07-20', 'NATIVIDAD', 'MUÑOZ', 'ROBERT', 'SANDRO', '', NULL, '15726124', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(422, '2013-07-20', 'NAVARRO', 'REQUEJO', 'CARLOS', 'ALBERTO', '', NULL, '15612605', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(423, '2013-07-20', 'NAVARRO', 'ROJAS', 'JUAN', 'EDUARDO', '', NULL, '15958780', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(424, '2013-07-20', 'NERI', 'AYALA', 'ABRAHAN', 'CESAR', '', NULL, '15739625', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(425, '2013-07-20', 'NEYRA', 'CASTILLO', 'JOSE', 'LUIS', '', NULL, '15608512', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(426, '2013-07-20', 'NICHO', 'ALCANTARA', 'JOSE', 'LEONEL', '', NULL, '15740193', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(427, '2013-07-20', 'NICHO', 'CARPIO', 'EDDIE', 'DANIEL', '', NULL, '15756427', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(428, '2013-07-20', 'NICHO', 'VIRU', 'WIGBERTO', 'MARTIN', '', NULL, '15759740', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(429, '2013-07-20', 'NOLE', 'DELGADO', 'JAVIER', 'AUGUSTO', '', NULL, '15759054', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(430, '2013-07-20', 'NOREÑA', 'LUCHO', 'MIRIAM', 'MILAGROS', '', NULL, '15588034', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(431, '2013-07-20', 'NORIEGA', 'CORDOVA', 'HUBERTO', 'WILLIAMS', '', NULL, '18172332', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(432, '2013-07-20', 'NUNJA', 'GARCIA', 'JOSE', 'VICENTE', '', NULL, '15447556', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(433, '2013-07-20', 'NUÑEZ', 'TORREBLANCA', 'RANDOLFO', '', '', NULL, '41577711', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(434, '2013-07-20', 'OBISPO', 'GAVINO', 'ELFER', 'ORLANDO', '', NULL, '15721919', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(435, '2013-07-20', 'OBISPO', 'GAVINO', 'JHON', 'HERBERT', '', NULL, '15728127', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(436, '2013-07-20', 'OCROSPOMA', 'GARAY', 'ALEJANDRO', '', '', NULL, '15587120', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(437, '2013-07-20', 'OCROSPOMA', 'VALDIVIA', 'KATERINE', 'PAMELA', '', NULL, '15737010', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(438, '2013-07-20', 'OLAYA', 'MAZA', 'PEPE', 'FRANCISCO', '', NULL, '15593004', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(439, '2013-07-20', 'ORBEGOSO', 'LOPEZ', 'JOSE', 'SAUL', '', NULL, '06800598', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(440, '2013-07-20', 'ORCON', 'ALIAGA', 'GLORIA', 'VICTORIA', '', NULL, '07111622', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(441, '2013-07-20', 'ORDOÑEZ', 'VILLAORDUÑA', 'CARMEN', 'GULIANA', '', NULL, '40552763', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(442, '2013-07-20', 'ORMEÑO', 'FLORES', 'FELIX', 'GILBERTO', '', NULL, '21410062', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(443, '2013-07-20', 'ORTIZ', 'CHULA', 'DARIELA', '', '', NULL, '09911735', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(444, '2013-07-20', 'OSCUVILCA', 'TAPIA', 'ELSA', 'CARMEN', '', NULL, '15599970', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(445, '2013-07-20', 'OSORIO', 'OSORIO', 'MARIO', 'ALBERTO', '', NULL, '15727491', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(446, '2013-07-20', 'OSSO', 'ARRIZ', 'OSCAR', 'OTILIO', '', NULL, '15584693', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(447, '2013-07-20', 'OTAZU', 'MONTES', 'OSCAR', 'CARLOS', '', NULL, '07260867', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(448, '2013-07-20', 'OVIEDO', 'ALDAVE', 'VICTOR', 'GERONIMO', '', NULL, '08659204', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(449, '2013-07-20', 'PABLO', 'AGAMA', 'CARMEN', 'OLGA', '', NULL, '15605378', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(450, '2013-07-20', 'PACIFICO', 'ZEVALLOS', 'CARLOS', 'ALBERTO', '', NULL, '15739901', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(451, '2013-07-20', 'PACORA', 'CORMAN', 'JORGE', 'GUILLERMO', '', NULL, '15605743', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(452, '2013-07-20', 'PACHECO', 'CHINCHAYAN', 'NELSON', 'ANGEL', '', NULL, '15602060', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(453, '2013-07-20', 'PADILLA', 'DELGADILLO DE RICSE', 'BERNARDITA', 'RUTH', '', NULL, '09073710', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(454, '2013-07-20', 'PAICO', 'PANTA', 'LUZ', 'GASDALY', '', NULL, '15611327', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(455, '2013-07-20', 'PALACIOS', 'MARTINEZ', 'EMILIO', 'AUGUSTO', '', NULL, '15609975', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(456, '2013-07-20', 'PALACIOS', 'RODRIGUEZ', 'BETTY', 'MARTHA', '', NULL, '15619147', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(457, '2013-07-20', 'PALACIOS', 'SERNA', 'RAUL', 'EDUARDO', '', NULL, '15727277', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(458, '2013-07-20', 'PALACIOS', 'SOLANO', 'JACINTO', 'JESUS', '', NULL, '15735645', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(459, '2013-07-20', 'PALOMARES', 'ANSELMO', 'EDISON', 'GOETHE', '', NULL, '15605363', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(460, '2013-07-20', 'PALOMINO', 'GARCIA-MILLA', 'MARCIAL', 'ALCIBIADES', '', NULL, '15614981', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(461, '2013-07-20', 'PALOMINO', 'PEZZUTTI', 'RICARDO', 'RAMIRO', '', NULL, '15600972', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(462, '2013-07-20', 'PALOMINO', 'TIZNADO', 'MAXIMO', 'DARIO', '', NULL, '08719903', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(463, '2013-07-20', 'PALOMINO', 'WAY', 'JORGE', 'ALBERTO', '', NULL, '15599204', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(464, '2013-07-20', 'PANASPAICO', 'MEDINA', 'ANGEL', 'ANTONIO', '', NULL, '15709354', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(465, '2013-07-20', 'PAPA', 'JIMENEZ', 'CLAUDIO', '', '', NULL, '15645385', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(466, '2013-07-20', 'PAREDES', 'AGUIRRE', 'FREDY', 'ROMAN', '', NULL, '15859960', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(467, '2013-07-20', 'PAREDES', 'BOTTONI', 'GERALDINA', 'FORTUNATA', '', NULL, '15596150', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(468, '2013-07-20', 'PAREDES', 'MARTINEZ', 'RUBEN', 'DARIO', '', NULL, '15760212', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(469, '2013-07-20', 'PARRERA', 'ESPINOZA', 'SEGUNDO', 'ALBERTANO', '', NULL, '17990475', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(470, '2013-07-20', 'PATRONI', 'BAZALAR', 'MANUEL', 'ALBERTO', '', NULL, '15594061', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(471, '2013-07-20', 'PEÑA', 'AYUDANTE', 'WILLIAM', 'ROGELIO', '', NULL, '15736189', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(472, '2013-07-20', 'PEÑA', 'CANGA', 'HUGO', 'EDUARDO', '', NULL, '15607951', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(473, '2013-07-20', 'PERALTA', 'AGUILAR', 'LUIS', 'MANUEL', '', NULL, '17939894', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(474, '2013-07-20', 'PEREZ', 'CARRILLO', 'VICTOR', '', '', NULL, '15591068', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(475, '2013-07-20', 'PEREZ', 'HUARANCCA', 'JULIAN', 'ILDEFONSO', '', NULL, '06889185', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(476, '2013-07-20', 'PEREZ', 'PIÑAN', 'EDGAR', 'MANUEL', '', NULL, '40499581', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(477, '2013-07-20', 'PEREZ', 'RAMIREZ', 'JOSE', 'LUIS', '', NULL, '15582348', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(478, '2013-07-20', 'PEREZ', 'TORRES', 'MANUEL', 'ESTEBAN', '', NULL, '08732442', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(479, '2013-07-20', 'PESANTES', 'CALDERON', 'GILBERTH', '', '', NULL, '18163042', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(480, '2013-07-20', 'PESANTES', 'ROJAS', 'CARLOS', 'ROBERTO', '', NULL, '17937958', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(481, '2013-07-20', 'PESTANA', 'URIBE', 'JUAN', 'ENRIQUE', '', NULL, '15942504', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(482, '2013-07-20', 'PICHILINGUE', 'NUÑEZ VDA. DE LIENDO', 'FLOR', 'VICTORIA', '', NULL, '15587017', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(483, '2013-07-20', 'PORRAS', 'LAVALLE', 'RAUL', 'ERNESTO', '', NULL, '06265179', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(484, '2013-07-20', 'PRIETO', 'GARCIA', 'MARIO', 'CLETO', '', NULL, '07931357', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(485, '2013-07-20', 'PUJADA', 'ABAD', 'HILARIO', 'NOBERTO', '', NULL, '15603577', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(486, '2013-07-20', 'QUICHIZ', 'ROMERO', 'ALEXANDER', 'NICOLAS', '', NULL, '15642969', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(487, '2013-07-20', 'QUINTE', 'VILLEGAS', 'APOLINAR', '', '', NULL, '15603661', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(488, '2013-07-20', 'QUISPE', 'COSSIO', 'BRAULIO', 'TEODOCIO', '', NULL, '07197873', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(489, '2013-07-20', 'QUISPE', 'OJEDA', 'TEODOSIO', 'CELSO', '', NULL, '20022994', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(490, '2013-07-20', 'QUISPE', 'SOTO', 'EDDY', 'IVAN', '', NULL, '15760232', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(491, '2013-07-20', 'QUISPEALAYA', 'BONELLY', 'TEODORO', 'TEOFANES', '', NULL, '07088603', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(492, '2013-07-20', 'RAMIREZ', 'GOMEZ', 'JAVIER', 'HONORATO', '', NULL, '15611298', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(493, '2013-07-20', 'RAMIREZ', 'LA ROSA', 'GUILLERMO', '', '', NULL, '15595257', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(494, '2013-07-20', 'RAMIREZ', 'MUNDACA', 'FLOR', 'EONICE', '', NULL, '09930052', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(495, '2013-07-20', 'RAMIREZ', 'VIENA', 'LINDER', '', '', NULL, '17907720', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(496, '2013-07-20', 'RAMOS', 'GONZALES', 'MARCIAL', '', '', NULL, '15588690', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(497, '2013-07-20', 'RAMOS', 'LA ROSA', 'PATRICIA', 'ELENA', '', NULL, '42929056', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(498, '2013-07-20', 'RAMOS', 'MANRIQUE', 'JUAN', 'ERNESTO', '', NULL, '15647647', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(499, '2013-07-20', 'RAMOS', 'MURPHY', 'JENNER', 'RICARDO', '', NULL, '15598868', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(500, '2013-07-20', 'RAMOS', 'PACHECO', 'HAYDEE', 'DEL ROSARIO', '', NULL, '15612688', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(501, '2013-07-20', 'RAMOS', 'PACHECO', 'RONALD', 'LUIS', '', NULL, '15615274', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(502, '2013-07-20', 'RAMOS', 'RAMIREZ', 'RAUL', 'DANIEL', '', NULL, '15596063', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(503, '2013-07-20', 'RAMOS', 'Y YOVERA', 'SANTIAGO', 'ERNESTO', '', NULL, '15697556', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(504, '2013-07-20', 'RAVINES', 'MIRANDA', 'SANTIAGO', 'PEDRO', '', NULL, '17837748', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(505, '2013-07-20', 'REQUEJO', 'RIVERA', 'LUIS', 'EMILIO', '', NULL, '15587466', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(506, '2013-07-20', 'RESURRECCION', 'HUERTAS', 'JUAN', 'ZENON', '', NULL, '15644136', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(507, '2013-07-20', 'RETUERTO', 'BUSTAMANTE', 'FILMO', 'EULOGIO', '', NULL, '15588730', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(508, '2013-07-20', 'REVILLA', 'MARREROS', 'MIGUEL', 'ANGEL', '', NULL, '09741027', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(509, '2013-07-20', 'REYES', 'ULFE', 'FIDEL', 'ALBERTO', '', NULL, '15632620', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(510, '2013-07-20', 'REYES', 'ULFE', 'JUAN', 'CARLOS', '', NULL, '15622453', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(511, '2013-07-20', 'RICSE', 'VILLAR', 'JESUS', 'JUAN MASIAS', '', NULL, '10174588', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(512, '2013-07-20', 'RIOS', 'COLAN', 'AURORA', 'ALEJANDRINA', '', NULL, '15951273', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(513, '2013-07-20', 'RIOS', 'PEREZ', 'ISIDRO', 'JAVIER', '', NULL, '15648944', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(514, '2013-07-20', 'RIOS', 'SALAZAR', 'PEDRO', 'MARTIN', '', NULL, '15591709', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(515, '2013-07-20', 'RIVERA', 'JIMENEZ', 'SILVIO', 'MIGUEL', '', NULL, '15724463', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(516, '2013-07-20', 'RIVERA', 'MINAYA', 'YANETH', 'MARLUBE', '', NULL, '15735300', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(517, '2013-07-20', 'RIVERA', 'MORALES', 'LUIS', 'ARSENIO', '', NULL, '15611049', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(518, '2013-07-20', 'RODRIGUEZ', 'ALEGRE', 'LINO', 'ROLANDO', '', NULL, '06535058', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(519, '2013-07-20', 'RODRIGUEZ', 'CARRANZA', 'JAIME', 'ANDRES', '', NULL, '18071883', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(520, '2013-07-20', 'RODRIGUEZ', 'ESPINOZA', 'RONALD', 'FERNANDO', '', NULL, '18222946', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(521, '2013-07-20', 'RODRIGUEZ', 'GELDRES', 'JUAN', 'JULIO', '', NULL, '17900238', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(522, '2013-07-20', 'RODRIGUEZ', 'NUÑEZ', 'JOSE', 'LUIS', '', NULL, '15739966', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(523, '2013-07-20', 'RODRIGUEZ', 'PERAUNA', 'ENRIQUE', 'MARCOS', '', NULL, '06055267', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(524, '2013-07-20', 'RODRIGUEZ', 'VIGIL', 'EDDY', 'GILBERTO', '', NULL, '06124371', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(525, '2013-07-20', 'ROJAS', 'ALVARADO', 'ALBERTO', '', '', NULL, '08953616', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(526, '2013-07-20', 'ROJAS', 'CABRERA', 'MIGUEL', '', '', NULL, '46615928', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(527, '2013-07-20', 'ROJAS', 'CARRANZA', 'HUGO', 'TEODORO', '', NULL, '15609856', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(528, '2013-07-20', 'ROJAS', 'GARRIDO', 'LESVY', 'CELINDA', '', NULL, '15647280', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(529, '2013-07-20', 'ROJAS', 'PAICO', 'VICENTE', 'DAVID', '', NULL, '15592667', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(530, '2013-07-20', 'ROJAS', 'PAZ', 'JORGE', 'LUIS', '', NULL, '16698556', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(531, '2013-07-20', 'ROJAS', 'RIVERA', 'ETELVINA', 'BELINDA', '', NULL, '15698459', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(532, '2013-07-20', 'ROJAS', 'RIVERA', 'PAULINA', 'CELINA', '', NULL, '15695019', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(533, '2013-07-20', 'ROJAS', 'ZAVALETA', 'EVA', 'JESUS', '', NULL, '32770050', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(534, '2013-07-20', 'ROJAS', 'ZENOZAIN', 'CARMEN', 'EUFEMIA', '', NULL, '15591287', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(535, '2013-07-20', 'ROMAN', 'BUSTINZA', 'LITA', '', '', NULL, '23860603', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(536, '2013-07-20', 'ROMERO', 'ALVA', 'HECTOR', 'FLORENCIO', '', NULL, '15756922', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(537, '2013-07-20', 'ROMERO', 'BOZZETTA', 'JOSE', 'LUIS', '', NULL, '15581525', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(538, '2013-07-20', 'ROMERO', 'CAMARENA', 'HECTOR', '', '', NULL, '15757045', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(539, '2013-07-20', 'ROMERO', 'HERBOZO', 'EFRAIN', 'NICOLAS', '', NULL, '15580070', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(540, '2013-07-20', 'ROMERO', 'HERBOZO', 'JORGE', 'HORACIO', '', NULL, '15609900', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(541, '2013-07-20', 'ROMERO', 'HERBOZO', 'NIDIA', 'ELENA', '', NULL, '15590319', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(542, '2013-07-20', 'ROMERO', 'MINAYA', 'ELIZABETH', 'DEL CARMEN', '', NULL, '41775608', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(543, '2013-07-20', 'ROMERO', 'ORTIZ', 'MAXIMO', '', '', NULL, '15603574', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(544, '2013-07-20', 'ROMERO', 'VILLAVICENCIO', 'ALEJANDRO', 'HUMBERTO', '', NULL, '15610969', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(545, '2013-07-20', 'ROMERO', 'ZULOETA', 'ROCIO', 'DEL CARMEN', '', NULL, '16689212', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(546, '2013-07-20', 'ROSADIO', 'BERNAL', 'RAUL', '', '', NULL, '15614940', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(547, '2013-07-20', 'ROSALES', 'HUASUPOMA', 'LUPITA', 'DORILA', '', NULL, '15690845', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(548, '2013-07-20', 'RUBIO', 'RIVERA', 'RAMIRO', 'EDUARDO', '', NULL, '06728234', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(549, '2013-07-20', 'RUEDA', 'BAZALAR', 'ZOILA', 'GREGORIA', '', NULL, '15594933', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(550, '2013-07-20', 'RUIZ', 'HUARAZ', 'CARLOS', 'BERNARDINO', '', NULL, '06690483', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(551, '2013-07-20', 'RUIZ', 'SANCHEZ', 'BERARDO', 'BEDER', '', NULL, '31602007', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(552, '2013-07-20', 'SAAVEDRA', 'ALVARADO', 'TEDDY', 'WILLIAM', '', NULL, '10312185', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(553, '2013-07-20', 'SAAVEDRA', 'SAAVEDRA', 'JULIO', 'ALBERTO', '', NULL, '15593440', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(554, '2013-07-20', 'SALAS', 'REYNOSO', 'BENIGNO', 'ROLANDO', '', NULL, '07662408', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(555, '2013-07-20', 'SALAZAR', 'HUAPALLA', 'FELIX', 'ERNESTO', '', NULL, '06695870', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(556, '2013-07-20', 'SALAZAR', 'MEZA', 'ROBERT', '', '', NULL, '09527972', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(557, '2013-07-20', 'SALAZAR', 'SANTIBAÑEZ', 'ALEJANDRO', 'MANUEL', '', NULL, '15592485', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(558, '2013-07-20', 'SALCEDO', 'MEZA', 'MAXIMO', 'TOMAS', '', NULL, '15602588', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(559, '2013-07-20', 'SALCEDO', 'RODRIGUEZ', 'MEDALIT', 'NIEVES', '', NULL, '15761015', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(560, '2013-07-20', 'SALDANA', 'ROJAS', 'JUAN', '', '', NULL, '05254273', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(561, '2013-07-20', 'SALVADOR', 'ZURITA', 'MOISES', '', '', NULL, '15739263', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(562, '2013-07-20', 'SAMANAMU', 'MARZAL', 'CESAR', 'FELIX', '', NULL, '15689217', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(563, '2013-07-20', 'SAMANIEGO', 'DAVILA', 'MANUEL', 'WILFREDO', '', NULL, '06972102', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(564, '2013-07-20', 'SANCHEZ', 'ALIAGA', 'MANUEL', 'RODOLFO', '', NULL, '15582150', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(565, '2013-07-20', 'SANCHEZ', 'GARCIA', 'ELVIS', 'RICHAR', '', NULL, '15736456', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(566, '2013-07-20', 'SANCHEZ', 'GUZMAN', 'ALBERTO', 'IRHAAM', '', NULL, '15758117', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(567, '2013-07-20', 'SANCHEZ', 'GUZMAN', 'JORGE', 'ANTONIO', '', NULL, '17829652', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(568, '2013-07-20', 'SANCHEZ', 'LUJAN', 'GUILLERMO', 'ALEJANDRO', '', NULL, '15759832', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(569, '2013-07-20', 'SANCHEZ', 'NEYRA', 'JAVIER', 'IVAN', '', NULL, '15766105', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(570, '2013-07-20', 'SANDOVAL', 'PINEDO', 'HENRY', 'KEPPLER', '', NULL, '07962521', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(571, '2013-07-20', 'SANJINEZ', 'SALAZAR', 'JOVIAN', 'VALENTIN', '', NULL, '00360109', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(572, '2013-07-20', 'SANTA CRUZ', 'ALVITES', 'JORGE', 'ISRAEL', '', NULL, '15736009', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(573, '2013-07-20', 'SANTOS', 'BAZO', 'JUAN', 'MANUEL', '', NULL, '15604250', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(574, '2013-07-20', 'SANTOS', 'PALOMINO DE RODRIGUEZ', 'ESPERANZA', '', '', NULL, '15740043', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(575, '2013-07-20', 'SANTOS', 'REYES', 'MARTIN', 'MANUEL', 'DAJHALMAN', NULL, '07220895', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(576, '2013-07-20', 'SARMIENTO', 'RAMOS', 'JUAN', 'MARIO', '', NULL, '07940729', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(577, '2013-07-20', 'SEGAMI', 'SALAZAR', 'GABRIEL', 'HUGO', '', NULL, '10321703', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(578, '2013-07-20', 'SERPA', 'ROJAS', 'FABIOLA', '', '', NULL, '15657970', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(579, '2013-07-20', 'SERRANO', 'RODAS', 'HUGO', '', '', NULL, '15587946', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(580, '2013-07-20', 'SIFUENTES', 'DAMIAN', 'ANIBAL', 'PANTALEON', '', NULL, '17920352', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(581, '2013-07-20', 'SIFUENTES', 'DAMIAN', 'PABLO', 'ALFREDO', '', NULL, '15614097', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(582, '2013-07-20', 'SILVA', 'CUBAS', 'BRITALDO', '', '', NULL, '10534130', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(583, '2013-07-20', 'SILVA', 'SANCHEZ', 'MIGUEL', 'WILLIAM', '', NULL, '15615449', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(584, '2013-07-20', 'SILVA', 'TOLEDO', 'VICTOR', 'LUIS', '', NULL, '15592432', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(585, '2013-07-20', 'SIPAN', 'CHIONG', 'OSCAR', 'DE LA CRUZ', '', NULL, '15686833', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(586, '2013-07-20', 'SIPAN', 'VALERIO', 'GUSTAVO', 'AUGUSTO', '', NULL, '15612829', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(587, '2013-07-20', 'SOLANO', 'ARMAS', 'TIMOTEO', '', '', NULL, '15605375', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(588, '2013-07-20', 'SOLANO', 'LUNA', 'JORGE', 'HUGO', '', NULL, '15590471', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(589, '2013-07-20', 'SOLANO', 'TIMOTEO', 'MARIA', 'LUISA', 'SOCORRO', NULL, '15756630', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(590, '2013-07-20', 'SOLARI', 'VARGAS', 'JOSE', 'ALBERTO', '', NULL, '15594088', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(591, '2013-07-20', 'SOSA', 'HIJAR', 'WALTER', 'JESUS', '', NULL, '15605030', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(592, '2013-07-20', 'SOSA', 'PALOMINO', 'ALCIBIADES', 'FLAMENCIO', '', NULL, '15610364', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(593, '2013-07-20', 'SOTO', 'AGREDA', 'DANNY', 'EDGARDO', '', NULL, '10171874', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(594, '2013-07-20', 'SOTO', 'LA ROSA', 'JOSE', 'GERMAN', '', NULL, '15649269', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(595, '2013-07-20', 'SUAREZ', 'ALMEIRA', 'MIGUEL', 'ANGEL', '', NULL, '15646696', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(596, '2013-07-20', 'SUAREZ', 'ALVARADO', 'EDWIN', 'EFRAIN', '', NULL, '08336034', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(597, '2013-07-20', 'SUAREZ', 'GUZMAN', 'BASILIO', '', '', NULL, '15730857', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(598, '2013-07-20', 'SUQUILANDA', 'FLORES', 'CARLOS', 'OVERTI', '', NULL, '06928374', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(599, '2013-07-20', 'SUSANIBAR', 'GONZALES', 'ANTONIA', '', '', NULL, '15605770', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(600, '2013-07-20', 'SUSANIBAR', 'HOCES', 'TEOBALDO', 'NOREÑO', '', NULL, '15688490', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(601, '2013-07-20', 'SUSANIBAR', 'RAMIREZ', 'EDGAR', 'TITO', '', NULL, '15647568', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(602, '2013-07-20', 'TABOADA', 'RODRIGUEZ', 'ROGGER', 'ABEL', '', NULL, '18004765', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(603, '2013-07-20', 'TAGLE', 'LOSTAUNAU', 'ISABEL', 'BEATRIZ', '', NULL, '07605675', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(604, '2013-07-20', 'TAMARIZ', 'GRADOS', 'NELLY', 'NORMA', '', NULL, '15596612', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(605, '2013-07-20', 'TAPIA', 'GALVEZ', 'ANDRES', '', '', NULL, '15590903', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(606, '2013-07-20', 'TELLO', 'ALARCON', 'VICTOR', 'ISRAEL', '', NULL, '15707428', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(607, '2013-07-20', 'TELLO', 'PANDAL', 'NILO', '', '', NULL, '15605059', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(608, '2013-07-20', 'TELLO', 'RODRIGUEZ', 'ENRIQUE', 'FERNANDO', '', NULL, '15759426', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(609, '2013-07-20', 'TIPISMANA', 'NEYRA', 'ORLANDO', '', '', NULL, '41105369', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(610, '2013-07-20', 'TOLEDO', 'ACOSTA', 'HECTOR', 'HUGO', '', NULL, '40254535', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(611, '2013-07-20', 'TOLEDO', 'SOSA', 'JOSE', 'ALONSO', '', NULL, '80302533', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(612, '2013-07-20', 'TORO', 'DEXTRE', 'ELISEO', '', '', NULL, '07786573', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(613, '2013-07-20', 'TORRES', 'CORCINO', 'EDELMIRA', '', '', NULL, '15649132', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(614, '2013-07-20', 'TORRES', 'CORCINO', 'EDITH', '', '', NULL, '15647759', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(615, '2013-07-20', 'TORRES', 'JAURI', 'PEDRO', 'SANTIAGO', '', NULL, '15591681', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(616, '2013-07-20', 'TORRES', 'JUNCO', 'PAULINA', 'ROSARIO', 'DEL PILAR', NULL, '15607717', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(617, '2013-07-20', 'TORRES', 'LOPEZ', 'WENDEY', 'ISOLINA', '', NULL, '15763685', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(618, '2013-07-20', 'TORRES', 'MEJIA', 'OSCAR', 'SANTIAGO', '', NULL, '08726728', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(619, '2013-07-20', 'TORRES', 'PEREZ', 'FELIX', '', '', NULL, '15643756', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(620, '2013-07-20', 'TORRES', 'VASQUEZ', 'INOCENCIO', 'GODOFREDO', '', NULL, '07824367', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(621, '2013-07-20', 'TREJO', 'DE RIOS', 'MIRTHA', 'SUSSAN', '', NULL, '32812343', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(622, '2013-07-20', 'UGARTE', 'MEDINA', 'MARIA', 'ARANZAZU', '', NULL, '15604936', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(623, '2013-07-20', 'URIBE', 'BARRETO', 'ALFONZO', 'EMILIO', '', NULL, '08100702', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(624, '2013-07-20', 'UTIA', 'PINEDO DE DAVILA', 'MARIA', 'DEL ROSARIO', '', NULL, '07922793', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(625, '2013-07-20', 'VALDEZ', 'ARROYO', 'FRANCISCO', '', '', NULL, '15584437', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(626, '2013-07-20', 'VALENCIA', 'BARDALES', 'JULIO', 'CESAR', '', NULL, '15608608', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(627, '2013-07-20', 'VALENZUELA', 'MUÑOZ', 'ALBERTO', '', '', NULL, '15593785', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(628, '2013-07-20', 'VALENZUELA', 'NARVAEZ', 'DANIEL', 'ALBERTO', 'OSWALDO', NULL, '15724937', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(629, '2013-07-20', 'VALVERDE', 'CORAL', 'FLORINDA', 'ADELAIDA', '', NULL, '06202160', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(630, '2013-07-20', 'VALVERDE', 'FLORES', 'COSME', 'ULISES', '', NULL, '17815214', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(631, '2013-07-20', 'VALLADARES', 'CELI', 'MARINO', '', '', NULL, '15584774', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(632, '2013-07-20', 'VALLADARES', 'VERGARA', 'EDGAR', 'IVAN', '', NULL, '15606301', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(633, '2013-07-20', 'VALLADOLID', 'FACIO', 'BENITO', '', '', NULL, '06224158', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(634, '2013-07-20', 'VASQUEZ', 'ARISTIZABAL', 'ARMANDO', 'EDGARDO', '', NULL, '15666916', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(635, '2013-07-20', 'VASQUEZ', 'CLAVO', 'GUILLERMO', 'NAPOLEON', '', NULL, '06100596', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(636, '2013-07-20', 'VASQUEZ', 'ESTELA', 'DARIO', 'ESTANISLAO', '', NULL, '10532648', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(637, '2013-07-20', 'VASQUEZ', 'MEDINA', 'PEDRO', 'JAMES', '', NULL, '16562688', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(638, '2013-07-20', 'VASQUEZ', 'MORANTE', 'PABLO', 'FERNANDO', '', NULL, '15580912', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(639, '2013-07-20', 'VASQUEZ', 'SILVA', 'LUIS', 'ALBERTO', '', NULL, '07441232', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(640, '2013-07-20', 'VASQUEZ', 'TREJO', 'CESAR', 'WILFREDO', '', NULL, '15714311', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(641, '2013-07-20', 'VEGA', 'PEREDA', 'NICANOR', 'MANUEL', '', NULL, '32988063', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(642, '2013-07-20', 'VEGA', 'VILCA', 'JAIME', 'FERNANDO', '', NULL, '07077044', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(643, '2013-07-20', 'VEGA', 'VILCA', 'JOSE', 'MANUEL', '', NULL, '15596219', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(644, '2013-07-20', 'VEGA', 'VILLANUEVA', 'ELEAZAR', 'LIZARDO', '', NULL, '06036222', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(645, '2013-07-20', 'VELASQUEZ', 'CORDOVA', 'WALTER', 'CARLOS', '', NULL, '15735513', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(646, '2013-07-20', 'VELASQUEZ', 'GAMARRA', 'JULIA', 'DELIA', '', NULL, '15594110', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(647, '2013-07-20', 'VELASQUEZ', 'OYOLA', 'MARGARITA', 'BETZABE', '', NULL, '15610900', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(648, '2013-07-20', 'VELASQUEZ', 'VERGARA', 'CARLOMAGNO', 'RONALD', '', NULL, '08471692', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(649, '2013-07-20', 'VELIZ', 'MONTES', 'HUGO', 'ALEJANDRO', '', NULL, '15582752', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(650, '2013-07-20', 'VELLON', 'FLORES DE SOLANO', 'VIVIANA', 'INES', '', NULL, '15596783', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(651, '2013-07-20', 'VERANO', 'CONDE', 'MARIO', 'ALCIDES', '', NULL, '15614400', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(652, '2013-07-20', 'VERASTEGUI', 'PAREDES', 'CESAR', 'RAUL', '', NULL, '06712420', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(653, '2013-07-20', 'VERGARA', 'EVANGELISTA', 'CARINA', 'RITA', '', NULL, '15727047', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(654, '2013-07-20', 'VERGARA', 'GUADALUPE', 'CLIMACO', 'MARCELINO', '', NULL, '15598776', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(655, '2013-07-20', 'VERGARA', 'GUADALUPE', 'POMPEYO', 'PRISCILIANO', '', NULL, '15594196', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(656, '2013-07-20', 'VILCHEZ', 'CHUMACERO', 'RICARDO', '', '', NULL, '03590086', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(657, '2013-07-20', 'VILCHEZ', 'JAIME', 'ROSA', 'MERCEDES', '', NULL, '15739512', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(658, '2013-07-20', 'VILLAFUERTE', 'CASTRO', 'DELIA', 'VIOLETA', '', NULL, '15744241', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(659, '2013-07-20', 'VILLANUEVA', 'RODRIGUEZ', 'TEODORICO', 'ANGEL', '', NULL, '15611093', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(660, '2013-07-20', 'VILLARREAL', 'RODRIGUEZ', 'HUMBERTO', 'GUILLERMO', '', NULL, '15606903', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(661, '2013-07-20', 'YABAR', 'RAYO', 'JULIA', 'MARIA', '', NULL, '15601849', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(662, '2013-07-20', 'YANAPA', 'ZENTENO', 'OSCAR', 'RUPERTO', 'EZEQUIEL', NULL, '15590442', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(663, '2013-07-20', 'YENGLE', 'RUIZ', 'MIGUEL', 'HERNAN', '', NULL, '18073658', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(664, '2013-07-20', 'YOPLACK', 'ZUMAETA', 'DELMAN', '', '', NULL, '18182694', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(665, '2013-07-20', 'ZAPATA', 'DE LA CRUZ', 'GRICERIA', 'MARIA', '', NULL, '41221768', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(666, '2013-07-20', 'ZAPATA', 'VILLAR', 'LOYO', 'PEPE', '', NULL, '10538371', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(667, '2013-07-20', 'ZAVALA', 'SANTOS', 'ALIAM', '', '', NULL, '15723990', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(668, '2013-07-20', 'ZAVALETA', 'SOTELO', 'DALILA', 'INOCENTA', '', NULL, '15841151', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(669, '2013-07-20', 'ZELADA', 'MENDOZA', 'CESAR', 'AUGUSTO', '', NULL, '15610237', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(670, '2013-07-20', 'ZELADA', 'NAVARRO', 'TORIBIA', 'SUSANA', '', NULL, '15611903', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(671, '2013-07-20', 'ZUBIETA', 'NUÑEZ', 'FILOMENO', '', '', NULL, '08297009', NULL, NULL, '', NULL, NULL, NULL, NULL, '1'),
(672, '2013-07-20', 'ZUÑIGA', 'ROJAS', 'MARCELO', 'GUMERCINDO', '', NULL, '15728921', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(673, '2013-07-20', 'SANTOS', 'ARCE', 'JIMMY', 'ALONSO', '', NULL, '42154689', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(674, '2013-07-20', 'OCROSPOMA', 'DUEÑAS', 'ROBERT', 'WILLIAM', '', NULL, '15728953', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(675, '2013-07-20', 'JARA', 'RAMOS', 'JOE', 'ROLAND', '', NULL, '15740686', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(676, '2013-07-20', 'FABIAN', 'PAULINO', 'HELMUTH', '', '', NULL, '42371273', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(677, '2013-07-20', 'BARRETO', 'MEZA', 'ABRAHAM', '', '', NULL, '15595947', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(678, '2013-07-20', 'GUEVARA', 'WINTONG', 'JONATHAN', 'DAVID', '', NULL, '43994308', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(679, '2013-07-20', 'LUNA', 'SANTOS', 'JUAN ', 'CARLOS', '', NULL, '15723552', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(680, '2013-07-20', 'GERONIMO', 'FERNANDEZ', 'JUDITH', 'ADRIANA', '', NULL, '43741424', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(681, '2013-07-20', 'COLLANTES', 'SAAVEDRA', 'ANTONIO', 'JOSUE', '', NULL, '43789244', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(682, '2013-07-20', 'ERASO', 'CAMACHO', 'MILTON', '', '', NULL, '22222222', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(683, '2013-07-20', 'CONCEPCION', 'URTEAGA', 'GILMER', 'RAMIRO', '', NULL, '18855990', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(684, '2013-07-20', 'PACHECO', 'MARCOS', 'HENRY', 'ARTURO', '', NULL, '15609271', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(685, '2013-07-20', 'ZAPATA', 'SOTO', 'MIGUEL', 'ARNALDO', '', NULL, '06721020', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(686, '2013-07-20', 'ALEMAN', 'CRUZ', 'CELODONIO', '', '', NULL, '15723366', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(691, '2013-07-20', 'PACHECO', 'ROMERO', 'MARIA', 'ELENA', '', NULL, '40252146', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(692, '2013-07-20', 'ESPINOZA', 'FLORES', 'LUIS', '', '', NULL, '11111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(693, '2013-07-20', 'PALOMARES', 'ROSALES', 'MARITZA', '', '', NULL, '99999999', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(694, '2013-07-20', 'MORENO', 'JARA', 'JORGE', '', '', NULL, '15595533', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(695, '2013-07-20', 'CUELLAR', 'CAMARENA', 'TANIA', 'ZAYDA', '', NULL, '41073428', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(696, '2013-07-20', 'BALTUANO', 'RUIZ', 'AMPARO', 'LEONOR', '', NULL, '15657371', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(697, '2013-07-20', 'BAZALAR', 'EVANGELISTA', 'LUIS', 'ARTURO', '', NULL, '15728604', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(698, '2013-07-20', 'SIFUENTES', 'ZORRILLA', 'MARIO', 'ALEJANDRO', '', NULL, '15846985', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(699, '2013-07-20', 'RACACHA', 'VALLADARES', 'EFRAIN', 'SERGIO', '', NULL, '15612295', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(700, '2013-07-20', 'BEJAR', 'MANRIQUE', 'EDGAR', 'CLAUDIO', '', NULL, '15603641', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(701, '2013-07-20', 'VALERIO', 'HARO', 'FÉLIX', 'JULIÁN', '', NULL, '123456', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(702, '2013-07-20', 'PACHECO', 'CLAROS', 'LEMUEL', '', '', NULL, '1465489', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(703, '2013-07-20', 'EYZAGUIRRE', 'LAGOS', 'CARLOS', 'RICARDO', '', NULL, '87646549', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(704, '2013-07-20', 'VASQUEZ', 'MARQUEZ', 'NORMA', 'CELINDA', '', NULL, '15610157', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(705, '2013-07-20', 'CÁCERES', 'COZ', 'LUZ', 'MARIANELA', '', NULL, '40534860', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(706, '2013-07-20', 'DIAZ', 'GÓMEZ', 'JUAN', 'EDILBERTO', '', NULL, '15589865', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(707, '2013-07-20', 'MIRANDA', 'QUISPE', 'GUILLERMO', 'RENEE', '', NULL, '15648110', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(708, '2013-07-20', 'CERDAN', 'CRUZADO', 'CESAR', '', '', NULL, '06262334', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(709, '2013-07-20', 'CARMONA', 'RIVERA', 'MARIA', 'IRIS', '', NULL, '15593687', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(710, '2013-07-20', 'YARLEQUE', 'WONG', 'JUANA', 'MARÍA', '', NULL, '15996593', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(711, '2013-07-20', 'SÁNCHEZ', 'JARA', 'CESAR', 'CHRISTIAN', '', NULL, '15865076', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(712, '2013-07-20', 'LUCERO', 'FRANCISCO', 'DELFINA', 'LUCIA', '', NULL, '15720093', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(713, '2013-07-20', 'MORA', 'MORALES', 'MANUEL', 'ALFREDO', '', NULL, '41378310', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(714, '2013-07-20', 'DE PAZ', 'LAZARO', 'ANA', 'CECILIA', '', NULL, '15862643', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(715, '2013-07-20', 'CARRASCAL', 'CASTRO', 'SARA', 'LOURDES', '', NULL, '15760495', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(716, '2013-07-20', 'BASILIO', 'LOVATÓN', 'EDWAR', 'DANIEL', '', NULL, '15648773', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(717, '2013-07-20', 'RICSE', 'PADILLA', 'MARIA', 'ELENA', '', NULL, '45648786', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(718, '2013-07-20', 'BRAVO', 'GRANADOS', 'JORGE', '', '', NULL, '54987954', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(719, '2013-07-20', 'REQUENA', 'GARCIA', 'MARIA DEL ROSARIO', '', '', NULL, '08684196', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(720, '2013-07-20', 'ULLOA', 'JUARES', 'CESAR', 'EMILIO', '', NULL, '15857962', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(721, '2013-07-20', 'LOZA', 'ROSADIO', 'FÉLIX', 'MOISES', '', NULL, '15594052', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(722, '2013-07-20', 'TORRES', 'CALDERÓN', 'ALEX', 'FIDEL', '', NULL, '1254678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(723, '2013-07-20', 'ROJAS', 'CARRILLO', 'LESVY', '', '', NULL, '11111111', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(724, '2013-07-20', 'PARIHUAMAN', 'QUINDE', 'GERALDINA ', 'REBECA', '', NULL, '11111111', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(725, '2013-07-20', 'LUQUE', 'RAFAEL', 'FLORENCIO', '', '', NULL, '29295419', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(726, '2013-07-20', 'FERNANDEZ', 'CHAFLOQUE', 'MIGUEL', 'ANGEL', '', NULL, '12345433', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(727, '2013-07-20', 'CHANGANA ', 'GARCIA', 'MANUEL', '', '', NULL, '11212212', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(728, '2013-07-20', 'CRONELIO', 'ABAD', 'SAMUEL', 'LUCIO', '', NULL, '15602781', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(729, '2013-07-20', 'CORNELIO', 'ABAD', 'SAMUEL', 'LUCIO', '', NULL, '15602781', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(730, '2013-07-20', 'VARGAS', 'MAGUIÑA', 'TEOFILO', 'TOMAS', '', NULL, '15689353', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(731, '2013-07-20', 'PINCO', 'HUAMAN', 'DIGNA', '', '', NULL, '12121212', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(732, '2013-07-20', 'BRONCANO', 'TORRES', 'JUAN', 'CARLOS', '', NULL, '15861538', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(733, '2013-07-20', 'LUNA', 'ROMERO', 'JUAN', 'TRINIDAD', '', NULL, '15732420', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(734, '2013-07-20', 'CASTAÑEDA', 'SAMANAMU', 'MIGURL', 'A.', '', NULL, '15726159', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(735, '2013-07-20', 'ESPINOZA', 'PAJUELO', 'JULIET', 'KARIN', '', NULL, '00000000', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(736, '2013-07-20', 'CHINGA', 'RAMOS', 'CARLOS', 'ENRIQUE', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(737, '2013-07-20', 'FERRER', 'SOLORZANO ', 'PERCY', 'OMAR', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(738, '2013-07-20', 'TERRONES', 'GÁLVEZ', 'EDWARD', '', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(739, '2013-07-20', 'MANRIQUE', 'JIMENEZ', 'CARLOS', 'ANDRÉS', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(740, '2013-07-20', 'ARREDONDO', 'GUERRERO', 'GUSTAVO', 'MATIAS', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(741, '2013-07-20', 'GARCIA', 'SANTIVAÑEZ', 'MOISES ', 'HUMBERTO', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(742, '2013-07-20', 'DOMINGUEZ', 'CACERES', 'MANUEL', 'RAUL', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(743, '2013-07-20', 'ROMERO', 'MENACHO', 'JAIME', 'ULISES', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(744, '2013-07-20', 'PACHECO', 'PEÑA', 'PEDRO', '', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(745, '2013-07-20', 'MEDINA', 'MEDINA', 'JOSÉ ', 'JULIÁN', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(746, '2013-07-20', 'SALINAS', 'VASQUEZ', 'EDUAR', '', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(747, '2013-07-20', 'CHUMBES', 'GUERRERO', 'GUSTAVO', 'HUMBERTO', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(748, '2013-07-20', 'PICHILINGUE', 'MUGURUZA', 'HUGO', 'CÉSAR', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(749, '2013-07-20', 'ZUMARAN ', 'IRRIBAREN', 'JOSÉ', 'LUIS', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(750, '2013-07-20', 'NARBASTA', 'VELASQUEZ', 'JOSÉ', 'ELEODORO', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(751, '2013-07-20', 'HUARCAYA', 'ALLCCA', 'JEREMIAS', 'DANIEL', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(752, '2013-07-20', 'ALVARADO', 'RIVAS', 'MIGUEL', 'MAXIMO', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(753, '2013-07-20', 'SOTELO', 'URBANO', 'JHOANNA', 'DEL CARMEN', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(754, '2013-07-20', 'LOPEZ', 'JIMENEZ', 'WILLIAM ', 'FREDY', '', NULL, '00000000', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(765, '2013-07-20', 'AYALA', 'MELGAREJO', 'JUAN', 'CANCIO', '', NULL, '55555555', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(766, '2013-07-20', 'MULTIPLE', 'DIREC', 'ASOC', '', '', NULL, '98765432', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(767, '2013-07-20', 'BUSTAMANTE', 'HOCES', 'PERCY', '', '', NULL, '44444444', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(768, '2013-07-20', 'ESPINOZA', 'MEDALLA', 'MAGDA', 'CLOTILDE', '', NULL, '77777777', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(769, '2013-07-20', 'HUAMAN', 'VERANO', 'CLORINDA', 'MARGOT', '', NULL, '88888888', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(770, '2013-07-20', 'REMIGIO', 'SALAZAR', 'DALILA', '', '', NULL, '11111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(771, '2013-07-20', 'HERRERA', 'ALVAREZ', 'ALEXIS ', 'FERNANDO', '', NULL, '77777777', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(772, '2013-07-20', 'BAZALAR', 'ESPINOZA', 'YVAN', 'JOSE', '', NULL, '77777777', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(773, '2013-07-20', 'ORE', 'DIAZ', 'JUAN', 'ANTONIO', '', NULL, '44444444', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(774, '2013-07-20', 'ECHEGARAY', 'GRADOS', 'ALEX', 'RAUL', '', NULL, '88888888', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(775, '2013-07-20', 'ESCUDERO', 'VELASQUEZ', 'VICTORINO', '', '', NULL, '44444444', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(776, '2013-07-20', 'DIAZ', 'COLLANTES', 'CARLOS', 'RUTILIO', '', NULL, '77777777', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(777, '2013-07-20', 'PORTAL', 'ROLDAN', 'DANIEL', '', '', NULL, '77777777', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(778, '2013-07-20', 'VERANO', 'ZELADA', 'SUSANA', '', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(779, '2013-07-20', 'PACHECO', 'SALVADOR', 'JORGE', 'FERNAND', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(780, '2013-07-20', 'CASTRO', 'BARTOLOMÉ', 'HECTOR', 'JORGE', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(836, '2013-07-20', 'MORALES', 'GÓMEZ', 'OTTO', 'MAVILIO', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(837, '2013-07-20', 'RODRIGUEZ', 'ROJAS', 'MARIO', 'RODRIGO', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(838, '2013-07-20', 'CARO', 'SOTO', 'VILMA', '', '', NULL, '1234567', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(839, '2013-07-20', 'ZUMARÁN', 'IRRIBARREN', 'JOSÉ', 'LUIS', '', NULL, '32885940', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(840, '2013-07-20', 'LOAYZA ', 'SOLIER', 'GILBERTO', 'TITO', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(842, '2013-07-20', 'MANDAMIENTO', 'GRADOS', 'ROMEL', 'IVÁN', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(843, '2013-07-20', 'CERNA', 'LÓPEZ', 'WALTER', 'CÉSAR', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(844, '2013-07-20', 'OCROSPOMA', 'VALDIVIA', 'RULY', 'OMAR', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(845, '2013-07-20', 'LA ROSA', 'FLORES', 'CHRISTIAN ', 'RONALD', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(846, '2013-07-20', 'LONCAN', 'SALAZAR', 'PIERRE', 'PAUL', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(847, '2013-07-20', 'PEZO', 'MORALES', 'PABLO', '', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(848, '2013-07-20', 'MEDINA', 'ZAVALETA', 'DAMNER', 'ARMANDO', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(849, '2013-07-20', 'RICALDI', 'PORRAS', 'HERNAN', 'KENNEDY', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(850, '2013-07-20', 'TELLO', 'MALPARTIDA', 'OMAR', '', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(851, '2013-07-20', 'HUAMÁN', 'FLORES', 'MIGUEL', 'FRANCISCO', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(852, '2013-07-20', 'GALDOS', 'FELIPE', 'JOSÉ', 'ANTONIO', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(853, '2013-07-20', 'REYES', 'NAVARRO', 'FELIPE', 'AMÉRICO', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1');
INSERT INTO `tbl_sujeto` (`id_sujeto`, `fecha_registro`, `apellido_paterno`, `apellido_materno`, `primer_nombre`, `segundo_nombre`, `tercer_nombre`, `fecha_nacimiento`, `dni`, `direccion`, `estado_civil`, `sexo`, `telefono_fijo`, `telefono_movil`, `email_institucional`, `email_personal`, `activo`) VALUES
(854, '2013-07-20', 'RAMIREZ', 'ALVARADO', 'WALTHER', 'ANTONIO', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(855, '2013-07-20', 'FLORIAN ', 'CHAMACHA', 'PAOLA', '', '', NULL, '1111111', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(856, '2013-07-20', 'FORTUNATO', 'FAUSTO', 'SANTIAGO', 'MUNAYCO', '', NULL, '1111111', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(857, '2013-07-20', 'MONTALVAN', 'CHINININ', 'CESAR', '', '', NULL, '1111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(858, '2013-07-20', 'RODRIGUEZ', 'ROJAS', 'MARIO', '', '', NULL, '10111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(859, '2013-07-20', 'DURAND', 'RUIZ', 'TEOFILO', '', '', NULL, '11111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(860, '2013-07-20', 'MENDOZA', 'SUYO', 'JOSE', 'CLEMENTE', '', NULL, '1111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(861, '2013-07-20', 'SUAREZ', 'YAURI', 'ELADIA', '', '', NULL, '1111111', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(863, '2013-07-20', 'MANRIQUE', 'FLORES', 'SAUL', 'ROBERT', '', NULL, '1111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(864, '2013-07-20', 'ATANACIO', 'ROJAS', 'ROSI', 'ANGEL', '', NULL, '111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(865, '2013-07-20', 'ESCALANTE', 'CANDIOTY', 'YENNY', '', '', NULL, '1111111', NULL, NULL, 'F', NULL, NULL, NULL, NULL, '1'),
(866, '2013-07-20', 'GRADOS', 'BAZALAR', 'JOHAN', '', '', NULL, '1111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(867, '2013-07-20', 'CCAHUAY', 'RAMOS', 'ARMANDO', '', '', NULL, '1111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(868, '2013-07-20', 'BELTRAN', 'VEGA', 'CESAR', '', '', NULL, '111111', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1'),
(869, '2013-07-20', 'CANO', 'GONZALES', 'PABLO', 'WILFREDO', '', NULL, '12345678', NULL, NULL, 'M', NULL, NULL, NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tematica`
--

DROP TABLE IF EXISTS `tbl_tematica`;
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

DROP TABLE IF EXISTS `tbl_tipo_autor_interno`;
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

DROP TABLE IF EXISTS `tbl_tipo_material_bibliografico`;
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

DROP TABLE IF EXISTS `tbl_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `id_sujeto` bigint(20) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `Reftbl_sujeto18` (`id_sujeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2730 AUTO_INCREMENT=73 ;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `usuario`, `contrasenia`, `id_sujeto`, `active`) VALUES
(24, 'admin', '123', 1, '1'),
(67, 'cesarcnd', 'cesar', 2, '1'),
(68, 'user', 'user', 3, '1'),
(69, 'Tester', 'tester', 4, '1'),
(70, 'lino', 'lino', 518, '1'),
(71, 'carlos', 'carlos', 119, '1'),
(72, 'Marlenita', '12345', 11, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario_rol`
--

DROP TABLE IF EXISTS `tbl_usuario_rol`;
CREATE TABLE IF NOT EXISTS `tbl_usuario_rol` (
  `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_usuario_rol`),
  KEY `Reftbl_rol16` (`id_rol`),
  KEY `Reftbl_usuario17` (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=2730 AUTO_INCREMENT=120 ;

--
-- Volcado de datos para la tabla `tbl_usuario_rol`
--

INSERT INTO `tbl_usuario_rol` (`id_usuario_rol`, `id_rol`, `id_usuario`) VALUES
(3, 63, 67),
(39, 63, 24),
(116, 64, 69),
(117, 65, 70),
(118, 64, 24),
(119, 69, 71);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_voucher`
--

DROP TABLE IF EXISTS `tbl_voucher`;
CREATE TABLE IF NOT EXISTS `tbl_voucher` (
  `id_voucher` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_alumno` varchar(15) DEFAULT NULL,
  `documento` varchar(15) DEFAULT NULL,
  `tipo_persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_voucher`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `tbl_voucher`
--

INSERT INTO `tbl_voucher` (`id_voucher`, `codigo_alumno`, `documento`, `tipo_persona`) VALUES
(5, '    03321010281', '', 1),
(6, '', '475124619101213', 4),
(7, '    03321010281', '', 1),
(8, '', '475124619101213', 4),
(9, '    03321010281', '', 1),
(10, '', '475124619101213', 4),
(11, '    03321010281', '', 1),
(12, '', '475124619101213', 4),
(13, '', '020120414433238', 4),
(14, '', '020120414507843', 4),
(15, '4140196689     ', '', 1),
(16, '', '020120414080718', 4),
(17, '', '020120414214824', 4),
(18, '', '020120414224121', 4),
(19, '', '020120414353914', 4),
(20, '', '020120414547921', 4),
(21, '', '020120414409344', 4),
(22, '990442101023   ', '', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viw_alumno`
--
DROP VIEW IF EXISTS `viw_alumno`;
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
-- Estructura Stand-in para la vista `viw_componente`
--
DROP VIEW IF EXISTS `viw_componente`;
CREATE TABLE IF NOT EXISTS `viw_componente` (
`id_componente` int(11)
,`componente` varchar(100)
,`descripcion_componente` varchar(100)
,`id_oficina` int(11)
,`oficina` varchar(100)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viw_docente`
--
DROP VIEW IF EXISTS `viw_docente`;
CREATE TABLE IF NOT EXISTS `viw_docente` (
`id_docente` bigint(20)
,`codigo_docente` varchar(10)
,`codigo_personal` char(6)
,`id_sujeto` bigint(20)
,`id_facultad` int(11)
,`fecha_registro` date
,`docente` varchar(460)
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
DROP VIEW IF EXISTS `viw_material_bibliografico_interno_alumno`;
CREATE TABLE IF NOT EXISTS `viw_material_bibliografico_interno_alumno` (
`id_material_bibliografico` bigint(20)
,`id_docente` bigint(20)
,`id_alumno` bigint(20)
,`id_autor_interno` bigint(20)
,`id_tipo_autor_interno` bigint(20)
,`alumno` varchar(204)
,`docente` varchar(460)
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
-- Estructura Stand-in para la vista `viw_plan_tesis`
--
DROP VIEW IF EXISTS `viw_plan_tesis`;
CREATE TABLE IF NOT EXISTS `viw_plan_tesis` (
`id_plan_tesis` bigint(20)
,`id_docente` bigint(20)
,`id_alumno` bigint(20)
,`id_facultad` int(11)
,`titulo` varchar(300)
,`solicitante` varchar(204)
,`asesor` varchar(460)
,`abreaviatura_escuela` varchar(20)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viw_sujeto`
--
DROP VIEW IF EXISTS `viw_sujeto`;
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
-- Estructura Stand-in para la vista `viw_tesis`
--
DROP VIEW IF EXISTS `viw_tesis`;
CREATE TABLE IF NOT EXISTS `viw_tesis` (
`id_material_bibliografico` bigint(20)
,`id_docente` bigint(20)
,`id_alumno` bigint(20)
,`id_autor_interno` bigint(20)
,`id_tipo_autor_interno` bigint(20)
,`alumno` varchar(204)
,`docente` varchar(460)
,`facultad` varchar(200)
,`titulo` varchar(300)
,`anio` year(4)
,`introduccion` text
,`objetivo` text
,`resumen` text
,`conclusion` text
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viw_usuario`
--
DROP VIEW IF EXISTS `viw_usuario`;
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
-- Estructura para la vista `viw_componente`
--
DROP TABLE IF EXISTS `viw_componente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_componente` AS select `tbl_componente`.`id_componente` AS `id_componente`,`tbl_componente`.`componente` AS `componente`,`tbl_componente`.`descripcion_componente` AS `descripcion_componente`,`tbl_componente`.`id_oficina` AS `id_oficina`,`tbl_oficina`.`oficina` AS `oficina` from (`tbl_componente` join `tbl_oficina` on((`tbl_componente`.`id_oficina` = `tbl_oficina`.`id_oficina`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `viw_docente`
--
DROP TABLE IF EXISTS `viw_docente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_docente` AS select `tbl_d`.`id_docente` AS `id_docente`,`tbl_d`.`codigo_docente` AS `codigo_docente`,`tbl_d`.`codigo_personal` AS `codigo_personal`,`tbl_s`.`id_sujeto` AS `id_sujeto`,`tbl_d`.`id_facultad` AS `id_facultad`,`tbl_s`.`fecha_registro` AS `fecha_registro`,concat(ifnull(`tbl_s`.`apellido_paterno`,''),' ',ifnull(`tbl_s`.`apellido_materno`,''),', ',ifnull(`tbl_s`.`primer_nombre`,''),' ',ifnull(`tbl_s`.`segundo_nombre`,''),' ',ifnull(`tbl_s`.`tercer_nombre`,'')) AS `docente`,`tbl_s`.`fecha_nacimiento` AS `fecha_nacimiento`,`tbl_s`.`dni` AS `dni`,`tbl_s`.`direccion` AS `direccion`,`tbl_s`.`estado_civil` AS `estado_civil`,`tbl_s`.`sexo` AS `sexo`,`tbl_s`.`telefono_fijo` AS `telefono_fijo`,`tbl_s`.`telefono_movil` AS `telefono_movil`,`tbl_s`.`email_institucional` AS `email_institucional`,`tbl_s`.`email_personal` AS `email_personal`,`tbl_s`.`activo` AS `activo` from (`tbl_docente` `tbl_d` join `tbl_sujeto` `tbl_s` on((`tbl_d`.`id_sujeto` = `tbl_s`.`id_sujeto`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `viw_material_bibliografico_interno_alumno`
--
DROP TABLE IF EXISTS `viw_material_bibliografico_interno_alumno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_material_bibliografico_interno_alumno` AS select `tbl1`.`id_material_bibliografico` AS `id_material_bibliografico`,`viw2`.`id_docente` AS `id_docente`,`viw1`.`id_alumno` AS `id_alumno`,`tbl2`.`id_autor_interno` AS `id_autor_interno`,`tbl2`.`id_tipo_autor_interno` AS `id_tipo_autor_interno`,`viw1`.`alumno` AS `alumno`,`viw2`.`docente` AS `docente`,`viw1`.`id_facultad` AS `id_facultad`,`viw1`.`id_escuela` AS `id_escuela`,`viw1`.`facultad` AS `facultad`,`viw1`.`abreviatura_facultad` AS `abreviatura_facultad`,`viw1`.`escuela` AS `escuela`,`viw1`.`escuela_abreviatura` AS `escuela_abreviatura`,`tbl3`.`titulo` AS `titulo`,`tbl3`.`introduccion` AS `introduccion`,`tbl3`.`objetivo` AS `objetivo`,`tbl3`.`resumen` AS `resumen`,`tbl3`.`conclusion` AS `conclusion`,`tbl3`.`anio` AS `anio`,`tbl3`.`id_tematica` AS `id_tematica`,`tbl3`.`id_tipo_material_bibliografico` AS `id_tipo_material_bibliografico`,`tbl3`.`activo` AS `activo` from ((((`tbl_autor_interno_material_bibliografico` `tbl1` join `tbl_autor_interno` `tbl2` on((`tbl1`.`id_autor_interno` = `tbl2`.`id_autor_interno`))) join `tbl_material_bibliografico` `tbl3` on((`tbl1`.`id_material_bibliografico` = `tbl3`.`id_material_bibliografico`))) join `viw_alumno` `viw1` on((`viw1`.`id_alumno` = `tbl2`.`id_alumno`))) join `viw_docente` `viw2` on((`viw2`.`id_docente` = `tbl1`.`id_docente`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `viw_plan_tesis`
--
DROP TABLE IF EXISTS `viw_plan_tesis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_plan_tesis` AS select `tbl`.`id_plan_tesis` AS `id_plan_tesis`,`viwd`.`id_docente` AS `id_docente`,`viwa`.`id_alumno` AS `id_alumno`,`viwa`.`id_facultad` AS `id_facultad`,`tbl`.`titulo` AS `titulo`,`viwa`.`alumno` AS `solicitante`,`viwd`.`docente` AS `asesor`,`viwa`.`escuela_abreviatura` AS `abreaviatura_escuela` from (((`tbl_plan_tesis` `tbl` join `viw_docente` `viwd` on((`tbl`.`id_docente` = `viwd`.`id_docente`))) join `tbl_alumno_plantesis` `tblap` on((`tblap`.`id_plan_tesis` = `tbl`.`id_plan_tesis`))) join `viw_alumno` `viwa` on((`viwa`.`id_alumno` = `tblap`.`id_alumno`))) where ((`tbl`.`id_estado_plan_tesis` = 1) and (`tblap`.`solicita` = 1)) order by `tbl`.`id_plan_tesis` desc;

-- --------------------------------------------------------

--
-- Estructura para la vista `viw_sujeto`
--
DROP TABLE IF EXISTS `viw_sujeto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_sujeto` AS select `tbl`.`id_sujeto` AS `id_sujeto`,concat(ifnull(`tbl`.`apellido_paterno`,''),' ',ifnull(`tbl`.`apellido_materno`,''),', ',ifnull(`tbl`.`primer_nombre`,''),' ',ifnull(`tbl`.`segundo_nombre`,'')) AS `sujeto`,`tbl`.`dni` AS `dni`,`tbl`.`direccion` AS `direccion`,`tbl`.`email_institucional` AS `email_institucional`,`tbl`.`email_personal` AS `email_personal`,`tbl`.`activo` AS `activo` from `tbl_sujeto` `tbl` where (`tbl`.`activo` = 1);

-- --------------------------------------------------------

--
-- Estructura para la vista `viw_tesis`
--
DROP TABLE IF EXISTS `viw_tesis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viw_tesis` AS select `tbl1`.`id_material_bibliografico` AS `id_material_bibliografico`,`viw2`.`id_docente` AS `id_docente`,`viw1`.`id_alumno` AS `id_alumno`,`tbl2`.`id_autor_interno` AS `id_autor_interno`,`tbl2`.`id_tipo_autor_interno` AS `id_tipo_autor_interno`,`viw1`.`alumno` AS `alumno`,`viw2`.`docente` AS `docente`,`viw1`.`facultad` AS `facultad`,`tbl3`.`titulo` AS `titulo`,`tbl3`.`anio` AS `anio`,`tbl3`.`introduccion` AS `introduccion`,`tbl3`.`objetivo` AS `objetivo`,`tbl3`.`resumen` AS `resumen`,`tbl3`.`conclusion` AS `conclusion` from ((((`tbl_autor_interno_material_bibliografico` `tbl1` join `tbl_autor_interno` `tbl2` on((`tbl1`.`id_autor_interno` = `tbl2`.`id_autor_interno`))) join `tbl_material_bibliografico` `tbl3` on((`tbl1`.`id_material_bibliografico` = `tbl3`.`id_material_bibliografico`))) join `viw_alumno` `viw1` on((`viw1`.`id_alumno` = `tbl2`.`id_alumno`))) join `viw_docente` `viw2` on((`viw2`.`id_docente` = `tbl1`.`id_docente`))) where (`tbl3`.`id_tipo_material_bibliografico` = 1);

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
-- Filtros para la tabla `tbl_alumno_plantesis`
--
ALTER TABLE `tbl_alumno_plantesis`
  ADD CONSTRAINT `FK_tbl_alumno_plantesis_tbl_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `tbl_alumno` (`id_alumno`),
  ADD CONSTRAINT `FK_tbl_alumno_plantesis_tbl_plan_tesis` FOREIGN KEY (`id_plan_tesis`) REFERENCES `tbl_plan_tesis` (`id_plan_tesis`);

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
-- Filtros para la tabla `tbl_componente`
--
ALTER TABLE `tbl_componente`
  ADD CONSTRAINT `Reftbl_oficina1` FOREIGN KEY (`id_oficina`) REFERENCES `tbl_oficina` (`id_oficina`);

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
  ADD CONSTRAINT `FK_tbl_docente_tbl_facultad_id_facultad` FOREIGN KEY (`id_facultad`) REFERENCES `tbl_facultad` (`id_facultad`),
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
