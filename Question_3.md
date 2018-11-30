## 오라클과 MySQL에서 데이터베이스(Schema)와 사용자(USER)를 생성하는 과정을 쓰시오.

### 오라클에서 Schema 생성하기

+ **오라클에서는 database와 user를 같은 것으로 보기 때문에** 사용자를 생성하면 database가 생성된 것과 같은 의미를 가진다. 이때 user와 database를 합쳐서 **schema**라고 부른다. 오라클에서 schema를 생성하려면 **Oracle SQL Developer**라는 툴을 이용하면 쉽게 생성할 수 있다. SQL Developer에 들어가 왼쪽 상단의 `접속` 부분을 찾는다. 접속 화면에 `Oracle 접속` - `system`을 찾아 누르면 맨 아래에 `다른 사용자`로 들어갈 수 있다. `다른 사용자`를 클릭하고 마우스 오른쪽 버튼을 눌러 `사용자 생성`을 클릭한다. `사용자 생성`을 클릭하면 사용자의 이름과 비밀번호를 설정할 수 있다. 또 롤과 시스템권한을 설정할 수 있고 테이블 스페이스에 얼만큼의 디스크 메모리를 할당시킬 것인지를 정할 수 있다. 다 설정한 후 `SQL` 탭을 누르면 방금 설정한 내용들이 SQL 쿼리문으로 작성된 걸 확인할 수 있다.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

### MySQL에서 데이터베이스(Database) 생성하기

+ MySQL은 database와 user를 따로 생성해야 한다. 우선 MySQL container를 실행시키고 shell을 띄운 후 `$> mysql -u root -p`를 입력해 root로 들어ㅓ간다.

1. `mysql> show databases;`
  위 명령어는 현재 있는 database의 목록을 모두 확인하는 명령어다. 이 명령어를 통해 현재 있는 database의 목록을 확인한다.
  
2. `mysql> create database <database 이름>;
  확인 후 새로운 database를 만들고 싶을 때 위의 쿼리문을 입력한다. 참고로 database를 만드는 권한은 root에 있다. 새로 만든 database의 이름도 정해준다. DB의 모든 쿼리문은 `;`로 끝을 나타낸다.
  
3. `mysql> show databases;`
  다시 한 번 database의 목록을 확인한다. 이때 방금 만든 database의 이름이 있으면 잘 만들어진 것이다.
  
4. `mysql> use <database 이름>`
  방금 만든 database 안에서 table을 만들거나 보는 등의 작업을 하려면 그 database를 선택하는 과정이 필요하다. 그 과정을 실행하기 위해서 use 명령문을 사용한다. 이 경우에는 끝에 ;를 붙이지 않아도 된다.
  
5. `mysql> show tables;`
  새로운 database를 만들었기 때문에 Empty set이라는 결과가 나올 것이다.
  
6. `mysql> create table <table이름>(<설정>);`
  제대로 database를 생성하고 선택했다면 테이블을 생성할 수 있다. 여러 설정들을 입력한 후 table을 만든다.
  
7. `mysql> show tables;` 
  마지막으로 다시 한 번 표의 목록을 요청하면 방금 만든 table이 보일 것이다.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

### MySQL에서 사용자(USER) 생성하기

1. `mysql> create user <user 이름>@'<host>' identified by '<비밀번호>';`
  새로 만들 user의 이름을 설정하고 host 자리에는 localhost 혹은 %, 아니면 local IP 주소를 적는다. identified by 뒤에는 새로 설정할 비밀번호를 적는다.
  
2.1. `mysql> grant all privileges on *.* to '<user 이름>'@'<host>';`
  새로 만든 user에게 권한을 부여하는 명령이다. 위의 `*.*`는 * :모든 database에 대해 * :모든 권한을 부여하겠다는 의미이다. 
  
2.2. `mysql> grant all privileges on <database 이름>.* to '<user 이름>'@'<host>;`
  위 명령문은 어느 한 database에 *(모든 권한)을 부여하겠다는 의미이다.
  
3. `mysal> flush privileges;`
  앞서 한 모든 설정들을 적용하겠다는 의미이다. git의 `commit`과 비슷한 개념이라고 이해하면 된다.
