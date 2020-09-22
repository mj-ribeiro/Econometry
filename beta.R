setwd('D:/Git projects/Econometry')   # definir o diretório

 

# Esperança do beta


set.seed(2)

x = seq(-1, 1, length = 1000)

n = length(x)



beta2 = 6

beta_reg = c()


for (j in 1:100000){
  erro =  rnorm(n, 0, 1)

  y = beta2*x + erro 
  
  reg = lm(y ~ x - 1)
  beta_reg[j] = reg$coefficients[1]
  
}


mean(beta_reg)


hist(beta_reg)



data = density(beta_reg)



reg = lm(y~x-1)

# plot

plot(data$x, length(data)*data$y, type = 'l', xlim = c(min(beta_reg), max(beta_reg)))
points(mean(beta_reg), 0, pch=19, col='red', cex=2)
points(reg$coefficients, 0, pch=19, col='blue', cex=2)
legend("topright", legend=c("beta médio","beta MQO"), col=c("red","blue"), lty=1,lwd=2)




reg$coefficients - mean(beta_reg)


