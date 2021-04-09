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
-- Table `evtdb`.`evt_ctg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`evt_ctg` (
  `EVT_CTG_ID` INT(11) NOT NULL,
  `EVT_CTG_NM` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EVT_CTG_ID`),
  UNIQUE INDEX `EVT_CTG_NM_UNIQUE` (`EVT_CTG_NM` ASC) VISIBLE,
  UNIQUE INDEX `EVT_CTG_ID_UNIQUE` (`EVT_CTG_ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `evtdb`.`evt_evt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`evt_evt` (
  `EVT_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `EVT_NM` VARCHAR(255) NOT NULL,
  `ST_DATE` DATE NOT NULL,
  `END_DATE` DATE NOT NULL,
  `EVT_ST` INT(10) NOT NULL,
  `EVT_FILE_URL` VARCHAR(255) NOT NULL,
  `EVT_TRG` VARCHAR(255) NOT NULL,
  `EVT_PHONE` VARCHAR(255) NOT NULL,
  `EVT_TRG_DATE` DATE NOT NULL,
  `EVT_CTG_ID` INT(11) NOT NULL,
  PRIMARY KEY (`EVT_ID`),
  INDEX `fk_evt_evt_EVT_CTG1_idx` (`EVT_CTG_ID` ASC) VISIBLE,
  CONSTRAINT `fk_evt_evt_EVT_CTG1`
    FOREIGN KEY (`EVT_CTG_ID`)
    REFERENCES `evtdb`.`evt_ctg` (`EVT_CTG_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
  `MPOINT` INT(11) NOT NULL DEFAULT '50000',
  `DATA_SIZE` DOUBLE UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`CUST_ID`),
  INDEX `fk_cust_dt_cust_bas1_idx` (`CUST_ID` ASC) VISIBLE,
  CONSTRAINT `fk_cust_dt_cust_bas1`
    FOREIGN KEY (`CUST_ID`)
    REFERENCES `evtdb`.`cust_bas` (`CUST_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `evtdb`.`evt_dt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`evt_dt` (
  `EVT_DT_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `EVT_ID` INT(11) NOT NULL,
  `RES_DATA` VARCHAR(255) NOT NULL,
  `DATA_TYPE` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`EVT_DT_ID`),
  INDEX `fk_EVT_DT_evt_evt1_idx` (`EVT_ID` ASC) VISIBLE,
  CONSTRAINT `fk_EVT_DT_evt_evt1`
    FOREIGN KEY (`EVT_ID`)
    REFERENCES `evtdb`.`evt_evt` (`EVT_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
