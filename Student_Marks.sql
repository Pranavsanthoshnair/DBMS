-- Create Table

CREATE TABLE Student
(
Roll INT PRIMARY KEY,
Name VARCHAR(30),
Physics INT,
Chemistry INT,
Mathematics INT
);


-- Insert Values

INSERT INTO Student VALUES (1,'Arun',20,18,40);
INSERT INTO Student VALUES (2,'Meera',15,12,35);
INSERT INTO Student VALUES (3,'Rahul',10,14,30);
INSERT INTO Student VALUES (4,'Anu',22,20,45);
INSERT INTO Student VALUES (5,'Vishnu',13,11,28);
INSERT INTO Student VALUES (6,'Sneha',18,17,42);
INSERT INTO Student VALUES (7,'Ravi',8,15,20);
INSERT INTO Student VALUES (8,'Divya',21,19,44);
INSERT INTO Student VALUES (9,'Kiran',16,13,33);
INSERT INTO Student VALUES (10,'Neha',12,12,25);


-- Class Average Physics

SELECT AVG(Physics) AS average_physics
FROM Student;


-- Highest Marks Mathematics

SELECT MAX(Mathematics) AS highest_marks_maths
FROM Student;


-- Lowest Marks Chemistry

SELECT MIN(Chemistry) AS lowest_marks_chemistry
FROM Student;


-- Students Passed Physics

SELECT COUNT(*) AS pass_physics
FROM Student
WHERE Physics >= 12;


-- Students Passed All Subjects

SELECT *
FROM Student
WHERE Physics>=12
AND Chemistry>=12
AND Mathematics>=25;


-- Total Marks of Each Student

SELECT Roll,Name,
Physics+Chemistry+Mathematics AS totalmark
FROM Student;


-- Class Average Total Marks

SELECT AVG(Physics+Chemistry+Mathematics) AS class_average
FROM Student;


-- Total Students Passed

SELECT COUNT(*) AS total_pass
FROM Student
WHERE Physics>=12
AND Chemistry>=12
AND Mathematics>=25;
