-- Create table
CREATE TABLE student_details (
    roll NUMBER,
    marks NUMBER,
    phone NUMBER
);

-- Insert sample data
INSERT INTO student_details VALUES (1, 80, 9876543210);
INSERT INTO student_details VALUES (2, 70, 9876501234);
INSERT INTO student_details VALUES (3, 90, 9876512345);

-- Display initial table
SELECT * FROM student_details;

-- Create procedure to increase marks by 5%
CREATE OR REPLACE PROCEDURE pr1 IS
BEGIN
    -- Update marks by adding 5%
    UPDATE student_details
    SET marks = marks * 1.05;

    -- Display message
    DBMS_OUTPUT.PUT_LINE('Marks boosted by 5% for all students');
END;
/

-- Execute procedure
EXEC pr1;

-- Display updated table
SELECT * FROM student_details;
