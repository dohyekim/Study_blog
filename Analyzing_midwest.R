# 1. midwest 데이터를 data.frame으로 불러온 후, 전체인구와 아시아계인구 데이터의 특징을 설명하시오. (state별 비교 설명)library(ggplot2) ####
midwest = as.data.frame(ggplot2::midwest)
midwest = as.data.frame(midwest)

totaldensity=aggregate(data=midwest, popdensity~state,mean)
totaldensity[order(-(totaldensity$popdensity)),]

asiandensity=aggregate(data=midwest, percasian~state,mean)
asiandensity[order(-(asiandensity$percasian)),]

# 데이터 특징:
# midwest는 437개의 county에 관한 28개 분야의 정보를 담고 있는 dataframe이다.
# state는 총 5개, county는 총 437개로 나눠지고 이 중 아시아인은 최소 0명에서 최대 188,565명이 각 county에 살고 있다. 
# 전체 인구밀도는 OH-MI-IL-IN-WI주 순서로 높고 
# 주별 평균 아시아인 비율은 IL-WI-MI-OH-IN 순으로 높다.



# 2. poptotal 변수(컬럼)를 total로, popasian 변수를 asian으로 변수명을 변경하는 코드를 작성하시오. ####
colnames(midwest)[colnames(midwest)=="poptotal"] = "total"
colnames(midwest)[colnames(midwest)=="popasian"] = "asian"
colnames(midwest)



# 3. 전체 아시아계 인구수와, asian 변수를 이용해 `전체 아시아계 인구 대비 아시아계 인구 백분율` 파생변수(asianpct)를 추가하고, 히스토그램을 그리시오.
####
summedasian = sum(midwest$asian)
midwest$asianpct = midwest[,'asian'] / summedasian * 100

histdata = midwest[,c('asianpct', 'state')]
hist(histdata$asianpct)



# 4. 도시(state)기준으로 아시아계 인구가 어떻게 분포하는지 설명하시오. ####
asianperstate= aggregate(data=histdata, asianpct~state, mean)
asianperstate[order(-asianperstate$asianpct),]
# IL-WI-MI-OH-IN순으로 아시아계 인구가 많다. 



# 5. 아시아계 인구 백분율(asianpct)의 전체 평균을 구하고, 평균을 초과하면 "lg", 그 외는 "sm"을 부여하는 파생변수(asianrate)를 추가하는 코드를 작성하시오. ####
mean(midwest$asianpct)
midwest$asianrate = ifelse(midwest$asianpct >= mean(midwest$asianpct),"lg","sm")
head(midwest$asianrate)



# 6. "lg"와 "sm"에 해당하는 지역이 얼마나 되는지 빈도 막대그래프(qplot)을 그려보시오.####
library(ggplot2)
qplot(midwest$asianrate)
