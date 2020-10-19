# Monitoria de econometria - 1
# aula 8


setwd('D:/Git projects/Econometry')   # definir o diretório

library(readxl)


df = read_xlsx('data.xlsx')

df = data.frame(df)

attach(df)


head(df)


# regressão


reg = lm(KM.L ~ KM.H +  POT + PESO)


summary(reg)


## confint


confint(reg)



## ANOVA


anova(reg)



## resíduos


plot(reg$fitted.values, reg$residuals, 
     col='blue',
     pch=19, cex=2)
abline(h=0)



## hist

hist(reg$residuals)


## qq plot

qqnorm(reg$residuals, col='red', pch=4)
qqline(reg$residuals)


## teste de shapiro wilk


shapiro.test(reg$residuals)




### multicolinearidade


#install.packages('faraway')

library(faraway)


indep = df[ ,3:5]

vif(indep)


# heterocedascidade


library(lmtest)

bptest(reg)


library(estimatr)

reg2 = lm_robust(KM.L ~ KM.H + POT + PESO)

summary(reg2)















