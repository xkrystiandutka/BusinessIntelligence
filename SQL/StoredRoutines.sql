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
