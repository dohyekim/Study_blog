Docker의 개념과 구성요소(image, container, docker-machine 등)에 대해 본인이 이해한 바를 자유롭게 서술하고, Docker의 설치 과정과 정상 설치를 확인하는 과정을 기술하시오.
--------------------------------------------------------------------------------

### Docker는 내 PC 외에 또 다른 PC를 사용하고 싶을 때, 내 PC 한 대로 또다른 PC까지 함께 사용할 수 있게 해준다. 여러 개의 서버를 실행하고 싶을 때도 docker를 사용할 수 있다.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#### 다음은 Docker의 기본 개념과 구성요소입니다.

* Windows는 내가 원래 가지고 있는 서버다.<br />
* 여기서 새로운 서버를 열고 싶을 때 docker를 설치한다. <br />
* Docker 안에는 여러 개의 서버를 만들 수 있다. 이때 서버를 만들기 위해 처음으로 해야할 일이 image를 다운받는 것이다. Image 안에는 그 서버를 실행시키기 위해 필요한 프로그램을 비롯한 모든 것이 들어있다.<br />
* image는 만들어두면 PC가 바뀌더라도 어디에서든 사용할 수 있다. 다른 PC를 사용하게 되면 해당 image만 다운(pull)하면 그대로 쓸 수 있어 매우 편리하다.<br />
* image를 다운 받았다면 그 image를 바탕으로 container를 띄우면 서버가 생성된다. 알맹이는 image이지만 image는 컨테이너로 띄우지 않으면 그냥 파일일 뿐이다. image를 컨테이너로 띄우는 순간 새로운 서버로 태어나게 된다고 볼 수 있다.<br />
* docker에서 설치된 container 및 image를 볼 수 있는 간단한 명령어들이다.<br />
`$> docker ps` 실행중인 container(서버) 목록<br />
`$> docker ps -a` 전체 container 목록 <br />
`$> docker images` 다운(pull)받은 전체 image 목록 <br />

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#### 다음은 Windows 10 이하의 버전에서 Docker를 설치하는 방법입니다.
1. docker는 Linux기반이므로 windows사용자라면 [**Docker for Windows**](https://store.docker.com/editions/community/docker-ce-desktop-windows)로 들어가 설치해야 한다.<br />
1.1. **Get Docker**를 클릭해 설치한다.<br />
1.2. 다운로드한 **Docker for Windows Installer.exe** 실행파일을 클릭해 설치한다.<br />
2. Windows 10 이하의 버전은 oracle이 제공하는 가상화 툴인 VirtualBox를 이용한 [**Docker Toolbox**](https://docs.docker.com/toolbox/toolbox_install_windows/)도 설치해야 한다.<br />
3. 위의 과정을 모두 설치하고 나면 **Docker Quickstart Terminal**이 생길 것이다. 이 터미널을 열어 4번의 명령어를 실행해본다. <br />
4. `$> docker version`<br /> 
Docker의 버전을 체크할 수 있다.<br />
`$> docker info`<br />
Docker가 가지고 있는 container, image, Docker의 현 버전 등에 대한 상세한 정보가 뜬다.<br />
5. Windows에서 container로 진입하기 위해서는 oracle virtual box를 이용해 proxy forwarding의 과정을 거쳐야 한다.
