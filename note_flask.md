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
