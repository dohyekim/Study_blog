column 명이 key가 되고 값이 value가 되는 json이 row에 들어감 (  row = document = objects ) <br>

table = collection (schema가 없음. 즉 column이나 type 등이 없는 table임) 왜냐하면 어차피 json이니까<br>

-------------------
replicate : 여기서는 분산이라는 뜻(sharding)

----------------
db.collection.update({key: value}, jsonData}<br>
<br>
{key:value}가 where인 셈, key:value인 곳을 jsonData하게 바꾼다<br>
32bit number : 4byte number ==> 작은 소수점, int<br>

(보통 소수점은 8byte이지만 작은 float은 32에 넣어준다는 뜻)<br>

----------------------
"_id": 내가 주는 거 아님. nonggo db가 주는 거<br>

------------------------------
 s="12345"<br>
stack 영역: 가까운 공간, s, &12 (거실에 밭 둘 순 없음)<br>
heap 영역: 먼 공간, "12345" 가변하기 쉬운 곳 (운동장에 밭 만들기)<br>
-----------------------------

capped: true,    # fixed size --> heap에 두지 않고 한 데 묶어두겠다 (heap은 따로 떨어져있음)<br>
max: 100000 --> 10만개까지 만들겠다 <br>
--------------------------------

{"name" : "aa"}<br>
<br>
autoIndex: true --> 이 테이블을 자주 읽을텐데 id로 찾기는 너무 어려우니까 name이라는 key로 찾아볼테니 index로 해줘<br>
mysql의 blob: binary type 이지만 이미지를 박지는 않는다 너무 크니까)<br>
BSON 이미지의 주소를 넣는다! 이미지 그대로 박으면 너무 큼. row의 max는 4MB<br>
bulk insert --> mysql의 executemany<br>
지금 bson의 사이즈가 얼만큼 있는지 알고 싶다면 -->Object.bsonsize("title: '', singer:'') ==> 하면 byte단위로 나옴. 45로 나오는데 그 이유는 id 등도 있기 때문, {}는 byte 수를 알기 쉽지 않다. 키 value 쌍이기 때문에<br>

-------------------------------
db.Song.drop() : 완전히 지우고 싶을 때 <br>
db.Song.remove({}) : 지워도 색인은 남음 <br>

---mongodb---
변수 선언할 때 findOne하는 것과 find하는 것에는 차이가 있다. find --> list로 나오기 대문에

like++ like를 하나 올려라
like-- like를 하나 빼라
meet = db.Song.findOne({title:'만남', singer:'노사연'})
이 경우 meet에도 id가 따로 있음

16번 슬라이드 참고
db.Song.update({title:'만남'}, meet)

title:'만남'인 것중에 하나만(김건모만) 줌. meet에는 노사연이 있기 때문에 둘이 다르다고 error가 남
pg18----------------------
> db.Song.update( {title:'노래1'},
                 {
                    $inc: { likecnt: 2 }
                 }
               )

--> 2가 커짐

김도혜(Dohye Kim) [6:10 PM]
p.19
> db.Song.update( {title:'노래1'},
                 { $unset: { "key": 여기다뭐라고써도상관없음} }  )

김도혜(Dohye Kim) [2:42 PM]
update는 여럭 ㅐ 중 하나만 update해준다. 전부다 upsert하고 싶으면 true, true해야 함
sort : 1 asc
-1 desc
query : {}인 곳을 가서 update/remve한다

update대신 remove 쓰면 지우기

.sort(_id:1)
.sort(_id:-1)

findAndModify는 하나만 바꿀수 있음(ex.가장 성적이 높은 사람 산출하기 등)

new:true --> update된 이후의 값을 find한다.
이게 없으면 변하기 전의 값을 return함

김도혜(Dohye Kim) [3:00 PM]
update문에서 세 번째 parameter로 true를 주면  upsert가 되는 것
