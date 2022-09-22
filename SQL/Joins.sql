# INNER JOINS

SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;


SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
group by m.emp_no
ORDER BY m.dept_no;

# Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 

SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;
    
# Using Joins

SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

/*
Select m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
JOIN 
departments_dup d ON d.dept_no = m.dept_no
ORDER BY d.dept_no;
*/

# Duplicate Rows

#duplicate records

INSERT INTO dept_manager_dup
VALUES('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_dup
VALUES('d009', 'Customer Service');

#check table

SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no ASC;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no ASC;

# LEFT JOIN

# remove the duplicates from two tables

delete from dept_manager_dup
where emp_no='110228';
delete from departments_dup
where dept_no='d009';

#add back the inital records
INSERT INTO dept_manager_dup
VALUES('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_dup
VALUES('d009', 'Customer Service');

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        left JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d 
        left JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d 
        left outer JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        left JOIN
    departments_dup d ON m.dept_no = d.dept_no
    where dept_name is null
ORDER BY m.dept_no;

#Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. See if the output contains a manager with that name.  

#Hint: Create an output containing information corresponding to the following fields: ‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC, e.emp_no;

# RIGHT JOIN

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        right JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;


SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d    
        right JOIN
	dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY dept_no;

# Differences between the New and the Old Join Syntax

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
		JOIN
	departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    departments_dup d
WHERE 
	m.dept_no = d.dept_no
ORDER BY m.dept_no;

# Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. Use the old type of join syntax to obtain the result.

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e,
    dept_manager dm
WHERE
    e.emp_no = dm.emp_no;

# New Join Syntax:

SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no; 
    
    
#  JOIN and WHERE Together

select e.emp_no, e.first_name, e.last_name, s.salary from employees e join salaries s on e.emp_no = s.emp_no where s.salary > 145000;
# https://stackoverflow.com/questions/23921117/disable-only-full-group-by
#set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

#Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.

SELECT
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
ORDER BY e.emp_no;   