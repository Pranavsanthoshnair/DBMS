-- EXP 15: CREATION OF PACKAGE

SET SERVEROUTPUT ON;

-- PACKAGE SPECIFICATION
CREATE OR REPLACE PACKAGE pk1 AS
    PROCEDURE proc1(a NUMBER, b NUMBER);
    PROCEDURE proc2(n NUMBER);
    FUNCTION fn11(n NUMBER) RETURN VARCHAR2;
    FUNCTION fn22(a NUMBER, b NUMBER, c NUMBER) RETURN NUMBER;
END pk1;
/

-- PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY pk1 AS

    PROCEDURE proc1(a NUMBER, b NUMBER) IS
        s NUMBER;
        avg NUMBER;
        prod NUMBER;
    BEGIN
        s := a + b;
        avg := (a + b)/2;
        prod := a * b;

        DBMS_OUTPUT.PUT_LINE('Sum = ' || s);
        DBMS_OUTPUT.PUT_LINE('Average = ' || avg);
        DBMS_OUTPUT.PUT_LINE('Product = ' || prod);
    END;

    PROCEDURE proc2(n NUMBER) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Square Root = ' || SQRT(n));
    END;

    FUNCTION fn11(n NUMBER) RETURN VARCHAR2 IS
    BEGIN
        IF MOD(n,2)=0 THEN
            RETURN 'Even';
        ELSE
            RETURN 'Odd';
        END IF;
    END;

    FUNCTION fn22(a NUMBER, b NUMBER, c NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN a+b+c;
    END;

END pk1;
/

-- MAIN PROGRAM
DECLARE
    res VARCHAR2(10);
    total NUMBER;
BEGIN
    pk1.proc1(10,5);
    pk1.proc2(25);

    res := pk1.fn11(7);
    DBMS_OUTPUT.PUT_LINE('Number is ' || res);

    total := pk1.fn22(2,3,4);
    DBMS_OUTPUT.PUT_LINE('Sum of 3 numbers = ' || total);
END;
/
