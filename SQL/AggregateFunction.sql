# Aggregate Funtion

# COUNT()

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;

# How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.

SELECT COUNT(DISTINCT dept_no) FROM dept_emp;

# SUM()

SELECT 
    SUM(salary)
FROM
    salaries;

# What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?

SELECT SUM(salary) FROM salaries WHERE from_date > '1997-01-01';

# MIN() & MAX()

SELECT 
    MAX(salary)
FROM
    salaries;

SELECT 
    MIN(salary)
FROM
    salaries;

# Which is the lowest employee number in the database?

SELECT MIN(emp_no) FROM employees;

# Which is the highest employee number in the database?

SELECT MAX(emp_no) FROM employees;

# AVG()

SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;

# What is the average annual salary paid to employees who started after the 1st of January 1997?

select avg(salary) from salaries where from_date > '1997-01-01';

# Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.

SELECT ROUND(AVG(salary), 2) FROM salaries WHERE from_date > '1997-01-01';