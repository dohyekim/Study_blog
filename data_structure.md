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
