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
-- Table `evtdb`.`EVT_CTG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`EVT_CTG` (
  `EVT_CTG_IDX` INT(11) NOT NULL,
  `EVT_CTG_NM` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EVT_CTG_IDX`),
  UNIQUE INDEX `EVT_CTG_NM_UNIQUE` (`EVT_CTG_NM` ASC) VISIBLE,
  UNIQUE INDEX `EVT_CTG_ID_UNIQUE` (`EVT_CTG_IDX` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `evtdb`.`EVT_EVT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`EVT_EVT` (
  `EVT_IDX` INT(11) NOT NULL AUTO_INCREMENT,
  `EVT_NM` VARCHAR(255) NOT NULL,
  `ST_DATE` DATE NOT NULL,
  `END_DATE` DATE NOT NULL,
  `EVT_ST` INT(10) NOT NULL,
  `EVT_FILE_URL` VARCHAR(255) NOT NULL,
  `EVT_TRG` VARCHAR(255) NOT NULL,
  `EVT_PHONE` VARCHAR(255) NOT NULL,
  `EVT_TRG_DATE` DATE NOT NULL,
  `EVT_CTG_ID` INT(11) NOT NULL,
  PRIMARY KEY (`EVT_IDX`),
  INDEX `fk_evt_evt_EVT_CTG1_idx` (`EVT_CTG_ID` ASC) VISIBLE,
  CONSTRAINT `fk_evt_evt_EVT_CTG1`
    FOREIGN KEY (`EVT_CTG_ID`)
    REFERENCES `evtdb`.`EVT_CTG` (`EVT_CTG_IDX`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `evtdb`.`CUST_BAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`CUST_BAS` (
  `CUST_IDX` INT(11) NOT NULL AUTO_INCREMENT,
  `CUST_NM` VARCHAR(255) NOT NULL,
  `CUST_ID` VARCHAR(255) NOT NULL,
  `CUST_PWD` VARCHAR(255) NOT NULL,
  `CUST_PHONE` VARCHAR(255) NOT NULL,
  `CUST_EMAIL` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CUST_IDX`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `evtdb`.`CUST_APP_RES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`CUST_APP_RES` (
  `APP_IDX` INT(11) NOT NULL AUTO_INCREMENT,
  `EVT_IDX` INT(11) NOT NULL,
  `CUST_IDX` INT(11) NOT NULL,
  `PRIZE` INT(10) NOT NULL,
  PRIMARY KEY (`APP_IDX`),
  INDEX `EVT_ID_EVT_idx` (`EVT_IDX` ASC) VISIBLE,
  INDEX `fk_cust_app_res_cust_bas1_idx` (`CUST_IDX` ASC) VISIBLE,
  CONSTRAINT `EVT_ID_EVT`
    FOREIGN KEY (`EVT_IDX`)
    REFERENCES `evtdb`.`EVT_EVT` (`EVT_IDX`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cust_app_res_cust_bas1`
    FOREIGN KEY (`CUST_IDX`)
    REFERENCES `evtdb`.`CUST_BAS` (`CUST_IDX`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `evtdb`.`CUST_DT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`CUST_DT` (
  `CUST_IDX` INT(11) NOT NULL,
  `CUST_PROD` VARCHAR(255) NOT NULL,
  `CUST_MBS` VARCHAR(255) NOT NULL DEFAULT 'SILVER',
  `CUST_POINT` INT(11) NOT NULL DEFAULT '50000',
  `CUST_DATA_SIZE` DOUBLE UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`CUST_IDX`),
  INDEX `fk_cust_dt_cust_bas1_idx` (`CUST_IDX` ASC) VISIBLE,
  CONSTRAINT `fk_cust_dt_cust_bas1`
    FOREIGN KEY (`CUST_IDX`)
    REFERENCES `evtdb`.`CUST_BAS` (`CUST_IDX`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `evtdb`.`EVT_DT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`EVT_DT` (
  `EVT_DT_IDX` INT(11) NOT NULL AUTO_INCREMENT,
  `EVT_IDX` INT(11) NOT NULL,
  `RES_DATA` VARCHAR(255) NOT NULL,
  `DATA_TYPE` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`EVT_DT_IDX`),
  INDEX `fk_EVT_DT_evt_evt1_idx` (`EVT_IDX` ASC) VISIBLE,
  CONSTRAINT `fk_EVT_DT_evt_evt1`
    FOREIGN KEY (`EVT_IDX`)
    REFERENCES `evtdb`.`EVT_EVT` (`EVT_IDX`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
