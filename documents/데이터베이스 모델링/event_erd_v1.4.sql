-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema evtdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `evtdb` ;

-- -----------------------------------------------------
-- Schema evtdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `evtdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `evtdb` ;

-- -----------------------------------------------------
-- Table `evtdb`.`evt_evt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`evt_evt` (
  `EVT_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `EVT_NM` VARCHAR(255) NOT NULL,
  `EVT_DT` VARCHAR(255) NOT NULL,
  `ST_DATE` DATE NOT NULL,
  `END_DATE` DATE NOT NULL,
  `EVT_ST` INT(10) NOT NULL,
  `EVT_FILE_URL` VARCHAR(255) NOT NULL,
  `EVT_CTG` VARCHAR(255) NOT NULL,
  `EVT_TRG` VARCHAR(255) NOT NULL,
  `EVT_PHONE` VARCHAR(255) NOT NULL,
  `EVT_TRG_DATE` DATE NOT NULL,
  PRIMARY KEY (`EVT_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `evtdb`.`cust_bas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`cust_bas` (
  `CUST_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `ENAME` VARCHAR(255) NOT NULL,
  `ID` VARCHAR(255) NOT NULL,
  `PWD` VARCHAR(255) NOT NULL,
  `PHONE` VARCHAR(255) NOT NULL,
  `EMAIL` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CUST_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `evtdb`.`cust_app_res`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`cust_app_res` (
  `APP_ID` INT(11) NOT NULL,
  `EVT_ID` INT(11) NOT NULL,
  `CUST_ID` INT(11) NOT NULL,
  `PRIZE` INT(10) NOT NULL,
  PRIMARY KEY (`APP_ID`),
  INDEX `EVT_ID_EVT_idx` (`EVT_ID` ASC) VISIBLE,
  INDEX `fk_cust_app_res_cust_bas1_idx` (`CUST_ID` ASC) VISIBLE,
  CONSTRAINT `EVT_ID_EVT`
    FOREIGN KEY (`EVT_ID`)
    REFERENCES `evtdb`.`evt_evt` (`EVT_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cust_app_res_cust_bas1`
    FOREIGN KEY (`CUST_ID`)
    REFERENCES `evtdb`.`cust_bas` (`CUST_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `evtdb`.`cust_dt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`cust_dt` (
  `CUST_ID` INT(11) NOT NULL,
  `PAY_SYS` VARCHAR(255) NOT NULL,
  `MBS` VARCHAR(255) NOT NULL DEFAULT 'SILVER',
  `POINT` INT NOT NULL DEFAULT '50000',
  `DATA_SIZE` DOUBLE UNSIGNED NOT NULL DEFAULT 0,
  INDEX `fk_cust_dt_cust_bas1_idx` (`CUST_ID` ASC) VISIBLE,
  PRIMARY KEY (`CUST_ID`),
  CONSTRAINT `fk_cust_dt_cust_bas1`
    FOREIGN KEY (`CUST_ID`)
    REFERENCES `evtdb`.`cust_bas` (`CUST_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

ALTER TABLE `evtdb`.`cust_dt` 
DROP FOREIGN KEY `fk_cust_dt_cust_bas1`;
ALTER TABLE `evtdb`.`cust_dt` 
ADD CONSTRAINT `fk_cust_dt_cust_bas1`
  FOREIGN KEY (`CUST_ID`)
  REFERENCES `evtdb`.`cust_bas` (`CUST_ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


ALTER TABLE `evtdb`.`cust_app_res` 
DROP FOREIGN KEY `fk_cust_app_res_cust_bas1`;
ALTER TABLE `evtdb`.`cust_app_res` 
ADD CONSTRAINT `fk_cust_app_res_cust_bas1`
  FOREIGN KEY (`CUST_ID`)
  REFERENCES `evtdb`.`cust_bas` (`CUST_ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

