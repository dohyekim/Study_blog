context == 영역

session context --> 접속한 사람의 영역
application context --> WAS(논리적 서버) 영역(EX. 네이버 안의 blog 서버, stock 서버, email 서버 ...)

서버에서 각자(홍길동)의 session id를, 브라우저는 cookie를, header에 달고 다닌다. 그리고 이 session id가 홍길동이 갈 때마다 공유되는 것(naver에 로그인 하면 블로그, 카페 다 이용 가능)

(web) container: application context를 여러 개 모아둔 그릇이라고 생각하면 됨


김도혜(Dohye Kim) [10:04 AM]
singleton: 메모리에 하나만 생길 수 있는 것. web application context는 singleton인 동시에 multi thread. 하나가 만들어졌지만 많은 사람이 동시에 쓸 수 있음. 그렇기 때문에 lock이 필요함. (서랍을 다른 사라밍 쓰는 동안 기다려줘야 하니까) --> getattr() 쓰는 것.

g.str = "123" ----> g의 str서랍장에 123 넣기
빼올 때는 getattr()함수 써야 한다. (이때 서랍장을 attribute라고 부름)

getattr(context의 이름, 서랍장의 이름, default값)
request : Flask가 하는 것
Response: request -->  route -->r model , model이 flask에 return해주는 것 (edited) 
주는 것
Response( string , ,header) ---> 간단 버전이 make_response()
flask+router --> controller, 파이썬이라면 Router라고 부름 (edited) 

김도혜(Dohye Kim) [10:17 AM]
@app.route('/') --> app에 router를 등록하는 것
def ... --> 이 부분이 model. router의 역할은 /가 왔을 때 이 model을 실행시키는 것
Flask가 returnn하는 html, xml, 등을 V라고 보면

MVR --> model과 뷰와 router
client site는 부와 모델이 완벽히 분리되기 어려울 때가 있음 ex.버튼(뷰)을 누르면 사라짐(model, 즉 기능) --> 이걸 나눠보자 한 게 MVVR

서버는 model을 분리할 수 있음. ex) def ():

김도혜(Dohye Kim) [10:46 AM]
헬스장 프론트데스크의 안내직원 --> Flask(요가스튜디오는 저기로 가세요)
헬스장 전체 --> Application context
락커룸 --> Session context
락커룸 하나 --> 내 session
모든 회원이 공유하는 프론트 --> g
getattr(g, '123, '456')
g가 instance화가 안 됐을 수도 있기 때문에 명시해주는 것
(ex. import request한다고 해서 바로 request 객체를 만드는 게 아니기 때문에)

김도혜(Dohye Kim) [10:55 AM]
RunLoop: 웹서버는 multithrread --> 홍길동의 요청이 오면 thread local 이 하나 생김. Router에서 model로 가면 별도의 thread를 만들 수도 있고 그냥 이 thread local을 사용할 수도 있음. g는 홍길동, 김길동의 각각의 thread local이 사용함. 중간에 어디로 새지 못하게 local thread 안에 method의 순서를 박아놓음. request를 받아서 response가 나갈 때까지(loop) 이 순서를 지켜서 어디로 못 새게 만들어놔야 함. 이걸 runloop라고 한다. js의 경우네는 이게 무조건 보장돼야 함. async이기 때문. 이걸 여러 함수를 모아둔 thread local 클래스라고 봐도 됨. 중간에 db, file write, g 등으로 빠져나가도 다시 돌아올 수 있게. 이는 thread를 safe하게 만들어준다. ex) app.route('/a') def (): s = 1할 때 s는 thread local 안의 변수니까 김길동이 건들리가 없음 --> safe.<br>
@app.route('/boards/<boardid>')
def test3(boardid):
    return "board id is %s" % boardid
boardid라는 변수에 boardid를 넣어줌<br>

--> board의 몇 번째 거를 보여주세요 라는 url을 만들 수 있음
