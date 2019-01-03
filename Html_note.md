---------HTML---------
★ protocol : 약속
★ HTTP/1.1이 protocol, 반드시 써야 하는 부분
★ DHCP: 유동 IP
★ TCP: 순서가 있는 BUFFER
★ UDP: 순서 X (ex.단문)
★ POP: 우체통 같은 개념
★ SMTP: 메일 보낼 대 사용하는 규약
★ SNMP: 내 네트워크 상태, 스위치, 라우터의 위치를 알려주는 프로토콜, NETWORK 장비에 접근할 때 SNMP 사용
★ HEADER: accept + authorization

김도혜(Dohye Kim) [11:28 AM]
★ DNS : 실제로 접속은  ip로 하지만 , naver.com의 ip를 알고 쓸 수는 없기 때문에 DNS에 물어보는 과정을 거친다.
★ GET: 봉투만 있고 속편지(BODY)는 없다는 뜻
★ HTTP/1.1 번역기 @
★ HEAD: utf-8로 해석하세요. 따라서 편지는 없다.
★ post: 최초의 발송, 게시물 등록
★ put: 보낸 편지지에 첨언을 덧붙이는 거, 게시물 수정
★ options: 이미지가 cache된 파일과 같은지 아니면 수정됐는지 물어보는 것. 바뀌었으면 응답에 body가 있고, 바뀌지 않았으면 편지봉투에 not modified(304)로 나옴, 즉 편지지 없음(봉투만 보면 알 수 있으니까)
★ patch = put(거의 유사)
★ 받는 편지봉투에 있는 번호 = response code

김도혜(Dohye Kim) [12:08 PM]
★ ! : 선언의 의미
★ element : XML에서는 tag를 element라고 부른다.
★ attribute: tag/element 옆에 있는 내용

김도혜(Dohye Kim) [12:42 PM]
=============html===================
★ &nbsp; 공백 하나
★ &amp; : &
★ <!--  주석 열기
★ --> 주석 닫기

김도혜(Dohye Kim) [1:03 PM]
★ viewport: 화면
★ width=device-width :  화면 크기만큼

김도혜(Dohye Kim) [1:09 PM]
parsing: 문제 없는 구문은 memory에 올리고
compile - > (load: memory에 적재시키는 일) -> 도착하는 순서대로 execute

김도혜(Dohye Kim) [2:40 PM]
/ 절대경로, 최상위 폴더
#이 붙어있는 곳으로 내려가는 링크
id = ~로 시작하는 element를 찾고 거기에서 #으로 보낸다
dt dt dd 순

김도혜(Dohye Kim) [2:50 PM]
pre: 내가 쓴 글의 형식(space, breaking the line 등등)이 그대로 나온다.
header/footer 주는 이유: header/footer는 절대 바뀌지 않는 곳이라는 의미

김도혜(Dohye Kim) [4:38 PM]
SSE: 나는 가만히 있는데 server에서 계속 응답을 줌 ex. 자리가 채워지면 선택 창에서 사라짐 (refresh 하지 않아도)

김도혜(Dohye Kim) [4:48 PM]
★ 띄어쓰기도 많이 안 하는 게 좋다
★ SVG image의 크기를 줄이거나 키워도 안 깨진다. (왜냐하면 vector 기반이기 때문에)
