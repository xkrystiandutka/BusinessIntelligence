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
    

