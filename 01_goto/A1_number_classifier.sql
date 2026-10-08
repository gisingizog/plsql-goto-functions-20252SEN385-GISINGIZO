SET SERVEROUTPUT ON;

DECLARE
    v_salary employees.salary%TYPE := 850000;
BEGIN

    IF v_salary >= 900000 THEN
        GOTO high_salary;

    ELSIF v_salary >= 700000 THEN
        GOTO medium_salary;

    ELSE
        GOTO low_salary;
    END IF;

    <<high_salary>>
    DBMS_OUTPUT.PUT_LINE('Salary Category: HIGH');
    GOTO finish;

    <<medium_salary>>
    DBMS_OUTPUT.PUT_LINE('Salary Category: MEDIUM');
    GOTO finish;

    <<low_salary>>
    DBMS_OUTPUT.PUT_LINE('Salary Category: LOW');

    <<finish>>
    DBMS_OUTPUT.PUT_LINE('Salary classification completed.');

END;
/