select u_id, name, joinday from employees where workplace in ('서울', '일산', '제주');

select u_id, name from employees where joinday >= to_date('2015-01-01') and joinday <= to_date('2021-10-31') order by name;

select substr(u_id, 1,1), count(*) from employees group by substr(u_id, 1,1) order by substr(u_id, 1,1);

select substr(emp_no, 1,1), sum(salary) from salaries group by substr(emp_no, 1,1) order by substr(emp_no, 1,1);

select name, workplace, address from employees where substr(u_id, 1,1) = 'C';

