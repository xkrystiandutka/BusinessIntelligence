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


# SQL Variables

set @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);

Select @v_avg_salary;
select @p_avg_salary;

# Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.

# Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.

# Finally, select the obtained output.

SET @v_emp_no = 0;

CALL emp_info('Aruna', 'Journel', @v_emp_no);

SELECT @v_emp_no;

# User-Defined Functions in MySQL

USE employees;
DROP FUNCTION IF exists f_emp_avg_salary;

DELIMITER $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal (10,2)
deterministic no sql reads sql data
begin
declare v_avg_salary decimal(10,2);

SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
return v_avg_salary;
END$$

select f_emp_avg_salary(11300);

# Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.

# Hint: In the BEGIN-END block of this program, you need to declare and use two variables – v_max_from_date that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.

# Finally, select this function.

DELIMITER $$

CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)

BEGIN
    DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);
                SELECT
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
                SELECT
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
RETURN v_salary;
END$$

DELIMITER ;

SELECT EMP_INFO('Aruna', 'Journel');


