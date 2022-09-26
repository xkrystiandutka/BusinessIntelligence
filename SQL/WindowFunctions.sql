# Window Functions

# The ROW_NUMBER() Ranking Window Function and the Relevant MySQL Syntax

use employees;

SELECT 
    emp_no,
    salary,
    ROW_NUMBER() OVER(partition by emp_nu order by salary desc) as row_num
FROM
    salaries;
    
    # Exercise #1 :

# Write a query that upon execution, assigns a row number to all managers we have information for in the "employees" database (regardless of their department).

# Let the numbering disregard the department the managers have worked in. Also, let it start from the value of 1. Assign that value to the manager with the lowest employee number.

SELECT
    emp_no,
    dept_no,
    ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num
FROM
dept_manager;

# Exercise #2:

# Write a query that upon execution, assigns a sequential number for each employee number registered in the "employees" table. Partition the data by the employee's first name and order it by their last name in ascending order (for each partition).

SELECT
emp_no,
first_name,
last_name,
ROW_NUMBER() OVER (PARTITION BY first_name ORDER BY last_name) AS row_num
FROM
employees;

# A Note on Using Several Window Functions in a Query

use employees;

select 
emp_nu,
salary,
row_number() over() as row_num1,
row_number() over(PARTITION BY emp_nu) as row_num2,
row_number() over(PARTITION BY emp_nu ORDER BY salary desc) as row_num3,
row_number() over(order by salary desc) as row_num3 
from salaries
order by emp_no, salary