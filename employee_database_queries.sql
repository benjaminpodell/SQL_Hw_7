--Joining the employees tables emp_no, last_name, first_name, and gender with salaries salary on the column emp_no which both tables have a map to.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--Selecting employees that were hired between 1986 and 1987 on the first of the year
SELECT hire_date ,first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--Joining dept_manager and employees tables from departments to view emp_no, first_name, last_name, dept_no, dept_name, from_date ,to_date
SELECT dept_manager.emp_no, employees.first_name, employees.last_name, departments.dept_no, departments.dept_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--Joining employees and departments from dept_emp to display dept_name, emp_no, first_name, and last_name
SELECT departments.dept_name, dept_emp.emp_no, employees.first_name, employees.last_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--Displaying all employees with first_name like Hercules and last_name had a 'B' in it
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Displaying employees that are in 'Sales' departments by joining departments and employees from dept_emp
SELECT departments.dept_name, dept_emp.emp_no, employees.first_name, employees.last_name
FROM dept_emp
JOIN departments
ON dept_emp.dept_no = departments.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

-- Displaying employees that are either in the sales or development department by joining departments and employees from dept_emp
SELECT departments.dept_name, dept_emp.emp_no, employees.first_name, employees.last_name
FROM dept_emp
JOIN departments
ON dept_emp.dept_no = departments.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

--Displaying the Frequency Count of employee last names by descending order
SELECT last_name,
COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;