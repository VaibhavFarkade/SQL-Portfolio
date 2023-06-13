 Let's start with a scenario involving an employee database. Consider a table named "employees" with the following columns:
 "employee_id" (integer), "first_name" (text), "last_name" (text), "department" (text), "position" (text), "salary" (numeric), and "hire_date" (date).
 

Consider the following table:->
Table: employees
| employee_id | first_name | last_name | department | position | salary  | hire_date |
| ----------- | ---------- | --------- | ---------- | -------- | ------- | --------- |
| 1           | John       | Doe       | Sales      | Manager  | 5000.00 | 2020-01-15|
| 2           | Jane       | Smith     | HR         | Analyst  | 4000.00 | 2019-08-20|
| 3           | Mark       | Johnson   | IT         | Developer| 6000.00 | 2021-03-10|


--------------------------------------------------------------------------------------------------------------------------------------------------

Q.1) Retrieve the first name and last name of all employees from the "employees" table.
```SQL
SELECT first_name, last_name
FROM employees;
```
--------------------------------------------------------------------------------------------------------------------------------------------------

Q.2) Retrieve the employee IDs and salaries of employees who have a salary greater than $50,000.
```SQL
SELECT employee_id, salary
FROM employees
WHERE salary>50000;
```
--------------------------------------------------------------------------------------------------------------------------------------------------

Q.3) Retrieve the first name, last name, and department of employees who work in the "Marketing" department.
```SQL
SELECT first_name, last_name, department
FROM employees
WHERE department='Marketing';
```
------------------------------------------------------------------------------------------------------------------------------------------------------

Q.4) Retrieve the first name, last name, and hire date of employees hired after January 1, 2022.
```SQL
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > 01-01-2022;
```
------------------------------------------------------------------------------------------------------------------------------------------------------

Q.5) Retrieve the first name, last name, and position of employees sorted by their last names in descending order.
```SQL
SELECT first_name, last_name, position
FROM emloyees
ORDER BY last_name DESC;
```
------------------------------------------------------------------------------------------------------------------------------------------------------

Q.6) Retrieve the first name, last name, and salary of the top 5 highest-paid employees.
```SQL
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;
```
------------------------------------------------------------------------------------------------------------------------------------------------------

Q.7) Retrieve the first name, last name, and hire date of the 10 most recently hired employees.
```SQL
SELECT first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 10;
```
------------------------------------------------------------------------------------------------------------------------------------------------------

Q.8) Retrieve the first name, last name, and department of employees in the "Sales" department, sorted alphabetically by last name.
```SQL
SELECT first_name, last_name, department
FROM employees
WHERE department='Sales'
ORDER BY last_name;
```
------------------------------------------------------------------------------------------------------------------------------------------------------

Q.9) Retrieve the first name, last name, and position of employees whose position starts with the letter 'A'.
```SQL
SELECT first_name, last_name, position
FROM employees
WHERE position LIKE 'A%';
```
------------------------------------------------------------------------------------------------------------------------------------------------------

Q.10) Retrieve the total number of employees in the "employees" table.
```SQL
SELECT COUNT(employee_id) AS total_employees
FROM employees;
```
------------------------------------------------------------------------------------------------------------------------------------------------------





