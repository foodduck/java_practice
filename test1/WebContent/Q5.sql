alter table employees add no int;
create sequence emp_seq start with 13 increment by 1 maxvalue 1000 cycle nocache;
insert into employees values ('Z011', '홍길동', '34grad', 'F', '섬', '', '', '', '', emp_seq.nextval);

create view test as select emp_no, salary from salaries union select emp_no, salary from bonus2;

create view money as select distinct emp_no, sum(salary) "합계" from test group by emp_no order by emp_no;


