-- TODO: Add your queries/answers to this script
use employee;

-- -------------------Q1-----------------------
SELECT first_name, last_name
FROM employee
WHERE first_name LIKE 'H%'
ORDER BY first_name;


-- -------------------Q2-----------------------
SELECT emp_no, first_name, last_name, hire_date, gender
FROM employee
WHERE first_name LIKE 'H%'
ORDER BY first_name;


-- -------------------Q3-----------------------
SELECT e.first_name, e.last_name, s.amount
FROM employee e
JOIN salary s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';


-- -------------------Q4-----------------------
UPDATE salary s
JOIN title t ON s.emp_no = t.emp_no
SET s.amount = s.amount * 1.05
WHERE t.title = 'Assistant Engineer'
  AND t.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01';
  
-- -------------------Q5-----------------------
DELETE FROM employee
WHERE first_name = 'Yishay' AND last_name = 'Tziveli';

-- -------------------Q6-----------------------
INSERT INTO department (dept_no, dept_name)
VALUES ('d010', 'Cybersecurity');
-- -------------------Q7-----------------------
INSERT INTO employee (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (11001, '1982-05-25', 'John', 'Doe', 'M', CURDATE());

-- -------------------Q8-----------------------
INSERT INTO title (emp_no, title, from_date, to_date)
VALUES (11001, 'Head of Cybersecurity', CURDATE(), '9999-01-01');

-- -------------------Q9-----------------------
INSERT INTO dept_manager (emp_no, dept_no, from_date, to_date)
VALUES (11001, 'd010', CURDATE(), '9999-01-01');

-- -------------------Q10-----------------------
INSERT INTO salary (emp_no, amount, from_date, to_date)
VALUES (11001, 85000, CURDATE(), '9999-01-01');

-- -------------------Q11-----------------------
-- End current title
UPDATE title
SET to_date = CURDATE()
WHERE emp_no = (SELECT emp_no FROM employee WHERE first_name = 'Weijing' AND last_name = 'Bottner')
  AND to_date = '9999-01-01';

-- Insert new title
INSERT INTO title (emp_no, title, from_date, to_date)
SELECT emp_no, 'Cybersecurity Analyst', CURDATE(), '9999-01-01'
FROM employee
WHERE first_name = 'Weijing' AND last_name = 'Bottner';

-- -------------------Q12-----------------------
-- End current salary
UPDATE salary
SET to_date = CURDATE()
WHERE emp_no = (SELECT emp_no FROM employee WHERE first_name = 'Weijing' AND last_name = 'Bottner')
  AND to_date = '9999-01-01';

-- Insert new salary
INSERT INTO salary (emp_no, amount, from_date, to_date)
SELECT emp_no, 72000, CURDATE(), '9999-01-01'
FROM employee
WHERE first_name = 'Weijing' AND last_name = 'Bottner';

-- -------------------Q13-----------------------
-- End current department
UPDATE dept_emp
SET to_date = CURDATE()
WHERE emp_no = (SELECT emp_no FROM employee WHERE first_name = 'Weijing' AND last_name = 'Bottner')
  AND to_date = '9999-01-01';

-- Insert new department assignment
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
SELECT emp_no, 'd010', CURDATE(), '9999-01-01'
FROM employee
WHERE first_name = 'Weijing' AND last_name = 'Bottner';
              
