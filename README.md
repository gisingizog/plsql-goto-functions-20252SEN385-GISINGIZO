# Employee Management System Using PL/SQL

## 1. Project Description

The Employee Management System is a database project developed using Oracle PL/SQL. It demonstrates how PL/SQL can be used to manage employee information, classify salaries, calculate payroll information, and validate employee records.

The project was developed as part of the Database Development with PL/SQL course. It focuses on GOTO statements, stored functions, exception handling, and the use of functions in SQL queries.

The database objects are created and executed inside an Oracle Pluggable Database (PDB) using Oracle SQL Developer.

## 2. Project Objectives

The objectives of this project are to:

* Understand and implement PL/SQL GOTO statements.
* Classify employee salaries into different categories.
* Review employee salaries using conditional statements.
* Demonstrate an illegal GOTO statement and its correction.
* Rewrite a GOTO program using normal conditional statements.
* Create stored functions for employee-related calculations.
* Calculate annual salaries and years of service.
* Calculate employee tax based on annual salary.
* Retrieve department names using department IDs.
* Use stored functions directly in SQL queries.
* Validate employee payroll information.
* Apply exception handling when employee records cannot be found.

## 3. Technologies Used

* **Oracle Database:** Database management system.
* **Oracle Pluggable Database (PDB):** Container in which the project database objects are created.
* **Oracle SQL Developer:** Tool used to write and execute SQL and PL/SQL scripts.
* **PL/SQL:** Programming language used to implement the assignment tasks.
* **Git and GitHub:** Version control and project repository management.

## 4. Database Design

The project uses two tables: `DEPARTMENTS` and `EMPLOYEES`.

### 4.1 Departments Table

The `DEPARTMENTS` table stores information about company departments.

| Column            | Description                           |
| ----------------- | ------------------------------------- |
| `DEPARTMENT_ID`   | Unique identifier for each department |
| `DEPARTMENT_NAME` | Name of the department                |

### 4.2 Employees Table

The `EMPLOYEES` table stores employee information.

| Column          | Description                              |
| --------------- | ---------------------------------------- |
| `EMPLOYEE_ID`   | Unique employee identifier               |
| `FIRST_NAME`    | Employee's first name                    |
| `LAST_NAME`     | Employee's last name                     |
| `DEPARTMENT_ID` | Department to which the employee belongs |
| `JOB_TITLE`     | Employee's job title                     |
| `SALARY`        | Employee's monthly salary                |
| `HIRE_DATE`     | Date the employee joined the company     |
| `STATUS`        | Employee's employment status             |

The `DEPARTMENT_ID` column in the employees table references the departments table. This relationship helps maintain consistency between employees and their departments.

## 5. Project Tasks

### Part A: GOTO Statements

#### A1: Number Classifier

This program classifies a salary into one of three categories: HIGH, MEDIUM, or LOW. It uses GOTO statements to transfer control to the appropriate label.

#### A2: Salary Review

This program retrieves an employee's salary and determines whether the salary is excellent, satisfactory, or requires review. It also handles cases where the employee does not exist.

#### A3: Illegal GOTO and Fix

This task demonstrates an invalid GOTO statement that attempts to jump into a restricted scope. The program is then corrected by placing the target label in a valid location.

#### A4: Rewrite Without GOTO

This task rewrites the salary review program using `IF`, `ELSIF`, and `ELSE` statements instead of GOTO statements. The rewritten version demonstrates a more straightforward approach to conditional logic.

### Part B: Stored Functions

#### B1: Annual Salary Function

The `FN_ANNUAL_SALARY` function receives an employee ID and returns the employee's annual salary by multiplying the monthly salary by twelve. It returns `NULL` if the employee is not found.

#### B2: Years of Service Function

The `FN_YEARS_OF_SERVICE` function calculates the number of completed years an employee has worked for the company using the hire date.

#### B3: Tax Calculator Function

The `FN_CALCULATE_TAX` function calculates tax based on the supplied annual salary.

The project uses the following example tax rates:

| Annual Salary                    | Tax Rate |
| -------------------------------- | -------: |
| Up to 5,000,000                  |      10% |
| Above 5,000,000 up to 10,000,000 |      15% |
| Above 10,000,000                 |      20% |

These rates are illustrative rules used in this project.

#### B4: Department Name Function

The `FN_DEPT_NAME` function receives a department ID and returns the corresponding department name. If the department does not exist, it returns a message indicating that the department was not found.

#### B5: Functions in SQL

This task demonstrates how stored functions can be called directly in SQL queries to generate an employee report.

The report includes:

* Employee ID and full name.
* Job title.
* Monthly salary.
* Annual salary.
* Years of service.
* Calculated annual tax.
* Department name.

### Part C: Combined Task

#### C1: Payroll Validator

The `FN_VALIDATE_PAYROLL` function validates employee payroll information.

It checks whether:

