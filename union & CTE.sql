use operation;

select * from  course;
select * from student;

select course_id , course_name from course;

select student_id , student_name from student; 

select course_id , course_name from course 
union 
select student_id , student_name from student;

select course_id , course_name from course 
union 
select student_id from student;

select course_desc , course_name from course 
union all
select student_id , student_name from student;

select student_id , student_name from student;

(select course_desc , course_name from course 
union all
select student_id , student_name from student);

(select course_desc , course_name from course 
union 
select student_id , student_name from student );

#CTE common table expession

select * from course where course_id in (101,102,106);

with sample_students as (
select * from course where course_id in (101,102,106))
select * from sample_students where course_tag = 'java';

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student s;

with outcoume_corss as (select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student s ) select course_id , course_name ,student_id from outcoume_corss where student_id = 301;

select 1 as col1, 2 as col2; 

select 1 as col1, 2 as col2 
union all
select 5, 4;

with ctetest as (select 1 as col1, 2 as col2 
union all
select 3, 4)
select col1 from ctetest;

with recursive cte(n) as (select 1 union all select n+1 from cte where n<5)
select * from cte;

select 1 as n, 2 as p, -1 as q;

with recursive cte as (select 1 as n, 2 as p, -1 as q
union all 
select n+1, p+2, q+4 from cte where n<50)
select * from cte;


with recursive cte as (select 1 as n, 2 as p, -1 as q
union all 
select n+1, p*2, q+4 from cte where n<50)
select * from cte;

