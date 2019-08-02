--Creates departments table and makes dept_no the primary key
departments
-
dept_no varchar PK
dept_name varchar

--Creates dept_emp table while mapping emp_no foreign key to employees table emp_no and dept_no foreign key to departments table dept_no
dept_emp
-
emp_no int FK >- employees.emp_no
dept_no varchar FK >- departments.dept_no
from_date date
to_date date

--Creates dept_manager table while mapping dept_no foreign key to departments table dept_no and emp_no foreign key to employees table emp_no
dept_manager
-
dept_no varchar FK >- departments.dept_no
emp_no int FK >- employees.emp_no
from_date date
to_date date

--Creates employees table and makes emp_no the primary key
employees
-
emp_no int PK
birth_date date
first_name varchar
last_name varchar
gender varchar
hire_date date

--Creates salaries table while mapping emp_no foreign key to employees table emp_no 
salaries
-
emp_no int FK >- employees.emp_no
salary int
from_date date
to_date date

--Creates titles table while mapping emp_no foreign key to employees table emp_no 
titles
-
emp_no int FK >- employees.emp_no
title varchar
from_date date
to_date date

