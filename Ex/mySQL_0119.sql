use hrdb;

-- select 문
#select문-from절 [조회]
/*
select문-from절
*/

select*from employees;
select*from departments;
select*from locations;
select*from countries;
select*from regions;
select*from jobs;
select*from job_history;

-- select 절
select first_name,salary
from employees;

select employee_id, first_name, last_name from employees;

select first_name, phone_number, hire_date, salary
from employees;

select first_name,last_name,salary,phone_number,email,hire_date
from employees;

-- as를 빼도 프린트가 된다.
select employee_id empNO, first_name 'f-name', salary as '월 급'
from employees;

select first_name 이름,
		phone_number 전화번호,
        hire_date as 입사일,
        salary as 월급
from employees;

select first_name 이름,
		last_name 성,
        salary as 월급,
        phone_number as 전화번호,
        email as 이메일,
        hire_date as 입사일
from employees;

#산술 연산자 사용하기
select first_name,
		salary 월급,
        salary-100 '월급-식대',
        salary*12 연봉,
        salary*12+5000 보너스포함,
        salary/30 일급,
        employee_id%3 '워크샵 팀'
from employees;

-- 문자열은  0 으로 처리 --> 오류가 나지 않아
select job_id*12
from employees;

-- 컬럼 합치기
select first_name, last_name
from employees;

select first_name,
		last_name,
        concat(first_name,' ', last_name) name,
        concat(first_name,' ',last_name,'hire date is ',hire_date) name2
from employees;

select  first_name,
		salary*12,
		'(주)개발자' company, 
        3 상태
from employees;

-- 테이블 명 생략
select '(주)개발자';
select now();

select now() from dual;

-- where 절
select first_name, department_id
from employees
where department_id = 10;

select first_name, salary
from employees
where salary >= 15000;

select first_name, hire_date
from employees
where hire_date >='2007-01-01';

select first_name, salary
from employees
where first_name = 'Lex';

select first_name, salary
from employees
where binary first_name = 'Lex';

select first_name, salary
from employees
where salary >= 14000
and salary <= 17000;

select first_name, salary
from employees
where salary >= 140000
or salary <=17000;

select first_name, hire_date
from employees
where hire_date >='2004-01-01'
and hire_date <= '2005-12-31';

select first_name, salary
from employees
where salary >= 14000
and salary <= 17000; #디테일하게 잡을려면 해당코드 쓰고,

select first_name, salary
from employees
where salary between 14000 and 17000; #숫자의 작은수부터 사용해야함

-- in 연산자
select first_name, last_name, salary
from employees
where first_name ='Neena'
or first_name = 'Lex'
or first_name = 'john'
;

select first_name, last_name, salary
from employees
where first_name in ('Neena','Lex','john');

select first_name, salary
from employees
where salary in ('2100','3100','4100','5100'); #in은 or이고, #between은 and이다.