LINUX
alias ll='ls -al'
find . -name <이름>
★ telnet : 네트워크에 접속할 때 쓴다.
---------리눅스----------
★ su - : 루트로 전환하기 (edited) 
★ df : 현재 사용중인 disc 용량
★ df -h : mb로 (edited) 
★ su - dooo : 루트에서 dooo로 (edited) 
★
$ ~/.vimrc : vim의 환경설정이라고 보면 됨.
★
$ ~/홈 dir 아래에다(.) (edited) 
★ cat : 파일 내용 보기 (edited) 
★ ~ : 내 방으로 /home 아래에 있음
보통 home 디렉토리라고 하면 /home/dooo를 의미한다. (edited) 
★ cd ~ : 내 폴더로 가기(dooo로 가기) (edited) 
★ $ vi ~/.vimrc
: 내 폴더 아래에 vimrc라는 파일을 vi를 가지고 만들겠다. (edited) 
★ cat .vimrc : .vimrc파일 내용 확인하기 (edited) 
★ indent에 관한 setting
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4 (edited) 
★ printf -> format으로 print한다
★ %s -> string
★ %d -> 숫자 (edited) 

김도혜(Dohye Kim) [3:23 PM]
단축키 ★ !v : 다시 들어감 vi로 작업하던 파일

★ printf는 개행 불가 \n or \t를 쳐야 함.

★ 변수 선언
- 공백도 글자로 따지니까 변수 선언하고 바로 =써야 함.
- ""도 반드시 쳐야하는 게 아니기 때문에 공백도 string이 돼버림.

error ) str = "hello "
ok) str=hello
ok) str="hello " (edited) 
``: 명령 실행
; 줄바꿈
' '가 구분자
{} range
ex) for i in `ls`; do echo $i; done --> 줄별로 나옴 (edited) 
ls: 파일 목록 보기 (edited) 

김도혜(Dohye Kim) [3:48 PM]
★ for i in `ls *.txt`; do cat $i; done

★ *.txt : 모든 텍스트 파일 (edited) 
★ ll *.txt: 모든 텍스트 파일 목록 보기 (edited) 
★ for i in `ls *.txt`; do echo $i; cat $i; done (edited) 
★ Try this: vi loop.sh (실행 파일 작성)
             bash loop.sh (실행) (edited) 
★ $ ./s2.sh   --> 그냥 실행하면 x권한이 없어서 실행 안 됨.
error) bash: ./s2.sh: Permission denied

$ for i in `ls *.sh`; do chmod +x $i; done (edited) 
★로그인하면 자동 실행되는 게 .profile 폴더

따라서 alias가 계속 유지되게 하고 싶으면
$ vi.profile에 alias 설정해두기 (edited) 

김도혜(Dohye Kim) [4:14 PM]
★ rc 파일: 가동될 때 무조건, 우선적으로 타는 파일
ex) vimrc : vi를 켤 때 무조건, 우선적으로 타는 파일
ex) bashrc: bash를 열 때 무조건, 우선적으로 적용하는 파일

김도혜(Dohye Kim) [4:21 PM]
★ !bash s3.sh (vi editor에서 w만 하고 바로 실행하는 법, 실행 권한이 없기 때문에 bash로 실행하는 것
★ \$3 --> $를 무력화시킨다.

김도혜(Dohye Kim) [4:28 PM]
★ $0 = 나
   $1 = param 1
   $2 = param 2
   $# = param의 수

김도혜(Dohye Kim) [4:44 PM]
★ if
if [ $# -gt 0 ]; then
   MSG="$1"
★ $# -gt 0 : param수가 greater than 0
★ [ ] 시작과 끝에 공백 필수

김도혜(Dohye Kim) [9:45 AM]
★  python -V
(=) python --version
     date +%Y
     date -d yesterday
     date --date=yesterday (ok)
( --는 =를 대체로 필요로함)

  -를 쓸지 --를 쓸 지 알 수 없으니까 date --help를 쳐서 확인해봐야 함. (edited) 



김도혜(Dohye Kim) [10:43 AM]
★ $ expr 1 + 2
   $ expr 5 \* 2 (edited) 

김도혜(Dohye Kim) [11:03 AM]
★ @ = all
${#arr}  --> 처음 arr의 갯수
${#arr[@]} --> 모든 arr의 갯수

★ Function에서 바깥쪽 $1을 쓰고 싶을 때는 function선언하기 전에 $1을 새로운 그릇에 담으면 된다.

★ Function을 부르기 위해서는 항상 그보다 앞서 function이 정의되어 있어야 함

★ 함수의 param a, b를 fn(a,b)자리에 두지 않고 fn() {ab}자리에 두기
★ if [ *-f* <파일 이름> ]; then cat <파일 이름>
--> -f: (다음과 같은) 파일이 있는가
     -r: 읽기 권한이 있는가
     -w: 쓰기 권한이 있는가
     -x: 실행 권한이 있는가

김도혜(Dohye Kim) [11:17 AM]
★ for i in 1 2 3 4 5
space가 구분자!

김도혜(Dohye Kim) [4:26 PM]
★ cron: 스케줄러같은 기능(~일에는 ~를 해라 ex.백업할 때 씀)
★ crontab은 유저마다 존재한다 (cron이란 daemon은 하나만 떠 있지만 crontab은 모든 유저에게 존재.)
★ crontab -e 는 root가 실행할 수 있음
★ 분 시 일 월 주
    *   *   *   *   *
★ 확인하기 >>
# tail -f temp.log

김도혜(Dohye Kim) [4:35 PM]
★ error 2 를 out의 영역 1로 옮긴다.
 2>&1
(error가 나는 영역이랑 out의 영역이랑은 다른 영역)

김도혜(Dohye Kim) [4:49 PM]
★ linux로 git

mkdir sh
mv ~/*.sh sh/

workspace/hello 안에 (.git이 있는 폴더에서)
mv ~/*.sh(home 아래 있는 모든 sh파일을) sh/(방금 만든 sh라는 폴더 아래에 넣는다.)

김도혜(Dohye Kim) [5:23 PM]


=======linux에서 mysql 백업하기============
mysql bash 띄워놓고

vi backup_dooodb.sh

#!/bin/bash

DATE=`date +%Y%m%d --date=yesterday`
FN=$DATE.sql
cd /backup
mysqldump -uroot -p1234! dooodb > $FN
./backup_doodb.sh
ls -alh backup (edited) 

김도혜(Dohye Kim) [5:42 PM]
================ 복구하기 ========
========mysql에서 crontab 걸기 =========
mysql 서버에 들어가서 해야 됨 (exec bash 상태에서)
apt-get update
apt-get install cron
service cron restart
crontab -e
0 3 * * * /backup_dooodb.sh >> /backup/backup.log 2>&1


