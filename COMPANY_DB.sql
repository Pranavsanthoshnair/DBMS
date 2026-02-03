/*
Create a table named Companies that contain Company_Id,Name of the company,Adress,Email_ID and Phone_No
1) Insert 5 values into table
2) Renam Table Companies into Another Name
3) Rename Phone number with another Name
4) Drop the Table
5) Truncate the Table
6) Add 2 new Columns DOB,Gender into the Company
*/

CREATE TABLE COMPANIES(Company_Id INT Primary Key,Name VARCHAR(20),Adress VARCHAR(50),Email VARCHAR(30),Phone_no INT);
INSERT into COMPANIES VALUES(1,'Bheem','las vegas','bheem@gmail.com',7309875432);
INSERT into COMPANIES VALUES(2,'Raju','New York','raju@gmail.com',7309875978);
INSERT into COMPANIES VALUES(3,'Kalia','Dholakpur','kalia@gmail.com',8609875432);
INSERT into COMPANIES VALUES(4,'Chintu','Poonjar','chintu@gmail.com',7309889432);
INSERT into COMPANIES VALUES(5,'Mintu','Bihar','mintu@gmail.com',7309875652);
ALTER TABLE COMPANIES Rename to COMPANY_DB;
ALTER TABLE COMPANY_DB Rename Column Phone_No to Mobile_No;
DROP TABLE COMPANY_DB;
TRUNCATE TABLE COMPANY_DB;
SELECT * FROM COMPANY_DB;
ALTER TABLE COMPANY_DB Add(DOB Date,Gender VARCHAR(20));
INSERT into COMPANY_DB VALUES(6,'Indumati','Delhi','indumati@gmail.com',7309890652,'02-08-2011','Female');
