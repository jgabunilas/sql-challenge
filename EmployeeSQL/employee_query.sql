-- SQL Challenge queries
-- Jason Gabunilas

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", employees.sex as "Sex", salaries.salary as "Salary"
from employees
inner join salaries on (employees.emp_no = salaries.emp_no)

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
from employees
where EXTRACT(Year from hire_date) = 1986

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select d.dept_no as "Dept. No", d.dept_name as "Dept. Name", dm.emp_no "Manager Employee Number", e.first_name as "Manager Last Name", e.last_name as "Manager First Name"
from departments d
inner join dept_manager dm on (d.dept_no = dm.dept_no)
inner join employees e on (e.emp_no = dm.emp_no)
order by "Manager Employee Number" ASC

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Dept. Name"
from departments d
inner join dept_emp on (d.dept_no = dept_emp.dept_no)
inner join employees e on (e.emp_no = dept_emp.emp_no)

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name as "First Name", last_name as "Last Name", sex as "Sex"
from employees
where first_name = 'Hercules'
and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
from employees e
inner join dept_emp on (e.emp_no = dept_emp.emp_no)
inner join departments d on (d.dept_no = dept_emp.dept_no)
where d.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- for employees that are members of both the Sales and Development departments
select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
from employees e
full outer join dept_emp on (e.emp_no = dept_emp.emp_no)
full outer join departments d on (d.dept_no = dept_emp.dept_no)
where d.dept_name = 'Sales' and d.dept_name = 'Development'

-- for employees that are members of either the Sales or Development departments
select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
from employees e
full outer join dept_emp on (e.emp_no = dept_emp.emp_no)
full outer join departments d on (d.dept_no = dept_emp.dept_no)
where d.dept_name = 'Sales' or d.dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) DESC


