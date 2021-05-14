-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema parcial3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema parcial3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parcial3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `parcial3` ;

-- -----------------------------------------------------
-- Table `parcial3`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcial3`.`consulta` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NULL DEFAULT NULL,
  `Apellido` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parcial3`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcial3`.`usuario` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NULL DEFAULT NULL,
  `Contrasena` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `parcial3` ;

-- -----------------------------------------------------
-- procedure SP_D_Consulta
-- -----------------------------------------------------

DELIMITER $$
USE `parcial3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_Consulta`(PidConsulta int)
BEGIN
Delete From consulta where PidConsulta = Id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_S_CRIPMD5
-- -----------------------------------------------------

DELIMITER $$
USE `parcial3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_CRIPMD5`(PcripPass varchar(500))
BEGIN
	Select MD5(PcripPass) as crip;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_S_Consulta
-- -----------------------------------------------------

DELIMITER $$
USE `parcial3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_Consulta`(
)
BEGIN
SELECT * FROM parcial3.consulta;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_S_LOGUINUSUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `parcial3`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_LOGUINUSUARIO`(pUsuario varchar(50), ppass varchar(50))
BEGIN
select * from usuario where Nombre = pUsuario and Contrasena = md5(ppass);
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
