use employees;
select * from employees;

-- 1. List of employees by depatment
-- Question: Write a query to list all employees along with their respective department names.
 -- Include employee number, first name, last name, department number, and department name.
select * from employees;
select * from dept_emp;
select * from departments;

select e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name from employees e  join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no;


-- 2. Current and Past Salaries of an Employee
-- Question: Write a query to retrieve all the salary records of a given employee (by employee number).
-- Include employee number, salary, from_date, and to_date.

select * from employees;
select * from salaries;

select * from salaries 
where emp_no = 10010 
order by salary desc
limit 1;

-- 3. Employees with Specific Titles
-- Question: Write a query to find all employees who have held a specific title (e.g., 'Engineer').
-- Include employee number, first name, last name, and title.

select * from employees;
select * from titles;

select e.emp_no, e.first_name, e.last_name, t.title from employees as e join titles t
on e.emp_no = t.emp_no
where t.title = 'Engineer';

-- 4. Departments with Their Managers
-- Question: Write a query to list all departments along with their current managers. 
-- Include department number, department name, manager's employee number, first name, and last name.

select * from dept_manager;
select * from departments;

select d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name from departments d
join dept_manager as dm 
on d.dept_no = dm.dept_no
join employees as e
on e.emp_no = dm.emp_no;


-- 5. Employee Count by Department
-- write a query to count a number of employees in each department.
-- Include department number, department name and employee counI

select * from employees;
select * from departments;
select * from dept_emp;

select de.dept_no, d.dept_name, count(de.emp_no) as employee_count
from departments as d 
join dept_emp de
on de.dept_no = d.dept_no
group by dept_name;


-- 6. Employees' Birthdates in a Given Year
-- Question: Write a query to find all employees born in a specific year (e.g., 1953).
-- Include employee number, first name, last name, and birth date.

select * from employees;

select emp_no, first_name, last_name, birth_date
from employees 
where year(birth_date) = 1954;

select * from employees 
where month(birth_date) = 10;

-- 7. Employees Hired in the Last 50 Years
-- Question: Write a query to find all employees hired in the last 50 years. 
-- Include employee number, first name, last name, and hire date.

select emp_no, first_name, last_name, hire_date from employees 
where hire_date >= date_sub(curdate(), interval 50 year);


-- 8. Average Salary by Department
-- Question: Write a query to calculate the average salary for each department.
-- Include department number, department name, and average salary.

select * from salaries;
select * from departments;

select d.dept_no, d.dept_name, avg(s.salary) from departments d 
join dept_emp de
on de.dept_no = d.dept_no
join salaries s 
on de.emp_no = s.emp_no
group by d.dept_name
order by d.dept_no;


-- 9.Gender Distribution in Each Department
-- Question: Write a query to find the gender distribution (number of males and females) in each department. 
-- Include department number, department name, count of males, and count of females.

select d.dept_no, d.dept_name, 
sum(case when e.gender = 'M' then 1 else 0 end ) as male_count,
sum(case when e.gender = 'F' then 1 else 0 end) as female_count
 from departments d
join dept_emp de 
on de.dept_no = d.dept_no
join employees e 
on de.emp_no = e.emp_no
group by d.dept_no, d.dept_name;


-- 10. Longest Serving Employees
-- Question: Write a query to find the employees who have served the longest in the company. 
-- Include employee number, first name, last name, and number of years served.

select emp_no, first_name, last_name,
timestampdiff(Year, hire_date, curdate()) as year_served
from employees
order by year_served desc
limit 10;



