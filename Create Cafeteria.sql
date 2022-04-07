-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cafeteria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cafeteria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cafeteria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cafeteria` ;

-- -----------------------------------------------------
-- Table `cafeteria`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`bitacora` (
  `bitacoracod` INT NOT NULL AUTO_INCREMENT,
  `bitacorafch` DATETIME NULL DEFAULT NULL,
  `bitprograma` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `bitdescripcion` VARCHAR(255) NULL DEFAULT NULL,
  `bitobservacion` MEDIUMTEXT NULL DEFAULT NULL,
  `bitTipo` CHAR(3) NULL DEFAULT NULL,
  `bitusuario` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`bitacoracod`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cafeteria`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`productos` (
  `invPrdId` BIGINT NOT NULL AUTO_INCREMENT,
  `invPrdBrCod` VARCHAR(128) NULL DEFAULT NULL,
  `invPrdCodInt` VARCHAR(128) NULL DEFAULT NULL,
  `invPrdDsc` VARCHAR(128) NULL DEFAULT NULL,
  `invPrdTip` CHAR(3) NULL DEFAULT NULL,
  `invPrdEst` CHAR(3) NULL DEFAULT NULL,
  `invPrdPadre` BIGINT NULL DEFAULT NULL,
  `invPrdFactor` INT NULL DEFAULT NULL,
  `invPrdVnd` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`invPrdId`),
  UNIQUE INDEX `invPrdBrCod_UNIQUE` (`invPrdBrCod` ASC) VISIBLE,
  UNIQUE INDEX `invPrdCodIng_UNIQUE` (`invPrdCodInt` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cafeteria`.`carretilla_anon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`carretilla_anon` (
  `anoncartid` BIGINT NOT NULL,
  `invPrdId` BIGINT NOT NULL,
  `cartCtd` INT NULL DEFAULT NULL,
  `cartPrc` DECIMAL(13,2) NULL DEFAULT NULL,
  `cartIat` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`anoncartid`, `invPrdId`),
  INDEX `fk_carretilla_anon_productos_idx` (`invPrdId` ASC) VISIBLE,
  CONSTRAINT `fk_carretilla_anon_productos`
    FOREIGN KEY (`invPrdId`)
    REFERENCES `cafeteria`.`productos` (`invPrdId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cafeteria`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`categorias` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cafeteria`.`documentofiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`documentofiscal` (
  `iddocumentofiscal` INT NOT NULL AUTO_INCREMENT,
  `facturapaypalid` VARCHAR(200) NOT NULL,
  `usuarioemail` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `total` DECIMAL(12,2) NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`iddocumentofiscal`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cafeteria`.`facturaencabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`facturaencabezado` (
  `idFacturaEncabezado` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL DEFAULT NULL,
  `total` VARCHAR(45) NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`idFacturaEncabezado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cafeteria`.`facturadetalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`facturadetalle` (
  `idfacturadetalle` INT NOT NULL AUTO_INCREMENT,
  `fk_idfacturaencabezado` INT NOT NULL,
  `productoDesc` VARCHAR(35) NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idfacturadetalle`),
  INDEX `fk_idfacturaencabezado` (`fk_idfacturaencabezado` ASC) VISIBLE,
  INDEX `fk_invPrdId_idx` (`productoDesc` ASC) VISIBLE,
  CONSTRAINT `fk_idfacturaencabezado`
    FOREIGN KEY (`fk_idfacturaencabezado`)
    REFERENCES `cafeteria`.`facturaencabezado` (`idFacturaEncabezado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cafeteria`.`funciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`funciones` (
  `fncod` VARCHAR(255) NOT NULL,
  `fndsc` VARCHAR(45) NULL DEFAULT NULL,
  `fnest` CHAR(3) NULL DEFAULT NULL,
  `fntyp` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`fncod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cafeteria`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`roles` (
  `rolescod` VARCHAR(15) NOT NULL,
  `rolesdsc` VARCHAR(45) NULL DEFAULT NULL,
  `rolesest` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`rolescod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cafeteria`.`funciones_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`funciones_roles` (
  `rolescod` VARCHAR(15) NOT NULL,
  `fncod` VARCHAR(255) NOT NULL,
  `fnrolest` CHAR(3) NULL DEFAULT NULL,
  `fnexp` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`rolescod`, `fncod`),
  INDEX `rol_funcion_key_idx` (`fncod` ASC) VISIBLE,
  CONSTRAINT `funcion_rol_key`
    FOREIGN KEY (`rolescod`)
    REFERENCES `cafeteria`.`roles` (`rolescod`),
  CONSTRAINT `rol_funcion_key`
    FOREIGN KEY (`fncod`)
    REFERENCES `cafeteria`.`funciones` (`fncod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cafeteria`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`producto` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(80) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `foto` VARCHAR(100) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `categoria_id` INT NOT NULL,
  `estado` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cafeteria`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`usuario` (
  `usercod` BIGINT NOT NULL AUTO_INCREMENT,
  `useremail` VARCHAR(80) NULL DEFAULT NULL,
  `username` VARCHAR(80) NULL DEFAULT NULL,
  `userpswd` VARCHAR(128) NULL DEFAULT NULL,
  `userfching` DATETIME NULL DEFAULT NULL,
  `userpswdest` CHAR(3) NULL DEFAULT NULL,
  `userpswdexp` DATETIME NULL DEFAULT NULL,
  `userest` CHAR(3) NULL DEFAULT NULL,
  `useractcod` VARCHAR(128) NULL DEFAULT NULL,
  `userpswdchg` VARCHAR(128) NULL DEFAULT NULL,
  `usertipo` CHAR(3) NULL DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE INDEX `useremail_UNIQUE` (`useremail` ASC) VISIBLE,
  INDEX `usertipo` (`usertipo` ASC, `useremail` ASC, `usercod` ASC, `userest` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cafeteria`.`roles_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`roles_usuarios` (
  `usercod` BIGINT NOT NULL,
  `rolescod` VARCHAR(15) NOT NULL,
  `roleuserest` CHAR(3) NULL DEFAULT NULL,
  `roleuserfch` DATETIME NULL DEFAULT NULL,
  `roleuserexp` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`usercod`, `rolescod`),
  INDEX `rol_usuario_key_idx` (`rolescod` ASC) VISIBLE,
  CONSTRAINT `rol_usuario_key`
    FOREIGN KEY (`rolescod`)
    REFERENCES `cafeteria`.`roles` (`rolescod`),
  CONSTRAINT `usuario_rol_key`
    FOREIGN KEY (`usercod`)
    REFERENCES `cafeteria`.`usuario` (`usercod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
