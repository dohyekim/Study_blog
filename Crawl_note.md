★ 실제 알맹이는 <iframe 안에 있는 경우도 있다
---> iframe 안에서 copy link address 를 긁어와서 그걸 url 값으로 주면 된다

김도혜(Dohye Kim) [5:02 PM]
requests.get --> server에 보낼 때 사용하는 get(http)

김도혜(Dohye Kim) [9:43 AM]
os.path는 파일 경로를 생성 및 수정하고, 파일 정보를 쉽게 다룰 수 있게 해주는 모듈.
★ os.path.basename(path)

입력받은 경로의 기본 이름(base name)을 반환합니다. abspath() 함수와 반대되는 기능을 수행한다고 볼 수 있습니다.

>>>basename('C:\\Python30\\tmp')
'tmp'

>>> basename('C:\\Python30\\tmp\\test.txt')
'test.txt'
★ URL Parsing
The URL parsing functions focus on splitting a URL string into its components, or on combining URL components into a URL string.

urllib.parse.urlparse(urlstring, scheme='', allow_fragments=True)
Parse a URL into six components, returning a 6-tuple. This corresponds to the general structure of a


> URL: scheme://netloc/path;parameters?query#fragment
Each tuple item is a string, possibly empty. The components are not broken up in smaller parts 
(for example, the network location is a single string), and % escapes are not expanded. (edited) 

김도혜(Dohye Kim) [10:19 AM]
------------------git-------------------------
git rm --cached -rf crawl/images
git commit
git push

rm : 지운다
--cached: push를 이미 한 상태라면 cache에 남아있는 것까지 지운다.
-rf: recursively force to remove (edited) 

김도혜(Dohye Kim) [10:30 AM]
os.path는 https://는 인식하지 못한다

김도혜(Dohye Kim) [10:47 AM]
id는 바뀔 수 있기 때문에 무조건 id로 crawling하면 안 된다.

김도혜(Dohye Kim) [11:53 AM]
개발자 콘솔 안 열릴 때
최후의 방법 :
html을 프로그램으로 갖고 오는 방법

김도혜(Dohye Kim) [12:00 PM]
referer: url에 접근하고 있는 url ( 내가 지금 보고 있는 페이지의 url을 주는 것이 가장 정확) (edited) 

김도혜(Dohye Kim) [12:11 PM]
★ linux - ulimit: 한 번에 열 수 있는 파일의 갯수(파일 + 터미널 + 네트워크 포트 연결된 수)
따라서 파일도 하나의 네트워크

★ network의 7계층
물리계층 : 랜선
전송 계층: data를 어떻게 보내는지, 누가 보내는지 알 수 있음
세션~응용: software관련
L3 --> 물리 + 데이터 + 네트워크 계층
응용 계층: application
★ Router 안에 Layer server(L서버)가 있는데,
그 중 L3를 가장 많이 쓴다. 제일 싸다. 큰 회사라면 대부분 L4를 쓴다. L3는 누가 접속했다는 것만 알 수 있음.
L4는 어떤 데이터가 전송되는지까지 알 수 있음.

L3 - - > 심한 과부하 --> 막아줘 가능
L4 --> 같은 IP가 단위 시간당 요청이 N번 이상 오면 N분동안 막아줘 가능

김도혜(Dohye Kim) [12:20 PM]
Header에 들어가는 것들
user agent
referer
authorization
cookie
ip
utf-8
.
.
.

★ referer (나를 부른 이전 주소) :
a.html --> b.html로 이동할 때 referer는 a
b.html --> 그 안의 img/js/css를 부를 때의 referer는 b

김도혜(Dohye Kim) [12:50 PM]
--------------데이터수집 slide 25 참고-------------------
next: p의 next는 text(첫번째 p) 의 next는 <b>STRONG</b> 의 next는 text(strong)의 next는 text(ㅎㅎㅎ)

next_sibling: <p>, <div> (형제)

p1.next_sibling은 바로 p2가 아님
왜냐하면 빈 공간이 있기 때문에
따라서 p1.next_sibling.next라고 해야 p2가 나온다

빈 공간은 html에서만 허용
xml의 경우에는 p1.next_sibling하면 p2 바로 나온다

"첫번째 p" --> text라는 tag로 인식 (@  xml에서) (edited) 

