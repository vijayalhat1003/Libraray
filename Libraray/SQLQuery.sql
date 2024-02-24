create database xlogia 
use xlogia
create table xlogia_tbl 
(Employee_Id int primary key, 
 Employee_Name nvarchar(30),
 Employee_Age nvarchar(30),
 Employee_Email nvarchar(30),
 )


create database eLibraryDB
use eLibraryDB
create table author_master_tbl 
(author_id nvarchar(20) primary key, 
 author_name nvarchar(30)
 )

 create table book_master_tbl
 (book_id nchar(10) primary key,
 book_name nvarchar(max),
 genre nvarchar(max),
 author_name nvarchar(max),
 publisher_name nvarchar(max),
 publish_date nvarchar(50),
 --language numeric(18,0),
 language nvarchar(max),
 edition nvarchar(50),
 book_cost nchar(10),
 no_of_pages nchar(10),
 book_description nvarchar(max),
 actual_stock nchar(10),
 current_stock nchar(10),
 book_img_link nvarchar(50))

 drop table book_master_tbl

create table publisher_master_tbl 
(publisher_id nchar(20) primary key, 
 publisher_name nvarchar(30)
 )

create table admin_login_tbl 
(username nvarchar(50) primary key, 
 password nvarchar(50),
 full_name nvarchar(50))

 drop table book_issue_tbl 
 insert into book_issue_tbl(member_id, member_name, book_id, book_name, issue_date, due_date)
 values (2, 'bhagyashri', '5', 'IT', '24', '28')
create table book_issue_tbl 
(member_id nvarchar(50) primary key, 
 member_name nvarchar(50),
 book_id nvarchar(50),
 book_name nvarchar(50),
 issue_date nvarchar(50),
 due_date nvarchar(50))

 select * from book_master_tbl

create table member_master_tbl 
(
 full_name nvarchar(50),
 dob nvarchar(50),
 contact_no nvarchar(50),
 email nvarchar(50),
 state nvarchar(50),
 city nvarchar(50),
 pincode nvarchar(50),
full_address nvarchar(50),
member_id nvarchar(50) primary key, 
 password nvarchar(50),
 account_status nvarchar(50)
 )

select * from publisher_master_tbl where member_id='Bhagya@123' and password='asfg';

insert into member_master_tbl ()

update publisher_master_tbl set publisher_name='hey' WHERE publisher_id=1
delete from publisher_master_tbl where publisher_id =1

insert into book_master_tbl (book_id, book_name, genre, author_name, publisher_name, publish_date, language, edition, book_cost, no_of_pages, book_description, actual_stock, current_stock, book_img_link) values
                             ('2', 'new', 'hey',           'Bhagya',   ' bha',         '1',       1, '1.2',    '200' ,    '100',      'new'      ,'2', '2' , 'new')                                                                                                                                       
select * from member_master_tbl where member_id = 
select full_name from member_master_tbl where member_id ='bhagya'
select * from member_master_tbl
update book_master_tbl set current_stock= current_stock+2 where book_id=1
delete from member_master_tbl where state='Bha'

select * from book_master_tbl
select * from book_master_tbl where book_id=1
delete from book_master_tbl whrere book_id= ' '