# Monitoria de econometria - 1
# aula 5


setwd('D:/Git projects/Econometry')   # definir o diretório


# Questão 1

# 1 a

sum(seq(10, 30, 1)^2 )


# 1 b

sum (sqrt(log( 10^seq(1, 6, 1) ) ) )


# 1 c

sum(sin( seq(0, 200, 10) ) )



# 1 d

sum(log (rep(c(1, 2, 3), c(3, 2, 1)) ) )



# 1 e

sum(tan( rep(c(4, 3, 1), c(1, 3, 1)) ) )





## Questão 2

# 2 a 

x = c(1, 4, 5, 10, 22, 3, 11)
n  = length(x)
lambda = 10 

V = -n*lambda + sum(x*lambda) - sum(log(factorial(x)))


# 2 b 

v1 = seq(0, 100, 10)
v1[1] = 1

sum((v1*pi)^2)


# 2 c

v = seq(0, 100, 10)
v[1] = 1

sum((v*pi)^seq(1, 11, 1) )



# 2 d

a = seq(1, 30, 1)
x = 2


sum(log((x + a)/a) )




# Questão 3

v = c(1, 4, 9, 10, 11, 3, 0.33, 5, 1) 
z = c(21, 1, 6, 30, 11, 3, 44, 5.6, 5) 



# 3 a


v[1]/z[1]



# 3 f

z[1]/z[3] + v[4] - z[8]




## Questão 2 - Lista 2

# bibliotecas


library(optimx)



## dados


x = c(1, 2, 4, 8, 5, 4, 6, 8, 3, 1, 5, 6, 3, 1.1, 7, 0.9, 1, 3, 4, 7, 8)
y = c(0, 1, 3, 1, 3, 4, 6.6, 8, 1, 4.1, 6, 7, 4, 3.6, 5, 3, 1, 2, 2.2, 1, 5.7)

df = data.frame(y, x)


reg = lm(y~x)


######## QUESTÃO 2


# 2 (a)

n = length(x)



aa = sum((x-mean(x))*(y - mean(y)))
bb = sqrt(sum((x-mean(x))^2)*sum((y-mean(y))^2) )

c = aa/bb


cor(y, x)


# 2 (b)


beta = c(4, 5)


freg = function(beta, data){
  with(data,  sum( (y - beta[1] - beta[2]*x )^2 )  )  
}



freg(beta, df)


my_reg = optim(par = beta, fn = freg, data=df)



beta1 = my_reg$par[1]
beta2 = my_reg$par[2]

# 2 (c)

# y  estimado

y_hat = beta1 + beta2*x 


# erro 

epsilon = y - y_hat


# erro padrão da regressão

sig = sqrt( sum(epsilon^2) /  ( n - length(my_reg$par) ) )


# erro padrão dos betas

ep_b2 = sig /  sqrt( sum( (x - mean(x))^2 ))

ep_b1 =  sig*sqrt( sum(x^2)/ (n*sum( (x - mean(x))^2 ) ) )



# 2 (d)

# teste de hipóteses




t_beta1 = (beta1 - 0)/ ep_b1

pt(t_beta1, length(x)-2, lower.tail = F)



curve(dt(x, length(x)), xlim = c(-5, 5), ylim = c(0, 0.45))
segments(t_beta1, 0, t_beta1, dt(t_beta1, length(x)))




t_beta2 = (beta2 - 0)/ ep_b2
pt(t_beta2, length(x)-2, lower.tail = F)






# 2  (e)

t_beta = qt(0.975, length(x)-2)


ic_beta1_L = beta1 - t_beta*ep_b1 
ic_beta1_H = beta1 + t_beta*ep_b1 


ic_beta2_L = beta2 - t_beta*ep_b2 
ic_beta2_H = beta2 + t_beta*ep_b2 


#confint(reg)


qt(0.975, 11)

# 2 (f)



sum(epsilon)



# 2 (g)


SQR = sum(epsilon^2)
SQE = sum( (y_hat - mean(y))^2 )

SQT = sum( (y - mean(y))^2 )   # SQR + SQE



# 2 (h)

r_2 = SQE/SQT


1 - (SQR/SQT)



# 2 (i)


# criando os pontos da reta

x0 = 0
x1 = max(x)


y0 = my_reg$par[1] + my_reg$par[2]*x0 
y1 = my_reg$par[1] + my_reg$par[2]*x1 


plot(x, y, pch=19, cex=1.3, col='red', axes=F, main = 'My regression')
axis(side = 1, at = seq(0, 15, 1) )
axis(side = 2, at = seq(0, 15, 1) )
segments(x0 = x0, y0 = y0, x1=x1, y1=y1)


#abline(lm(y~x), df)







