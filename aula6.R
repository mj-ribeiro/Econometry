# Monitoria de econometria - 1
# aula 6


setwd('D:/Git projects/Econometry')   # definir o diretório

windows()

curve(dnorm(x, 0, 1), xlim =c(-5, 5))
abline(v=0)
points(2, dnorm(2), col='red', cex=2, pch=19)
text(-1, 0.1, '50%')




pnorm(0, 0, 1)


pnorm(0.11, 0, 1)

pnorm(0.53, 0, 1)




### quantil


qnorm(0.5, 0, 1)

qnorm(0.6, 0, 1)


### gerador de números aleatórios

set.seed(10)
hist( rnorm(100000, mean = 0, sd=1), breaks = 25, col='lightgreen' )



set.seed(11)
rnorm(5)


dnorm(2, 0, 1)

dnorm(0, 0, 1)



######

# d - densidade
# q - quantil
# r - random
# p - probability



### Poison

1 - ppois(0, lambda = 0.5)

##   np = lambda

ppois(1, lambda = 1)



#### quantil

qpois(0.5, 100)




### densidade


curve(dpois(x, 100), xlim = c(0, 200))
abline(v =qpois(0.5, 100) )



## números aleatórios



hist( rpois(2000, lambda = 10), col='lightblue', breaks = 25, probability = T)




### condicionais


x = rbinom(1, 1, 0.5)

# x =0  cara, x=1 coroa



if(x == 0){
  cat('cara')
}else{
  cat('coroa')
}




name = 'jonas'

if(name=='Marcos'){
  cat('Olá', name)
}else{
  cat('Olá desconhecido')
}



## loops


for (i in 1:10) {
  
  print('olá mundo')
  
}



## valor de i


for (i in 1:10) {
  cat('i = ', i, '\n')
}



v = c(3, 5, 6, 7)

n = length(v)


for (i in 1:n) {
  cat('v = ', v[i], '\n')
}





names = c('ana', 'jonas', 'maria', 'joãozinho')

for (i in names) {
  cat(i, '\n')
}



for (i in 1:length(names)) {
  cat(names[i], '\n')
}





## contadores


c = 0

for (i in 1:10) {
  c = c + 1
  cat('c =', c, '\n')
}




##  acumuladores


soma = 0
a = 12

for (i in 1:10) {
  soma = a + soma
  cat('soma =', soma, '\n')
}



### condicionais e loops


for(i in 1:10){
  k = rnorm(1)
  
  if(k>0){
    print('k é maior que zero')
  }else{
    print('k é menor que zero')
  }
}




## while

n = 0
  
while(n<100){
  print('olá mundo')
  n = n + 1
}






while(TRUE){
  print('Olá')
}






























































































































