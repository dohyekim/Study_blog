1. Substring
- update Student set mobile = substr(mobile,5); <br>
mobile을 잘라내는데 5번째부터 잘라서 주세요.<br>
<br>
2. Where<br>
- ``` update Student set gender = 0 where not (phone like '010-5%' or phone like '010-2%' or phone like '010-6%' or phone like '010-4%' or phone like '010-8%') and id > 0; ```<br>
- where절에는 반드시 id가 있어야 한다.<br>
<br>
3. Index<br>
index는 모두 메모리에 올라간다고 알면 된다.<br>
<br>
4. 연습 문제<br>
   7) 서울에 거주하는 과목별 남녀 학생수 <br>
- group by 에서 sub.id와 stu.gender로 했기 때문에 select할 때도 sub.name보다는 sub.id를 해주는 게 좋다. <br>
- clustered index인(disk에 쓰인 물리적인 index인) 동시에 (primary key)니까 unique하기까지 함  <br>
-> 컴퓨터 입장에서 group/ordering할 때 이미 순서대로 정렬된(sorted) 거(즉 index)에서 뚝 잘라오면 엄청 편하니까<br>
반드시 clustered일 필요는 없음. index면 OK( 다만 clustered index가 갑일 뿐..)<br>
- 실제로 다른 db에서는 sub.name이 안 됨 --> 이름을 보고 싶다면 group함수를 쓰자 (min(sub.name) or max(sub.name) <br>
- order by sub.name asc하지 말고 order by min(sub.name)<br>
- alias는 '띄어쓰기 있으면' 생기긴 하지만 나중에 이걸 다시 못 씀.<br>
- group by sub.name이 아닌 sub.id인 이유는 group by나 order by는 index를 타는 게 좋기 때문이다. <br>
gender는 index가 없으니까 앞에 나온 애라도 index를 타게 하면 좋다.<br>
<br>
-----------Query -----------------<br>
` select min(sub.name) subject_name,
                 (case stu.gender
                  when 1 then '남자'
                         else '여자' end) as 'gender', count(*) as 'num of students'
from Enroll en inner join Student stu on en.student = stu.id
               inner join Subject sub on en.subject = sub.id
where stu.address = '서울'
group by sub.id, stu.gender
order by subject_name asc, stu.gender desc; `
<br>
5. Subquery<br>
- subquery는 row 한 개만 가져올 수 있다.<br>
<br>
6. alias<br>
- subquery는 반드시 alias가 필요하다<br>
- from에서 여러 개를 읽어도 alias만 지어주면 select에서 뽑는 데는 제약이 없다.<br>
- having은 alias 불가<br>
<br>
7.. Flag<br>
- Flag = boolean<br>
- lock 상태인지 unlock 상태인지(True와 False상태를 담고 있는 것, 0이냐 1이냐 = bit)을 Flag라고 부름.<br>
<br>
8. rank
- rank() 함수를 쓴 결과 (rank()는 thread 방식으로 별도로 움직임. 그래서 rank() over 뒤에 (order by __)를 다시 해 준다.<br>
<br>
그래서 앞에 select한 애들은 위의 order by에는 영향을 받지 않는다.<br>
<br>
9. cursor<br>
커서를 오픈하는 순간 메모리에 올라간다. 한 row씩만 움직이면 되기 때문에 가볍다.<br>
> 1.  conn_source<br>
> 2.  select all<br>
> 3.  담기<br>
> 4. close conn_source<br>
> 5. open conn_target<br>
> 6. executemany<br>
> 7. close conn_target<br>
> 8. 검증<br>
<br>
10. datatype<br>
DECIMAL(5,2) --> 소수점 두 자리까지 총 5자리<br>
<br>
11. group by<br>
group by 보다 distinct를 쓸 수 있으면 distinct가 더 좋음. 왜냐하면 group by는 자루에다 다 담아두기 때문에.<br>
<br>
12. Backup<br>
<br>
Backup의 종류<br>
1. hot backup (지금 하면서 백업) ★★★<br>
2. cold backup(멈추고 백업)<br>
3. physical backup(데이터 파일 백업)<br>
<br>
13. Statement<br>
- callable statement: procedure를 부르는 statement<br>
 --> procedure 안에 있는 쿼리문은 이미 SGA에 컴파일된 상태이니까 다시 컴파일 할 필요 없다는 의미<br>
- Statement는 두 개의 쿼리를 모두 준비해도 compile 가능 (ex. select, insert 한 번에, ';'로 연결하면 됨.)<br>
<br>
14. procedure <br>
- procedure 안에서는 transaction XX<br>
  단, summation 관련한 batch 형태의 procedure라면 transaction을 안에 건다. crontab에서는 transaction 걸 수가 없으니까<br>
<br>
15. 메모리<br>
- 디스크 조각 모음 --> indexing도 다시 함<br>
<br>
16. Oracle<br>
- 오라클의 프로세스<br>
Background Process (매트릭스 세계를 가동하는 프로세스)<br>
Server Process (session이 들어올 때마다 생기는 프로세스)<br>
<br>
- 오라클의 메모리 구조<br>
SGA = BP와 SP가 서로 공유하는 메모리<br>
PGA = 나만 알아도 되는 메모리 (ex. 변수, 임시 테이블), Session이 끝나면 지워짐.   --> 관리하기 편하다.<br>
<br>
- 오라클의 Instance<br>
RAC(Clusters) = instance가 두 개 이상인 것<br>
clustering = master(server)와 slave를 연결하는 것, 이 때 instance는 두 개<br>
<br>
- view, function, procedure  등은 전부 SGA에 올라간다.<br>
--> with read only 옵션을 걸면 부담이 줄어든다.<br>
<br>
17. pymysql
<br>
- executemany: 한번에 들고 가서 처리
- execute + fetchall(): (하나 execute하고 커서를 나와서 처리하고) X a
- write에서는 fetchall을 쓸 필요가 없음
- read에서 cursor로 가져올 때 fetchall 쓰기
   > ex. select (edited) 
- ?로 주면 id의 경우 number로 변환될 것
- %s로 주면 된다. (한 번에 처리하기 때문에)--> mysql로 string으로 전달되고 거기에서 compile될 때 변환
<br>
- %s --> mysql에서 각각에 맞는 type으로 변환한다. (대신 data length 안에 들어갈 수 있어야 함. <br>
> ex) smallint(5)자리에 bigint가 들어가면 error)<br>

- %d를 쓰고 싶으면 mysql에서 floor로 type을 변경해야 함.<br>

- cursor는 하나이기 때문에 두 개의 쿼리를 동시에 수행 X <br>
(커서가 select를 할 지 insert를 할 지 알 수 없음) --> execute(/many)를 여러번 <br>

- execute(sql, 하나의 값) --> 쿼리 하나, 값 하나<br>

- executemany(sql, 여러 값(ex. list)) --> 쿼리 하나, 값 여러 개가 한 번에<br>

- fetchall하면 tuple의 tuple <br>
- fetchone하면 tuple 하나로 <br>
- executemany는 결과값이 마지막 하나만 나오기 때문에 select에는 쓸 수 없음<br>
<br>
- ` update T set pct = %s where id = %s ` <br>
에서 pct %s가 null이라면 기존의 pct값으로 update하고 싶아고 했을 때 <br>
`pct = ifnull(%s, pct)` 라고 조건 주면 된다.<br>
- connection pool<br>
- connection은 하나더라도 cursor는 계속 닫아주는 게 좋다.<br>
- unique key는 create table할 때 같이 하면 중복 오류를 막을 수 있다.<br>

- Create문을 한 후 이관하는 프로그램에 alter구문을 다 넣기<br>

- table, cols에 list로 담아두고 loop 돌기<br>

- primary key는 그대로 두는 게 좋다 ( 중복 입력이 방지될 수 있으니까) <br>
- foreign key만 drop해도 테이블 drop할 수 있음. index는 지우지 않아도 <br>

- 더이상 fetch할 수 없을 때 done<br>
--> fetch구문 밑에 if _done then leave 써주는 게 좋다.<br>
그 이후에 select를 하든 뭘 하든..<br>

18. > insert ignore into ~~
update할 때는
>> on duplicate key update ~~

19. 여러 개의 처리를 할 경우 (pymysql)
Ex. insert insert update
try
- connection 열기
- transaction 걸기(autocommit = False)
- insert, insert, update 실행
- commit 하기
except
- 에러가 났을 경우 rollback
- raise error
finally
- cur.close
- conn.close
( 만일 A() 함수가 b()를 호출하는 경우 b()에서 error가 나면 이미 exception 처리를 했기 때문에 A()는 에러가 났는지 모르고 계속 프로그램이 돌아가게 됨 (exception에서 runtime error를 이미 잡았기 때문에 프로그램이 멈추지 않고 돌아감) 그래서 A한테 b()에서 에러가 났으니까 계속 진행 ( 위 경우 commit )하지 말고 멈추라는 (이 경우 rollback)신호를 보내기 위해 하는 것이 raise)

중요한 것은 insert/update 함수 안에서 한 번에 commit하거나 rollback
