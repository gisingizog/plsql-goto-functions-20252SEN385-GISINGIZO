CREATE OR REPLACE FUNCTION fn_dept_name (
    p_department_id IN department.department_id%TYPE
)
RETURN VARCHAR2
IS
    v_department_name department.department_name%TYPE;
BEGIN

    SELECT department_name
    INTO v_department_name
    FROM department
    WHERE department_id = p_department_id;

    RETURN v_department_name;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Department Not Found';
END;
/