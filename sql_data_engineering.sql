DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE employees;
DROP TABLE titles;
DROP TABLE departments;

-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create titles table
CREATE TABLE titles (
    title_id VARCHAR(10) NOT NULL PRIMARY KEY,
    title VARCHAR(255)
);

-- Create employees table
CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title VARCHAR(10),
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex VARCHAR(30),
    hire_date DATE,
	FOREIGN KEY(emp_title) REFERENCES titles (title_id)
);

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary INT
);

-- Create a junction table for dept_emp
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT de_key PRIMARY KEY (emp_no, dept_no)
);

-- Create a junction table for dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	CONSTRAINT dm_key PRIMARY KEY (dept_no, emp_no)
);

-- View tables to check they are correct
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;