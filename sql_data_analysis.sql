-- List employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no;

	
/* List the first name, last name, and hire date for the employees who were hired 
in 1986. */
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


/* List the manager of each department along with their department number, department 
name, employee number, last name, and first name. */
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN departments AS d ON d.dept_no = dm.dept_no;


/* List the department number for each employee along with that employee’s employee 
number, last name, first name, and department name. */
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no;


/* List first name, last name, and sex of each employee whose first name is Hercules 
and whose last name begins with the letter B. */
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


/* List each employee in the Sales department, including their employee number, 
last name, and first name. */
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_manager
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
)
UNION
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

/* List each employee in the Sales and Development departments, including their 
employee number, last name, first name, and department name. */
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


/* List the frequency counts, in descending order, of all the employee last names 
(that is, how many employees share each last name). */
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees GROUP BY last_name
ORDER BY "Last Name Count" DESC;