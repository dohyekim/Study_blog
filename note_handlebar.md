-----------------------Handlebars-----------------------------
{{#if author}}  --> author 값이 있으면
by fullname auther --> by + fullname이라는 함수를 실행하는데  fullname에 author를 하나씩 주겠습니다

김도혜(Dohye Kim) [9:34 AM]
compile --> compile할 때 source 안에 있는 {{}}를 만나면 걔를 찾아서 compile한다. 
id_title의 경우 함수의 주소를 미리 알아놓고 title의 경우 함수로 정의되지 않았기 때문에 json에서 찾는다. 
이때 {{}}를 handlebar라고 보면 된다, (edited) 

김도혜(Dohye Kim) [10:18 AM]
https://ovenapp.io/
Oven
OvenApp.io
Oven(오븐)은 HTML5 기반의 무료 웹/앱 프로토타이핑 툴입니다. (카카오 제공)

김도혜(Dohye Kim) [11:15 AM]
column기본 size : 12
md - 2 하면 뒤에서 md - 10이 되어야 함
(Bootstrap -> Grid 참고)

김도혜(Dohye Kim) [12:50 PM]
modal창 --> 제일 바깥쪽(footer 뒤에 ) 놓아야 함. div 안에 들어가면 안 됨. 단 버튼은 원래 있는 곳에 data toggle과 data target을 둔다.  
--> modal의 form을 바꾸기 위해서 form 찾기
