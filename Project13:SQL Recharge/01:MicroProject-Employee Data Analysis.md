The **"Employee Data Analysis"** micro-project is a practice exercise aimed at developing and enhancing your SQL skills. 🚀 The project revolves around an employee database, represented by the "employees" table, which includes columns such as *employee_id, first_name, last_name, department, position, salary, and hire_date.*

🔍 The queries in this project cover a variety of tasks, including:

- Basic retrieval of employee information ✅
- Filtering based on conditions using LIKE and BETWEEN ✅
- Sorting and ordering data ✅
- Performing calculations with COUNT, MIN, MAX, AVG, and SUM ✅

This micro-project provides an opportunity to practice common SQL operations that are essential for data analysis tasks. 📚 By working on these queries, you can strengthen your understanding of SQL syntax, sharpen your query writing skills, and become more proficient in retrieving and analyzing data from a database.

--------------------------------------------------------------------------------------------------------------------------------------------------

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

Q.6) Retrieve the first name, last name, and salary of the top 5 highest-paid employees. Also write another query showing combined salary of these employees.
```SQL
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;
```
- Another
```SQL
SELECT SUM(salary) AS combined_salary
FROM (
  SELECT salary
  FROM employees
  ORDER BY salary DESC
  LIMIT 5
) AS top_5_employees;
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

Q.10) Retrieve the total number of employees in the "employees" table having minimum salary.
```SQL
SELECT COUNT(employee_id) AS total_employees
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.11) Retrieve the distinct departments present in the "employees" table.
```SQL
SELECT DISTINCT department
FROM employees;
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.12) Retrieve the count of employees in each department.
```SQL
SELECT department, COUNT(employee_id) AS total_employees
FROM employees
GROUP BY department;
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.13) Retrieve the average salary of employees in the "Finance" department.
```SQL
SELECT AVG(salary) AS average_salary
FROM employees
WHERE department='Finance';
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.14) Retrieve the first name, last name, and length of the first name for all employees.
```SQL
SELECT first_name, last_name, LENGTH(first_name)
FROM employees;
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.15) Retrieve the first name, last name, and position of employees whose last name ends with the letter 's'.
```SQL
SELECT first_name, last_name, position
FROM employees
WHERE last_name LIKE '%s';
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.16) Retrieve the first name, last name, and hire date of employees hired between January 1, 2022, and December 31, 2022.
```SQL
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date
BETWEEN '2022-01-01' AND '2022-12-31';
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.17) Retrieve the first name, last name, and salary of employees whose salary is within the range of $40,000 and $60,000.
```SQL
SELECT first_name, last_name, salary
FROM employees
WHERE salary
BETWEEN 40000 AND 60000;
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.18) Retrieve the first name, last name, and department of employees who do not have a department assigned.
```SQL
SELECT first_name, last_name, department
FROM employees
WHERE department IS NULL;
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.19) Retrieve the first name, last name, and position of employees whose position is either "Manager" or "Supervisor".
```SQL
SELECT first_name, last_name, position
FROM employees
WHERE position IN ('Manager', 'Supervisor');

-- We can also use the OR opeator here!
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.20) Retrieve the first name, last name, and hire date of employees whose hire date is on a Monday.
```SQL



```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.21) Retrieve the first name, last name, and department of employees in the "Sales" department whose first name starts with the letter 'J'.
```SQL
SELECT first_name, last_name, department
FROM employees
WHERE department='Sales'
AND first_name LIKE 'J%';
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.22) Retrieve the first name, last name, and hire date of employees whose hire date is on a Monday.
```SQL
-- This is a tough one XD
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(DOW FROM hire_date)=1;
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.23) Retrieve the first name, last name, and salary of employees whose salary is greater than the average salary.
```SQL
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.24) Retrieve the first name, last name, and hire date of employees hired in the year 2021.
```SQL
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date)=2021;
```
---------------------------------------------------------------------------------------------------------------------------------------------------

Q.25) Retrieve the first name, last name, and department of employees whose department is not "IT" or "Finance" and whose salary is greater than the average salary.
```SQL
SELECT first_name, last_name, department
FROM employees
WHERE department NOT IN ('IT', 'Finance')
AND salary > (SELECT AVG(salary) FROM employee);
```
---------------------------------------------------------------------------------------------------------------------------------------------------
