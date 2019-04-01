context == 영역

session context --> 접속한 사람의 영역<br>
application context --> WAS(논리적 서버) 영역(EX. 네이버 안의 blog 서버, stock 서버, email 서버 ...)<br>

서버에서 각자(홍길동)의 session id를, 브라우저는 cookie를, header에 달고 다닌다. 그리고 이 session id가 홍길동이 갈 때마다 공유되는 것(naver에 로그인 하면 블로그, 카페 다 이용 가능)<br>

(web) container: application context를 여러 개 모아둔 그릇이라고 생각하면 됨<br>


김도혜(Dohye Kim) [10:04 AM]
singleton: 메모리에 하나만 생길 수 있는 것. web application context는 singleton인 동시에 multi thread. 하나가 만들어졌지만 많은 사람이 동시에 쓸 수 있음. 그렇기 때문에 lock이 필요함. (서랍을 다른 사라밍 쓰는 동안 기다려줘야 하니까) --> getattr() 쓰는 것.<br>

g.str = "123" ----> g의 str서랍장에 123 넣기<br>
빼올 때는 getattr()함수 써야 한다. (이때 서랍장을 attribute라고 부름)<br>

getattr(context의 이름, 서랍장의 이름, default값)<br>
request : Flask가 하는 것<br>
Response: request -->  route -->r model , model이 flask에 return해주는 것 <br>

Response( string , ,header) ---> 간단 버전이 make_response()<br>
flask+router --> controller, 파이썬이라면 Router라고 부름<br>
<br>

김도혜(Dohye Kim) [10:17 AM]
@app.route('/') --> app에 router를 등록하는 것<br>
def ... --> 이 부분이 model. router의 역할은 /가 왔을 때 이 model을 실행시키는 것<br>
<br>
Flask가 returnn하는 html, xml, 등을 V라고 보면<br>
MVR --> model과 뷰와 router<br>
client site는 부와 모델이 완벽히 분리되기 어려울 때가 있음 <br>
ex.버튼(뷰)을 누르면 사라짐(model, 즉 기능) --> 이걸 나눠보자 한 게 MVVR<br>

서버는 model을 분리할 수 있음. ex) def ():<br>

김도혜(Dohye Kim) [10:46 AM]
헬스장 프론트데스크의 안내직원 --> Flask(요가스튜디오는 저기로 가세요)<br>
헬스장 전체 --> Application context<br>
락커룸 --> Session context<br>
락커룸 하나 --> 내 session<br>
모든 회원이 공유하는 프론트 --> g<br>
getattr(g, '123, '456')<br>
g가 instance화가 안 됐을 수도 있기 때문에 명시해주는 것<br>
(ex. import request한다고 해서 바로 request 객체를 만드는 게 아니기 때문에)<br>

김도혜(Dohye Kim) [10:55 AM]
RunLoop: 웹서버는 multithrread --> 홍길동의 요청이 오면 thread local 이 하나 생김. Router에서 model로 가면 별도의 thread를 만들 수도 있고 그냥 이 thread local을 사용할 수도 있음. g는 홍길동, 김길동의 각각의 thread local이 사용함. 중간에 어디로 새지 못하게 local thread 안에 method의 순서를 박아놓음. request를 받아서 response가 나갈 때까지(loop) 이 순서를 지켜서 어디로 못 새게 만들어놔야 함. 이걸 runloop라고 한다. js의 경우네는 이게 무조건 보장돼야 함. async이기 때문. 이걸 여러 함수를 모아둔 thread local 클래스라고 봐도 됨. 중간에 db, file write, g 등으로 빠져나가도 다시 돌아올 수 있게. 이는 thread를 safe하게 만들어준다. ex) app.route('/a') def (): s = 1할 때 s는 thread local 안의 변수니까 김길동이 건들리가 없음 --> safe.<br>
@app.route('/boards/<boardid>')<br>
def test3(boardid):<br>
    return "board id is %s" % boardid<br>
boardid라는 변수에 boardid를 넣어줌<br>

