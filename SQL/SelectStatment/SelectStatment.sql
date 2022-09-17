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