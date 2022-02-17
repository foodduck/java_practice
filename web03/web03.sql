/*project1: 프로젝트 폴더 이름*/

select * from member

/*회원*/
create table member (id varchar2(40) primary key, pw varchar2(40) not null, 
name varchar2(40) not null, email varchar2(100) unique, question varchar2(400) not null,
answer varchar2(400) not null, address1 varchar2(300) not null, address2 varchar2(300) not null,
regdate date default sysdate)
/*address1은 우편번호로 하고, address2는 상세주소가 아닌 주소입니다.*/

insert into member values ('a3gb', 'asdf1234', '곽', 'kkaa@google.com', '기르던 고양이의 이름은?',
'나비', '10446', '흰돌마을 3단지 한진아파트', '2020-09-16')


alter table member add job varchar2(10)
/*게시글*/ w_ aaa.nextval() 을 no에 추가한다.
create table board (no int primary key, writer varchar2(40), title varchar2(100), 
content varchar2(1000), delpw number(4) regdate date default sysdate)
/*공지*/ n_
create table notice (no number(1) primary key, title varchar2(100), content varchar2(1000), img varchar2(300))
/*제품*/ p_
create table product (id varchar2(20) primary key, name varchar2(80), description varchar2(1000), 
standard varchar2(80), price int, img varchar(500))

insert into product values('A01', 'car01', 'good', 'KR1', '30000000', './img/a001')
/*관리자*/ a_
create table admin (id varchar2(40) primary key, pw varchar2(40) not null)
insert into admin values ('admin', '1234')
select * from product2
select substr()
create sequence aaa start with 1 increment by 1 maxvalue 10000 cycle nocache;
create index bbb on notice2(idx);
select * from notice2
insert into notice2 values(aaa.nextval, 'A004', '제목1', '내용1', '홍길동', sysdate, 0)
insert into notice2 values(bbb.nextval, 'A002', '제목2', '내용2', '홍길동', sysdate, 0)
select * from product2
select substr(id, 2,3) as a1 from notice2 where idx in (select max(idx) from notice2)
