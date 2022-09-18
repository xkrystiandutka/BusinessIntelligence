#SELECT STATEMENT

#FROM
SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;
    
#Select the information from the “dept_no” column of the “departments” table.
#Select all data from the “departments” table.

SELECT dept_no FROM departments;
SELECT * FROM departments;
    
#WHERE

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
#Select all people from the “employees” table whose first name is “Elvis”. 😊

select * from employees where first_name='Elvis';

#AND

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'  AND gender='M';
    
#Retrieve a list with all female employees whose first name is Kellie. 

select * from employees where first_name='Kellie' and gender='F';

#OR

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'  OR first_name='Elvis';

#Retrieve a list with all employees whose first name is either Kellie or Aruna.

select * from employees where first_name='Kellie' or first_name='Aruna';

#Operator Precedence and Logical Order

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND (gender='M' or gender='F');
    
#Retrieve a list with all female employees whose first name is either Kellie or Aruna.

SELECT * FROM employees WHERE gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');

# Using IN - NOT IN

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
        OR first_name = 'Mark'
        OR first_name = 'Nathan'; 
    
SELECT 
    *
FROM
    employees
WHERE
    first_name not IN( 'Cathie', 'Mark', 'Nathan'); 
    
 # Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
 
SELECT * FROM employees WHERE first_name IN( 'Denis', 'Elvis'); 

# Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.

SELECT * FROM employees WHERE first_name NOT IN ('John' , 'Mark', 'Jacob');

# Using LIKE - NOT LIKE

SELECT * FROM employees WHERE first_name like ('Mar_');
SELECT * FROM employees WHERE first_name not like ('&MAR&');

# Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.

SELECT * FROM employees WHERE first_name LIKE('Mark%');

# Retrieve a list with all employees who have been hired in the year 2000.

SELECT * FROM employees WHERE hire_date LIKE ('%2000%');

# Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 

 SELECT * FROM employees WHERE emp_no LIKE ('1000_');
 
# Wildcard characters

# Extract all individuals from the ‘employees’ table whose first name contains “Jack”.

 SELECT * FROM employees WHERE first_name LIKE ('%JACK%');

# Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
 
SELECT * FROM employees WHERE first_name NOT LIKE ('%Jack%'); 

#  BETWEEN - AND

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
# Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.

SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 70000;

# Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.

SELECT * FROM employees WHERE emp_no NOT BETWEEN '10004' AND '10012';

# Select the names of all departments with numbers between ‘d003’ and ‘d006’. 

SELECT dept_name FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';

#IS NOT NULL - IS NULL

SELECT * FROM employees where first_name is null;

# Select the names of all departments whose department number value is not null.

SELECT dept_name FROM departments WHERE dept_no IS NOT NULL;

# Using Other Comparison Operators

 SELECT 
    *
FROM
    employees
WHERE
    first_name != 'Mark';
 
  SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
 
  SELECT 
    *
FROM
    employees
WHERE
    hire_date <= '1985-02-01';
    
# Retrieve a list with data about all female employees who were hired in the year 2000 or after.
# Hint: If you solve the task correctly, SQL should return 7 rows.

select * from employees where gender = 'f' and hire_date > '2000-01-01';

# Extract a list with all employees’ salaries higher than $150,000 per annum.

SELECT * FROM salaries WHERE salary > 150000;

#  SELECT DISTINCT

SELECT distinct
    gender
FROM
    employees;
    
# Obtain a list with all different “hire dates” from the “employees” table.

# Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output rows displayed back to the default of 1000.

SELECT DISTINCT hire_date FROM employees;

#  Getting to Know Aggregate Functions

SELECT 
    COUNT(distinct first_name)
FROM
    employees;

select * from employees where first_name is null;

# How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?

SELECT COUNT(*) FROM salaries WHERE salary >= 100000;

# How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.

SELECT COUNT(*) FROM dept_manager;

# ORDER BY

SELECT 
    *
FROM
    employees
ORDER BY first_name, last_name asc;

# Select all data from the “employees” table, ordering it by “hire date” in descending order.

SELECT * FROM employees ORDER BY hire_date desc;

# GROUP BY

SELECT
	first_name, count(first_name)
FROM
    employees
GROUP BY first_name
order by first_name desc;



