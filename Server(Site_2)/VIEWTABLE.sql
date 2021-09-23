clear screen;
DROP table VIEWTABLE;

Create table   VIEWTABLE as ( select * from HOSPITALINFOTABLE);

create or replace view view1(view_A, view_B, view_C,view_D, view_E) as
select S.HospitalId, S.HospitalName, S.Location,S.PhoneNumber, S.IcuBedCapacity
from  VIEWTABLE S;

select * from view1;

commit;