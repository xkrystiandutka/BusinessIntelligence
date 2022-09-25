# Stored Routines

USE employees;

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$

CREATE PROCEDURE select_employees()

BEGIN

SELECT * FROM employees

    LIMIT 1000;
    
END$$

DELIMITER ;

call employees.select_employees();

call select_employees();

# Create a procedure that will provide the average salary of all employees.

DELIMITER $$

CREATE PROCEDURE avg_salary()

BEGIN
	SELECT
		AVG(salary)
	FROM
		salaries;
END$$

DELIMITER ;
# Then, call the procedure.

CALL avg_salary;
CALL avg_salary();
CALL employees.avg_salary;
CALL employees.avg_salary();


# Stored Procedures with an Input Parameter

USE employees;

DROP procedure IF exists emp_salary;

DELIMITER $$
USE employees $$
create procedure emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT
	e.first_name, e.last_name, AVG(s.salary)
FROM
	employees e
		JOIN
	salaries s  ON e.emp_no = s.emp_no
where
	e.emp_no = p_emp_no;
END$$

DELIMITER ;

call employees.emp_salary(11300);

call emp_salary(11300);

# Stored Procedures with an Output Parameter

USE employees;

DROP procedure IF exists emp_avg_salary_out;

DELIMITER $$
USE employees $$
create procedure emp_avg_salary_out(IN p_emp_no INTEGER, out p_avg_salary decimal(10,2))
BEGIN
SELECT
	AVG(s.salary)
INTO p_avg_salary
FROM
	employees e
		JOIN
	salaries s  ON e.emp_no = s.emp_no
where
	e.emp_no = p_emp_no;
END$$

DELIMITER ;

set @p_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @p_avg_salary);
select @p_avg_salary;

# Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.

DELIMITER $$

CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)

BEGIN
	SELECT
		e.emp_no
	INTO p_emp_no FROM
		employees e
	WHERE
		e.first_name = p_first_name
	AND e.last_name = p_last_name;
END$$

DELIMITER ;

