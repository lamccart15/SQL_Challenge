--List employee details (employee number, first name, last name, sex, and salary) 
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees as e
JOIN salaries as s
	ON e.emp_no = s.emp_no;
	
--List first name, last name, and hire date for employees hired in 1986
SELECT * FROM employees; 
SELECT first_name, last_name, hire_date
FROM employees 
WHERE EXTRACT (YEAR FROM hire_date) = 1986; 

--List manager of each dept along with dept number, dept name, manager's employee number, last name, and first name. 
SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name
FROM employees as e
JOIN dept_manager as m
	ON e.emp_no = m.emp_no
JOIN departments as d
	ON d.dept_no = m.dept_no; 

--List employee number, first name, last name, and department name
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees as e 
JOIN dept_emp as de
	ON e.emp_no = de.emp_no
JOIN departments as d
	ON d.dept_no = de.dept_no;
	
--List first name, last name, and sex for employees whose first name is "Hercules" and last name begins with a "B"
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the sales dept - including employee number, first name, last name, and dept name
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
	ON e.emp_no = de.emp_no
JOIN departments as d
	ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

--List all employees in the sales and development depts - including employee number, first name, last name, and dept name
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
	ON e.emp_no = de.emp_no
JOIN departments as d
	ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names
SELECT COUNT (last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY last_name DESC; 