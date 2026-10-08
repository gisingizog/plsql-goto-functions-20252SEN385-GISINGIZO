SHOW CON_NAME;

CREATE TABLE department(
    department_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    department_name VARCHAR2(100) NOT NULL
);


CREATE TABLE employees (
    employee_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    department_id NUMBER,
    job_title VARCHAR2(100),
    salary NUMBER(10,2),
    hire_date DATE NOT NULL,
    status VARCHAR2(20) DEFAULT 'ACTIVE',

    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id),

    CONSTRAINT chk_employee_salary
        CHECK (salary >= 0),

    CONSTRAINT chk_employee_status
        CHECK (status IN ('ACTIVE', 'INACTIVE'))
);

-- ============================================
-- SAMPLE DEPARTMENTS
-- ============================================

INSERT INTO department(department_name) VALUES ('Information Technology');
INSERT INTO department(department_name) VALUES ('Human Resources');
INSERT INTO department(department_name) VALUES ('Finance');
INSERT INTO department(department_name) VALUES ('Marketing');

SELECT * FROM department;
-- ============================================
-- SAMPLE EMPLOYEES
-- ============================================

INSERT INTO employees(first_name,last_name, department_id, job_title, salary, hire_date,status)
VALUES ('John', 'Mugisha', 1, 'Backend Developer',
        850000, DATE '2022-03-15', 'ACTIVE');

INSERT INTO employees(first_name,last_name, department_id, job_title, salary, hire_date,status)
VALUES ('Alice', 'Uwase', 1, 'Software Engineer',
        950000, DATE '2021-06-10', 'ACTIVE');

INSERT INTO employees(first_name,last_name, department_id, job_title, salary, hire_date,status)
VALUES ('David', 'Niyonzima', 2, 'HR Officer',
        650000, DATE '2023-01-20', 'ACTIVE');

INSERT INTO employees(first_name,last_name, department_id, job_title, salary, hire_date,status)
VALUES ('Grace', 'Mukamana', 3, 'Accountant',
        750000, DATE '2020-09-05', 'ACTIVE');

INSERT INTO employees(first_name,last_name, department_id, job_title, salary, hire_date,status)
VALUES ('Eric', 'Habimana', 4, 'Marketing Officer',
        600000, DATE '2024-02-12', 'ACTIVE');

INSERT INTO employees(first_name,last_name, department_id, job_title, salary, hire_date,status)
VALUES ('Sarah', 'Iradukunda', 1, 'Mobile Developer',
        900000, DATE '2022-11-01', 'ACTIVE');

COMMIT;

SELECT * FROM employees;