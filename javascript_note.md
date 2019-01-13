김도혜(Dohye Kim) [3:36 PM]
JS Version ES6
document: 보이는 html
window: tab까지 포함
on: event
onclick= click ebent가 발생했을 때
id로 element를 가져오겠다.
inner html: content자리
window.location = 지금 있는 페이지의 url (edited) 
document.write = print()

김도혜(Dohye Kim) [3:59 PM]
id가 없으면 name이 우선
#id, name
innterHTML을 찾아서 ~~~로 set한다. (없으면 바로 ~~~로 set)
값이 변하면 print, onclick 등의 event를 만나면 함수를 실행해야 함
id는 유일값 (memory에 등록)
name은 중복가능 (별도의 memory에 등록->주소값만 가지고있음)

김도혜(Dohye Kim) [4:23 PM]
variable - closer: 제일 가까운 값을 변수 값으로 재활용한다. 실수로 같은 이름의 변수를 설정해도 봐준다.
em6에서는 var대신 let을 써서 중복 허용 X

김도혜(Dohye Kim) [6:11 PM]
==    equal to
===    equal value and equal type
!=    not equal
!==    not equal value or not equal type

김도혜(Dohye Kim) [9:55 AM]
Javascript
undefineed: 메모리의 위치(시작점)만 있고 메모리 자체는 확보 X, nullpointer도 없음
NULL: 메모리 확보해서 비워놓은 것, nullpointer만 존재 (edited) 
type을 선언했을 때
기본적으로 string은 &로, 8K 확보
기본적으로 NUMBER는 4byte(소수점 시 추가)를 확보해둔다,

nullpointer: null point를 만날 때까지가 메모리. 'abc'는 3byte지만 null pointer까지 4byte를 잡고 있음. SQL에서 varchar(32) 대신 varchar(31)을 잡는 이유. (지금은 굳이 그렇게 안 해도 됨)
프로그램 연산시 가장 부담스러운 작업은 메모리 확보 (edited) 
typeof undefined           // undefined
typeof null                // object

(1)null === undefined         // false
(1) type이 달라서 ㄹfalse
(2) null == undefined          // true
(2)는 False == False 이므로 //true (0, none, null 등은 모두 false) (edited) 
string, date, number, bolean, array 제외하면 js에서는 모두 object (edited) 
!!null --> 확실한 false
곱하기 연산자는 string, number간 연산 가능
더하기 연산자는 string+number -> 가나다123
object = class
ES5에서는 class를 쓰기 위해서 Json을 씀
var car = {type:"Fiat", model:"500", color:"white"};

type, model, color가 car라는 class의 멤버변수가 되는 것
class가 메모리에 올라가는 순간 class=instant, this/self = instance
그 밖에서 부르는 this는 그 document를 의미
★ HTML Events
HTML events
onchange: input box같은 곳에서 값을 입력했을 때
onkeydown: 키보드를 눌렀을 때
onload: 돔트리가 다 구성됐을 때, 메모리에 다 올라왔을 때

김도혜(Dohye Kim) [10:58 AM]
event listener: flag=False --> True가 될 때까지 loop돌고 있는 상태
CSS의 hover
js의 onmouseover

function은 같지만 실행하는 게 다름. hover를 쓰면 js구문을 쓸 수 없다.
js의 function은 class, 따라서 function 안에 this를 가질 수 있다.  pythohn과 다름 (edited) 

김도혜(Dohye Kim) [11:13 AM]
js와  css는 cache에 쌓이기 때문에 바뀌지 않는 이상 계속 내려오지 않지만 html은 cache가 아니라서 계속 내려온다 --> html 용량을 줄이기 위해서 js, css파일을 따로 빼두는

options: 바뀌었어? 라고 물어봄
--> 200: 바뀜
--> 304: 안바뀜

