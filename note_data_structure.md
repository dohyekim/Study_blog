김도혜(Dohye Kim) [10:16 AM]
map: table이 생긴다고 생각하면 됨(dict, json도 map)

map --> key value를 칼럼으로 하는 테이블
key에는 보통 str, value에는 object(class의 instance까지도 들어올 수 있음)
MELON의 경우에는 value에 또 다른 map이 들어온 것

sorted는 전역함수 (앞에 아무것도 안 붙으니까)
sorted의 결과는 []안의 튜플(key와 value를 담은)
따라서 sorted에서는 결과 값을 바꿀 수 없음
바꾸고 싶으면 dict에서 자꿔야 함
key들은 set (edited) 
★ ★ ★ ★ ★
메모리에는 dict의 key와 key의 주소만 메모리에 올라가 있음 @index page
value값에 접근할 때는 key의 주소를 타고 건너 건너 value로 감( 자료구조에서 --> linked list라고 부름)
Hashmap -- nonblock(readonly ) --> block할 필요 없음 --> tuple과 관련
Hashtable -- block (sql의 transaction과 비슷, 얘를 update하는 동안은 다른 게 중지)

김도혜(Dohye Kim) [10:46 AM]
가장 바깥의 dictionary의 value는 보통 []로 싼다.(표준)

--> []는 json array --> 여기에다가 새로운 게 나오면 append할 수 있으니까 (ex. 새로운 회사가 추가됨)
--> [] 안의 {}는 json object (edited) 

김도혜(Dohye Kim) [10:52 AM]
xml.parser과 html.parser는 cpu작업이 많이 필요하니까 json이 좋다

xml --> json화하는 module들이 많으니 참고

김도혜(Dohye Kim) [5:56 PM]
내가 접근하고자 하는 값을 key로 주면 훨씬 편함

Hashmap -- nonblock(readonly ) --> block할 필요 없음 --> tuple과 관련
Hashtable -- block (sql의 transaction과 비슷, 얘를 update하는 동안은 다른 게 중지)
synchronized --> block
asynchronized -->nonblock

★ sync
함수를 실행하는 ㅘ정이 e1, e2, e3이라면 ath가 어딘가까지 하다가 bth에 넘기면 bth도 할만큼 하다가 ath에 넘김. ath는 이전 ath를 이어서 실행(딱 나눠지는 게 아님)
하나의 프로세스를 여러 개의 thread로 나눴을 때 a th와 b th가 동시에 한 함수를 부른다면 --> Java,python : a가 실행되는동안 b는 block됨
만약 a th가 중간에 전역변수 값을 바꿨다고 하면 b th가 들어갔을 때 혼란(전역변수 값이 바뀌어있으니까) error. 심지어 어디서 error가 났는지 모름. 그러니까 blocking을 걸자(synchronized를 주는 것, Java는 줄 수 있음, python은 기본적으로 synchronized) a 가 하는 동안 나머지 th는 blocked --> 기다리고 있음

DB의 start transaction과 같음

hashmap은 dict의 값을 바꾸고 있을 때 바꾸고 있는 값이 아닌 다른 값들도 read조차 하지 못하게 함

★ async
javascript
--> 아무거나 실행되기 때문에 function() () 안에 인자로 function을 두는 것. 그러면 그 function은 function 안에서만 실행됨
hashtable은 dict의 값을 바꾸고 있을 때 read 가능 (edited) 

hastmap을 hashtableㅂ다 훨씬 자주 쓴다.(cpu 좋아서 hashmap으로도 별로 에러날 일 없음)
근데 db로 가는 동안에 connection에만 0.2초걸림 --> 나머지 th들은 waiting해야 됨 --> python, java가 느린 이유

javascript = > DB, FILE, NETWORK --> 서로 다른 process에 두도록 함, 그래서 db가 언제 끝날지 모름 --> callback함수 실행(이거 다음에 실행하도록 컴퓨터에 전달) 그래서 node.js가 빠르다.
