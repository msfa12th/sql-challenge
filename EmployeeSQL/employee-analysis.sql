# After importing data from all CSV files
# run the following script to get answers

# List the following details of each employee: 
#   employee number, last name, first name, gender, and salary.
select 
	e.emp_no, e.last_name, e.first_name, e.gender,s.salary
from employees e
join salaries s on s.emp_no = e.emp_no;

# List employees who were hired in 1986.
select
	e.first_name,e.last_name,e.hire_date
from employees e
where hire_date >= '1/1/1986'
and hire_date < '1/1/1987'
;

#List the manager of each department with the following information: 
# department number, department name, the managers employee number,
select
	d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name,
	dm.from_date,to_date
from departments d
join dept_manager dm on dm.dept_no = d.dept_no
join employees e on e.emp_no = dm.emp_no;

# List the department of each employee 
# with the following information: employee number, 
# last name, first name, and department name.
select
	e.emp_no, e.last_name,e.first_name,d.dept_name
from departments d
join dept_emp de on de.dept_no = d.dept_no
join employees e on e.emp_no = de.emp_no;

# List all employees whose first name is Hercules and last names begin with B
select first_name, last_name from employees
where first_name='Hercules' and last_name like 'B%';

# List all employees in the Sales department, including their employee 
# number, last name, first name, and department name.
select
	e.emp_no, e.last_name,e.first_name,d.dept_name
from departments d
join dept_emp de on de.dept_no = d.dept_no
join employees e on e.emp_no = de.emp_no
where d.dept_name = 'Sales';

# List all employees in the Sales and Development departments, 
# including their employee number, last name, first name, and department name.
select
	e.emp_no, e.last_name,e.first_name,d.dept_name
from departments d
join dept_emp de on de.dept_no = d.dept_no
join employees e on e.emp_no = de.emp_no
where d.dept_name in ('Development','Sales');

# In descending order, list the frequency count of employee last names, i.e.,
# how many employees share each last name.
select
	e.last_name,count(*) as frequency_count
from employees e
group by e.last_name
order by frequency_count desc;