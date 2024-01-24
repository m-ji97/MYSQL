
-- left outer join
select 	e.department_id,
		e.first_name,
		d.department_name
from employees e
left outer join departments d # left join 으로도 작성이 가능하다
	on e.department_id = d.department_id;
    
-- right outer join    
select  e.department_id,
		e.first_name,
		d.department_name
from employees e
right outer join departments d
	on e.department_id = d.department_id;
    
-- ex
select  e.department_id,
		e.first_name,
		d.department_name
from employees e
left join departments d
	on e.department_id = d.department_id;
    
select  e.department_id,
		e.first_name,
        d.department_name
from employees e
right join departments d
		on e.department_id = d.department_id;
    
-- right outer join -> left outer join
select  e.department_id,
		first_name,
        d.department_id
from employees e
right outer join departments d
	on e.department_id = d.department_id;
    
-- union
(select e.employee_id,
		e.department_id,
		e.first_name,
		d.department_name
from employees e
left outer join departments d
	on e.department_id = d.department_id)
union
(select e.employee_id,
		e.department_id,
		e.first_name,
		d.department_name
from employees e
right outer join departments d
	on e.department_id = d.department_id);
    
select employee_id,
		first_name,
		manager_id,
        department_id,
        job_id
from employees;

select*
from departments;

select  e.first_name,
		d.department_name
from employees e , departments d
where e.department_id = d.department_id;

select 	e.employee_id,
		e.first_name,
        m.first_name as manager_name
from employees e, employees m
where e.employee_id = m.employee_id;

select  first_name,
		salary,
        location_id,
		street_address,
        city
from employees e, locations l
where e.salary = l.location_id;

-- subQuery
select salary
from employees
where first_name='Den';

select first_name, salary
from employees
where salary > 11000;

select  first_name,
		salary
from employees
where first_name ='Den'; -- Den 11000

select first_name,
		salary
from employees
where salary >= 11000;

select first_name,
		salary
from employees
where salary >= (select salary
				 from employees
				 where first_name = 'Den');