김도혜(Dohye Kim) [12:57 PM]
★ soup --> /부터 찾는 셈(맨 처음)
★ body.select_one('div.container)은 body에서 시작하는 거 ( 이 때 body = soup.html.body 에서 선언한 변수 의미)
★ .select --> []
.select_one --> list타입 X, .FIND와 같은 타입
★ .find --> list타입이 아님
.find에서 attribute를 줄 경우에는 class_="" 라고 _를 붙여야 한다.
.find에서는 id를 줄 수 있다.
★ soup.select.attrs['class'] 가능 (edited) 

김도혜(Dohye Kim) [1:04 PM]
==============css selector================
a, b --> a태그와 b태그 다
a b --> a 다음에 나오는 b
a > b --> 1촌(부모-자식)
a + b --> a에 인접한 b

element[attr~=val] 이 val이 attr 안에 꼭 있어야 하는 것 (!= attr=val과는 다름)
-------------------------------------------------------------
★ 주의
element[attr=val]인 경우에는 val 외에 아무 것도 없어야 함
ex) class="aa b"인 경우 class="aa" 하면 안 나옴
이 때 ~= 쓴다.
-------------------------------------------------------------
element[attr*=val] 이 val이 포함된 모든 것

element[attr^=val] 이 val로 시작하는 것

element[attr$=val] 이 val로 끝나는 것

★ 정규식 참고 (edited) 

김도혜(Dohye Kim) [4:23 PM]
팩토리 패턴 --> html.parser (edited) 

김도혜(Dohye Kim) [4:29 PM]
같은 화면이지만 다른 서버에서 가져오는 창 있으면 iframe 찾아보기
원하는 곳을 검사로 확인한 후에 위로 더 올려보는 습관 --> iframe 있을 수도 (edited) 

김도혜(Dohye Kim) [9:37 AM]
th가 없으면 td로

김도혜(Dohye Kim) [10:03 AM]
서버에서 '세종대왕' 을 utf-8로 보내줬다면

.text ==> beautifulsoup이 decode해줘서 string으로 만들어서 나오는 것
.content ==> string으로 만들거나 그런 과정 없이 그대로 보내줌 -->  얘로 한글 읽으면 깨져서 나옴 (edited) 

김도혜(Dohye Kim) [10:10 AM]
1. div를 찾는다 (class 등)
2. select('div.class이름)
div를 (tag이름을 알 수 있으면) 얘도 같이 거는 게 좋다.
3. a.select('tr')을 찾아서 찾으려는 text가 있으면 return하도록 if, for문 돌린다.
previous_sibling ==> 형제 중 위에 있는 형ㅇㅇ제

김도혜(Dohye Kim) [10:51 AM]
res.raise_for_status()
:
error가 났을 때 뒷부분은 실행하지 말고 오류가 났다는 걸 알려달라는 함수

우리는 브라우저가 아니니까 서버에서 주는 cookie를 담을 곳이 없음 --> session 객체에 담는다.

res2 = session.get(...)

session에 cookie가 담겨 있으니까 session을 사용한 것
단순히 생각하면 네트워크 콘솔에 나오는 그대로 우리가 하면 되는 것

김도혜(Dohye Kim) [11:10 AM]
login post가 가는 url을 가지고 와야 함
request headers의 referer도 가지고 와야 함
                                user-agent도 가지고 옴


★ token : html을 내려주면서 token을 주는데 hashing된 값(난수)로 준다.
html 안 어딘가에 token이 심어져있음 -> 얘를 가지고 js로 조작해서 action에 해당되는 값을 지정. 
만약 지정값이 다르면 정상요청으로 인식 X --> JWT(JAVASCRIPT WEB TOKEN) 헤더에 token을 심음. 
token은 글을 게시할 때마다 (요청할 때마다) 다르기 때문에 도배 글을 막을 수 있다.

김도혜(Dohye Kim) [12:43 PM]
driver.find_element_by_name("q")
-- tag의 attribute가 name값인 것

send_keys('a aa')
-- 키보드로 a aa써

Keys.RETURN
-- enter키 누르기

time.sleep()은 넉넉하게 주는 게 좋다(사이트가 열릴 때까지 기다려야하니까)

김도혜(Dohye Kim) [1:10 PM]
partial == like
★   ActionChains(driver).key_down(Keys.CONTROL).send_keys('c').key_up(Keys.CONTROL).perform()

chain을 실행하는 것은 perform()

timesleep 아예 멈춤
implicitly_wait 사람이 기다리는 것처럼 기다림(로딩은 계속 돌아가고 있음) ★ 얘가 성능에는 더 좋다 (edited) 

김도혜(Dohye Kim) [3:50 PM]
json.loads(str, encoding...)
json.load(file-->open)

dumps -> string으로 덤프 준다는 의미
network -> docs/xhr(ajax) -> response에서 내게 data를 준 html을 찾기 --> 
걔의 header 보고 가져와야될 거 가져오기, target page 등 찾아오기 --> view source 긁어서 params만들고 url 가져오기 (edited) 
