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


