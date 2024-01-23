-- 그룹함수

#단일행 함수
select  first_name,
		salary,
        round(salary,2)
from employees;

#그룹함수
select sum(salary)
from employees;

-- count
select count(*) #*은 전체 수량
from employees;

select count(first_name)
from employees;

select count(manager_id) 
from employees;

select count(commission_pct) #컬럼명을 사용하면 null은 없애고, 카운드 세진다.
from employees;

select count(*), count(commission_pct)
from employees;

select count(commission_pct)
from employees
where salary > 16000;

-- sum()
select count(*), sum(salary)
from employees;

-- avg()
select count(*), sum(salary), avg(salary) #avg는 null을 제외하기에 innull()함수를 넣어줘야한다
from employees;

-- max()/min()
select count(*), max(salary), min(salary)
from employees;

-- GROUP BY
select department_id, avg(salary)
from employees
group by department_id;

select department_id, job_id, count(*)
from employees
group by department_id, job_id;

select department_id, count(*), sum(salary)
from employees
where sum(salary) >= 20000
group by department_id;
# where 절에는 그룹함수를 쓸수 없다

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000;

select department_id, count(*), sum(salary)
from employees
where department_id = 100
group by department_id
having sum(salary) >= 20000;
-- and department_id = 100;

-- if~else 문
select  first_name,
		salary,
		commission_pct,
		if(commission_pct is null, 0, 1) state
from employees;

select  employee_id,
		salary,
        job_id,
        case when job_id = 'AC_ACCOUNT' then salary+salary*0.1
			 when job_id = 'SA_REP' then salary+salary*0.2
             when job_id = 'ST_CLERK' then salary+salary*0.3
				else salary
        end realSalary
from employees;

select  first_name,
		department_id,
        case when department_id between 10 and 50 then 'A-TEAM'
			 when department_id between 60 and 100 then 'B-TEAM'
			 when department_id between 110 and 150 then 'C-TEAM'
        else '팀없음'
        end TEAM
from employees;

-- join
-- 사람 이름 
select first_name, department_id
from employees;

-- 팀이름
select*
from departments;

-- join
select  e.first_name,
		d.department_name,
		e.department_id,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id;

select*
from employees e 
inner join departments d
	on e.department_id = d.department_id;

select  first_name,
		department_name,
        job_title,
        j.job_id
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;
    
select  e.first_name,
		d.department_name,
        j.job_title,
        j.job_id
from employees e 
inner join departments d
	on e.department_id = d.department_id
inner join jobs j
	on e.job_id = j.job_id;
    
-- 예제
-- 이름, 부서번호, 부서명, 업무아이디, 업무명, 도시아이디, 도시명
select  e.first_name,
		d.department_id,
        d.department_name,
        j.job_id,
        j.job_title,
        l.location_id,
        l.city
from employees e, departments d, jobs j, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and e.job_id = j.job_id;


