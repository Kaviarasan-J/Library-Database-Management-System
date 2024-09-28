create database library_demo;

use library_demo;

create table readers(
     reader_id varchar(6),
     fname varchar(30),
     mname varchar(30),
     ltnmae varchar(30),
     city varchar(15),
     mobileno varchar(10),
     occupation varchar(10),
     dob date,
     constraint reader_pk primary key(reader_id)
     );

insert into readers values('C00001','Ramesh','Chandra','Sharma','Delhi','9563426789','Service','2023-12-06');
insert into readers values('C00002','Avinash','Sunder','Minha','Delhi','9786453324','Service','2023-10-06');
insert into readers values('C00003','Rahul',null,'Sharma','Delhi','8675543876','Service','2023-09-18');
insert into readers values('C00004','Parul',null,'Gandhi','Delhi','9087456233','Housewife','2023-11-02');
insert into readers values('C00005','Naveen','Chandra','Aedekar','Mumbai','6389487620','Service','2023-09-08');
insert into readers values('C00006','Chitersh',null,'Barwe','Mumbai','7845902456','Students','2023-11-11');
insert into readers values('C00007','Amit','Kumar','Borkar','Mumbai','8765349023','Students','2023-09-29');
insert into readers values('C00008','Nisha',null,'Damle','Mumbai','6321543790','Service','2023-03-24');
insert into readers values('C00009','Abishek',null,'Dutta','Kolkata','90562y8221','Service','2023-05-22');
insert into readers values('C00010','Shankar',null,'Nair','Chennai','9876543210','Service','2023-07-12');

select * from readers;

create table Book (
      bid varchar(6),
      bname varchar(40),
      bdomain varchar(30),
      constraint book_id_pk primary key(bid)
      );
      
insert into book values('B00001','The Cat in the Hat','Story');
insert into book values('B00002','Charlie and the Chocolate Factory','Story');
insert into book values('B00003','The Very Hungry Caterpillar','Story');

create table active_readers(
	   account_id varchar(6),
       reader_id varchar(6),
       bid varchar(6),
       atype varchar(10),
       astatus varchar(10),
       constraint activereaders_acnumber_pk primary key(account_id),
       constraint account_readerid_fk foreign key(reader_id) references readers(reader_id),
       constraint account_bid_fk foreign key(bid) references book(bid)
);
select * from active_readers;

insert into active_readers values('A00001','C00001','B00001','Premium','Active');
insert into active_readers values('A00002','C00002','B00002','Regular','Active');
insert into active_readers values('A00003','C00003','B00002','Premium','Active');
insert into active_readers values('A00004','C00002','B00003','Premium','Active');
insert into active_readers values('A00005','C00006','B00002','Regular','Active');
insert into active_readers values('A00006','C00007','B00001','Premium','Suspended');
insert into active_readers values('A00007','C00007','B00001','Premium','Active');
insert into active_readers values('A00008','C00001','B00003','Regular','Terminated');
insert into active_readers values('A00009','C00003','B00002','Premium','Terminated');
insert into active_readers values('A00010','C00004','B00002','Premium','Active');

select * from active_readers;

create table bookissue_details(
	    issuenumber  varchar(6),
        account_id varchar(6),
        bid varchar(20),
        bookname varchar(50),
        numbers_of_book_issued int(7),
        constraint trandetails_tnumber_pk primary key(issuenumber),
        constraint trandetails_acnumber_fk foreign key(account_id) references active_readers(account_id)
        );
        
select * from bookissue_details;
--         
-- insert into bookissue_details values('T00001','A00001','B00001','The Cat in the Hat','Story');
-- insert into bookissue_details values('T00002','A00001','B00002','Charlie and the Chocolate Factory','Story');
-- insert into bookissue_details values('T00003','A00002','B00001','The Cat in the Hat','Story');
-- insert into bookissue_details values('T00004','A00002','B00003','The Very Hungry Caterpillar','Story');

INSERT INTO bookissue_details (issuenumber, account_id, bid, bookname, numbers_of_book_issued) 
VALUES ('T00001', 'A00001', 'B00001', 'The Cat in the Hat', 1);

INSERT INTO bookissue_details (issuenumber, account_id, bid, bookname, numbers_of_book_issued) 
VALUES ('T00002', 'A00001', 'B00002', 'Charlie and the Chocolate Factory', 1);

INSERT INTO bookissue_details (issuenumber, account_id, bid, bookname, numbers_of_book_issued) 
VALUES ('T00003', 'A00002', 'B00001', 'The Cat in the Hat', 1);

INSERT INTO bookissue_details (issuenumber, account_id, bid, bookname, numbers_of_book_issued) 
VALUES ('T00004', 'A00002', 'B00003', 'The Very Hungry Caterpillar', 1);

select * from active_readers;

select * from active_readers where astatus = 'Terminated';

select * from active_readers where astatus = 'Active';

select count(account_id) from active_readers where atype='Premium';