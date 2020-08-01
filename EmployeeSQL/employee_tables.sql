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
    foreign key (emp_no) references employees(emp_no)
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