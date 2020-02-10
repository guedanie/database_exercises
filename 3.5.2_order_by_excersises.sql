USE employees;

SELECT * FROM employees;

#Find all employees with first anmes "Irena, Vidya or Maya
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

#Update the order clause
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

#Order by employee number
SELECT *
FROM employees
WHERE last_name LIKE "e%"
ORDER BY emp_no;

#Find all employees hired in the 90s
SELECT *
FROM employees
WHERE hire_date BETWEEN "1990-01-01" AND "1999-12-31";

#Find all employees born on christams
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';

#Alternative solution
SELECT *
FROM employees
WHERE MONTH(birth_date) = "12" AND DAY(birth_date) = "25";

#Find all employees with a 'q' last name
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

#Update query to use or instead of in
SELECT *
FROM employees
WHERE first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya';

#Add condition to previous query to find male
SELECT * 
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') 
AND gender = 'M';

#Find all employees whose last name starts or ends with E
SELECT *
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E'
ORDER BY emp_no ASC;

#Duplicate previous query and update to find all employees whose last name starts and ends with E
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY emp_no DESC;

#Find all employees hired in the 90s and born on Christmas
SELECT *
FROM employees
WHERE (hire_date BETWEEN "1990-01-01" AND "1999-12-31")
AND birth_date LIKE "%12-25"
ORDER BY hire_date desc;

#Find all employees with a 'q' in their last name but not 'qu'
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

