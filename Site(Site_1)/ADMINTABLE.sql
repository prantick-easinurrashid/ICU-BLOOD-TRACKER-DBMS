--ADMIN TABLE INFORMATION
CLEAR SCREEN;
SET VERIFY OFF;

DROP TABLE ADMINTABLE;

CREATE TABLE ADMINTABLE(
HospitalId  number,
AdminEmail varchar2(20) unique,
Password varchar2(10));

INSERT INTO ADMINTABLE VALUES(1,'admin1@gmail.com','12345');
INSERT INTO ADMINTABLE VALUES(2,'admin2@gmail.com','12345');
INSERT INTO ADMINTABLE VALUES(3,'admin3@gmail.com','12345');
INSERT INTO ADMINTABLE VALUES(4,'admin4@gmail.com','12345');
INSERT INTO ADMINTABLE VALUES(5,'admin5@gmail.com','12345');
INSERT INTO ADMINTABLE VALUES(6,'admin6@gmail.com','12345');
INSERT INTO ADMINTABLE VALUES(7,'admin7@gmail.com','12345');
INSERT INTO ADMINTABLE VALUES(8,'admin8@gmail.com','12345');
INSERT INTO ADMINTABLE VALUES(9,'admin9@gmail.com','12345');

--CREATE TABLE JOINTABLE AS (SELECT * FROM ADMINTABLE NATURAL JOIN HOSPITALINFOTABLE @site2);

COMMIT;
SELECT * FROM ADMINTABLE;
--SELECT * FROM JOINTABLE ;

