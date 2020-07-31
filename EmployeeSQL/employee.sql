-- Drop tables if they exist
DROP TABLE departments
drop table titles
drop table employees
drop table salaries
drop table dept_emp
drop table dept_manager

-- Create the departments table

CREATE TABLE departments (
    dept_no VARCHAR(20) NOT NULL primary key,
    dept_name VARCHAR(255) NOT NULL
);

select * from departments

-- Create the titles table
CREATE TABLE titles (
    title_id VARCHAR(20) NOT NULL primary key,
    title VARCHAR(255) NOT NULL
);

select * from titles


-- Create the employees table
CREATE TABLE employees (
    emp_no int NOT NULL primary key,
    emp_title VARCHAR(20) NOT NULL,
    birth_date date not null,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    sex varchar(1) not null,
    hire_date date not null,
    foreign key (emp_title) references titles(title_id)
);
select * from employees


-- Create the salaries table
CREATE TABLE salaries (
    emp_no int NOT NULL primary key,
    salary int not null
);
select * from salaries



--Create the dept_emp table
CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar(20) not null,
    primary key (emp_no, dept_no),
    foreign key (emp_no) references employees(emp_no),
    foreign key (dept_no) references departments(dept_no)
);
select * from dept_emp


-- Create the dept_manager table
CREATE TABLE dept_manager (
    dept_no varchar(20) not null,
    emp_no int NOT NULL primary key,
    foreign key (dept_no) references departments(dept_no)
);
select * from dept_manager

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


