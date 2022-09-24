# SQL Subqueries with IN Embedded Inside WHERE

SELECT 
    *
FROM
    dept_manager;
    
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            
SELECT 
    dm.emp_no
FROM
    dept_manager dm;
    
# Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.

SELECT
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
# SQL Subqueries with EXISTS-NOT EXISTS Embedded Inside WHERE

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);
            
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no
order by emp_no);

# Select the entire information for all employees whose job title is “Assistant Engineer”. 

SELECT
    *
FROM
    employees e
WHERE
    EXISTS( SELECT
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer');

# SQL Subqueries Nested in SELECT and FROM

SELECT 
	A.*
FROM
	(SELECT
	e.emp_no AS employee_ID,
    MIN(de.dept_no) as departure_code,
    (SELECT
			emp_no
		FROM
			dept_manager
		WHERE
			emp_no = 110022) as manager_ID
	FROM
		employees e
join dept_emp de on  e.emp_no = de.emp_no
where 
	e.emp_no <= 110020
group by e.emp_no
order by e.emp_no) as A
union
SELECT 
	B.*
FROM
	(SELECT
	e.emp_no AS employee_ID,
    MIN(de.dept_no) as departure_code,
    (SELECT
			emp_no
		FROM
			dept_manager
		WHERE
			emp_no = 110039) as manager_ID
	FROM
		employees e
join dept_emp de on  e.emp_no = de.emp_no
where 
	e.emp_no > 110020
group by e.emp_no
order by e.emp_no
LIMIT 20) as B ;