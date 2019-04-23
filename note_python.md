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

김도혜(Dohye Kim) [5:50 PM]
map은 list의 하나하나를 lambda에 들어갈 수 있게 해줌

call by value
instance의 경우에는 call by reference
a = A('11'), b = A('22'), c=b라고 했을 때
a의 주소값은 &1, b의 주소값은 &2, c의 주소값은 &2.
이 때 c.name="홍"이라고 바꾸면
b.name="김"이었어도 b.name="홍"으로 바뀐다. 새로운 메모리가 생기지 않음.

JSON도 js안에서는 모든 오브젝트가 클래스이기 때문에 Call by Reference.
json1 = json2라고 하면 같은 메모리 주소를 바라본다.

call by value라고 하면 a = 1, b = a라고 했을 때 a의 주소값은 &7, b의 주소값은 &8
그러나 b=3이라고 다시 선언하면 새로운  &9의 주소값이 다시 생긴다(메모리에 새로운 게 생겨남)
