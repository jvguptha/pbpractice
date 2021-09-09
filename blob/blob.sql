create table for_blob( TestID integer,BLOBName varChar(50),BLOBData varBinary(2000) );


CREATE TABLE for_blob
(
TestID INTEGER DEFAULT AUTOINCREMENT,
BLOBName varChar(50),
BLOBData BLOB);



CREATE TABLE for_blob
(
TestID INTEGER DEFAULT AUTOINCREMENT,
BLOBName varChar(50),
BLOBData varBinary(32767));


---------------------------
Select
---------------------------
This column's data type requires the use of an embedded SQL statement.
---------------------------
OK   
---------------------------
