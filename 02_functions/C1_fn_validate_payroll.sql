CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_employee_id IN employees.employee_id%TYPE
)
RETURN VARCHAR2
IS
    v_salary employees.salary%TYPE;
    v_department_id employees.department_id%TYPE;
    v_status employees.status%TYPE;
BEGIN

    SELECT
        salary,
        department_id,
        status
    INTO
        v_salary,
        v_department_id,
        v_status
    FROM employees
    WHERE employee_id = p_employee_id;

    IF v_salary IS NULL OR v_salary <= 0 THEN
        RETURN 'INVALID: Salary is not valid';
    END IF;

    IF v_department_id IS NULL THEN
        RETURN 'INVALID: Department is missing';
    END IF;

    IF v_status <> 'ACTIVE' THEN
        RETURN 'INVALID: Employee is inactive';
    END IF;

    RETURN 'VALID: Payroll information is correct';

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee does not exist';

    WHEN OTHERS THEN
        RETURN 'ERROR: ' || SQLERRM;
END;
/