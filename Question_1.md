Docker를 활용하여 오라클 Express Edition을 설치하는 과정을 기술하시오.
----------------------------------------------------------------------

1. `$> docker search oracle`
  docker search 명령어에 설치하고 싶은 프로그램을 입력해서 해당 프로그램과 관련된 image가 있는지 찾는다. 혹은 hub.docker.com에서도 확인할 수 있다.
  
2. `$> docker pull <image 이름>`
  official 인증을 받았거나 별의 개수가 높은 image를 다운(pull)받는다. 이 때 express edition을 다운 받으려면 'xe'가 들어간 image를 다운받으면 된다.
  
3. `$> docker images`
  다운받은 image의 전체 목록을 보여주는 명령어이다. 방금 다운받은 image가 제대로 다운받아졌는지 확인하기 위해 위 명령을 실행한다. 명령의 결과레 설치  한 image의 이름이 있으면 제대로 다운받은 것이다.
  
4. `$> docker run -d --name <container 이름> -p 8080:8080 -p 1521:1521 <image 이름>`
  image를 설치했다면 그 image를 기반으로 container를 생성한다. Image를 다운받은 후 처음으로 container를 생성할 때는 docker run 명령어를 실행하면 된다. 이때 옵션으로 -d를 설정하면 container가 background에서 실행된다는 의미로, 실행 결과가 곧바로 출력되는 -it 옵션과 다르게 실행결과가 바로 뜨지 않는다. 하지만 동시에 container가 잘 죽지 않는다는 장점이 있다. 옵션을 정해준 이후로는 container의 이름을 정해주면 된다. 그 다음에는 네트워크 옵션을 적어주는데 -p는 임의의 포트를 지정하겠다는 뜻이다. 오라클의 경우에는 8080포트와 1521포트 두 개를 연결해야 하는데 이 때 8080은 관리자 tool용이고 1521은 실행 데몬 포트이다. 포트를 연결할 때는 <내가 주려는 포트>:<해당 포트>의 형식으로 연결한다.
  
5. `$> docker ps`
  현재 가동중인 container의 목록을 보여주는 명령어이다. Container 생성이 끝나면 제대로 설치가 됐는지 확인하기 위해 위 명령을 실행할 수 있다. 명령의 결과로 방금 지정한 이름으로 된 container가 있다면 잘 설치된 것이다. (cf. `docker ps -a` 명령어는 가동중인 container를 비롯해 현재 가동중이지 않은 container의 목록까지 전부 보여주는 명령어이다.)
  
6. `$> docker exec -it oracle bash`
  5번의 명령을 실행하면 command 칸에 컨테이너를 띄우면 기본적으로 실행되는 명령어가 적혀있다. oracle의 경우에는 '/entrypoint.sh'이라고 적혀있는 걸 볼 수 있다. 이는 새로운 shell이 생기지 안흔다는 것을 의미함으로 oracle의 세계로 들어가기 위해서는 bash 명령을 통해 새로운 shell을 덮어야만 한다. 따라서 docker attach 명령어가 아닌 exec 명령어를 사용하고 뒤에 bash를 실행한다는 의미로 bash까지 적어주어야 한다.
