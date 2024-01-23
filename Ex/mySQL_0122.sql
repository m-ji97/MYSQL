select*
from employees;

select first_name, salary
from employees;

select  concat(first_name, last_name),
		salary*12
from employees;

select 	now() # = select now();
from dual;

select now();

select first_name, '황일영' #'활일영' 이 경우 데이터가 없어도 적용이 가능하다
from employees;

begin
select first_name, salary
from employees
where salary >= 17000;

select first_name, salary
from employees
where salary = 17000; #같다는 = 하나만

select first_name, salary
from employees
where salary != 17000; #아닌 경우(부정)

select*
from employees
where first_name = 'john';

select first_name
from employees
where binary first_name = 'john';

select first_name,salary
from employees
where first_name like 'L%';

select first_name, salary
from employees
where first_name like '%am%';

select first_name, salary
from employees
where first_name like '_a%'; #두번째 글자가 a인 경우만 출력

select first_name, salary
from employees
where first_name like '___a%';

select*
from employees
where first_name like '_a__';
end;


-- null
begin
select  first_name,
		salary,
        salary*commission_pct
from employees
where salary between 13000 and 15000;

select  first_name,
		salary,
        commission_pct,
        salary*commission_pct #null을 포함한 산술식은 null로 출력됨
from employees
where salary >= 13000
and salary <= 15000;

select*
from employees
where commission_pct is null; #null인 경우를 알아볼때 is null로 수정해줘야한다

select*
from employees
where commission_pct is not null; #null이 아닌 사람들할때 is not null로 되어야한다.

select first_name, commission_pct
from employees
where commission_pct is not null;

select first_name, manager_id, commission_pct
from employees
where manager_id is null
and commission_pct is null;

select first_name, salary
from employees
where department_id is null;
end;
-- order by
begin
select first_name, salary
from employees
where salary >=5000
order by salary asc;
#작은 거에서 큰거  asc, 큰거에서 작은거 desc

select*
from employees
order by employee_id asc;

select first_name, salary
from employees
order by first_name asc;

select first_name, hire_date, salary
from employees
order by hire_date desc;

-- 1. 최근 입사한 순 2. 입사한 일이 같으면 월급이 많은 사람부터

select first_name, hire_date, salary
from employees
order by hire_date desc, salary desc;
end;
-- ----------------------------------------------------

select department_id,salary,first_name
from employees
order by department_id asc;

select first_name, salary
from employees
order by salary >= 10000, salary desc;

select  department_id,
		salary,
        first_name
from employees
order by department_id asc, salary desc;

select first_name, salary, hire_date
from employees
order by first_name asc;

select first_name, salary, hire_date
from employees
order by hire_date asc;

select*
from employees
where hire_date = 60
and 2007-01-01
order by hire desc;

-- 단일행 함수 -> 숫자함수

-- 반올림
select   round(123.123,2)
		,round(123.126,2)
        ,round(234.567,0)
        ,round(123.456,0)
        ,round(123.456)
        ,round(123.126,-1)
        ,round(125.126,-1)
        ,round(123.126,-2)
from dual;

-- 올림
select  ceil(123.456), -- 124
		ceil(123.789), -- 124
		ceil(123.7892313), -- 124
		ceil(987.1234) -- 988
;

-- 내림
select  floor(123.456), -- 123
		floor(123.789), -- 123
		floor(123.7892313), -- 123
		floor(987.1234) -- 987
;

select  first_name,
		salary,
        ceil(salary/30) as 일당
from employees
order by salary desc;

-- 숫자의 n승
select pow(12,2), power(12,2);

-- 숫자의 제곱근
select sqrt(144);

-- sign
select  sign(123), -- 1
		sign(0),   -- 0
		sign(-123) -- -1
;

-- 절대값
select  abs(123), 
		abs(0),
		abs(-123)
;