--> board의 몇 번째 거를 보여주세요 라는 url을 만들 수 있음<br>

김도혜(Dohye Kim) [11:03 AM]
subdomain은 맨 앞에 들어오는 것

ex. blog.naver.com에서 subdomain은 blog

subdomain="g"라고 하면 g.local.com:5000

김도혜(Dohye Kim) [11:10 AM]
request.form --> request의 body부분 의미 (편지지의 body)
request.args --> param부분(편지봉투에서 naver.com/boards/30?q="python"에서 바뀌는 부분 q(boards(<bid>라고 한다면)도 param이긴 하지만 python에서는 자동생성되기 때문에 굳이 줄 필요 없음)
편지지에 써있는지(form) 편지봉투에 써있는지(agrs) 모를 때는 value
따라서 get으로 줄 수 있는 것은 param으로 uri에 박아버리자
request.values.get('date', date.today(), type=ymd('%Y-%m-%d'))

aaa.com/date=20180211
편지지와 봉투를 뒤져서 date라는 param을 찾는데, defaul는 오늘 날짜로 하고, type을 ymd()함수 형태로 주세요.)
★ request로 오는 건 다 string

김도혜(Dohye Kim) [11:24 AM]
p.12
date_str에는 'date' 값(ex. 20180709)이 들어감
fmt는 형식


def ymd(fmt):
   def trans(date_str):
       return datetime.strptime(date_str, fmt)
   return trans


이렇게 복잡한 ㅣ이유
web은 여러 사람이 동시에  사용 --> 김일수가 이 함수를 호출하면 만들어진 함수를 김백수까지 그대로 사용. 만일 아무도 안 쓰면 이 함수는 애초에 만들어지지 않음. 즉 함수를 재생성하지 않기 위해 이렇게 만든다.

@app.route('/dt')
def dt():
   datestr = request.values.get('date', date.today(), type=ymd('%Y-%m-%d'))
   return "우리나라 시간 형식: " + str(datestr)

date가 가진 값을 trans의 매개변수로 주는 것은 get함수가 구현하는 것 (edited) 

김도혜(Dohye Kim) [11:42 AM]
custom_res = Response("Custom Response", 200, {'test': 'ttt'})
-->Response의 객체를 만들고 내보낼 string, status code와 header까지 만들고
return make_response(custom_res)
--> 이걸 response로 보낸다 --> Flask가 할 일을 대신 해주는 셈

str : Simple String (HTML, JSON)
return make_response("custom response")
이렇게만 보내도 되긴 함. Flask가 알아서 instance를 만들어줌

김도혜(Dohye Kim) [12:00 PM]
return ('REQUEST_METHOD: %(REQUEST_METHOD) s <br>'
       'SCRIPT_NAME: %(SCRIPT_NAME) s <br>'
       'PATH_INFO: %(PATH_INFO) s <br>'
       'QUERY_STRING: %(QUERY_STRING) s <br>'
       'SERVER_NAME: %(SERVER_NAME) s <br>'
       'SERVER_PORT: %(SERVER_PORT) s <br>'
       'SERVER_PROTOCOL: %(SERVER_PROTOCOL) s <br>'
       'wsgi.version: %(wsgi.version) s <br>'
       'wsgi.url_scheme: %(wsgi.url_scheme) s <br>'
       'wsgi.input: %(wsgi.input) s <br>'
       'wsgi.errors: %(wsgi.errors) s <br>'
       'wsgi.multithread: %(wsgi.multithread) s <br>'
       'wsgi.multiprocess: %(wsgi.multiprocess) s <br>'
       'wsgi.run_once: %(wsgi.run_once) s') % request.environ


request.environ은 dictinoary

%(REQUEST_METHOD)는 request.environ['REQUEST_METHOD']를 %자리에 박는다

김도혜(Dohye Kim) [12:08 PM]
request.is_xhr

True면 json을 내려보내고
false이면 html을 내려보내는 등의 처리를 할 수 ㅣㅇㅆ음
app.config.update(MAX_CONTENT_LENGTH=5*1024*1024)

