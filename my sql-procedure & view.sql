use bankdetails;

DELIMITER &&
create procedure bal_max()
BEGIN
select * from bank where balance in (select max(balance) from bank);
END &&

call bal_max();


DELIMITER &&
create procedure a()
BEGIN
select * from bank;
END &&

call a();



DELIMITER &&
create procedure d()
BEGIN
select * from bank where age >40;
END &&
call d();


DELIMITER &&
create procedure e()
BEGIN
select age, education or balance from bank where housing = "yes";
END &&
call e();

DELIMITER &&
create procedure all_data()
BEGIN
		select * from bank;
END &&

call all_data();


DELIMITER &&
create procedure `count`()

BEGIN
		select  count(*) from bank;
END &&

call `count`();



DELIMITER &&
create procedure job_age(IN v1 varchar (30), IN v2 int)
BEGIN
		select * from bank where job = v1 and age <v2;

END &&


call job_age("unemployed", 45);


DELIMITER &&
create procedure jobrole(IN jd varchar(30))
BEGIN
		select * from bank where job= jd;
        
END && 

call jobrole("blue-collar");



DELIMITER &&
create procedure housing(IN v0 varchar(30))
BEGIN
		select housing, balance, education, age, marital from bank where housing = "no";
        
END &&


call housing("no");




create view HBEAM as select housing, balance, education, age, marital from bank;


