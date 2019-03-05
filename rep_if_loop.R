
# 1. data$group 컬럼에 A조~C조 랜덤으로 160명씩 고르게 분포시키시오. ####

data$group = rep(sample(c('A조','B조','C조')), times=160)
head(data)
nrow(data[data$group=="A조",])
nrow(data[data$group=="B조",])
nrow(data[data$group=="C조",])

# 2. fibonacci.R 파일을 작성하고 console에서 실행하시오. ####
while(TRUE){
x = as.integer(readline(prompt="Input the number(ex.5, 0 to quit) >> "))
vect = c(1,1)

if (x <=0) break
else if (x<=2 & x >0){
  print(vect[1:x])
  }
else {
  for (i in 1:(x-2)) {
    vect[length(vect)+1] = vect[length(vect)-1]+vect[length(vect)] 
    }
  print(vect[1:x])
  }
print(vect)
}

#source("fibonacci.R")

# 3. apply를 이용하여 smdt에 과목별 (총)평균점수 행을 추가하고, 총점과 평균 변수(컬럼)을 추가하시오. ####

# 3.1 과목별 (총)평균점수 행을 추가
apply(smdt[,2:4], MARGIN=2, FUN=mean)
smdt[nrow(smdt)+1, 2:4] = apply(smdt[,2:4], MARGIN=2, FUN=mean)
smdt[nrow(smdt),1] = "계"
smdt

# 3.2 총점과 평균 변수(컬럼) 추가
smdt$"total"=apply(smdt[,2:4], MARGIN=1, FUN=sum)
smdt$"mean"=apply(smdt[,2:4], MARGIN=1, FUN=mean)
smdt

# 4. 2016~2019년 연도별 1월(Jan) ~ 12월(Dec) 매출액 데이터를 `no year Jan Feb … Dec` 형태로 만든 다음, 아래와 같이 출력하시오. ####
ny = data.frame(no=1:4, year=2016:2019)
ny
sm = matrix(round(runif(n=4 * 12, min=300, max=700),3)*1000, nrow=4, dimnames = list(NULL, month.abb))
sm
salespm = cbind(ny, sm) #sales per month
salespm
yms = melt(data=salespm[,2:14], id.vars="year", variable.name="month", value.name="saleamt")
yms
