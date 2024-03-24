use sales;

DELIMITER $$
create function final_profits(profit int , discount int )
returns int
Deterministic
Begin 
Declare final_profit int ;
set final_profit = profit - discount ;
return final_profit;
end $$

select max(sales) from sdf;

select profit, discount, final_profits( profit, discount) from sdf;

delimiter $$
CREATE function final_profits1( profit int, discount int)
returns decimal (20, 6)
deterministic
begin
declare final_profit1 decimal(20, 6);
set final_profit1 = profit - discount;
return final_profit1;
end $$

select profit, discount, final_profits1 (profit, discount) from sdf;

delimiter $$
create function add_to_col3(a int)
returns int
deterministic
begin
declare b int;
set b = a+10;
return b;
end $$

select quantity, add_to_col3(quantity) from sdf;


use online_retail;
select UnitPrice, add_to_Col3(UnitPrice) from O_R;

use sales;

delimiter $$
create function final_profits_real( profit decimal (20, 6),
discount decimal (20,6), sales decimal (20, 6) )

returns decimal
deterministic
begin
declare final_profit int;
set final_profit = profit - discount * sales;
return final_profit;

end $$

select profit, discount, sales, final_profits_real (profit, discount, sales) from sdf;


delimiter $$
create function final_profits_real1(profit decimal (20, 6), discount decimal (20, 6), sales decimal(20, 6) )
returns decimal (20, 6)
deterministic
begin
declare final_profit decimal (20, 6);
set final_profit = profit - discount * sales;
return final_profit;
end $$


select profit, discount, final_profits_real1( profit, discount, sales) from sdf;

delimiter $$
create function final_profits_real2 (p decimal(20,6), d decimal(20, 6), s decimal(20, 6))
returns decimal(20, 6)
deterministic
begin
declare final_profit decimal (20, 6);
set final_profit = p - d * s;
return final_profit;
end $$

select profit, discount, sales, final_profits_real2( profit, discount, sales) from sdf;

1 + 1 = 2

'1'+ '10' = 110

2+2 = 4
'2'+'2' = 22
'2' * '10' = 2222222222

select* from sdf;

select quantity, add_to_col3(quantity) from sdf;

delimiter $$
create function int_to_str (a int)
returns varchar (20)
deterministic
begin
declare b varchar (20);
set b = 'a';
return b;
end $$

select int_to_str(345);

select int_to_str(45);


select quantity, add_to_col3(quantity) from sdf;

select max(sales), min(sales) from sdf;


use sales;
select * from sdf;

use online_retail;
select * from O_R;

alter table O_R
add column InvoiceDate_new date after InvoiceDate;

alter table O_R
drop column InvoiceDate_new;

set SQL_SAFE_UPDATES =0;

use online_retail;

delimiter $$
create function total_costs( Quantity int, UnitPrice decimal (20, 5))
returns decimal(20, 5)
deterministic
begin
declare total_cost decimal (20, 5);
set total_cost = Quantity * UnitPrice;
return total_cost;
end $$

select Quantity, UnitPrice, total_costs( Quantity, UnitPrice) from O_R;



delimiter $$
create function total_costs1 (Q int, U int)
returns int
deterministic
begin
declare total_cost1 int;
set total_cost1 = Q * U;
return total_cost1;
end $$

select quantity, unitprice, total_costs1 (quantity, unitprice) from O_R;

select unitprice, add_to_col3(unitprice) from O_R;

select * from O_R;

select quantity, add_to_col3(quantity) from O_R;


delimiter $$
create function total_costs2( a int, b decimal(30, 5))
returns decimal(30, 5)
deterministic
begin
declare total_cost2 int;
set total_cost2 = a * b;
return total_cost2;
end $$

select quantity, unitprice, total_costs2(quantity, unitprice) from O_R;

select `day`, `month`, total_costs2( `day`, `month`) from O_R;

1  - 100 - super affordable product 
100 -300 - affordable 
300 - 600 - moderate price 
600 + - expensive 

1- 5 - toddler 
5 - 10 - kids
10 - 18 - tenagers
18 - 30 - young
30 - 60 - man
60 -70 - senior citizen 
70 + - super senior

delimiter $$
create function mark_sales(a int)
returns varchar(30)
deterministic
begin
declare b varchar(30);
if a <=100 then
	set b = "super affordable
    product";
    
elseif a > 100 and a < 300 then
	set b = "affordable";
    
elseif a > 300 and a < 600 then
	set b = "modrate price";
    
else
	set b = "expensive";
    
end if;
return b;
end $$

select mark_sales (101);

select mark_sales (300);

select mark_sales (306);
select mark_sales (30);
select sales, mark_sales(sales) from sdf;

select sales, quantity, mark_sales (sales) from sdf;

delimiter $$
create function age_cat(a int)
returns varchar(30)
deterministic
begin
declare b varchar (30);
if a <= 5 then
	set b = "toddler";
elseif a > 5 and a <10 then
	set b = "kids";
elseif a >=10 and a <18 then
	set b = "teengers";
elseif a >=18 and a <30 then
	set b = "young";
elseif a >=30 and a <60 then
	set b = "man";
elseif a >= 60 and a <70 then
	set b = "senior citizen";
    
else
	set b = "super senior";
end if;
return b;
end$$
    
    
select age_cat(20);

select age_cat (50);
