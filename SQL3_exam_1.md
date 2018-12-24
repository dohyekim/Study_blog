### Table
------------------------------------
1. 첫 글자는 대문자로 한다.
2. 첫 글자를 제외하고는 소문자로 쓴다. </br>
3. 띄어쓰기는 ‘_’ 로 대체한다.
4. ‘_’ 외에 모든 특수문자나 띄어쓰기는 허용하지 않는다. </br>
5. 한글명은 허용하지 않는다.
6. 영문 약어명은 통용되는 약어가 있다면 그대로 표현한다. 

### Column
---------------------------------
1. 각 테이블에는 하나의 id column이 반드시 있어야 한다.
2. 테이블에는 반드시 primary key가 id column에 걸려있어야 한다.
3. id column은 auto_increment로 한다.
4. 각 테이블마다 이름, 명칭 data를 담은 column명은 "name"으로 통일한다.
5. 여러 개의 이름, 명칭 data를 담는 경우에는 대표적인 것 하나만 "name"으로 정한 뒤
   나머지는 "(세부 정보)_name"로 만든다. </br>
   > ex) Table: Employees </br>
   >     Column: "name"(employee의 이름 column),"job_name"(직책 이름 column) </br>
6. column 이름에는 대문자는 허용하지 않는다.
7. 영문 약어명은 통용되는 약어가 있다면 그대로 표현한다.
8. 이름, 명칭의 경우 data type은 varchar(40)으로 한다.
9. data type이 varchar이고 not null인 경우 default는 " "로 한다.
10. 숫자가 2자리 이하면 data type은 "tinyint", 5자리 이하면 "smallint", 11자리 이하면 "int"로 한다.
11. id column의 data type은 테이블의 row 개수를 고려하여 잡는다.

### Foreign Key
------------------------------------
1. foreign key의 이름은 다음과 같은 형식으로 정한다.
   "fk_(참조하는 table 약어)_(참조되는 table 약어)"
2. foreign key가 걸리는 column의 이름은 참조하는 table 이름과 같게 한다.
3. foreign key는 참조하는 테이블의 id column에 설정한다.

### Oracle에서 MySQL로 이관하는 경우 data type 설정
---------------------------------------
1. 오라클의 Data Type이 "varchar2"일경우 "varchar"로 변환해준다. 
2. 오라클의 "varchar"와 "varchar2"은 "varchar"로 통일한다.
3. number의 경우 다음과 같이 통일한다.
   > ex. number(3) 이하는 tinyint로 변환한다. </br>
   > ex. number(5) 이하는 smallint로 변환한다. </br>
   > ex. number(5) 초과시 int로 변환한다. </br>
   > ex. number(5,2)와 같은 형태일 경우 decimal(5,2)로 변환한다. </br>

### 기타 이름 규칙
-----------------------------------
1. view
    "v_(join되는 테이블 이름)"
2. trigger 
    "tr_(테이블)_(영향 받는 테이블 이름)"
3. temporary table 
    "temp_(이름)"
4. procedure 
    "sp_(이름)"
5. function 
    "fn_(이름)"
6. variable
    "_(이름)"

