class 여러 개인 경우 .으로 이어서 select

김도혜(Dohye Kim) [12:35 PM]
중복 제거 ==> set 사용

김도혜(Dohye Kim) [12:55 PM]
l = [i.text for i in singers]

--> singers를  loop돌면서 .text를 가져와 l에 담는다
p = dic.keys()

하면 dic이라는 dictionary의  key 값들이 전부 떨어짐

김도혜(Dohye Kim) [1:11 PM]
dictionary sorting -->
dic[0] ==> key
dic[1] ==> items
sort(dic.items(), key = lambda d: d[1]['ranking'])

김도혜(Dohye Kim) [1:23 PM]
dic.items()는 value값을 불러오겠다는 뜻

김도혜(Dohye Kim) [3:44 PM]
=========== python csv, codecs ===========
codecs.open :: csv를 내가 컨트롤할 수 있도록 변환한 뒤 open한다 (edited) 

김도혜(Dohye Kim) [3:57 PM]
csv.reader :: stream 뚫기( 즉 통로를 뚫었단느 뜻)
--> 시냇물을 타고 하나씩 하나씩(cell이) 내려옴 ---> for loop돌릴 수 있다.

김도혜(Dohye Kim) [4:06 PM]
fp = codecs.open(filename, "r", "utf-8")
# csv.reader == 파일을 읽어서 가져가준다.
# codecs.open == stream을 뚫어주는 거
reader = csv.reader(fp, delimiter=',', quotechar='"')


   for cells in reader:
--> # csv의 row단위로 stream에 띄워 보낸다.

김도혜(Dohye Kim) [5:02 PM]
writerow의 row는 항상 list로 싸야 한다.
codecs.open --> 대용량을 써야 할 때 stream으로 잘게 나눠서 쓸 수 있기 때문에 그냥 open보다 많이 쓰인다 --> system에 부담이 적어짐 (edited) 
