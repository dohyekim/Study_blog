recall = 맞다고 판단했느네 맞았던 거 / 맞다고 판단했는데 맞았던 거 + 틀렸다고 판단했는데 정말 틀렸던 거

데이터가 많다고 정확도가 높아지느 ㄴ것은 아님 --> 정답률과 오답률이 비슷하게 밀어넣어야 함(학습시킬때) (edited) 

김도혜(Dohye Kim) [12:19 PM]
pickle 라이브러리 : 메모리에 올라가는 모든 instance를 파일로 떨굴 수 있고 반대로 load하면 다시 instance로 올릴 수있다.

김도혜(Dohye Kim) [12:39 PM]
cpu 하나가 decision tree모두를 가져가니까 효율을 위해서 4가지의 질문을 랜덤하게 찢어서 가각ㄱ의 cpu에 준다
동시에 처리해서 Yes가 많은지 No가 많은지를 판단 Yes가 많으면 가설이 맞다고 결론 --> rnadom forest이고 집단학습 (각각의 cpu가 집단적으로 학습) (edited) 

김도혜(Dohye Kim) [12:44 PM]
식용이냐 독버섯이냐 -> Random forest
무슨 버섯이냐 -> support vector
head해봤을 때 xolumn이름을 python이 (데이터가 범주형이구나)라고 파악해서 factor라고 판단, column 이름을 data에서 랜덤으로 뽑아서 만들어버림 (p가 두개면 p p.1 이런 식)
단 데이터는 실수화(벡터화)해야 한다

김도혜(Dohye Kim) [12:56 PM]
n_estimators=100가 높을수록 정밀도를 높이라는ㄴ 뜻
random_state=4096 random으로 자를  때 어떤 난수표에 의해서 할지 --> 최적의 값을 찾는다 (edited) 

김도혜(Dohye Kim) [1:16 PM]
최적화
-----------------------------------
100개로 돌렸는데 C=100이면 100개의 데이터일 때가 최적이다 (쓰레기  값이 많다는 뜻)

결과로 나온 값들은 svc에서 옵션으로 줄 수 이쓴 값들임. 나온 값을 옵션으로 붙여넣기하면 된다