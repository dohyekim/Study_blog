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

$("<\h1>") --> h1을 찾는게 아니라 만드는 것 (<>)
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

----------------------------
<h3> javascript ES6 </h3>
const a = 1; 하면 a는 2나 3으로 절대 바뀔 수 없음
let은 var 대신 사용하면 됨
함수는 중복 X -->
const act = (name="kim") => {console.log(...)}
==
var act  = function{...}

console.log(`aesar ${aa} sfdlaet`)

김도혜(Dohye Kim) [10:38 AM]
javascript에서는 function과 json 이 class --> function 안에 this를 쓰면 함수 안의 변수를 쓸 수 있음
arrow function의 this는 arrow function 내의 this가 아니고 그 arrow function을 싸고 있는 것의 this. arrow function 내에서 this를 쓰고 싶으면 function(...) 써줘야 함
-----------------------------------------------------------------
let jdata = {
 id: 123,
 age: 45,
 name: `aaa`
};
let {id, age} = jdata;
console.log(`QQQ>> id=${id}, age=${age}`);

==
(js)
let id = jdata.id
let age = jdata.age

(python)
id = jdata['id']
age = jdata['age'] (edited) 

김도혜(Dohye Kim) [10:53 AM]
------------------------------
let nums1 = [1, 2, 3],
   nums2 = [7, 8, 9],
   arrnum = [...nums1, ...nums2],
   [first, ...rest] = arrnum,
   [last] = nums2.reverse();

nums2를 뒤집은 후 첫 번째 값을 last라는 변수에 담는다.

arrnum의 첫번째 값을 first에 넣고 나머지를(...) rest에 담는다. 이 때 ...를 넣으면 []형태로 나옴
[last, last2] = nums2.reverse();

하면 last = 9, last2 = 8
------------------------------
const fn1 = (...arguments) => {
    console.log(arguments);
}
----->
fn1("aaa", 23,44)
--->
(3) ["aaa", 23, 44] (edited) 

김도혜(Dohye Kim) [11:07 AM]
---------
pg 10

then은 Promist(내장) class의 객체로 쓰였을 때 쓸 수 있다.

김도혜(Dohye Kim) [11:23 AM]
-------------------------------
const getList = page => new Promise( (resolves, rejects) => {
   const req = new XMLHttpRequest();
   req.open('GET', "/replies/222/" + page);


   req.onload = () => {
       if (req.status === 200)
           resolves( JSON.parse(req.response) );
       else
           rejects(Error(req.statusText));
   };

   req.onerror = err => {
       console.error("ERROR:", err);
       rejects(err);
   };

   req.send();
});


getList(11).then( res => {
   console.log("Final Result>>", res);
}, err => {
console.error(err);
})




Error의 객체, onerror는 Error 객체 자동 생성됨 --> then 뒤의 값으로 가는 것
if문만 res에 전달됨

김도혜(Dohye Kim) [11:53 AM]
------------------------------------------------------------------------
class Ball extends Product {
 constructor(id, name) {
   super(id, name || `ball`);
 }

 print() {
   super.print();
   console.log(`This is Ball!!`);
 }
}
const p1 = new Product(1, `p1`),
     p2 = new Ball(2);
console.log(p1.print());
console.log(p2.print());

-->
Ball 이 Product의 자식 (edited) 
super.print()는 부모의 함수를 부르는 것
-------------------------------------------------------------------------
export해야 import할 수 있음
import ~ from ~
(python의 경우는 ㅏㅍ일 이름 자체가 export
from ~ import ~) (edited) 
--------------------------------------------------------------------
// product.js
export default Product;
import P from 'product';

(product.js 안에는 Product라는 class가 있을 것)
이때 P는 Product가 됨


// out.js
export const print = (msg) => log(msg);
export const log = (s) => console.log(s);
import { print, log } from './out.js';

default를 안 붙였을 때는 print, log가 export의 print, log와 반드시 일치해야 함, 이 경우 두 개 불렀으니까 {}로 싸준 것 (edited) 

김도혜(Dohye Kim) [9:55 AM]
<a href="#" onclick="2페이지가져오기()">2</a>


김도혜(Dohye Kim) [10:00 AM]
# 대신 javascript:void(); or javascript:; --> # 안 붙음
