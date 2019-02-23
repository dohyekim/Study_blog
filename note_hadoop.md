아파치가 80포트를 가짐 --> 아파치가 요청을 먼저 받고 파이썬이면 flask로 보내고 js/css인 경우에는 별도의 과정 없이 그냥 보낸다(파이썬을 위해서는 flask가 필요하기 때문에)

김도혜(Dohye Kim) [11:07 AM]
Cluster: 여러 대 서버가 한꺼번에 처리되는 것

김도혜(Dohye Kim) [11:49 AM]
-------------------Hadoop--------------------------
yarn은 application, (edited) 
node manager: 계속 yarn이랑 통신하면ㅅ서 어떤 node가 쉬는지/작업 가능한지 파악
name node: 이 데이터가 어디에 있는지를 파악하는 역할을 한다. 따라서 select 요청이 들어왔을 때 그 데이터를 갖고 있는 node들을 뒤지게 함. 이걸 모르고 있으면 모든 분산 node를 일일이 full- scan해야 함 (edited) 
map은 데이터들이 오는 단위로 key랑 value가 있는데, 얘네들을 다 받은 후에 순서대로 정렬하는 작업이 필요 --> 이걸 정렬하는 게 reduce
# Reduce (Shuffle-Sorting → Reduce → ouput)

shuffle이라고 부르지만 실제로 하는 역할은 sorting,
reduce는 동일한 키를 갖고 있느 ㄴ애들을 하나로 ex. 예를 들어서 소설을 쓴다고 하면 ch1의 100-150pg는 A서버에, 151-200은 B서버에 있다고 치면 얘네들을  ch1이라는 이름 아래 하나로 묶어두는 것

output은 여기서 max()를 쓰면 최고 기온이 나오는 것과 같음
Map함수 : 달/일 빼고 연도만 줘 라고 하는 함수
(직접 짜야 함) --> data node에 요청
Reduce: 이것도 내가 직접 짜야 함 --> Namenode에 요청(뭘 주세요니까)
