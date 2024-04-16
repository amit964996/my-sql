use test_partition;

SELECT * FROM test_partition.course;

select * ,
case 
    when course_name = 'fsda' then sysdate()
    else "this is not your batch"
end as statement 
from course;

select *,
case
	when course_id = 104 then "this is single record"
end as stat
from course;

select *,
case
	when course_id = 104 then "this is single record"
    when course_name = 'fsds' then system_user()
end as stat
from course;

select *,
case
	when course_id = 104 then "this is single record"
    when course_name = 'fsds' then system_user()
    else "NO"
end as stat
from course;

select course_id, course_name ,
case
	when course_id = 104 then "this is single record"
    when course_name = 'fsds' then system_user()
    else "NO"
end as stat
from course;


select * ,
case 
    when length(course_name) = 4  then "len 4"
    when length(course_name) = 2  then "len 2"
    when length(course_name) = 5  then "len 5"
    else "other lenght"
end as statement 
from course;

update course set course_name = case 
when course_name = 'RL' then 'reinforcement learing'
when course_name = 'dl' then 'deep learning'
end; 


UPDATE course 
SET course_name = 
    CASE 
        WHEN course_name = 'RL' THEN 'Reinforcement Learning'
        WHEN course_name = 'dl' THEN 'Deep Learning'
    END;
    
UPDATE course 
SET course_name = 
    CASE 
        WHEN course_lauch_year =  2022 THEN 'Reinforcement Learning'
    END;

UPDATE course 
SET course_name = 
    CASE 
        WHEN course_lauch_year =  2020 THEN 'Deep Learning'
    END;
   
   
select * ,
case 
    when course_lauch_year = 2019 then "ML"
    when course_lauch_year = 2020  then "DL"
    when course_lauch_year = 2021  then "DS"
    else "DA"
end as statement 
from course;  


UPDATE course 
SET course_name = 
    CASE 
        WHEN course_lauch_year =  2020 THEN 'SF'
		when course_lauch_year = 2019 then "ML"
		when course_lauch_year = 2020  then "DL"
		when course_lauch_year = 2021  then "DS"
		else "DA"
    END;
    
UPDATE course 
SET course_name = 
    CASE 
        WHEN course_name =  "SF" THEN 'Sales-Force'
		when course_name = "ml" then "Machine Learning"
		when course_name = "DL"  then "Deep Learning"
		when course_name = "ds"  then "Data Science"
		else "Data A"
    END;
    
select * from course