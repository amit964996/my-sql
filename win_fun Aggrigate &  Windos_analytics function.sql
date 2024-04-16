create database win_fun;

use win_fun;

create table inst_students(
student_id int ,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
students_marks int ,
student_mail_id varchar(50));

insert into inst_students values(100 ,'FSDA' , 'sandeep','CS', 65, 'sandeep@gmail.com');

insert into inst_students values(101 ,'FSDA' , 'saurabh','cs',80,'saurabh@gmail.com'),
(102 ,'FSDA' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'FSDA' , 'shyam','cs',82,'shyam@gmail.com'),
(104 ,'FSDA' , 'santanu','cs',82,'sanket@gmail.com'),
(105 ,'FSDA' , 'AMIT','ME',67,'shyam@gmail.com'),
(106 ,'FSDS' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'FSDS' , 'anil','ME',78,'ajay@gmail.com'),
(107 ,'FSDS' , 'snehal','CI',89,'snehal@gmail.com'),
(108 ,'FSDS' , 'manisha','CI',34,'manisha@gmail.com'),
(109 ,'FSDS' , 'rakesh','CI',45,'rakesh@gmail.com'),
(110 ,'SALEsFORCE' , 'anuj','CI',43,'anuj@gmail.com'),
(111 ,'SALEsFORCE' , 'mohit','EE',67,'mohit@gmail.com'),
(112 ,'SALEsFORCE' , 'vivek','EE',23,'vivek@gmail.com'),
(113 ,'SALEsFORCE' , 'gaurav','EE',48,'gaurav@gmail.com'),
(114 ,'SALEsFORCE' , 'prateek','EE',88,'prateek@gmail.com'),
(115 ,'SALEsFORCE' , 'mithun','ECE',27,'mithun@gmail.com'),
(116 ,'Devops' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(117 ,'Devops' , 'pranay','ECE',45,'pranay@gmail.com'),
(118 ,'Devops' , 'sandeep','ECE',65,'sandeep@gmail.com'),
(119 ,'Devops' , 'sanjay','ECE',68,'sandeep@gmail.com');

select student_batch , sum(students_marks) from inst_students group by student_batch;

select student_batch ,min(students_marks) from inst_students group by student_batch;

select student_batch ,max(students_marks) from inst_students group by student_batch;

select student_batch ,avg(students_marks) from inst_students group by student_batch;

select count(student_batch) from inst_students;

select count(distinct student_batch) from inst_students;

select count(distinct students_marks) from inst_students;

select student_batch , count(*) from inst_students group by student_batch;

select student_batch, max(students_marks) from inst_students group by student_batch;

select student_batch, max(students_marks) from inst_students group by student_batch limit 2;

select max(students_marks) from inst_students where student_batch='fsda';

select student_name, student_batch, max(students_marks) from inst_students ;

select student_name, max(students_marks) from inst_students where student_batch='FSDA';

select student_name from inst_students where students_marks in 
(select max(students_marks) from inst_students where student_batch="fsda");

select student_name from inst_students where student_batch='fsda' order by students_marks DESC limit 2;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 1;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 1,1;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 1,2;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 1,3;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 2,2;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 2 , 1;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 3, 1;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 4 , 1;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 5 , 1;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 6 , 1;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 3, 3;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 3;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 2, 3;

select * from inst_students;


select * from inst_students where students_marks = (select min(students_marks) from 
(select students_marks from inst_students where student_batch ="fsda" order by students_marks desc limit 3) as top);

select students_marks from inst_students 
where student_batch ="fsda" order by students_marks desc limit 3;

select student_id , student_batch , student_stream, students_marks ,
row_number() over (order by students_marks) as 'row_number' from inst_students;


select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_num' 
from inst_students ) as test where row_num = 1;

select student_id , student_batch , student_stream, students_marks ,
row_number() over(partition by student_batch order by students_marks desc ) as 'row_num' 
from inst_students;


select student_id , student_batch , student_stream,students_marks ,
row_number() over(order by students_marks desc) as 'row_number',
rank() over(order by students_marks desc ) as 'row_rank' 
from inst_students;


select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
rank() over(partition by student_batch order by students_marks desc ) as 'row_rank' 
from inst_students ) as test where row_rank = 1;

select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
rank() over(partition by student_batch order by students_marks desc ) as 'row_rank',
dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
from inst_students ) as test where `dense_rank` = 2;

select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
from inst_students ) as test where `dense_rank` = 1;

select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
from inst_students ) as test;

use win_fun