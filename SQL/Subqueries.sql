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


# Create the ‘emp_manager’ table, using the following code:

DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (

   emp_no INT(11) NOT NULL,

   dept_no CHAR(4) NULL,

   manager_no INT(11) NOT NULL

);

# Fill emp_manager with data about employees, the number of the department they are working in, and their managers.

# Your query skeleton must be:
#Insert INTO emp_manager SELECT
# U.* FROM (A ) UNION (B) UNION (C) UNION (D) AS U;
# A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).
# Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.
# Your output must contain 42 rows.

INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
