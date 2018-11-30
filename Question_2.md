
Docker를 활용하여 MySQL 57을 설치하는 과정을 기술하시오.
-----------------------------------------------------
1. `$> docker search mysql`

&nbsp;&nbsp; oracle 설치와 마찬가지로 mysql과 mysql에 필요한 프로그램이 모두 포함된 image를 검색한다.
  
2. `$> docker pull mysql:5.7`

&nbsp;&nbsp; image를 다운받을 때 사용하는 docker pull 명령을 통해 mysql을 다운받는다. 이때 mysql만 쓰면(즉, 태그값을 지정하지 않으면) 자동으로 mysql의 최신 버전이 다운된다. 5.7버전을 사용하고 싶다면 뒤에 :5.7을 붙여서 다운받아야 한다.
  
3. `$> docker images`

&nbsp;&nbsp; 다운받은 image를 모두 보여주는 명령어이다. 명령의 실행 결과로 mysql 5.7이 있으면 제대로 다운받은 것이다.
  
4. `$> docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=<비밀번호> --name <container 이름> <image 이름>`
  
&nbsp;&nbsp; 다운받은 image를 기반으로 container를 생성하는 docker run 명령어를 실행한다. 이후 옵션을 지정ㅇ해주고(-d: 백그라운드에 띄운다.) 네&nbsp;&nbsp;&nbsp;트워크 옵션도 지정한다(-p 3306:3306). MySQL의 경우 3306포트를 사용하고 oracle과는 다르게 하나의 포트만 연결하면 된다. 컨테이&nbsp;&nbsp;&nbsp;너를 시작할 때 환경변수를 설정하려면 뒤에 -e 옵션을 지정하면 된다. 이어서 MySQL에서 사용할 root(관리자)계정의 비밀번호를 설정하&nbsp;&nbsp;&nbsp;고 컨테이너의 이름을 지어준다. 마지막으로 그 컨테이너의 바탕이 되는 image의 이름을 적어준다.
  
5. `$> docker ps`

&nbsp;&nbsp; 현재 떠 있는(가동중인) 컨테이너의 목록을 확인한다. 여기에 방금 지어준 container의 이름이 떠 있으면 성공이다.
 
6. `$> docker exec -it <container 이름> bash`

&nbsp; MySQl도 oracle과 마찬가지로 exec 명령어를 사용해서 컨체이너 속으로 들어가야 한다. 이 때 마지막에 bash를 입력해 새로운 shell이 뜨는 명령어를 추가해준다. 위 명령어를 실행하면 root 권한으로 들어가게 돼 명령어창에 #이 붙을 것이다.
 
 7. `#> musql -u <계정 이름> -p`
 
&nbsp; MySQl 세계에 들어가 위의 명령어를 치면 각자의 계정으로 로그인할 수 있다. <계정 이름>에 root를 넣으면 관리자 계정으로 들어간다. 명령어를 치고 나면 password를 입력하라고 나올 것이다. root 계정으로 들어갔다면 4번에서 설정한 비밀번호를 치면 된다. 제대로 로그인하면 앞으로는 command line이   `mysql>`로 시작할 것이다.
                                                                                                           
