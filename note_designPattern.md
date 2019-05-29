< 개념 설명 >
MVC
  처음에 클라이언트는 서버에게 요청을 보낸다 (URL을 사용해서)
  그러면 서버의 라우터가 그 요청을 받아서 html, css, js(자원)을 내려보내준다.(다 그려낸 상태에서)
  즉 완전히 새로운 화면을 그려서 내려보내는 것.
  그래서 MVC를 서버 사이드 렌더링이라고도 부른다. (서버에서 할 일이 많음)
  렌더링 : css, js를 이용해 화면을 구성해서 내려보내주는 것인데 template engine을 사용해서 내려보내는 것까지 포함하는 개념

MVR
  Controller가 Router로 바뀐 것
  
- REST : 
  클라이언트와 서버가 JSON으로 data를 서로 주고받는 방식
  클라이언트가 서버의 라우터에 데이터를 요청하면 서버에서 DB에서 가져오거나 가공해서 내려보내준다.
  AJAX 함수를 통해서 데이터를 받으면 AJAX의 콜백 함수를 이용해서 화면을 다시 재구성 (hide() -> html() 등의 javascript를 통해서)
  데이터만 채워넣는 개념이다. 따라서 화면을 전부 다 새로 들고 오는 것과는 다른 개념
  그러면 화면단에서 하는 일이 많아지니까 이걸 쉽게 하기 위해서 프레임워크가 나온 것임
  ex. 핸들바의 경우 간단한 프레임워크, 그래서 얘를 클라이언트 사이드 렌더링이라고 함. 화면을 클라이언트사이드에서 제어

model의 개념: 서버가 DB에서 데이터를 가져오고 가공하는 것
EX. 테이블을 그린 class 내의 함수도 model이 될 수 있고 data를 select해서 내려보내는 것도 model이 될 수 있음.
서버가 db에서 데이터를 가져오고 가공하는 것이 MODEL의 개념인 셈
  
MVVM
  여기서부터는 클라이언트가 서버에 최초의 요청을 보내면 서버가 html, js, css를 내려보내준다. 하지만 이후의 요청부터는 데이터만 준다.
  클라이언트(사용자 PC)는 데이터가 필요한 경우 클라이언트 내에 있는 Router에다가 요청을 보낸다. Router는 경로를 설정해주는 역할을 한다. 그리고 ViewModel이란 게 있는데 ViewModel이란
  view가 가지고 있는 model이라고 볼 수 있다. 만일 새로운 데이터를 서버에 요청해야 할 경우 서버에 있는 router에 ViewModel이 요청을 보낸다. 서버의 router에서 받은 json은 model에 그려져있는 ember object에 쏙쏙 박혀서 화면에 그려진다. 
  요청을 보내면 서버의 router는 viewmodel에게 데이터를 내려보내주고 그 화면은 ember가 알아서 맞게 그려준다. 화면 전환이 거의 없고 부드러운 화면이 
  그려짐. view를 표현하기 위해 만들어진 model이라고 볼 수 있다.
  
  viewmodel
  view에 입력이 들어오면 viewmodel에 부탁을 하고, viewmodel은 필요한 data를 model에 요청, model이 data를 주면 viewmodel이 그 data를 가공함. 가공하고 저장이 끝난 순간 view가 알아서 새로운 데이터를 활용해서 화면을 바꿈. ( data binding ) -> 자동으로 갱신된다.
  
  이때 사용하는 프레임워크가 backbone, angular, ember, react, vue인 것.
  
  
  
Models hold application data. They’re usually structs or simple classes.
Views display visual elements and controls on the screen. They’re typically subclasses of UIView.
View models transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.
- source: https://www.raywenderlich.com/34-design-patterns-by-tutorials-mvvm
 
 
 SPA
  Single Page Application으로 최초에 서버한테서 받은 html, js, css로 그린 화면만 가지고 시작한다. 후에 화면을 바꿀 일이 있으면
  이 화면에서 제어해서 새로운 화면을 만들게 해준다.
  
  
 REST 
 
 Flask가 완전한 REST 방식이 아님. (REST + jinja)
 
 완전한 REST 로 하고 싶다는 생각에서 나온 게 ember, vue 등등
 기존에는 
 
 
 Node는 
 플랫폼, 웹 브라우저가 
 아니어도 javascript 개발이 가능하도록 만든 플랫폼
 
 
 Node Express.js --> 서버 프레임워크
 Node에서는 ember.js, vue.jsrk k