5메가 이상 못 올리게 하고 싶을 때 쓸 수 있음 (edited) 

김도혜(Dohye Kim) [12:20 PM]
모든 웹서버는
wsgi.multithread: True
wsgi.multiprocess: False

--> cpu를 한 장만 쓴다는 뜻
여러 장 쓰게 하고 싶으면 app.config에서 이걸 True로 하면 됨
wsgi.run_once: False

같은 session에서 같은 요청이 여러번 나온다면 한 번만 실행해주세요. ex. 더블ㄹ클릭 --> 두 번 하지 말고 한 번만

김도혜(Dohye Kim) [12:54 PM]
max_age : 이 시간이 지나면 쿠키 삭제 ex. 오늘 하루 보지 않기 --> 안 본다는 정보 24시간 동안 max_age로
쿠키는 항상 domain 밑의 path에 따라 다름
path = '/'인 경우에는 쿠키를 모든 사이트(블로그든 카페든)에 적용한다는 뜻

김도혜(Dohye Kim) [2:31 PM]
res = Response(///)했다면 return을 해줘야 함

cookie는 브라우저에 담고
session의 key는 서버에 담는다.
로그인되어있는 상태인지는 사용자도 알아야 하지만 서버도 알아야 하기 때문 (edited) 

김도혜(Dohye Kim) [3:43 PM]
cookie는 누구나 접근할 수 있음, 심징어 조작ㄷ 할 수있음(request header안에 넣으면 되니까) --> sessionid로 비교

김도혜(Dohye Kim) [3:49 PM]
로그아웃처리
@app.route('/delsess')
def delsess():
   if session.get('Token'):
       del session['Token']
   return "Session이 삭제되었습니다!"

김도혜(Dohye Kim) [4:32 PM]
session context(락커룸)에서
세션1 - {token:'123X'}
세션2 - {a : b}

김도혜(Dohye Kim) [9:59 AM]
AP: 네트워크 중간다리 (ex. 공유기)

김도혜(Dohye Kim) [10:07 AM]
https://jeong-pro.tistory.com/80
기본기를 쌓는 정아마추어 코딩블로그
Web - 쿠키와 세션의 차이, 용도, 사용법(cookie,session)
웹에서 쿠키와 세션 (Cookie & Session) 쿠키와 세션을 사용하는 이유 HTTP 프로토콜의 특징이자 약점을 보완하기 위해서 사용한다. HTTP 프로토콜의 특징 1) 비연결지향(Connectionless) HTTP는 먼저 클라이언트..
Oct 21st, 2017

김도혜(Dohye Kim) [10:23 AM]
{% for title, name in lst %}
   <li>{{title}}: {{name}}</li>
{% endfor %}

김도혜(Dohye Kim) [11:49 AM]
layout - head와 body 사이에 macro 두기

김도혜(Dohye Kim) [12:06 PM]
layout에 있는 html들은 브라우저에 cache됨. 즉 재사용됨

김도혜(Dohye Kim) [12:45 PM]
macro를 import하고 있는 html(caller)에서 macro를 부를 때, route가 부르고 있는 변수를 caller에서도 쓸 수 있게 하려면 import 옆에 with context를 붙이면 된다.

김도혜(Dohye Kim) [2:46 PM]
div.container ==> 양쪽 여백이 생김

김도혜(Dohye Kim) [5:18 PM]
checkbox,
modal 을 macro로 만들기 (edited) 

김도혜(Dohye Kim) [5:25 PM]
dict(id='xxx', name='sss', checked='checked') --> 이렇게 하면 바ㅗㄹ dictionary가 만들어지고 py.htm에서는 순서 관계 없이 dictionary이름.id를 하면 macro에서 순서지킬 필요 없음

김도혜(Dohye Kim) [12:28 PM]
{% include ["a.html", "b.html"] %}
a, b 둘 다 있으면 a
a 없으면 b

김도혜(Dohye Kim) [12:51 PM]
{% include "inc/navbars.html" %}