* The employee exists.
* The salary is greater than zero.
* A department has been assigned.
* The employee is active.

The function returns a validation message indicating whether the payroll information is valid or identifying the problem.

#### C2: Reflection

The reflection discusses what was learned from implementing GOTO statements, stored functions, exception handling, and SQL queries that call functions.

It also explains the importance of writing readable and maintainable PL/SQL programs.

## 6. Project Directory Structure

```text
plsql-goto-functions-<studentID>-<firstname>/
│
├── README.md
├── .gitignore
│
├── 00_setup/
│   └── create_tables.sql
│
├── 01_goto/
│   ├── A1_number_classifier.sql
│   ├── A2_salary_review.sql
│   ├── A3_illegal_goto.sql
│   └── A4_rewrite_no_goto.sql
│
├── 02_functions/
│   ├── B1_fn_annual_salary.sql
│   ├── B2_fn_years_of_service.sql
│   ├── B3_fn_calculate_tax.sql
│   ├── B4_fn_dept_name.sql
│   └── C1_fn_validate_payroll.sql
│
├── 03_tests/
│   ├── B5_functions_in_select.sql
│   ├── test_functions.sql
│   └── test_validate_payroll.sql
│
├── screenshots/
│   ├── A1_output.png
│   ├── A2_output.png
│   ├── A3_error_and_fix.png
│   ├── A4_output.png
│   ├── B5_select_output.png
│   └── C1_output.png
│
└── docs/
    └── REFLECTION.md
```

## 7. How to Run the Project

### Step 1: Connect to the PDB

Open Oracle SQL Developer and connect using the database user associated with the project PDB.

Verify the current container:

```sql
SELECT SYS_CONTEXT('USERENV', 'CON_NAME') AS CONTAINER
FROM dual;
```

Make sure the result is the intended PDB rather than `CDB$ROOT`.

### Step 2: Create the Tables

Run:

`00_setup/create_tables.sql`

This script creates the departments and employees tables and inserts sample records.

### Step 3: Compile the Stored Functions

Run the following scripts:

1. `B1_fn_annual_salary.sql`
2. `B2_fn_years_of_service.sql`
3. `B3_fn_calculate_tax.sql`
4. `B4_fn_dept_name.sql`
5. `C1_fn_validate_payroll.sql`

Make sure each function compiles successfully.

### Step 4: Run the GOTO Programs

Execute the scripts in the `01_goto` directory:

1. `A1_number_classifier.sql`
2. `A2_salary_review.sql`
3. `A3_illegal_goto.sql`
4. `A4_rewrite_no_goto.sql`

For A3, execute the intentionally incorrect example separately to demonstrate the error, then execute the corrected version.

### Step 5: Run the Tests

Execute the scripts in the `03_tests` directory:

* `B5_functions_in_select.sql`
* `test_functions.sql`
* `test_validate_payroll.sql`

Check the query results and output messages to verify the functions.

### Step 6: Capture Screenshots

Capture screenshots showing the program outputs, the A3 error and correction, the SQL function report, and the payroll validation results.

Store the screenshots in the `screenshots` directory.

## 8. Testing and Expected Results

The project tests the following behaviors:

| Test                  | Expected Behavior                               |
| --------------------- | ----------------------------------------------- |
| Salary classification | Displays the appropriate salary category        |
| Salary review         | Displays the appropriate salary review message  |
| Illegal GOTO          | Demonstrates an invalid jump and its correction |
| Annual salary         | Returns monthly salary multiplied by twelve     |
| Years of service      | Returns completed years of employment           |
| Tax calculator        | Calculates tax according to the example rates   |
| Department lookup     | Returns the department name                     |
| Missing employee      | Handles an employee ID that does not exist      |
| SQL report            | Displays employee and payroll information       |
| Payroll validator     | Reports valid or invalid payroll information    |

## 9. Exception Handling

Exception handling is used to prevent certain errors from terminating a program unexpectedly.

For example, the annual salary and years of service functions handle `NO_DATA_FOUND` when the requested employee does not exist.

The salary review program also handles missing employee records.

The payroll validator returns an error message when an employee record cannot be found.

## 10. Lessons Learned

Through this project, I learned how to use GOTO statements and labels to control program execution in PL/SQL. I also learned that excessive use of GOTO statements can make programs difficult to understand.

I gained experience creating stored functions for salary calculations, years of service, tax calculations, and department lookups. I also learned how to use these functions in SQL queries to generate reports.

The project improved my understanding of exception handling and payroll validation. It demonstrated how database programming can be used to process employee information and produce useful reports.

## 11. Conclusion

The Employee Management System demonstrates the use of Oracle PL/SQL for employee-related database operations. It combines GOTO statements, conditional logic, stored functions, SQL queries, and exception handling to perform salary classification, salary calculations, department lookups, and payroll validation.

The project also demonstrates the importance of testing database programs and organizing source code into separate files for easier maintenance and reuse.



```
```
