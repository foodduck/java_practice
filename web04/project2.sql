/*Qna 테이블의 visited를 지우기*/

/*회원 테이블 및 시퀀스*/

create sequence scott.usertb_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

create table usertb(usertbid int primary key, u_id varchar2(50) unique, pw varchar2(50) not null, 
uname varchar2(50) not null, email varchar2(50) not null, q varchar2(200) not null, 
a varchar2(200) not null, add1 varchar2(100) not null, add2 varchar2(200) not null, 
regdate date default sysdate, cp int default 0);

insert into usertb values (usertb_seq.nextval, 'kwa1032', 'qwerasdf', '홍길동', 'hong@naver.com', 
'태어난 곳은?', '병원', '10446', '고양시 일산동구', sysdate, 0)

/*관리자용 판매 테이블 및 시퀀스*/

create sequence scott.sales_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

create table sales(salesid int primary key, scode varchar2(30) unique, cnt int not null, 
price int not null, dc decimal default 0, pay int not null);

insert into sales values (sales_seq.nextval, 'A001', 30, 9800, 0.8, 235200)

/*쿠폰 테이블 및 시퀀스*/

create sequence scott.coupon_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

create table coupon(couponid int primary key, ccode varchar2(30) unique, cname varchar2(50) not null, 
dc decimal not null, use varchar2(10) default 'no');

insert into coupon values (coupon_seq.nextval, 'A02', '설날기념', '0.9', 'no')

/*쿠폰발급내역 테이블 및 시퀀스*/

create sequence scott.issuecoupon_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

create table issuecoupon (issuecouponid int primary key, icode varchar2(30) unique, iname varchar2(50) not null, 
dc decimal not null, use varchar2(10) default 'no', holder varchar2(50) not null, receivedate date default sysdate)

insert into issuecoupon values (issuecoupon_seq.nextval, 'A001', '크리스마스쿠폰', '0.9', 'no', 'kwak12', sysdate)

/* 고객센터 테이블 및 시퀀스 */
create sequence scott.qna_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

create table qna (qnaid int primary key, tit varchar2(200) not null, 
con varchar2(500) not null, author varchar2(50) not null,
pw int not null, regdate date default sysdate);

insert into qna values (qna_seq.nextval, '안녕하세요', '내용1', 'hong11', 1234, sysdate, 0)

/*제품목록 테이블 및 시퀀스*/

create sequence scott.prolist_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

create table prolist (prolistid int primary key, pcode varchar2(30) unique, pname varchar2(50) not null, 
nat varchar2(50) not null, genre varchar2(50) not null,
price int not null, img varchar2(500));

/* 결제 테이블 및 시퀀스*/

create sequence scott.buy_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

create table buy (buyid int primary key, bcode varchar2(30) unique, buyer varchar2(50) not null,
bname varchar2(50) not null, cnt int not null, price int not null, cpuse varchar2(10) default 'no');

/* 장바구니 테이블 및 시퀀스 */

create sequence scott.orderbasket_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

create table orderbasket (orderbasketid int primary key, ocode varchar2(30) unique, buyer varchar2(50) not null,
oname varchar2(50) not null, cnt int not null);


