create table employees (u_id varchar2(8) primary key, name varchar2(20) not null, 
password varchar2(20) not null, position varchar2(4) not null, workplace varchar2(20) not null, 
address varchar2(50), birthday date, joinday date, weddingday date);

create table salaries (emp_no varchar(8) primary key, salary number(10) not null, 
from_date date not null, to_date date);



