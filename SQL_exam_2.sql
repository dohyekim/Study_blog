insert into Enroll (student, subject)
select s.id, sbj1.id from Student s, (select id from Subject order by rand() limit 3) sbj1 where s.id <= 300;

insert into Enroll (student, subject) 
select s.id, sbj2.id
from Student s, (select id from Subject where id not in (select subject from Enroll) order by rand() limit 3) sbj2 
where s.id > 300 and s.id <= 600;

insert into Enroll (student, subject)
select s.id, sbj3.id
from Student s, (select id from Subject where id not in (select subject from Enroll) order by rand() limit 4) sbj3
where s.id > 600 and s.id <= 1001;

select en.*, stu.name as 'student name', sub.name as 'subject name' 
from Enroll as en inner join Student as stu on en.student = stu.id
				  inner join Subject as sub on en.subject = sub.id order by id;
