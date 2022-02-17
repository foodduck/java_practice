select u_id, name, joinday from employees where u_id not in (select emp_no from salaries);

select a.u_id, a.name, b.jik_name from employees a inner join jik b on a.position=b.jik_code;

