-- create departments table
CREATE TABLE departments
(dept_no VARCHAR(20) NOT NULL,
 PRIMARY KEY(dept_no),
 dept_name CHAR(30)
);

-- create dept_emp table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL PRIMARY KEY,
	dept_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- CREATE dept_manager table
CREATE TABLE dept_manager
(dept_no VARCHAR(20) NOT NULL,
 emp_no INT NOT NULL,
 FOREIGN KEY (dept_no) REFERENCES departments(dept_no)	
);

--create employees table
CREATE TABLE employees
(	emp_no INT NOT NULL PRIMARY KEY,
 emp_title VARCHAR(20) NOT NULL,
 birth_date VARCHAR(20) NOT NULL,
 first_name CHAR(20) NOT NULL,
 last_name CHAR(20) NOT NULL,
 sex CHAR(3) NOT NULL, 
 hire_date VARCHAR(20)NOT NULL
);

--create table salaries
CREATE TABLE salaries
(
 emp_no INT NOT NULL,
 FOREIGN KEY (emp) REFERENCES employees(emp_no),
 salary INT	NOT NULL
);

--create table titles
CREATE TABLE titles
(
 title_id VARCHAR(20) NOT NULL PRIMARY KEY,
 title CHAR(20) NOT NULL
);