-- 가장 큰 값
select  greatest(2, 0, -2), -- 2
		greatest(4, 3.2, 5.25), -- 5.25
		greatest('B', 'A', 'C', 'c') -- 소문자 c
;

-- 가장 작은 값
select  least(2, 0, -2), -- -2
		least(4, 3.2, 5.25), -- 3.2
		least('B', 'A', 'C', 'c')  -- A
;

select max(salary)
FROM employees;

select  employee_id,
		manager_id,
		department_id,
		greatest(employee_id,manager_id,department_id)
from employees;

-- 단일행 함수, 문자함수
select concat('안녕','하세요')
from dual;

select concat('안녕', '-', "'하'세요")
from dual;

select concat(first_name, ' ',last_name)
from employees;

select concat_ws('-','abc','123','가나다')
from dual;

select concat_ws('-',first_name,last_name,salary)
from employees;

select  first_name, #대문자를 소문자로 변환
		lcase(first_name),
        lower(first_name),
        lower('ABCabc!#%'),
        lower('가나다')
from employees;

select  first_name, #소문자를 대문자로 변환
		ucase(first_name),
        upper(first_name),
        upper('ABCabc!#%'),
        upper('가나다')
from employees;

select  first_name,
		length(first_name),
        char_length(first_name),
        character_length(first_name)
from employees;

select length('a'),
		char_length('a'),
        character_length('a')
from employees;

select length('가'),
		char_length('가'),
        character_length('가')
from employees;

select  first_name,
		substring(first_name,3,3), #이름에 3번부터 3글자
        substring(first_name,2,2),
        substring(first_name,-3,2) #음수인 경우 뒤에서부터 시작
from employees
where department_id = 100;

select  substring('123456-2568752',0,1)
from dual;

select first_name,
		lpad(first_name,10,'*'),
        rpad(first_name,10,'*')
from employees;

select  concat('|', '            안녕하세요              ', '|' ),
		concat('|', trim('            안녕하세요              '), '|' ),
        concat('|', ltrim('            안녕하세요              '), '|' ),
        concat('|', rtrim('            안녕하세요              '), '|' )
from dual;

select  first_name,
		replace(first_name, 'a', '*')
from employees
where department_id = 100;

select  first_name,
		replace(first_name,substr(first_name, 2,3),'***')
from employees
where department_id = 100;

select  first_name,
		replace(first_name,substr(first_name, 2,3),'***')
from employees
where department_id = 100;


-- 
select current_date(), curdate();

select current_time(), curtime();

select current_timestamp(), now();

select  adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR), 
		adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH),
		adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK),
		adddate('2021-06-20 00:00:00', INTERVAL 1 DAY),
		adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR),
		adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),
		adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
;
select  subdate('2021-06-20 00:00:00', INTERVAL 1 YEAR), 
		subdate('2021-06-20 00:00:00', INTERVAL 1 MONTH),
		subdate('2021-06-20 00:00:00', INTERVAL 1 WEEK),
		subdate('2021-06-20 00:00:00', INTERVAL 1 DAY),
		subdate('2021-06-20 00:00:00', INTERVAL 1 HOUR),
		subdate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),
		subdate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
;

select  datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00'),
		timediff('2021-06-21 01:05:05', '2021-06-20 01:00:00')
from dual;

select  first_name,
		hire_date,
        round(datediff(now(), hire_date/365),2) workday
from employees
order by workday desc;

select  now(),
		date_format(now(),'%y-%m-%d %H:%i:%s'),
        date_format(now(), '%Y-%m-%d(%a) %H:%i:%s %p')
from dual;

select  datediff('2021-jun-04', '2021-06-01')
from dual;

select str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d')
from dual;

select str_to_date('2021-06-01 12:30:05', '%Y-%m-%d')
from dual;

select  format(123456.89,2),
		format(1234567.89,0),
        format(1234567.89,-5)
from dual;

select first_name, ifnull(commission_pct,'없음')
from employees;