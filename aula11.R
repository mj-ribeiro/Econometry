# Monitoria de econometria - 1
# aula 11

setwd('D:/Git projects/Econometry')   # definir o diretório




# integral 

f1 = function(x){
  x^2 + 3*x - 2
}


a = 0
b = 5
n = 1e4



solve = function(a, b, N, fx){
  s = 0
  for (i in 1:N) {
    x = runif(1, a, b)
    f = fx(x)
    s = s + f
  }
  return(s*(b-a)/N)
}


n = 50000

solve(a, b, n, f1)




## 1e 


f2 = function(x){
  log(x) + 2
}


solve(0, 10, n, f2)





### Questão 2 - gráficos

par(mfrow=c(1, 2))
curve(f1, xlim = c(0, 5))
curve(f2, xlim = c(0, 10))






### Questão 3

set.seed(2)

x = seq(-1, 1, length=1000)

n = length(x)



beta2 = 6

beta_reg = c()



for (j in 1:1e4) {
  erro = rnorm(n, 0, 1)
  
  y = beta2*x + erro 
  
  reg = lm(y ~ x - 1)
  beta_reg[j] = reg$coefficients[1]
  cat('Iterações:', j, '\n')
}


mean(beta_reg)


par(mfrow=c(1, 1))
hist(beta_reg, col = 'lightblue', breaks = 25)

summary(beta_reg)



#### Questão 4

beta2_ols = c()
beta2_alt = c()

set.seed(10)

for (i in 1:50000) {
  
  y = rnorm(1000, 0, 1)
  x = rnorm(1000, 0, 1)
  
  k = (x - mean(x))/ sum((x-mean(x)) ^2)
  beta2_ols[i] = sum(k*y)     # eq 2
  
  w = rnorm(1000, 0, 1)
  beta2_alt[i] = sum(w*y)
  
  cat('Iterações:', i, '\n')
}


sd(beta2_alt)

sd(beta2_ols)



## plots

par(mfrow=c(1, 2))
plot(density(beta2_ols), col='red', lty=2, lwd=2, main='Estimador de MQO')
abline(v=0, lty=2)

plot(density(beta2_alt), col='blue', lwd=2, main='Estimador Alternativo')
abline(v=0, lty=2)




summary(beta2_alt)
summary(beta2_ols)






























































