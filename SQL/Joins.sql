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

# CROSS JOIN

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
	d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, e.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
		JOIN
	employees e ON dm.emp_no = e.emp_no
WHERE
	d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

# Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.

SELECT
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_name;

# Return a list with the first 10 employees with all the departments they can be assigned to.

# Hint: Don’t use LIMIT; use a WHERE clause.

SELECT
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;


# Combining Aggregate Functions with Joins

SELECT 
    e.gender, AVG(s.salary) AS avarage_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender; 

# JOIN More than Two Tables

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no;
    
 SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
         JOIN
    dept_manager m ON e.emp_no = m.emp_no
        RIGHT JOIN
    departments d ON m.dept_no = d.dept_no;
       
# Select all managers’ first and last name, hire date, job title, start date, and department name.

SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;

SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
            AND m.from_date = t.from_date
ORDER BY e.emp_no;

# Tricks for Joins

SELECT 
    d.dept_name, AVG(salary) as avarage_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
group by d.dept_name
having avarage_salary >  60000
order by avarage_salary DESC;

# How many male and how many female managers do we have in the ‘employees’ database?

SELECT
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

# The Differences Between UNION and UNION ALL

drop table if exists employees_dup;
create table employees_dup (
	emp_no int(10),
    birth_date date,
    first_name varchar(14),
    last_name varchar(16),
    gender enum('M', 'F'),
    hire_date date);
    
-- duplicate the structure of the employees table

insert into employees_dup
select e.* from employees e limit 20;

select * from employees_dup;

insert INTO employees_dup values('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

select * from employees_dup;

# Union vs Unnion All

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = '10001' 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = '10001' 
UNION  SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;

# Go forward to the solution and execute the query. What do you think is the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)?

SELECT
    *
FROM
    (SELECT
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT
		NULL AS emp_no,
        NULL AS first_name,
        NULL AS last_name,
        dm.dept_no,
        dm.from_date
    FROM
        dept_manager dm) as a
ORDER BY -a.emp_no DESC;