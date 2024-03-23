use bankdetails;

create table if not exists demo (
`id` int auto_increment,
`name` varchar(30),
`email` varchar(30),
`address` varchar(30),

primary key (`id`));

insert into demo values(0, "amit", "amit@gmail", "jaipur");

insert into demo( `name`, `email`, address)
values( "amit", "amit@gmail", "jaipur");

create table if not exists demo2(
`id` int,
`name` varchar(30),
`email` varchar(30),
`address` varchar(30),
`salary` int check(`salary`>12000));

insert into demo2 values ( 1, "amit", "amit@gmail", "jaipur", 13000);

insert into demo2 ( `name`, email, address, 
salary )
values("amit", "amit@gmail", "jaipur", 13000);


create table if not exists demo3(
`id` int not null,
`name` varchar(30),
`email` varchar(30),
`address` varchar(30),
`salary` int check(`salary` > 10000));

insert into demo3(`id`, `name`, email, address, salary)
values(2, "amit", "amit@gmail", "jaipur", 12000);

create table if not exists demo4 (
`id` int not null  auto_increment,
`name` varchar(30) not null default 'unknown',
`email` varchar(30) unique not null,
`address` varchar(30) check (`address` ='jaipur') not null,
`salary` int check(`salary` > 11000) not null,
primary key (`id`));


insert into demo4(`id`, `name`, email, address, salary)

values(2, 'amit2', 'amit2@gmail', 'jaipur', 12000);

select * from demo4;


alter table demo3 add check(`id` > 0);

insert into demo4 values(15, "sukhan", "sukhan@gmail", "jaipur", 17000);


select * from demo4;
