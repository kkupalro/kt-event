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
  `EVT_ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '이벤트 아이디',
  `EVT_NM` VARCHAR(255) NOT NULL COMMENT '이벤트명',
  `EVT_DT` VARCHAR(255) NOT NULL COMMENT '이벤트내용',
  `ST_DATE` DATE NOT NULL COMMENT '시작날짜',
  `END_DATE` DATE NOT NULL COMMENT '종료날짜',
  `EVT_ST` INT(10) NOT NULL COMMENT '상태',
  `EVT_FILE_URL` VARCHAR(255) NOT NULL COMMENT '파일',
  `EVT_CTG` VARCHAR(255) NOT NULL COMMENT '분류',
  `EVT_TRG` VARCHAR(255) NOT NULL COMMENT '응모대상',
  `EVT_PHONE` VARCHAR(255) NOT NULL COMMENT '이벤트문의',
  `EVT_TRG_DATE` DATE NOT NULL COMMENT '당첨자발표',
  PRIMARY KEY (`EVT_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT='이벤트';

-- -----------------------------------------------------
-- Table `evtdb`.`cust_bas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`cust_bas` (
  `CUST_ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '회원 아이디',
  `ENAME` VARCHAR(255) NOT NULL COMMENT '이름',
  `ID` VARCHAR(255) NOT NULL COMMENT '아이디',
  `PWD` VARCHAR(255) NOT NULL COMMENT '비밀번호',
  `PHONE` VARCHAR(255) NOT NULL COMMENT '핸드폰번호',
  `EMAIL` VARCHAR(255) NOT NULL COMMENT '이메일',
  PRIMARY KEY (`CUST_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = '회원';


-- -----------------------------------------------------
-- Table `evtdb`.`cust_app_res`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`cust_app_res` (
  `APP_ID` INT(11) NOT NULL COMMENT '응모 아이디',
  `EVT_ID` INT(11) NOT NULL COMMENT '이벤트 아이디',
  `CUST_ID` INT(11) NOT NULL COMMENT '회원 아이디',
  `PRIZE` INT(10) NOT NULL COMMENT '당첨여부',
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
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '응모자';

-- -----------------------------------------------------
-- Table `evtdb`.`cust_dt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evtdb`.`cust_dt` (
  `CUST_ID` INT(11) NOT NULL COMMENT '회원 아이디',
  `PAY_SYS` VARCHAR(255) NOT NULL COMMENT '요금제',
  `MBS` VARCHAR(255) NOT NULL DEFAULT 'SILVER' COMMENT '멤버쉽', 
  `POINT` INT NOT NULL DEFAULT '50000' COMMENT '포인트',
  `DATA_SIZE` DOUBLE UNSIGNED NOT NULL DEFAULT 0 COMMENT '데이터 용량',
  INDEX `fk_cust_dt_cust_bas1_idx` (`CUST_ID` ASC) VISIBLE,
  PRIMARY KEY (`CUST_ID`),
  CONSTRAINT `fk_cust_dt_cust_bas1`
    FOREIGN KEY (`CUST_ID`)
    REFERENCES `evtdb`.`cust_bas` (`CUST_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = '회원 상세정보';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- ----------------------------------------------------------------------
-- 테이블 정보 보기
select table_name, table_comment
from information_schema.tables
where table_schema = 'evtdb' and table_name = 'cust_app_res';

-- 칼럼 정보 보기
select column_name, column_comment
from information_schema.columns
where table_schema = 'evtdb' and table_name = 'cust_app_res';