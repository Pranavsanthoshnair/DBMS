-- EXP 16 Q1: STUDENT TABLE USING CURSOR

SET SERVEROUTPUT ON;

-- CREATE TABLE
CREATE TABLE student (
    rid NUMBER,
    name VARCHAR2(20),
    m1 NUMBER,
    m2 NUMBER,
    m3 NUMBER,
    grade VARCHAR2(5)
);

-- INSERT DATA
INSERT INTO student VALUES (1,'A',80,75,70,NULL);
INSERT INTO student VALUES (2,'B',60,65,55,NULL);
INSERT INTO student VALUES (3,'C',90,85,95,NULL);
INSERT INTO student VALUES (4,'D',40,45,50,NULL);
INSERT INTO student VALUES (5,'E',70,60,65,NULL);

COMMIT;

-- BEFORE UPDATE
SELECT * FROM student;

-- CURSOR PROGRAM
DECLARE
    CURSOR c1 IS SELECT rid,m1,m2,m3 FROM student;
    r c1%ROWTYPE;
    total NUMBER;
    avg NUMBER;
    g VARCHAR2(5);
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO r;
        EXIT WHEN c1%NOTFOUND;

        total := r.m1 + r.m2 + r.m3;
        avg := total/3;

        IF avg>=80 THEN
            g:='A';
        ELSIF avg>=60 THEN
            g:='B';
        ELSIF avg>=50 THEN
            g:='C';
        ELSE
            g:='F';
        END IF;

        UPDATE student
        SET grade = g
        WHERE rid = r.rid;

    END LOOP;
    CLOSE c1;
END;
/

-- AFTER UPDATE
SELECT * FROM student;
