# Monitoria de econometria - 1
# aula 4


setwd('D:/Git projects/Econometry')   # definir o diretório


# curve

windows()
curve(dnorm(x), xlim = c(-5, 5), col='red', type = 'l')



# function

fx = function(x){
  x^2
}



#install.packages('latex2exp')

library(latex2exp)


curve(fx(x), xlim = c(-5,5), col='blue', type = 'o',
      xlab = 'X',
      ylab = TeX('X^2'),
      main = 'My function')



# plot


x = seq(-5, 5, 0.01)

plot(x, fx(x), type='l', lwd=3, lty=1)
abline(v = 4, col='blue', lwd=3, lty=2)
abline(h = 10, col='red', lwd=3, lty=3)
segments(-4, 4, 4, 20)



# 

plot(x, x^3, type='l')
points(0,0, pch=19, col='red', cex=2)
points(c(-4, 2), c(-99, 50), cex=3, col='blue', pch =4)



# scatter

set.seed(10)
rnorm(5)


g = rnorm(100, 0, 1)
k = rnorm(100, 10, 5)


plot(g, k,
     pch=19,
     col='red',
     xlab = 'normal- m=0, v=1',
     ylab = 'normal - m=10, v=5',
     main = 'Meu gráfico')




# histogram


hist(rnorm(10000), col = 'lightgreen', breaks = 60, probability = T, 
     main= 'Meu histograma')
curve(dnorm(x), add=T, lwd=3, col='red')





# Multiple plots

windows()
par(mfrow=c(2, 2))
plot(x, exp(x), type='l', main='exp(x)')
plot(x, log(x), type='l', main = 'log(x)')
plot(x, x^2, type='l', main='x^2')
plot(x, 1/x, type='l', main='1/x')



# quartis


vv = seq(1, 9, 1)

summary(vv)



# Dist



set.seed(10)

curve(dnorm(x), xlim = c(-5, 5))
abline(v=0)
text(-1, 0.1, '50%')






























