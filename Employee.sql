CREATE TABLE Employee (Emp_Id INT PRIMARY KEY,Emp_Name VARCHAR(100),Dept VARCHAR(50),Salary INT);

INSERT INTO Employee VALUES (1,'David Smith','HR',7000);
INSERT INTO Employee VALUES (2,'Olivia Brown','Finance',8000);
INSERT INTO Employee VALUES (3,'James Wilson','Marketing',7500);
INSERT INTO Employee VALUES (4,'Sophia Taylor','Production',7200);
INSERT INTO Employee VALUES (5,'Liam Johnson','Production',6800);

SELECT * FROM Employee;

UPDATE Employee SET Salary = 8200 WHERE Emp_Name = 'David Smith';
SELECT * FROM Employee;

INSERT INTO Employee VALUES (6,'Dammiel Harris','Production',6700);
SELECT * FROM Employee;

DELETE FROM Employee WHERE Emp_Id = 3;
SELECT * FROM Employee;

SELECT * FROM Employee WHERE Emp_Name NOT LIKE 'D%';

UPDATE Employee SET Salary = Salary + (Salary * 5 / 100) WHERE Dept = 'Production';
SELECT * FROM Employee;

DELETE FROM Employee WHERE Salary < 7000;
SELECT * FROM Employee;

SELECT * FROM Employee WHERE Salary = (SELECT MIN(Salary) FROM Employee);

UPDATE Employee SET Salary = 8200 WHERE Dept = 'Marketing';
SELECT * FROM Employee;

SELECT * FROM Employee WHERE Emp_Name LIKE 'A%';