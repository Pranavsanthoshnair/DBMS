CREATE TABLE Bank(
    BankCode INT PRIMARY KEY,
    BankName VARCHAR(50),
    HeadOffice VARCHAR(50),
    Branch VARCHAR(50)
);
SELECT * FROM Bank;

INSERT INTO Bank VALUES
(1,'SBI','Ernakulam','Kottayam'),
(2,'HDFC','Ernakulam','Thrissur'),
(3,'ICICI','Kochi','Kottayam'),
(4,'Axis','Ernakulam','Alappuzha'),
(5,'Federal','Aluva','Kottayam');
SELECT * FROM Bank;

COMMIT;

SAVEPOINT sp1;

INSERT INTO Bank VALUES
(6,'Canara','Mangalore','Kochi');
SELECT * FROM Bank;

ROLLBACK TO sp1;
SELECT * FROM Bank;

GRANT SELECT ON Bank TO PUBLIC;

REVOKE SELECT ON Bank FROM PUBLIC;

CREATE TABLE Branch(
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(50),
    BankCode INT
);
SELECT * FROM Branch;

INSERT INTO Branch VALUES
(101,'Kottayam',1),
(102,'Thrissur',2),
(103,'Kottayam',3),
(104,'Alappuzha',4),
(105,'Kottayam',5);
SELECT * FROM Branch;

CREATE VIEW bank_headoffice AS
SELECT BankCode,BankName,HeadOffice,Branch
FROM Bank
WHERE HeadOffice='Ernakulam';

SELECT * FROM bank_headoffice;

CREATE VIEW bank_branch AS
SELECT BranchID,BranchName,BankCode
FROM Branch
WHERE BranchName='Kottayam';

SELECT * FROM bank_branch;