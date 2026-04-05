-- EXP 16 Q2: BANK INTEREST USING CURSOR

SET SERVEROUTPUT ON;

-- CREATE TABLES
CREATE TABLE bank_details (
    accno NUMBER,
    name VARCHAR2(20),
    balance NUMBER,
    address VARCHAR2(30)
);

CREATE TABLE interest_table (
    accno NUMBER,
    interest NUMBER
);

-- INSERT DATA
INSERT INTO bank_details VALUES (101,'Ram',10000,'Kochi');
INSERT INTO bank_details VALUES (102,'Ravi',20000,'TVM');
INSERT INTO bank_details VALUES (103,'Anu',15000,'EKM');

COMMIT;

-- VIEW ORIGINAL TABLE
SELECT * FROM bank_details;

-- CURSOR PROGRAM
DECLARE
    CURSOR c2 IS SELECT accno,balance FROM bank_details;
    r c2%ROWTYPE;
    intr NUMBER;
BEGIN
    OPEN c2;
    LOOP
        FETCH c2 INTO r;
        EXIT WHEN c2%NOTFOUND;

        intr := 0.08 * r.balance;

        INSERT INTO interest_table VALUES (r.accno, intr);

    END LOOP;
    CLOSE c2;
END;
/

-- DISPLAY RESULT
SELECT * FROM interest_table;
