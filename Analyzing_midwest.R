# midwest 데이터를 data.frame으로 불러온 후, 데이터의 특징을 설명하시오. ####
library(ggplot2)
midwest = as.data.frame(ggplot2::midwest)
middf = as.data.frame(midwest)

aggregate(data=middf, popdensity~state,mean)
aggregate(data=middf, percasian~state,mean)

# 데이터 특징:
state는 총 5개, county는 총 437개로 나눠지고 이 중 아시아인은 최소 0명에서 최대 188,565명이 각 county에 살고 있다. 
전체 인구밀도는 OH-MI-IL-IN-WI주 순서로 높고 
주별 평균 아시아인 비율이 가장 높은 곳은 IL-WI-MI-OH-IN 순이다.



#poptotal 변수(컬럼)를 total로, popasian 변수를 asian으로 변수명을 변경하는 코드를 작성하시오. ####
total = middf$poptotal
middf$total = total
colnames(middf)
middf=middf[,-5]
str(middf)

asian = middf$popasian
middf$asian = asian
colnames(middf)
middf=middf[,-9]
str(middf)



# total, asian 변수를 이용해 `전체 인구 대비 아시아계 인구 백분율` 파생변수(asianpct)를 추가하고, 히스토그램을 그리시오.
####
middf$asianpct = (middf[,'asian'] / middf[,'total']) * 100
histdata = middf[,c('asianpct', 'state')]
hist(histdata$asianpct)



# 도시(state)기준으로 아시아계 인구가 어떻게 분포하는지 설명하시오. ####
asianperstate= aggregate(data=histdata, asianpct~state, mean)
asianperstate[order(-asianperstate$asianpct),]
# IL-WI-MI-OH-IN순으로 아시아계 인구가 많다. 



# 아시아계 인구 백분율(asianpct)의 전체 평균을 구하고, 평균을 초과하면 "lg", 그 외는 "sm"을 부여하는 파생변수(asianrate)를 추가하는 코드를 작성하시오. ####
mean(middf$asianpct)
middf$asianrate = ifelse(middf$asianpct >= mean(middf$asianpct),"lg","sm")
head(middf$asianrate)



# "lg"와 "sm"에 해당하는 지역이 얼마나 되는지 빈도 막대그래프(qplot)을 그려보시오.####
library(ggplot2)
qplot(middf$asianrate)
