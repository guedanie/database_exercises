#SUBQUERIES exercises
USE employees;

#Find all the employees with the same hire date as employees 101010 using a sub-query - answer should have 69 rows

SELECT employees.first_name, employees.hire_date, employees.emp_no
FROM employees
WHERE employees.hire_date IN(
	SELECT employees.hire_date
	FROM employees 
	WHERE emp_no = 101010
	)
;

SELECT employees.first_name, employees.hire_date
FROM employees
WHERE emp_no = 101010;

## Find all the titles held by all employees with the frist name Aamod. Results should be 314 total titles, 6 unique titles

SELECT titles.title, COUNT(*)
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees 
	WHERE employees.first_name = 'Aamod')
GROUP BY titles.title
;

#How many people in the employees table are no longer working for the company?
# Skipping for now, as there is no current way to know if the employee has left the company, or simply moved departments or new salary
;

#Find all the current department managers that are female.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > CURDATE() 
) AND gender = 'F'
;

#Find all the employees that currently have a higher than average salary
SELECT AVG(salary)
FROM salaries
;


SELECT employees.first_name, employees.last_name, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salary IN (
	SELECT salary
	FROM salaries
	WHERE salary > AVG(salary)
	) AND salaries.to_date > NOW()

;