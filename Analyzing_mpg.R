library(ggplot2)
mpg = as.data.frame(ggplot2::mpg)

# 1. mpg 데이터에서 통합 연비(도시와(cty) 고속도로(hwy))가 높은 순으로 출력하시오. ####
mpg$fuel = (mpg[,'cty'] + mpg[,'hwy'])/2
mpg[order(-(mpg$fuel)),]



# 2. mpg 데이터에서 생산연도별 연료 종류에 따른 통합연비를 연도순으로 출력하시오. ####
fperyrfl = aggregate(data=mpg, fuel~(fl+year), mean)
fperyrfl[order(fperyrfl$year),]
