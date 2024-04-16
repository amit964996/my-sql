create database neuron;
USE NEURON;

create table course(
course_id int , 
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date);

create table course_update(
course_metor_update varchar(50), 
course_price_update int ,
course_discount_update int );

SELECT * FROM COURSE;
SELECT * FROM COURSE_UPDATE;

insert into course ( 
course_id, course_desc, course_mentor, course_price, course_discount) 
value(101, "FSDA", "sudhanshu", 4000, 10);


delimiter //
create trigger course_before_insert
before insert
on course for each row
begin
	set new.create_date = sysdate();
end; //    

insert into course ( course_id, course_desc, course_mentor, course_price, course_discount) 
value(102, "FSDA2", "sudh", 4001, 11);

delimiter //
create trigger course_after_insert1
after insert
on course for each row
begin
	insert into course (create_date) values(sysdate());
end; //


insert into course ( course_id, course_desc, course_mentor, course_price, course_discount) 
value(103, "FSDA3", "sudh3", 4002, 12);



create table course2(
course_id int , 
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date,
user_info varchar(50)  );


insert into course2 (course_id,course_desc,course_mentor,course_price,course_discount) value(102,"FSDA","sudhanshu",4001,11);

delimiter //
create trigger course_before_insert1
before insert 
on course2 for each row
begin
	declare user_val varchar(50);
	set new.create_date = sysdate();
    select user() into  user_val;
    set new.user_info = user_val;
end; //

select * from course2;
select user();

delimiter //
create trigger course_before_insert2
before insert 
on course2 for each row
begin
	declare user_val varchar(50);
	set new.create_date = sysdate();
    select user() into  user_val;
    set new.user_info = user_val;
    insert into ref_course values(sysdate() , user_val);
end; //


create table ref_course (
record_insert_date date,
record_insert_user varchar(50)
);

insert into course2 (course_id,course_desc,course_mentor,course_price,course_discount) value(103,"FSDA3","sudhanshu",4002,12);

select * from course2;
select * from ref_course;


create table test1(
c1 varchar(50),
c2 date,
c3 int);


create table test2(
c11 varchar(50),
c12 date,
c13 int );


create table test3(
c21 varchar(50),
c22 date,
c23 int );


delimiter //
create trigger to_update_others
before insert on test1 for each row 
begin
	insert into  test2 values("xyz",sysdate(),23354);
	insert into  test3 values("xyz",sysdate(),23354);
end; //

insert into test1 values ("abc", sysdate(), 204);

select * from test1;
select * from test2;
select * from test3;

insert into test2 values("amit1", '2024-02-02', 6876);

delimiter //
create trigger to_update_others_2
before insert on test2 for each row 
begin
	insert into  test3 values("xyz1",sysdate(),23354);
end; //


delimiter //
create trigger to_update_others_table1
after insert on test1 for each row 
begin
	update test2 set c11 = 'abc' where c11 = 'xyz';
	delete from test3 where c21 = 'xyz';
end; //


delimiter //
create trigger to_update_others_table2
after insert on test1 for each row 
begin
	update test2 set c11 = 'abc' where c11 = 'xyz';
	delete from test3 where c21 = 'xyz';
end; //


insert into test1 values ("abc2", sysdate(), 205);

delimiter //
create trigger to_delete_others_table 
after delete on test1 for each row 
begin
	insert into test3 values("after delete" , sysdate(), 435456);
end; //

delete from test1 where c1 = 'abc';


select * from test1;
select * from test2;
select * from test3;

delimiter //
create trigger to_delete_others_before_observation
before delete on test1 for each row 
begin
	insert into test2(c11,c12,c13) values(old.c1, old.c2,old.c3);
end; //



create table test11(
c1 varchar(50),
c2 date,
c3 int);


create table test12(
c1 varchar(50),
c2 date,
c3 int );


create table test13(
c1 varchar(50),
c2 date,
c3 int );


insert into test11 values("abc13" , sysdate(), 435456);
select * from test11;
select * from test12;
select * from test13;

delimiter //
create trigger to_delete_others_before_observation
before delete on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

delete from test11 where c1 = 'abc11';


delimiter //
CREATE TRIGGER trigger_name    
    (AFTER | BEFORE) (INSERT | UPDATE | DELETE)  
         ON table_name FOR EACH ROW    
         BEGIN    
        --variable declarations    
        --trigger code    
END;  