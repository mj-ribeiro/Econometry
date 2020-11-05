# Monitoria de econometria - 1
# aula 10


setwd('D:/Git projects/Econometry')   # definir o diretório


# install.packages('readxl')

library(readxl)


base = read_xlsx('consumo.xlsx')

base = data.frame(base)

head(base)
tail(base)

#Y=consumo per capita de frango
#X2=Renda disponível per capita, US$
#X3=Preço Frango
#X4=Preço Suíno
#X5=Preço Bovino
#X6= Preço substitutos do Frango


cor(base[,-1])


attach(base)


## regressão 


reg = lm(data = base[,-1],Y ~ . )


summary(reg)




## intervalo de confiança




confint(reg)


# anova


anova(reg)



## Multicolinearidade

#install.packages('faraway')


library(faraway)


indep = base[,3:7]

View(indep)


vif(indep)




#### heterocedasticidade

plot(reg$residuals^2, cex=3, 
     pch=19,
     col='brown')



# Teste de Park


res_quad = log(reg$residuals^2)


n = length(base)


for (i in 3:n) {
  aux = lm(res_quad ~ log(base[,i]) )
  print(summary(aux)$coefficients[,4][2] )
}



head(base)


# Teste de Glejser


res_quad = abs(reg$residuals)


n = length(base)


for (i in 3:n) {
  aux = lm(res_quad ~ log(base[,i]) )
  print(summary(aux)$coefficients[,4][2] )
}



# autocorrelação


library(Hmisc)


res = reg$residuals


l_res = Lag(res)


plot(res, l_res, cex=4, pch=19, col='red')


# Teste Durbin Watson


library(lmtest)

dwtest(reg)



### Especificação



mod1 = lm(log(Y)~ log(X2) +log(X3))
mod2 = lm(log(Y)~ log(X2) +log(X3)+ log(X4))
mod3 = lm(log(Y)~ log(X2) +log(X3)+ log(X5))
mod4 = lm(log(Y)~ log(X2) +log(X3)+ log(X4) + log(X5))
mod5 = lm(log(Y)~ log(X2) +log(X3)+ log(X6))



l = c( 'mod1', 'mod2', 'mod3', 'mod4', 'mod5', 'reg')



for (i in 1:length(l)) {
  cat('Modelo', i, '---', 'Akaike:', AIC(get(l[i])), '---',
      'Schwartz:',BIC(get(l[i])), '\n' )
}


# Teste Reset


reset(reg)


reset(mod3)







