1) Linux(Ubuntu) Docker Container를 구동하기 위한 절차를 쓰고, 설치된 Ubuntu Container에 2)Telnet daemon 구동하기, 3)한글 사용 설정하기, 4)Git 사용 설정하기 등의 작업 절차를 기술하시오.
---------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
### * Ubuntu Docker Container 구동하기

1. `$> docker pull <image 이름>` <br />
  Ubuntu image를 다운(pull)받는다. <br />
2. `$> docker container run --name <container 이름> -d <네트워크 옵션>` <br />
  다운받은 image를 바탕으로 container를 띄운다. 이때 ubuntu는 따로 포트를 설정하지 않아도 된다.<br />
2.1. 한 번 생성(run)한 container를 다음에 또 부르고 싶을 때는 `$> docker start <container 이름>` 명령을 사용하면 된다.<br />
3. Container 안으로 들어가기 위해서는 다음 두 가지 방법 중 하나를 선택할 수 있다.<br />
3.1. `$> docker attach <컨테이너 이름>`<br />
    container에서 나올 때는 control + p + q를 치면 된다.<br />
3.2. `$> docker exec -it <컨테이너 이름> bash`<br />
    container에서 나올 때는 exit을 치면 된다.<br />
    
### 
