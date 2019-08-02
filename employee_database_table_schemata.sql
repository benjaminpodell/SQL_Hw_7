-- First dropping tables to make sure they don't already exist 
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Creates tables that specifies data types, foreign keys, and primary keys
CREATE TABLE "departments" (CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no"),
							"dept_no" VARCHAR NOT NULL, 
							"dept_name" VARCHAR NOT NULL                   
);

CREATE TABLE "dept_emp" ("emp_no" INT NOT NULL,
                         "dept_no" VARCHAR NOT NULL,
                         "from_date" DATE NOT NULL,
                         "to_date" DATE NOT NULL
);

CREATE TABLE "dept_manager" ("dept_no" VARCHAR NOT NULL,
                             "emp_no" INT NOT NULL,
                             "from_date" DATE NOT NULL,
                             "to_date" DATE NOT NULL
);

CREATE TABLE "employees" (CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no"),
						  "emp_no" INT NOT NULL,
                          "birth_date" DATE NOT NULL,
                          "first_name" VARCHAR NOT NULL,
                          "last_name" VARCHAR NOT NULL,
                          "gender" VARCHAR NOT NULL,
                          "hire_date" DATE NOT NULL                          
);

CREATE TABLE "salaries" ("emp_no" INT NOT NULL,
                         "salary" INT NOT NULL,
                         "from_date" DATE NOT NULL,
                         "to_date" DATE NOT NULL
);

CREATE TABLE "titles" ("emp_no" INT NOT NULL,
					   "title" VARCHAR NOT NULL,
					   "from_date" DATE NOT NULL,
					   "to_date" DATE NOT NULL
);

--Adds Foreign Key Constraint that either maps an employee number or department number to each created table
ALTER TABLE "dept_emp" ADD CONSTRAINT "deptemp_to_empno" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "deptemp_to_deptno" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "deptmanager_to_deptno" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "deptmanager_to_empno" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "salaries_to_empno" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "titles_to_empno" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Import Departments and employees csv first then remaining csv's in order for mapping to be successful
-- Finally, Query * FROM Each Table to confirm the data
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;