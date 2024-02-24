
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


update book_master_tbl set current_stock= current_stock+2 where book_id=1
delete from member_master_tbl where state='Bha'

select * from book_master_tbl
select * from book_master_tbl where book_id=1
delete from book_master_tbl whrere book_id= ' '
