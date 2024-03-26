use sales;


create table loop_table(real_value int);


Delimiter $$
create procedure insert_data()
Begin
set @a  = 1;
generate_data : loop
insert into loop_table values (@a);
set @a = @a + 1;
if @a  = 101 then 
	leave generate_data;
end if;
end loop generate_data;
End $$
call insert_data;

select * from loop_table;

alter table loop_table
add column square int;

delimiter $$
create procedure insert_data1()
begin
declare b int;
while b <= 100 do
insert into loop_table(square) values (b* b);
set b =b+1;
end while;
end $$

call insert_data1;
select * from loop_table;
use bankdetails;
create table loop_table2 ( `values` int , square int);

delimiter $$
create procedure insert_data5()
begin
declare b int default 1;
while b <= 100 do
insert into loop_table2 ( `values`, square)
values (b, b*b);
set b = b+1;
end while;
end$$

call insert_data5;

select  * from loop_table2;