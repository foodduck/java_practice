
select * from testmember

회원

create sequence scott.tm_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;


create table testmember (idx int primary key, mid varchar2(50) unique, pw varchar2(50) not null, name varchar2(50) not null, 
email varchar2(100) unique not null, postcode varchar2(50) not null, address varchar2(300) not null, regdate date default sysdate)

insert into testmember values(tm_seq.nextval, 'admin', '1234', '곽', 'kasw@naver.com', '10446', '백석동', sysdate)

제품

create sequence scott.tp_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

create table testproduct (idx int primary key, mid varchar2(50) unique, pname varchar2(50) not null, price int not null, 
standard varchar2(50) not null, description varchar2(300) not null)

insert into testproduct values (tp_seq.nextval, 'A005', 'starr', 20000000, 'KR01', '신형 자동차')

게시판(공지)

create sequence scott.tb_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

create table testboard (idx int primary key, btag varchar2(30) not null,  title varchar2(200) not null, 
content varchar2(500) not null, author varchar2(50) not null, regdate date default sysdate);

insert into testboard values (tb_seq.nextval, '공지', '정기점검 안내드립니다.', '불편을 드려 죄송합니다.', 'admin', sysdate)



drop table testmember;
drop table testproduct
drop table testboard
drop table testadmin








