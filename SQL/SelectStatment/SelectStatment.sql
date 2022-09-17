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