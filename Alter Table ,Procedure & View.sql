create database sales;

use sales;

create table if not exists sdf(
order_id VARCHAR(15) NOT NULL, 
order_date VARCHAR(15) NOT NULL, 
ship_date VARCHAR(15) NOT NULL,  
ship_mode VARCHAR(14) NOT NULL, 
customer_name VARCHAR(22) NOT NULL, 
segment VARCHAR(11) NOT NULL, 
state VARCHAR(36) NOT NULL, 
country VARCHAR(32) NOT NULL, 
market VARCHAR(6) NOT NULL, 
region VARCHAR(14) NOT NULL, 
product_id VARCHAR(16) NOT NULL, 
category VARCHAR(15) NOT NULL, 
sub_category VARCHAR(11) NOT NULL, 
product_name VARCHAR(127) NOT NULL, 
sales DECIMAL(38, 0) NOT NULL, 
quantity DECIMAL(38, 0) NOT NULL, 
discount DECIMAL(38, 3) NOT NULL, 
profit DECIMAL(38, 5) NOT NULL, 
shipping_cost DECIMAL(38, 2) NOT NULL, 
order_priority VARCHAR(8) NOT NULL, 
`year` DECIMAL(38, 0) NOT NULL
);

select * from sdf;


set session SQL_MODE = '';

load data infile
'D:/sales_data_final.csv'
into table sdf
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select str_to_date(order_date, '%m/%d/%y') from sdf;


select * from sdf;
set SQL_SAFE_UPDATES = 0;
alter table sdf
add column order_date_new date after order_date;

update sdf
set order_date_new = str_to_date(order_date, '%m/%d/%y');

ALTER TABLE sdf
drop order_date_new;

select * from sdf;

alter table sdf
add column ship_date_new date after ship_date;

update sdf
set ship_date_new = str_to_date(ship_date, '%m/%d/%y');


select * from sdf where order_date_new = '2020-01-01';

select * from sdf where order_date_new > '2020-01-01';


select * from sdf where order_date_new < '2020-01-01';

select * from sdf where ship_date_new between '2020-01-06' and '2020-01-08';




select now();

select curdate();

select curtime();


select order_date from sdf where order_date_new < date_sub(now() , interval 1 week);

select date_sub(now(), interval 1 week);

select date_sub(now(), interval 30 day);


select date_sub(now(), interval 50 day);

select date_sub(now(), interval 3 year); 

select year (now());

select dayname (now());

select dayname ('2030-10-12 20:10:20');

select dayname ('2015-10-25');


select * from sdf;


alter table sdf
add column flag date after order_id;

alter table sdf
drop flag;

alter table sdf
add column discount_flag varchar(20) after discount;

update sdf
set discount_flag = if(discount > 0, 'yes', 'no');


select discount_flag, count(*) from sdf 
group by discount_flag;

select count(*) from sdf where discount >0;

set SQL_SAFE_UPDATES =0;

alter table sdf
add column month_new int;

alter table sdf
modify column month_new int;

alter table sdf
add column day_new int;

alter table sdf
modify column day_new int;

alter table sdf
add column year_new int;

alter table sdf
modify column year_new int;

update sdf
set month_new = month(order_date_new);


update sdf
set day_new = day(order_date_new);

update sdf
set year_new = year(order_date_new);

select day_new, month_new, year_new from sdf;

select month(order_date_new) from sdf;

select day(order_date_new) from sdf;

select year(order_date_new) from sdf;

select year_new , avg(sales) from sdf
group by year_new;

select month_new , avg(sales) from sdf
group by month_new;

select day_new , avg(sales) from sdf
group by day_new;


select month_new, sum(sales) from sdf 
group by month_new;

select day_new, sum(sales) from sdf
group by day_new;

select year_new, sum(sales) from sdf 
group by year_new;

select month_new, max(sales) from sdf group by month_new;

select day_new, min(sales) from sdf group by day_new;


select month_new, sum(quantity), sum(sales) from sdf
group by month_new;


select (sales* discount+ shipping_cost) as ctc from sdf;


select order_id, discount, if(discount >0, 'yes', 'no') as discount_flag from sdf;



select order_id, discount, profit, if (profit >10, 'profit', 'no profit') as profit_flag from sdf;

select concat( country, '  ', region) as CR from sdf;

select * from sdf;


set global max_allowed_packet = 209715200;




create database online_retail;

use online_retail;

create table if not exists O_R(
invoiceNo varchar(100),
StockCode varchar(100),
`Description` varchar(100),
Quantity varchar(100),
InvoiceDate varchar(100),
UnitPrice varchar(50),
CustomerID varchar(50),
Country varchar(100)
);

select * from O_R;

	load data infile
	'D:/Rahul(csv file).csv'
	into table O_R
	fields terminated by ','
	lines terminated by '\n'
	ignore 1 rows;
    
    alter table O_R
    add column `day` int after InvoiceDate;
    
    alter table O_R
    modify column `day` int;
    
    update O_R
    set `day` = day(InvoiceDate);
    
    set sql_safe_updates = 0;

select * from O_R;

alter table O_R
add column `month` int after `day`;

update O_R
set `month` = month(InvoiceDate);


alter table O_R
add column `year` int after `month`;


update O_R
set `year` = year(InvoiceDate);

select * from O_R;

create view UCCD as select unitprice, customerID, country, `description` from O_R;


select * from UCCD;

delimiter &&
create procedure d_Q(in v1 varchar(100), in v2 varchar(100))
BEGIN
		select * from O_R where `Description` = v1 and Quantity = v2;
        
END &&

call d_Q("WHITE METAL LANTERN", 6);

delimiter &&
create procedure d_M_Y(in v1 int, in v2 int, in v3 int)
BEGIN
		select StockCOde, Quantity, UnitPrice, country from O_R
        where `day` =v1 and `month` =v2 and `year` =v3;
        
END &&

call d_m_y(1, 12, 2010);

delimiter &&
create procedure `count`()

BEGIN
		select count(*) from O_R;
END &&

call `count`();



delimiter &&
create procedure all_data()
BEGIN
		select * from O_R;
        
END &&

call all_data();


create view iSDQ as select invoiceNo, StockCode, `description`, Quantity from O_R;

select * from iSDQ; 
