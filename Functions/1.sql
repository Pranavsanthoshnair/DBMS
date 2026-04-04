-- Create a function to calculate factorial
CREATE OR REPLACE FUNCTION factorial(n IN NUMBER)
RETURN NUMBER
IS
    fact NUMBER := 1;  -- Initialize factorial value
BEGIN
    -- Loop from 1 to n
    FOR i IN 1..n LOOP
        fact := fact * i;  -- Multiply each number
    END LOOP;

    RETURN fact;  -- Return result
END;
/

-- Anonymous block to call function and display result
DECLARE
    num NUMBER;       -- Variable to store input
    result NUMBER;    -- Variable to store output
BEGIN
    num := &num;  -- Take input from user

    result := factorial(num);  -- Call function

    -- Display result
    DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ' is: ' || result);
END;
/