김도혜(Dohye Kim) [1:10 PM]
form은 무조건 refresh함
form action (버튼을 눌렀을 때 url로 보내고 싶은 경우)
form onsubmit (버튼을 눌렀을 때 function을 부르고 싶은 경우--> 이 때 function에 return false를 넣어줘야 하)

김도혜(Dohye Kim) [4:33 PM]
object type을 비교할 때는 그 object의 주소값을 비교한다

김도혜(Dohye Kim) [10:02 AM]
================jQuery=============
$( document ).ready(function() {...;} 를 먼저 실행

김도혜(Dohye Kim) [10:07 AM]
$(document.getElementbyId('err') == $('#err)
$가 붙는 순간 wrapping된 jQuery 객체
err.css('font-weight', '500')

김도혜(Dohye Kim) [10:53 AM]
CRUD = Create, Read, Update, Delete

김도혜(Dohye Kim) [11:01 AM]
(SI) Django -> Vue.js -> Ember.js
(서버) Django -> Node.js -> Vue.js

김도혜(Dohye Kim) [11:18 AM]
비동기I/O (Input/Output)  (즉 post/get(?))
이 경우
하나가 실행되는 동안 다른 애는 그냥 실행(앞에 애가 실행 성공하든 말든) --> 다른 말로 asynchronized라고 한다

<-> 동기: synchronized
.then 함수 --> 앞의 명령 실행하고 나면 --> 보통 function에 모아둔다.
.then (a, b) -> 성공하면 a 실행, 실패하면 b 실행, 근데 이 자리(a,b)에 function이 들어가는 것
$가 붙으면 jQuery 객체 (즉, instance) memory에 살아있는 객체(=instance)

$. --> static method
. xxx ==> 끝났을 때(.) xxx해라
JSON.stringify-->json객체를 string화 한다.

김도혜(Dohye Kim) [11:36 AM]
$("<h1>") --> h1을 차즌 ㄴ게 아니라 만드는 것 (<>)
.tex(text자리에 json.arearoup.length를 넣고)
.appendTo("body") body 태그  아래 중 맨 아래에다가 더해라

.html text가 아니라 tag자체를 넣고 싶은 경우

김도혜(Dohye Kim) [11:48 AM]
러닝 자바스크립트

김도혜(Dohye Kim) [12:17 PM]
.done => 성공했을 때
.fail -> 실패했을 때
.always -> 성공하든 실패했든 수행하는 부분

김도혜(Dohye Kim) [1:09 PM]
ajax:
- type 자리에다가는 method를 쓰면 됨
- data: client가 server에게 보내는 모든 data
- 서버와 통신할 때 ajax 씀

xhr:
- XMLHttpRequest (XHR) 은 AJAX 요청을 생성하는 JavaScript API 입니다. 이것의 메소드는 browser와 server간의 네트워크 요청을 전송하도록 해줍니다.
여러 번 찾는 경우는 var 변수로 빼놓고 사용하는 게 좋다 (왜냐하면 보통의 html은 무거우니까, 엄청 많은 태그들 속에서 여러 번 찾으면 부담) (edited) 
- xhr은 모든 정보를 담고 있다.

김도혜(Dohye Kim) [4:34 PM]
href="#" #은 현재 페이지를 의미한다

$('#content').html(....);
== document.getElementbyId('content).innerHTML=...;

?는  url과 uri를 구분
&는 parameter를 구분

★ 한글이 url주소나 text값에 있을 경우 브라우저가 decoding
프로그램으로 download받으면 decoding해줄 browser가 없으므로 직접 decode('utf-8') 해줘야 한다. (edited) 

김도혜(Dohye Kim) [3:43 PM]
★ xml의 장점: 잘못된 태그가 들어가면 무조건 오류가 난다. 서버 개발 시 실수가 줄어든다.
★ CDATA(... <br> ... <br> ....) 이렇게 묶어줘야 한다. 그렇지 않으면 <br>을 depth가 있는 tag로 인식
