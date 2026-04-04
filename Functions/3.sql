-- Create table
CREATE TABLE student (
    id NUMBER,
    name VARCHAR2(30),
    m1 NUMBER,
    m2 NUMBER,
    m3 NUMBER,
    total NUMBER,
    grade VARCHAR2(2)
);

-- Insert sample data
INSERT INTO student (id, name, m1, m2, m3) VALUES (1, 'Akhil', 85, 78, 90);
INSERT INTO student (id, name, m1, m2, m3) VALUES (2, 'Rahul', 60, 72, 68);
INSERT INTO student (id, name, m1, m2, m3) VALUES (3, 'Sneha', 95, 88, 92);

-- Display initial table
SELECT * FROM student;

--------------------------------------------------
-- Function to calculate grade based on total
--------------------------------------------------
CREATE OR REPLACE FUNCTION f1(total IN NUMBER)
RETURN VARCHAR2
IS
    g VARCHAR2(2);
BEGIN
    IF total >= 270 THEN
        g := 'A';
    ELSIF total >= 240 THEN
        g := 'B';
    ELSIF total >= 200 THEN
        g := 'C';
    ELSE
        g := 'F';
    END IF;

    RETURN g;
END;
/

--------------------------------------------------
-- Procedure to update total and grade
--------------------------------------------------
CREATE OR REPLACE PROCEDURE p1 IS
BEGIN
    -- Update total and grade using function
    UPDATE student
    SET total = m1 + m2 + m3,
        grade = f1(m1 + m2 + m3);

    DBMS_OUTPUT.PUT_LINE('Total and Grade updated for all students');
END;
/

-- Execute procedure
EXEC p1;

-- Display updated table
SELECT * FROM student;
