

setwd('D:/Git projects/Econometry')   # definir o diretório



# seq

seq(1, 10, 1) 

seq(1, 10, 2) 

seq(10, 1, -2)


# rep

rep(10, 5)

rep('Olá mundo', 100)



rep(c(1, 2), 5)


rep(c(1, 2, 3), c(3, 2, 1))


# vectors

vec = c(2, 22, 34, 0, 67, 3, 4, 6,7, 80)


sqrt(vec)
sin(vec)
log(vec, base=10)
cos(vec)

vec + 4

2*vec

vec^(1/3)



mean(vec)
sd(vec)

summary(vec)




### strings


vec1 = c('b', 'nn', 'k')

typeof(vec1)


vec2 = c(1, 'f', 'm', 'olá')

typeof(vec2)



## Slicing 


vec  

vec[5]


vec[-10]


vec[1:3]

vec[c(1, 3, 5)]

vec[-2:-4]




vec

vec[vec>6]

vec[vec==80]

vec[vec<10]

vec[vec<0]



## Operations with vectors 



x = c(1, 5, 6, 7, 8)

y = c(33, 4, 41, 7, 11)


length(x) #


x + y

x/y

x*y

x-y


x>y

x!=y

x == y



z = c(11, 2)


y + z   # error



# Not a number

vec3 = c(NaN, 3, 4, 6, 7, 8)

mean(vec3, na.rm = T)   # first

sd(vec3, na.rm=T)

summary(vec3)


index = is.na(vec3) == FALSE   # second 

vec3[index]




### Matrix


d = seq(1, 20, 1)


A1 = matrix(d, nrow=4, ncol =5)


A1



f = c('a', 'b', 'c')

t = rep(f, 3)

A2 = matrix(t, 3, 3)

A2



# names 


c1 = seq(1, 5, 1)
c2 = rnorm(5)
c3 = seq(-44, -40, 1)

C = rbind(c1, c2, c3)

nr = c('a', 'b', 'c')
nc = c('c1', 'c2', 'c3', 'c4', 'c5')

colnames(C) = nc
rownames(C) = nr


C['a', 'c1']

C['c', 'c4']

C[1, 4]



# Linear regression


x1 = c(2, 1, 5, 7, 8, 0, 2, 1)
x2 = c(11, 2, 4, 5, 78, 1, 2, 9)

x = cbind(x1, x2)

x 

y = c(1, 5, 2, 3, 7, 32, 2, 0)

y

install.packages('matlib')

library(matlib)


b = inv(t(x)%*%x)%*%t(x)%*%y

b 


reg = lm(y ~ x1 + x2 - 1)
summary(reg)

b














