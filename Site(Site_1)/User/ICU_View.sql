Drop TABLE ICUVIEWTABLE;

Create table ICUVIEWTABLE as ( SELECT HospitalName , IcuBedCapacity from HOSPITALINFOTABLE@site2 );

Create or REPLACE view VIEW1 ( Hospital , ICU_Avaiable) as  SELECT s.HospitalName , s.IcuBedCapacity FROM ICUVIEWTABLE s;

SELECT * from VIEW1;

COMMIT;