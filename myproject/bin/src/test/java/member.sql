CREATE TABLE member(
	id VARCHAR(100) PRIMARY KEY,
	password VARCHAR(100) NOT NULL,
	name VARCHAR(100) NOT NULL,
	address VARCHAR(100) NOT NULL	
);

INSERT INTO member(id,password,name,address) VALUES('java','1234','아이유','종로');
COMMIT;