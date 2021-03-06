-- 성적 테이블(Grade), 컬럼(중간고사, 기말고사)을 만들고 각 수강 과목에 대해 중간고사, 기말고사 점수를 sample로 채우고
-- 다음과 같은 Report를 작성하시오.
-- 같은 쿼리를 2번 실행하면 쿼리를 두 번 작성하기
-- 수강내역: 500명 * 수강과목 수
-- 점수: 0~100점
-- Grade는 A,B,C,D,F
-- REPORT1 모양은 과목, 학생명, 중간고사, 기말고사, 총점, 평균, (과목별)학점, 석차(option) 순으로. [정렬] 과목별 성적순으로
-- REPORT2 모양은 과목, 평균, 최고 득점자, 총 학생수 [정렬] 과목 (가나다 순)
-- REPORT3 모양은 학생명, 학교명, 과목수, 총점, 평균, 평점
START TRANSACTION;

CREATE TABLE `Grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enroll` int(11) NOT NULL,
  `midterm` int(11) NOT NULL DEFAULT '0',
  `final` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Grade_ibfk_1` (`enroll`),
  CONSTRAINT `Grade_ibfk_1` FOREIGN KEY (`enroll`) REFERENCES `Enroll` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4096 DEFAULT CHARSET=utf8;

-- insert into Grade(sub_stu) 

select * from Enroll;
select * from Grade;
insert into Grade(enroll) select id from Enroll;
update Grade set midterm = ceil((0.5 + rand()/2) * 100) where id > 0;
update Grade set final = ceil((0.5 + rand()/2) * 100) where id > 0;

-- 검증 (수업 때 추가)
-- 1. count
select count(*), select count(*) from Enroll) from Grade;
-- 2. min/max
select min(midterm), min(final), max(midterm), max(final) from Grade;
commit;

-- Report 1
select sub.name as 과목명, 
s.name as 학생, 
gd.midterm 중간 , gd.final 기말 , 
(gd.midterm + gd.final) 총점, 
cast((gd.midterm + gd.final) / 2 as signed integer) 평균,
(case when cast((gd.midterm + gd.final) / 2 as signed integer)>= 90 then 'A'
	when cast((gd.midterm + gd.final ) / 2 as signed integer) >= 80 then 'B'
    when cast((gd.midterm + gd.final ) / 2 as signed integer) >= 70 then 'C'
    when cast((gd.midterm + gd.final ) / 2 as signed integer) >= 60 then 'D'
else 'F' end) 학점
from Enroll as en inner join Student s on en.student = s.id
                  inner join Subject sub on en.subject = sub.id
                  inner join Grade gd on gd.enroll = en.id
                  order by sub.name , 학점 asc;


-- Report 2 (과목, 평균, 최고 득점자, 총 학생수 [정렬] 과목 (가나다 순))

-- 최고 득점자 

create table Temp(
select (midterm + final) total,
	   sub.name subject,
       s.name student
from Enroll as en inner join Student s on en.student = s.id
                  inner join Subject sub on en.subject = sub.id
                  inner join Grade gd on gd.enroll = en.id);
          
select Temp.student, Temp.subject, Temp.total from
(select subject, max(total) max
from Temp group by subject) a
inner join Temp on a.subject = Temp.subject and a.max = Temp.total;

select * from Subject;
select subject from Temp group by subject;


-- 과목, 평균, 총 학생수
select max(sub.name) as 과목명, cast((sum(midterm) + sum(final)) / count(*) / 2 as signed integer ) as 평균,
count(*) as '총 학생수'
from Enroll as en inner join Student s on en.student = s.id
                  inner join Subject sub on en.subject = sub.id
                  inner join Grade gd on gd.enroll = en.id
group by sub.id;

-- 검증
select subject, count(*) from Enroll group by subject;


-- Report 3 (학생명, 학교명, 과목수, 총점, 평균, 평점)

select min(s.name) as 학생명, 
count(*) as 과목수, 
sum(midterm + final) as 총점, 
cast(sum(gd.midterm + gd.final) / (count(en.subject) * 2) as signed integer) as 평균,
(case when 
cast(sum(gd.midterm + gd.final) / (count(en.subject) * 2) as signed integer) >= 90 then 'A'
when
cast(sum(gd.midterm + gd.final) / (count(en.subject) * 2) as signed integer) >= 80 then 'B'
when
cast(sum(gd.midterm + gd.final) / (count(en.subject) * 2) as signed integer) >= 70 then 'C'
when
cast(sum(gd.midterm + gd.final) / (count(en.subject) * 2) as signed integer) >= 60 then 'D'
else 'F' end) as 학점
from Enroll en inner join Grade gd on gd.enroll = en.id
			   inner join Student s on en.student = s.id
			   inner join Subject sub on en.subject = sub.id
group by en.student
order by 학점, 학생명;


            
