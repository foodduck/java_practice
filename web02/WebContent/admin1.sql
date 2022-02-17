select * from member;
insert into member(userid, passwd, birth, name, yesno) values ('admin','1234','2021','관리자','YES');
update member set regdate=to_date(sysdate, 'yyyy-mm-dd') where userid='admin';
select * from member where userid='admin' and passwd='1234';
create table product(proNum varchar2(8) primary key, proName varchar2(40) not null, 
proPrice number(8), proCnt number(4))
alter table product add proImg varchar2(200)
insert into product values('A001', 'morning', '20000000','24')
insert into product values('A002', 'starex', '30000000','4')
insert into product values('A003', 'avante', '35000000','52')
insert into product values('A004', 'lay', '22000000','31')
insert into product values('A005', 'santafe', '32000000','10')

update product set proImg='./img/a001.jpeg' where proNum='A001'
update product set proImg='./img/a002.jpeg' where proNum='A002'
update product set proImg='./img/a003.jpeg' where proNum='A003'
update product set proImg='./img/a004.jpeg' where proNum='A004'
update product set proImg='./img/a005.jpeg' where proNum='A005'
delete from product where proNum='A006'
insert into product values('A006', 'limu', '72000000','2','null')
select * from PRODUCT order by proNum desc

create table test1(id varchar(40) primary key, pw varchar(40), name varchar(40), email varchar(80))
insert into test1 values ('kks1234', '1234', 'kwak', 'kks123@naver.com')
select * from test1
delete from test1 where member ='asdf'
/*회원*/
create table member (id varchar2(40) primary key, pw varchar2(40) not null, 
name varchar2(40) not null, email varchar2(100) unique, question varchar2(400) not null,
answer varchar2(400) not null, address1 varchar2(300) not null, address2 varchar2(300) not null)
/*address1은 우편번호로 하고, address2는 상세주소가 아닌 주소입니다.*/
drop table member
insert into member values ('asdfasdf', 'asdf1234', '곽', 'kks@naver.com', '기르던 고양이의 이름은?',
'나비', '10446', '흰돌마을 3단지 한진아파트')
select * from member

/*게시글*/
create table board (no int primary key, writer varchar2(40), title varchar2(100), 
content varchar2(1000), delpw number(4))
/*공지*/
create table notice (no number(1) primary key, title varchar2(100), content varchar2(1000), img varchar2(300))
/*제품*/
create table product (id varchar2(20) primary key, name varchar2(80), description varchar2(1000), 
standard varchar2(80), price int)
/*관리자*/
create table admin (id varchar2(40) primary key, pw varchar2(40) not null)
insert into admin values ('admin', '1234')
