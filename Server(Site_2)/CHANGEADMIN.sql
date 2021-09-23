SET VERIFY OFF;
SET SERVEROUTPUT ON;

--TAKE INPUT FROM USER
ACCEPT H_NUM NUMBER PROMPT 'Enter Hospital ID: '
ACCEPT Admin_Name CHAR PROMPT 'Enter Admin Usrer Name: '
ACCEPT NEWPASS CHAR PROMPT 'Enter your new password: '

--TRIGGER CREATE
CREATE OR REPLACE TRIGGER ADMIN_PASS_CHANGE 
before update of Password ON ADMINTABLE
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('TRIGGER AND DATA UPDATE IN THE ADMIN TABLE');
END;
/


DECLARE
	N  ADMINTABLE.HospitalID@site1%TYPE;
	AdminName ADMINTABLE.AdminEmail@site1%TYPE;
	NEW_PASS ADMINTABLE.Password@site1%TYPE;
	
	FLAG NUMBER;
	DATANOTFOUND EXCEPTION;

BEGIN 
	N:=&H_NUM;
	AdminName:='&Admin_Name';
	NEW_PASS:='&NEWPASS';
	
	FLAG:= 0;

--CHANGE ADMIN

FOR R IN (SELECT * FROM ADMINTABLE@site1) LOOP

  IF R.HospitalID = N THEN
  UPDATE ADMINTABLE@site1 SET ADMINTABLE.AdminEmail = AdminName where ADMINTABLE.HospitalID = N;
  UPDATE ADMINTABLE@site1 SET ADMINTABLE.Password = NEW_PASS where ADMINTABLE.HospitalID = N;
  FLAG:=1;
  EXIT;
  END IF;
  
  IF FLAG = 0 THEN
		RAISE DATANOTFOUND;
  END IF;
 
END LOOP;

EXCEPTION
WHEN DATANOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND EXCEPTION RAISE' );
	
END;
/
COMMIT;