김도혜(Dohye Kim) [1:01 PM]
To become matrix ==>> number of rows has to be same


김도혜(Dohye Kim) [10:48 AM]
list : nth dimension

김도혜(Dohye Kim) [12:39 PM]
serialize

김도혜(Dohye Kim) [9:51 AM]
local variables : a <- 3
global variables: a <<- 3

김도혜(Dohye Kim) [9:42 AM]
why?why me?why now?

김도혜(Dohye Kim) [5:10 PM]
dim=c(<row>, <column>,<axis>)
축이 2개 --> 3*4 matrix에 축이 2개다 --> 3*4*2
크기각 가변적인 것은 list

김도혜(Dohye Kim) [9:54 AM]
In R, variable == column, (because it's variable)

김도혜(Dohye Kim) [10:16 AM]
smdt = ()....
<smdt> is called object instead of variable

김도혜(Dohye Kim) [11:02 AM]
n() : 빈도수 == groupby -> rowcount

-------------------------R-------------------------------------------
tuple로 만들기 위해 c()로 붙인다고 이해하면 됨.
3:5 = seq(3,5) = 3부터 5까지 주세요.

김도혜(Dohye Kim) [9:59 AM]
c(1,2,3) --> list[1,2,3]
class(c(1,2,3,'A')) --> character(character가 젤 세기 때문)
동시에 1,2,3도 '1','2','3'이 됨
메모리 구조를 바꿔줌 (edited) 

김도혜(Dohye Kim) [10:09 AM]
level == 축약된 data 형태 (ex. F for femail, M for Male)
Ctrl+1
Ctrl+2
Ctrl+Shift+C
#
####
as --> casting같은 의미, type 변환
as.numeric(f) --> 2 (값을 numeric형태로 줌)
as.vector(f) --> 'B' (edited) 
-----------------memory--------------
a=1 하면 a서랍장에 1이 들어감
a라고만 하면 a메모리 영역만 생기고 쓰레기 값이 들어감, 이 때의 상태가 NA
이  쓰레기 값을 비우고 싶을 때 NULL값을 넣는 것
NA != NULL
따라서 값을 초기화하고 싶을 땐 =null하면 된다 (그러면 초기값이 들어감. 이 때 생기는 1234...는 초기값일 뿐임)

김도혜(Dohye Kim) [10:39 AM]
연속되지 않은 값 --> c(1,3,5)
연속된 값 --> 1:3
v1[-3] 3번째 값을 빼고 주세요
v1[-(1:3)] 1~3번째 값을 빼고 주세요
names(v1) --> v1의 column 이름들
names --> key of data( number of names == num of data) (edited) 
column이 dictionary의 key가 된다고 생각하면 됨



김도혜(Dohye Kim) [3:51 PM]
t.test(s, alternative = c("two.sided"),    # cf. c("greater"), c("less")
        mu=65, conf.level = 0.95)   양측검증 --> 귀무가설이 만족할 확률 (edited) 

(이다 아니다)

김도혜(Dohye Kim) [4:00 PM]
p-value =  기각역 = 귀무가설이 맞을 확률 ( 정규분포표에서 양끝값)
따라서 0.014가 나오면 귀무가설이 맞을 확률이 1.4%라는 뜻
따라서 0.000이 나오면 귀무가설이 맞을 확률이 0 , 귀무가설이 틀리다는 뜻 --> 대립가설이 맞다는 뜻 (대립가설의 기각역이 0이다) (edited) 
귀무 가설(歸無假說, 영어: null hypothesis, 기호 H0) 또는 영 가설(零假說)은 통계학에서 처음부터 버릴 것을 예상하는 가설이다. 차이가 없거나 의미있는 차이가 없는 경우의 가설이며 이것이 맞거나 맞지 않다는 통계학적 증거를 통해 증명하려는 가설이다. 예를 들어 범죄 사건에서 용의자가 있을 때 형사는 이 용의자가 범죄를 저질렀다는 추정인 대립가설을 세우게 된다. 이때 귀무가설은 용의자는 무죄라는 가설이다. 통계적인 방법으로 가설검정을 시도할 때 쓰인다.


김도혜(Dohye Kim) [10:00 AM]
기각 기준: p-value(Pr) < 0.0163 이면 이산(서로 다르다)
describeBy(data$kor, data$cls, mat = T) -- 반 별로 국어 성적 알려줌

김도혜(Dohye Kim) [10:47 AM]
include=False(when storing as html, we'll not put this in. ex. load(data/.../.rda)
