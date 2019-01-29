print("\a") --> beep 소리

김도혜(Dohye Kim) [12:19 PM]
python

if xxx in yyy: 할 때 xxx와 yyy의 타입이 같아야 함(다르면 False나옴)
type([ x[2] for x in xs]) == list
yyy == list
%(genre)% 라고 하면 [genre]라는 key를 pymysql이 찾기 때문에 주어진 data에서 genre라는 key가 없으면 error 남. (edited) 

김도혜(Dohye Kim) [12:43 PM]
2번째 돌릴 때 프로그램이 잘못되면 1번째 data가 오염될 수 있기 대문에 1. create table like ~:라고 backup 테이블을 만들어두거나 2. 백업하거나 3. 처음부터 다시 돌린다.

김도혜(Dohye Kim) [2:35 PM]
if i > 10: continue --> 데이터가 많을 때 쓸 수 있는 코드 (edited) 
db는 보통 여러 명이 쓰고 있기 때문에 db와의 접근을 적게 하는 게 좋기 때문에 insert ignore into보다는 python에서 이미 있는 자료인지를 파악/비교한 후에 on duplicate key update를 쓰는 게 좋다.
