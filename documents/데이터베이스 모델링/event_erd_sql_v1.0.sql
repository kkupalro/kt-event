CREATE TABLE `evt_evt` (
  `EVT_ID` int NOT NULL AUTO_INCREMENT,
  `EVT_NM` varchar(255) NOT NULL,
  `EVT_DT` varchar(255) NOT NULL,
  `ST_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `EVT_ST` int NOT NULL DEFAULT '0',
  `EVT_FILE_URL` varchar(255) NOT NULL,
  `EVT_CTG` varchar(255) NOT NULL,
  PRIMARY KEY (`EVT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `cust_app_res` (
  `APP_ID` int NOT NULL AUTO_INCREMENT,
  `EVT_ID` int DEFAULT NULL,
  `CUST_ID` int DEFAULT NULL,
  `PRIZE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`APP_ID`),
  KEY `cust_app_res_ibfk_1` (`EVT_ID`),
  KEY `cust_app_res_ibfk_2` (`CUST_ID`),
  CONSTRAINT `cust_app_res_ibfk_1` FOREIGN KEY (`EVT_ID`) REFERENCES `evt_evt` (`EVT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cust_app_res_ibfk_2` FOREIGN KEY (`CUST_ID`) REFERENCES `cust_dt` (`CUST_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `cust_bas` (
  `CUST_ID` int NOT NULL AUTO_INCREMENT,
  `ENAME` varchar(255) NOT NULL,
  `ID` varchar(255) NOT NULL,
  `PWD` varchar(255) NOT NULL,
  `PHONE` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  PRIMARY KEY (`CUST_ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `cust_dt` (
  `CUST_ID` int NOT NULL AUTO_INCREMENT,
  `PAY_SYS` varchar(255) NOT NULL,
  `MBS` varchar(255) NOT NULL DEFAULT '화이트',
  `POINT` int NOT NULL DEFAULT '50000',
  `DATA_SIZE` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`CUST_ID`),
  CONSTRAINT `cust_dt_ibfk_1` FOREIGN KEY (`CUST_ID`) REFERENCES `cust_bas` (`CUST_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci