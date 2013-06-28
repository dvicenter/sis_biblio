﻿-- Script was generated by Devart dbForge Studio for MySQL, Version 4.50.285.0
-- Script date 27/06/2013 08:25:21 p.m.
-- Server version: 5.1.41
-- Client version: 4.1

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

-- 
-- Set default database
--
USE sis_biblio;

--
-- Definition for table tbl_accion
--
DROP TABLE IF EXISTS tbl_accion;
CREATE TABLE tbl_accion (
  id_accion TINYINT(4) NOT NULL AUTO_INCREMENT,
  accion VARCHAR(10) NOT NULL,
  PRIMARY KEY (id_accion)
)
ENGINE = INNODB
AUTO_INCREMENT = 11
AVG_ROW_LENGTH = 1638
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_autor_externo
--
DROP TABLE IF EXISTS tbl_autor_externo;
CREATE TABLE tbl_autor_externo (
  id_autor_externo BIGINT(20) NOT NULL AUTO_INCREMENT,
  apellido_paterno VARCHAR(50) NOT NULL,
  apellido_materno VARCHAR(50) DEFAULT NULL,
  nombre VARCHAR(100) DEFAULT NULL,
  origen VARCHAR(70) DEFAULT NULL,
  PRIMARY KEY (id_autor_externo)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_componente
--
DROP TABLE IF EXISTS tbl_componente;
CREATE TABLE tbl_componente (
  id_componente INT(11) NOT NULL AUTO_INCREMENT,
  componente VARCHAR(100) NOT NULL,
  descripcion_componente VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id_componente)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_estado_plan_tesis
--
DROP TABLE IF EXISTS tbl_estado_plan_tesis;
CREATE TABLE tbl_estado_plan_tesis (
  id_estado_plan_tesis INT(11) NOT NULL AUTO_INCREMENT,
  estado VARCHAR(30) NOT NULL,
  color VARCHAR(25) NOT NULL,
  active CHAR(1) NOT NULL,
  PRIMARY KEY (id_estado_plan_tesis)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_facultad
--
DROP TABLE IF EXISTS tbl_facultad;
CREATE TABLE tbl_facultad (
  id_facultad INT(11) NOT NULL AUTO_INCREMENT,
  codigo_facultad CHAR(2) NOT NULL,
  facultad VARCHAR(200) NOT NULL,
  activo CHAR(1) NOT NULL,
  PRIMARY KEY (id_facultad)
)
ENGINE = INNODB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 4096
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_rol
--
DROP TABLE IF EXISTS tbl_rol;
CREATE TABLE tbl_rol (
  id_rol INT(11) NOT NULL AUTO_INCREMENT,
  rol VARCHAR(50) NOT NULL,
  descripcion VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (id_rol)
)
ENGINE = INNODB
AUTO_INCREMENT = 81
AVG_ROW_LENGTH = 1365
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_sujeto
--
DROP TABLE IF EXISTS tbl_sujeto;
CREATE TABLE tbl_sujeto (
  id_sujeto BIGINT(20) NOT NULL AUTO_INCREMENT,
  fecha_registro DATE NOT NULL,
  apellido_paterno VARCHAR(50) NOT NULL,
  apellido_materno VARCHAR(50) DEFAULT NULL,
  primer_nombre VARCHAR(50) NOT NULL,
  segundo_nombre VARCHAR(50) DEFAULT NULL,
  fecha_nacimiento DATE DEFAULT NULL,
  dni VARCHAR(15) DEFAULT NULL,
  direccion VARCHAR(250) DEFAULT NULL,
  estado_civil CHAR(1) DEFAULT NULL,
  sexo CHAR(1) DEFAULT NULL,
  telefono_fijo VARCHAR(15) DEFAULT NULL,
  telefono_movil VARCHAR(15) DEFAULT NULL,
  email_institucional VARCHAR(50) DEFAULT NULL,
  email_personal VARCHAR(50) DEFAULT NULL,
  activo CHAR(1) NOT NULL,
  PRIMARY KEY (id_sujeto)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_tematica
--
DROP TABLE IF EXISTS tbl_tematica;
CREATE TABLE tbl_tematica (
  id_tematica INT(11) NOT NULL AUTO_INCREMENT,
  tematica VARCHAR(100) NOT NULL,
  descripcion_tematica VARCHAR(100) DEFAULT NULL,
  estado_tematica CHAR(1) NOT NULL,
  PRIMARY KEY (id_tematica)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_tipo_autor_interno
--
DROP TABLE IF EXISTS tbl_tipo_autor_interno;
CREATE TABLE tbl_tipo_autor_interno (
  id_tipo_autor_interno BIGINT(20) NOT NULL AUTO_INCREMENT,
  tipo_autor_interno VARCHAR(25) NOT NULL,
  descripcion_tipo_autor_interno VARCHAR(250) DEFAULT NULL,
  estado_tipo_autor_interno CHAR(1) NOT NULL,
  PRIMARY KEY (id_tipo_autor_interno)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_tipo_material_bibliografico
--
DROP TABLE IF EXISTS tbl_tipo_material_bibliografico;
CREATE TABLE tbl_tipo_material_bibliografico (
  id_tipo_material_bibliografico TINYINT(4) NOT NULL,
  tipo_material_bibliografico VARCHAR(100) NOT NULL,
  descripcion_tipo_material_bibliografico VARCHAR(250) DEFAULT NULL,
  estado_tipo_material_bibliografico CHAR(1) NOT NULL,
  PRIMARY KEY (id_tipo_material_bibliografico)
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_componente_accion
--
DROP TABLE IF EXISTS tbl_componente_accion;
CREATE TABLE tbl_componente_accion (
  id_componente_accion INT(11) NOT NULL AUTO_INCREMENT,
  id_accion TINYINT(4) NOT NULL,
  id_componente INT(11) NOT NULL,
  PRIMARY KEY (id_componente_accion),
  INDEX Reftbl_accion29 (id_accion),
  INDEX Reftbl_componente30 (id_componente),
  CONSTRAINT Reftbl_accion29 FOREIGN KEY (id_accion)
    REFERENCES tbl_accion(id_accion),
  CONSTRAINT Reftbl_componente30 FOREIGN KEY (id_componente)
    REFERENCES tbl_componente(id_componente)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_docente
--
DROP TABLE IF EXISTS tbl_docente;
CREATE TABLE tbl_docente (
  id_docente BIGINT(20) NOT NULL AUTO_INCREMENT,
  codigo_docente INT(11) NOT NULL,
  codigo_personal CHAR(6) DEFAULT NULL,
  condicion CHAR(1) NOT NULL,
  observacion VARCHAR(250) DEFAULT NULL,
  id_sujeto BIGINT(20) NOT NULL,
  PRIMARY KEY (id_docente),
  INDEX Reftbl_sujeto9 (id_sujeto),
  CONSTRAINT Reftbl_sujeto9 FOREIGN KEY (id_sujeto)
    REFERENCES tbl_sujeto(id_sujeto)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_escuela
--
DROP TABLE IF EXISTS tbl_escuela;
CREATE TABLE tbl_escuela (
  id_escuela INT(11) NOT NULL AUTO_INCREMENT,
  codigo_escuela CHAR(4) NOT NULL,
  escuela VARCHAR(200) NOT NULL,
  escuela_abreviatura VARCHAR(20) DEFAULT NULL,
  estado CHAR(1) NOT NULL,
  id_facultad INT(11) NOT NULL,
  PRIMARY KEY (id_escuela),
  INDEX Reftbl_facultad7 (id_facultad),
  CONSTRAINT Reftbl_facultad7 FOREIGN KEY (id_facultad)
    REFERENCES tbl_facultad(id_facultad)
)
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 3276
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_material_bibliografico
--
DROP TABLE IF EXISTS tbl_material_bibliografico;
CREATE TABLE tbl_material_bibliografico (
  id_material_bibliografico BIGINT(20) NOT NULL,
  codigo_material_bibliografico VARCHAR(40) DEFAULT NULL,
  titulo VARCHAR(300) NOT NULL,
  introduccion TEXT DEFAULT NULL,
  objetivo TEXT DEFAULT NULL,
  resumen TEXT DEFAULT NULL,
  conclusion TEXT DEFAULT NULL,
  anio DATE NOT NULL,
  portada VARCHAR(200) DEFAULT NULL,
  numero_pagina SMALLINT(6) DEFAULT NULL,
  editorial VARCHAR(100) DEFAULT NULL,
  volumen INT(11) DEFAULT NULL,
  tomo VARCHAR(3) DEFAULT NULL,
  contenido VARCHAR(100) DEFAULT NULL,
  id_tipo_material_bibliografico TINYINT(4) NOT NULL,
  id_tematica INT(11) NOT NULL,
  activo CHAR(1) NOT NULL,
  PRIMARY KEY (id_material_bibliografico),
  INDEX Reftbl_tematica15 (id_tematica),
  INDEX Reftbl_tipo_material_bibliografico4 (id_tipo_material_bibliografico),
  CONSTRAINT Reftbl_tematica15 FOREIGN KEY (id_tematica)
    REFERENCES tbl_tematica(id_tematica),
  CONSTRAINT Reftbl_tipo_material_bibliografico4 FOREIGN KEY (id_tipo_material_bibliografico)
    REFERENCES tbl_tipo_material_bibliografico(id_tipo_material_bibliografico)
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_usuario
--
DROP TABLE IF EXISTS tbl_usuario;
CREATE TABLE tbl_usuario (
  id_usuario BIGINT(20) NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(50) NOT NULL,
  contrasenia VARCHAR(100) NOT NULL,
  id_sujeto BIGINT(20) NOT NULL,
  active CHAR(1) NOT NULL,
  PRIMARY KEY (id_usuario),
  INDEX Reftbl_sujeto18 (id_sujeto),
  CONSTRAINT Reftbl_sujeto18 FOREIGN KEY (id_sujeto)
    REFERENCES tbl_sujeto(id_sujeto)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_alumno
--
DROP TABLE IF EXISTS tbl_alumno;
CREATE TABLE tbl_alumno (
  id_alumno BIGINT(20) NOT NULL AUTO_INCREMENT,
  numero_carnet VARCHAR(20) DEFAULT NULL,
  condicion_alumno TINYINT(4) NOT NULL,
  id_sujeto BIGINT(20) NOT NULL,
  id_escuela INT(11) NOT NULL,
  PRIMARY KEY (id_alumno),
  INDEX Reftbl_escuela10 (id_escuela),
  INDEX Reftbl_sujeto8 (id_sujeto),
  CONSTRAINT Reftbl_escuela10 FOREIGN KEY (id_escuela)
    REFERENCES tbl_escuela(id_escuela),
  CONSTRAINT Reftbl_sujeto8 FOREIGN KEY (id_sujeto)
    REFERENCES tbl_sujeto(id_sujeto)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_autor_externo_material_bibliografico
--
DROP TABLE IF EXISTS tbl_autor_externo_material_bibliografico;
CREATE TABLE tbl_autor_externo_material_bibliografico (
  id_autor_externo_material_bibliografico BIGINT(20) NOT NULL AUTO_INCREMENT,
  id_autor_externo BIGINT(20) NOT NULL,
  id_material_bibliografico BIGINT(20) NOT NULL,
  PRIMARY KEY (id_autor_externo_material_bibliografico),
  INDEX Reftbl_autor_externo26 (id_autor_externo),
  INDEX Reftbl_material_biliografico27 (id_material_bibliografico),
  CONSTRAINT Reftbl_autor_externo26 FOREIGN KEY (id_autor_externo)
    REFERENCES tbl_autor_externo(id_autor_externo),
  CONSTRAINT Reftbl_material_biliografico27 FOREIGN KEY (id_material_bibliografico)
    REFERENCES tbl_material_bibliografico(id_material_bibliografico)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_material_bibliografico_docente
--
DROP TABLE IF EXISTS tbl_material_bibliografico_docente;
CREATE TABLE tbl_material_bibliografico_docente (
  id_material_bibliografico_docente BIGINT(20) NOT NULL AUTO_INCREMENT,
  id_material_bibliografico BIGINT(20) NOT NULL,
  id_docente BIGINT(20) NOT NULL,
  PRIMARY KEY (id_material_bibliografico_docente),
  INDEX FK_docente_material_bibliografico (id_docente),
  INDEX FK_material_bibliografico_docente (id_material_bibliografico),
  CONSTRAINT FK_docente_material_bibliografico FOREIGN KEY (id_docente)
    REFERENCES tbl_docente(id_docente),
  CONSTRAINT FK_material_bibliografico_docente FOREIGN KEY (id_material_bibliografico)
    REFERENCES tbl_material_bibliografico(id_material_bibliografico)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_rol_componente_accion
--
DROP TABLE IF EXISTS tbl_rol_componente_accion;
CREATE TABLE tbl_rol_componente_accion (
  id_rol_componente_accion INT(11) NOT NULL AUTO_INCREMENT,
  id_rol INT(11) NOT NULL,
  id_componente_accion INT(11) NOT NULL,
  PRIMARY KEY (id_rol_componente_accion),
  INDEX Reftbl_componente_accion31 (id_componente_accion),
  INDEX Reftbl_rol22 (id_rol),
  CONSTRAINT Reftbl_componente_accion31 FOREIGN KEY (id_componente_accion)
    REFERENCES tbl_componente_accion(id_componente_accion),
  CONSTRAINT Reftbl_rol22 FOREIGN KEY (id_rol)
    REFERENCES tbl_rol(id_rol)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_usuario_rol
--
DROP TABLE IF EXISTS tbl_usuario_rol;
CREATE TABLE tbl_usuario_rol (
  id_usuario_rol INT(11) NOT NULL AUTO_INCREMENT,
  id_rol INT(11) NOT NULL,
  id_usuario BIGINT(20) NOT NULL,
  PRIMARY KEY (id_usuario_rol),
  INDEX Reftbl_rol16 (id_rol),
  INDEX Reftbl_usuario17 (id_usuario),
  CONSTRAINT Reftbl_rol16 FOREIGN KEY (id_rol)
    REFERENCES tbl_rol(id_rol),
  CONSTRAINT Reftbl_usuario17 FOREIGN KEY (id_usuario)
    REFERENCES tbl_usuario(id_usuario)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_autor_interno
--
DROP TABLE IF EXISTS tbl_autor_interno;
CREATE TABLE tbl_autor_interno (
  id_autor_interno BIGINT(20) NOT NULL AUTO_INCREMENT,
  id_tipo_autor_interno BIGINT(20) NOT NULL,
  id_alumno BIGINT(20) NOT NULL,
  PRIMARY KEY (id_autor_interno),
  INDEX Reftbl_alumno12 (id_alumno),
  INDEX Reftbl_tipo_autor_interno3 (id_tipo_autor_interno),
  CONSTRAINT Reftbl_alumno12 FOREIGN KEY (id_alumno)
    REFERENCES tbl_alumno(id_alumno),
  CONSTRAINT Reftbl_tipo_autor_interno3 FOREIGN KEY (id_tipo_autor_interno)
    REFERENCES tbl_tipo_autor_interno(id_tipo_autor_interno)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_plan_tesis
--
DROP TABLE IF EXISTS tbl_plan_tesis;
CREATE TABLE tbl_plan_tesis (
  id_plan_tesis INT(11) NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(300) NOT NULL,
  introduccion TEXT DEFAULT NULL,
  objetivo TEXT NOT NULL,
  resumen TEXT DEFAULT NULL,
  conclusion TEXT DEFAULT NULL,
  activo CHAR(1) NOT NULL,
  observacion TEXT DEFAULT NULL,
  correo VARCHAR(50) DEFAULT NULL,
  id_alumno BIGINT(20) NOT NULL,
  id_docente BIGINT(20) NOT NULL,
  id_estado_plan_tesis INT(11) NOT NULL,
  PRIMARY KEY (id_plan_tesis),
  INDEX Reftbl_alumno23 (id_alumno),
  INDEX Reftbl_docente24 (id_docente),
  INDEX Reftbl_estado_plan_tesis32 (id_estado_plan_tesis),
  CONSTRAINT Reftbl_alumno23 FOREIGN KEY (id_alumno)
    REFERENCES tbl_alumno(id_alumno),
  CONSTRAINT Reftbl_docente24 FOREIGN KEY (id_docente)
    REFERENCES tbl_docente(id_docente),
  CONSTRAINT Reftbl_estado_plan_tesis32 FOREIGN KEY (id_estado_plan_tesis)
    REFERENCES tbl_estado_plan_tesis(id_estado_plan_tesis)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tbl_autor_interno_material_bibliografico
--
DROP TABLE IF EXISTS tbl_autor_interno_material_bibliografico;
CREATE TABLE tbl_autor_interno_material_bibliografico (
  id_autor_interno_material_bibliografico BIGINT(20) NOT NULL AUTO_INCREMENT,
  id_autor_interno BIGINT(20) NOT NULL,
  id_material_bibliografico BIGINT(20) NOT NULL,
  PRIMARY KEY (id_autor_interno_material_bibliografico),
  INDEX Reftbl_autor_interno5 (id_autor_interno),
  INDEX Reftbl_material_biliografico6 (id_material_bibliografico),
  CONSTRAINT Reftbl_autor_interno5 FOREIGN KEY (id_autor_interno)
    REFERENCES tbl_autor_interno(id_autor_interno),
  CONSTRAINT Reftbl_material_biliografico6 FOREIGN KEY (id_material_bibliografico)
    REFERENCES tbl_material_bibliografico(id_material_bibliografico)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

DELIMITER $$

--
-- Definition for procedure SPRABMAccion
--
DROP PROCEDURE IF EXISTS SPRABMAccion$$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE SPRABMAccion(IN pIdAbm TINYINT, IN pId_accion TINYINT(4), IN pAccion VARCHAR(10))
BEGIN
IF pIdAbm = 0
      THEN 
        SELECT accion FROM tbl_accion;
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
END
$$

--
-- Definition for procedure SPRABMComponente
--
DROP PROCEDURE IF EXISTS SPRABMComponente$$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE SPRABMComponente(IN pIdAbm TINYINT, IN pId_componente INT (11), IN pComponente VARCHAR(100), IN pDescripcion_componente VARCHAR(100))
BEGIN
IF pIdAbm = 0
      THEN 
        SELECT tbl.componente, tbl.descripcion_componente FROM tbl_componente tbl;
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
END
$$

--
-- Definition for procedure SPRABMRol
--
DROP PROCEDURE IF EXISTS SPRABMRol$$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE SPRABMRol(IN pIdAbm TINYINT, IN pIdRol int,IN pRol VARCHAR(50), IN pDescripcion VARCHAR(200))
BEGIN
 IF pIdAbm = 0
      THEN 
        SELECT * FROM tbl_rol;
    ELSE
      IF pIdAbm = 1
        THEN
          INSERT INTO tbl_rol(rol, descripcion) VALUES (pRol, pDescripcion);
      ELSE
        IF pIdAbm = 2
          THEN
            UPDATE tbl_rol set    rol = pRol,
                                  descripcion = pDescripcion
                           Where  id_rol = pIdRol;
          IF pIdAbm = 3
            THEN
              DELETE FROM tbl_rol WHERE id_rol = pIdRol;
          END IF;
        END IF;
     END IF;
  END IF;
END
$$

--
-- Definition for procedure SPRABMUsuario
--
DROP PROCEDURE IF EXISTS SPRABMUsuario$$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE SPRABMUsuario(IN pIdAbm TINYINT, IN pId_usuario BIGINT (20), IN pUsuario VARCHAR(50), IN pContrasenia VARCHAR(100), IN pId_sujeto BIGINT(20), IN pActive CHAR(1))
BEGIN
IF pIdAbm = 0
      THEN 
        SELECT tbl.usuario, tbl.contrasenia,tbl.active FROM tbl_usuario tbl
          WHERE tbl.active=1;
ELSE
       IF pIdAbm = 1
      THEN
      INSERT INTO tbl_usuario(usuario,contrasenia,id_sujeto,active) VALUES (pUsuario,pContrasenia,pId_sujeto,pActive);
      ELSE 
 IF pIdAbm=2
      THEN
      UPDATE tbl_usuario tbl set 
        tbl.usuario=pUsuario,
        tbl.contrasenia=pContrasenia WHERE id_usuario=pId_usuario;
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
END
$$

--
-- Definition for procedure SPRCNSAccion
--
DROP PROCEDURE IF EXISTS SPRCNSAccion$$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE SPRCNSAccion(IN pIdCns INT, IN pInicio INT, IN pFinal INT)
BEGIN
declare pTotal int;
SET @inicio=pInicio;
SET @fin=pFinal;

IF pIdCns = 1 THEN
    set @pTotal=(select count(id_accion) from tbl_accion);
    PREPARE STMT FROM "SELECT id_accion, accion, ? as Total FROM tbl_accion LIMIT ?,?";
    EXECUTE STMT USING @pTotal,@inicio,@fin;
END IF;
END
$$

--
-- Definition for procedure SPRCNSAsesor
--
DROP PROCEDURE IF EXISTS SPRCNSAsesor$$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE SPRCNSAsesor()
BEGIN
 SELECT
  viw.id_docente,
  viw.id_sujeto,
  viw.Docente,
  viw.activo
FROM
  viw_docente viw
  WHERE viw.activo='1';
END
$$

--
-- Definition for procedure SPRCNSEscuela
--
DROP PROCEDURE IF EXISTS SPRCNSEscuela$$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE SPRCNSEscuela()
BEGIN
SELECT
  tbl.id_escuela,
  tbl.escuela
FROM
  tbl_escuela tbl
  WHERE tbl.estado=1;
END
$$

--
-- Definition for procedure SPRCNSFacultad
--
DROP PROCEDURE IF EXISTS SPRCNSFacultad$$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE SPRCNSFacultad()
BEGIN
SELECT
  tbl.id_facultad,
  tbl.facultad
FROM
  tbl_facultad tbl
  WHERE tbl.activo=1;
END
$$

--
-- Definition for procedure SPRINSSolicitudConstancia
--
DROP PROCEDURE IF EXISTS SPRINSSolicitudConstancia$$
CREATE DEFINER = 'root'@'localhost'
PROCEDURE SPRINSSolicitudConstancia(IN pTitulo VARCHAR(300),IN pIntroduccion text,IN pObjetivo text,IN pResumen TEXT, IN pConclusion TEXT,IN pCorreo VARCHAR(50),IN pActivo CHAR(1),IN pIdSujeto BIGINT,IN pIdDocente BIGINT)
BEGIN
     SET @pidAlumno = (SELECT tbl.id_alumno FROM  tbl_alumno tbl  WHERE tbl.id_sujeto=pIdSujeto);
    INSERT INTO tbl_plan_tesis(titulo,introduccion,objetivo,resumen,conclusion,activo,correo,id_alumno,id_docente,id_estado_plan_tesis)
       VALUES (pTitulo,pIntroduccion,pObjetivo,pResumen,pConclusion,1,pCorreo,@pidAlumno,pIdDocente,1);
END
$$

DELIMITER ;

--
-- Definition for view viw_docente
--
DROP VIEW IF EXISTS viw_docente CASCADE;
CREATE OR REPLACE 
	DEFINER = 'root'@'localhost'
VIEW viw_docente
AS
	select `tbl_d`.`id_docente` AS `id_docente`,`tbl_d`.`codigo_docente` AS `codigo_docente`,`tbl_d`.`codigo_personal` AS `codigo_personal`,`tbl_s`.`id_sujeto` AS `id_sujeto`,`tbl_s`.`fecha_registro` AS `fecha_registro`,concat(ifnull(`tbl_s`.`apellido_paterno`,''),' ',ifnull(`tbl_s`.`apellido_materno`,''),', ',ifnull(`tbl_s`.`primer_nombre`,''),' ',ifnull(`tbl_s`.`segundo_nombre`,'')) AS `docente`,`tbl_s`.`fecha_nacimiento` AS `fecha_nacimiento`,`tbl_s`.`dni` AS `dni`,`tbl_s`.`direccion` AS `direccion`,`tbl_s`.`estado_civil` AS `estado_civil`,`tbl_s`.`sexo` AS `sexo`,`tbl_s`.`telefono_fijo` AS `telefono_fijo`,`tbl_s`.`telefono_movil` AS `telefono_movil`,`tbl_s`.`email_institucional` AS `email_institucional`,`tbl_s`.`email_personal` AS `email_personal`,`tbl_s`.`activo` AS `activo` from (`tbl_docente` `tbl_d` join `tbl_sujeto` `tbl_s` on((`tbl_d`.`id_sujeto` = `tbl_s`.`id_sujeto`)));

-- 
-- Dumping data for table tbl_accion
--
INSERT INTO tbl_accion VALUES 
  (1, 'Insertar'),
  (2, 'Eliminar'),
  (3, 'Editar'),
  (4, 'dsadsa'),
  (5, 'dsadsa'),
  (6, 'dsadas'),
  (7, 'dasdas'),
  (8, 'dsads'),
  (9, 'adsad'),
  (10, 'dsada');

-- 
-- Dumping data for table tbl_autor_externo
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_componente
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_estado_plan_tesis
--
INSERT INTO tbl_estado_plan_tesis VALUES 
  (1, '1', 'amarillo', '1');

-- 
-- Dumping data for table tbl_facultad
--
INSERT INTO tbl_facultad VALUES 
  (1, '01', 'INGENIERIA', '1'),
  (2, '02', 'MEDICINA', '1'),
  (3, '03', 'EDUCACION', '1'),
  (4, '04', 'CONTABILIDAD', '0');

-- 
-- Dumping data for table tbl_rol
--
INSERT INTO tbl_rol VALUES 
  (60, 'ddd', 'dddd'),
  (61, 'eeee', 'eeee'),
  (62, 'jaajsa', 'ksndksdks'),
  (63, 'mmm', 'mmm'),
  (64, 'jhshjwhe', 'jdnfjdfd'),
  (65, 'qqqqqq', 'mmmmm'),
  (66, 'jajajjaja', 'ajaajajja'),
  (67, 'cesa', 'cesa'),
  (77, 'bjbjhbjbjbj', ''),
  (78, '', ''),
  (79, 'KARINA', 'KELLY'),
  (80, 'hola', 'hola');

-- 
-- Dumping data for table tbl_sujeto
--
INSERT INTO tbl_sujeto VALUES 
  (1, '2013-06-24', 'Morales', 'Flores', 'Victor', 'Angel', '1994-06-28', '76771971', 'Calle Bellavista', 'S', 'M', '1234567', '123456', '', NULL, '1'),
  (2, '2013-06-10', 'Nicho', 'Diaz', 'Cesar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1');

-- 
-- Dumping data for table tbl_tematica
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_tipo_autor_interno
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_tipo_material_bibliografico
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_componente_accion
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_docente
--
INSERT INTO tbl_docente VALUES 
  (1, 1234, '1234', '1', NULL, 1),
  (3, 6654, NULL, '2', NULL, 2);

-- 
-- Dumping data for table tbl_escuela
--
INSERT INTO tbl_escuela VALUES 
  (1, '01', 'INGENIERIA DE SISTEMAS', 'EAPIS', '1', 1),
  (2, '02', 'INGENIERIA INFORMATICA', 'EAPII', '0', 1),
  (3, '03', 'INGENIERIA INDUSTRIAL', 'EAPII', '1', 1),
  (4, '04', 'MEDICINA', 'EAPM', '1', 1),
  (5, '05', 'ENFERMERIA', 'EAPE', '1', 1);

-- 
-- Dumping data for table tbl_material_bibliografico
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_usuario
--
INSERT INTO tbl_usuario VALUES 
  (1, 'admin', '123', 1, '');

-- 
-- Dumping data for table tbl_alumno
--
INSERT INTO tbl_alumno VALUES 
  (1, '0332101028', 1, 1, 1);

-- 
-- Dumping data for table tbl_autor_externo_material_bibliografico
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_material_bibliografico_docente
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_rol_componente_accion
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_usuario_rol
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_autor_interno
--
-- Table does not contain any data (it is empty)

-- 
-- Dumping data for table tbl_plan_tesis
--
INSERT INTO tbl_plan_tesis VALUES 
  (2, 'hola', 'hola', 'hola', 'hola', 'hola', '1', NULL, 'asdad', 1, 1, 1),
  (3, 'TESIS', 'SAL', 'POR', 'FS', 'VOR', '1', NULL, 'cesar2010_13@hotmail.com', 1, 3, 1);

-- 
-- Dumping data for table tbl_autor_interno_material_bibliografico
--
-- Table does not contain any data (it is empty)

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;