--List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no,employees.last_name,employees.first_name,employees.sex,salaries.salary
FROM employees
INNER JOIN salaries ON salaries.emp_no = employees.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT employees.first_name,employees.last_name,employees.hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name 
-- getting title_id for manager from titles table
SELECT title_id FROM titles
WHERE title='Manager';

SELECT dept.dept_no,e.emp_no,e.last_name,e.last_name,dept.dept_name
FROM departments dept
JOIN dept_emp d
ON (d.dept_no= dept.dept_no)
JOIN employees e
ON (e.emp_no= d.emp_no)
WHERE e.emp_title='m0001';

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT departments.dept_no,departments.dept_name,dept_emp.emp_no,employees.last_name,employees.first_name
FROM departments INNER JOIN dept_emp ON
dept_emp.dept_no= departments.dept_no
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name,last_name,sex 
FROM employees
WHERE first_name LIKE 'Hercules%'
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no,e.last_name,e.first_name
FROM employees e
JOIN dept_emp d
ON (e.emp_no = d.emp_no)
JOIN departments
ON(d.dept_no=departments.dept_no)
WHERE d.dept_no in(
	SELECT dept_no
	FROM departments
	WHERE dept_name='Sales'
);

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no,e.last_name,e.first_name,departments.dept_name
FROM employees e
JOIN dept_emp d
ON (e.emp_no = d.emp_no)
JOIN departments
ON(d.dept_no=departments.dept_no)
WHERE d.dept_no in(
	SELECT dept_no
	FROM departments
	WHERE dept_name='Sales'
	OR dept_name='Development'
);

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
SELECT last_name,COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY Frequency DESC;