항상 'inc/' 붙여줘야함
if isinstance(dt, date):
       return dt.strftime(fmt)

dt가 date 형태이면
dt를 fmt형태로 전환한다
strptime str(string)을 parsing해서 time으로 바꾼다
strftime str(string)을 formatting해서 time으로 바꾼다

| safe

html 태그를 인식하게 하고 싶을 때 (edited) 

김도혜(Dohye Kim) [4:57 PM]
읽기 좋은 코드가 좋은 코드다 (책임)

김도혜(Dohye Kim) [3:36 PM]
create_engine에서  engine은 database를 의미
session은 한 database에 한 번 연결될 때마다 생기는 것
scoped_session :: application context에 적용되는 session 즉 ㅁ메모리에 중복해서 올리지 않는다
exc :: exception
base :: database

김도혜(Dohye Kim) [3:43 PM]
db_session
WAS에서
db에서 session은 연결을 의미
db와 서버를 연결하기 위한 object라고 생각하면 됨
def init_database():
   Base.metadata.create_all(bind=engine)

bind=engine, 이 engine을 기준으로 생성ㅇ한다
@app.before_first_request
def beforeFirst():
   init_database()

database는 한 번만 생성함녀 됨. 이 때 session도 만들어지고 base도 만들어지니까
dbsession을 이용해서 session을 여는데, 다 끝나면 이걸 꺼야 함 --> @app.teardown_appcontext
def teardown(exception):
   db_session.remove()

--> 불필요한 session이 다 사라지게 함 (edited) 
@app.teardown_request
request 종료

@app.teardown_appcontext

--? request뿐 아니라 response객체까ㅣ 종료하는 ㅓㄳ
mysql > show processslist;

김도혜(Dohye Kim) [4:37 PM]
ORM

김도혜(Dohye Kim) [10:01 AM]
sqlalchemy는 쿼리문을 만드는 역할 to pymysql 실제 일을 하는 건 pymysql
즉 sqlalchemy는 interface일뿐

김도혜(Dohye Kim) [10:07 AM]
gcp가 만들어준 건 docker container와 비스샇ㄴ 개념, 이 container를 VM이라고 하기도 한닫

김도혜(Dohye Kim) [10:12 AM]
db와 하는 일 중에 가장 부담이 가는 일은 connection을 맺는 일 --> connection을 끊지 말고 그냥 재사용하자 --> 놀고 있는 conn에 새로 연결해줌 --> 사용자가 많아지면 새롱 ㄴconn 만든다 --> 처음에 conn맺는 사용자만 조금 오래 걸릴 뿐 --> session이 만료되기 전에 연결되면 session도  꺼질 일 없음
db 하나가 줄 수 있는 session의 수 : 256 즉 256개의 서버가 하나의 db에 연결될 수 있음

김도혜(Dohye Kim) [10:50 AM]
s2 = s2._replace(likecnt=201)

s2를 읽어와서 likecnt를 201로 바꿔서 새로 생성하는데 그 이름을 똑같이 s2로 해서 덮어쓰는 것 --> 많이 쓰면 메모리 낭비, 걍 dict쓰지

d1 = s1._asdict()
dictionary랑 같은데 순서를 맞춰서 줌

김도혜(Dohye Kim) [1:00 PM]
js의 ; == python의 \

김도혜(Dohye Kim) [11:52 AM]
first() --> None
one() --> Error

김도혜(Dohye Kim) [5:10 PM]
jsonify가 가능한 건 [] + .....(기억안남)

김도혜(Dohye Kim) [5:18 PM]
truncate filter: 10개 이상이 되면 ...으로 표시하는 등의 작업을 할 수 있음

client에서 server로 json/array를 보내고 싶을 때:
request.forms/args/values.get() 도 되지만
json형태 그대로 받고 싶을 때 (키:쌍일 수도 있지만 키:[쌍]일 수도 있기 때문에)
request.json()을 사용하면 된다

반대로 server에서 clien로 json을 내보낼 때는
jsonify()쓰면 
