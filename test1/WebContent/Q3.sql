create table bonus2 as select * from salaries;

update bonus2 set salary = salary*0.3;

update employees set address = '장항동 1537' where name = '김현우';

delete from salaries where emp_no = 'C1006';

update employees set position = 'C' where name = '김현우';

