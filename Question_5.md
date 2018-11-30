Linux(Ubuntu) Docker Container를 구동하기 위한 절차를 쓰고, 설치된 Ubuntu Container에 Telnet daemon 구동하기, 한글 사용 설정하기, Git 사용 설정하기 등의 작업 절차를 기술하시오.
---------------------------------------------------------

###  Ubuntu Docker Container 구동하기

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
    
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
### Telnet daemon 구동하기

1. [**deamon**](https://ko.wikipedia.org/wiki/%EB%8D%B0%EB%AA%AC_(%EC%BB%B4%ED%93%A8%ED%8C%85))이란 여러 OS를 사용하는 상황에서 사용자가 직접적으로 제어하지 않고 백그라운드에서 돌면서 여러 작업을 하는 프로그램을 의미한다. 뒤에 d를 달고 있다. <br />
2. docker container 안으로 들어간다.<br />
3. `$> su -` root 계정으로 들어간다.<br />
4. `#> apt-get update` 먼저 apt-get 프로그램을 update한다.<br />
5. `#> apt-get install Xinetd telnetd` Xinet(inetd에 보안 기능이 강화된 데몬으로 인터넷 기반 연결을 관리하는 데몬)과 telnet 데몬을 intall한다. <br />
6. `#> apt-get install vim` vi editor를 install한다.<br />
7. `$> vi /etc/xinetd.d/telnettc/xinetd.d/telnet` vi editor를 사용해 다음 명령어를 적는다. <br />
`service telnet
{
    disable = no
    flags = REUSE
    socket_type = stream
    wait = no
    user = root
    server = /usr/sbin/in.telnetd
    log_on_failure += USERID
}
<br />`
8. `$> /etc/init.d/xinetd restart` <br />
9. `#> docker commit <container 이름> <새 이름>` <br />
  Telnet 포트를 새로 연결해주기 위해서는 run명령어를 실행해야 한다. 하지만 ubuntu를 설치할 때 이미 포트를 설정해주지 않고 다운받았기 때문에 새로운 이미지를 떠 새로 run해야 한다. 이를 위해 기존의 ubuntu image를 다른 이름으로 commit한다.<br />
10. `#> docker run -itd -p 23:23 --name <새 container 이름> <image 이름> bash` <br />
  새로 만든 container를 run시킨 후 telnet 포트인 **23번 포트**로 연결한다.<br />
  
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
### 한글 설정하기

1. `$> apt-get install locales`<br />
2. `$> cat /usr/share/i18n/SUPPORTED`<br />
3. `$> localedef -f UTF-8 -i ko_KR ko_KR.UTF-8`<br />
4. `$> locale-gen ko_KR.UTF-8`<br />
5. `$> locale -a`<br />
6. `$> locale` <br />
  root 계정에서 위의 명령어를 실행해 LC_ALL= 자리가 비었는지 확인한다.<br />
7. `$> locale -a` <br />
  위 명령어를 통해 LC_ALL= 자리에 채울 수 있는 언어가 있는지 본다. 한글의 경우에는 ko_KR.utf8이 목록에 있어야 한다. 1~4번의 과정을 제대로 수행했다면 목록에 ko_KR.utf8이 있을 것이다.<br />
8. `$> LC_ALL = ko_KR.UTF-8 bash`<br />
  LC_ALL= 자리를 ko_KR.UTR-8로 채운다.<br />
9. `# ~/.profile` 를 vi editor로 들어가서 <br />
`LC_ALL=ko_KR.UTF-8 bash
export LANGUAGE=ko` 를 붙여 넣으면 위 설정을 계속 유지할 수 있다.<br />

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
### Git 사용하기

1. `#> apt-get update`<br />
2. `#> apt-get install git`<br />
  git을 설치한다.<br />
3. `#> git config --global user.name <github 이름>`<br />
4. `#> git config --global user.email <github email 주소>`<br />
  3, 4번 과정으로 git에 로그인한다.<br />
5. `#> git config --list`<br />
  list에 내 이름과 email 주소가 있는지 확인한다.<br />
6. `#> git config credential.help store`<br />
7. `#> su - <개인 계정>`<br />
8. `$> ll`<br />
  개인 계정의 폴더를 확인하는 명령문이다.<br /> 
8. `$> cd <디렉토리 이름>`<br />
  내가 git clone하고 싶은 폴더로 들어간다.<br />
9. `$> git clone <github url>`<br />
  git clone한다. git clone을 하면 git init은 할 필요가 없다.<br />
10. 이제 git bash에서 했던 명령어들을 그대로 쓸 수 있다.<br />
`git add --all`<br />
`git comit -am "<commit의 이름>"`<br />
`git push origin master`<br />
