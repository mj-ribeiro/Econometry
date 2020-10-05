# Monitoria de econometria - 1
# aula 7


setwd('D:/Git projects/Econometry')   # definir o diretório




# see https://datahelpdesk.worldbank.org/knowledgebase/articles/201175-how-does-the-world-bank-code-its-indicators





v = c(0, 1)

c = 0

n = 10000


for(i in 1:n){
  if(sample(v, 1)==0){
  c = c + 1
  print('cara')
}else{
  print('coroa')
}}


cat('A proporção de caras é:', c/n)



### recursividade


p_t0 = 1 

p_t1 = c()


n = 100

for(i in 1:n){
  p_t1[i] = p_t0 + rnorm(1, 0, 1)
  p_t0 = p_t1
}


plot(p_t1, type='l')




### o Nan ATACA novamente



vec = c(1, 4, 5, 7, 12, 4.5, 3, NaN)

mv = mean(vec, na.rm = T)

mv 

ifelse(is.na(vec)==T, mv, vec)



## while

x = 6

while(x){
  print(x)
  x = x - 1
  if(x==3){
    break
  }
}



### funções


fx = function(x, y=0){
  x^2 + y
}


fx(4, 1)




### print

fp = function(x){
  for (i in 1:x) {
    print('Olá mundo!')
  }
}


fp(100)




## função binária


bin = function(x){
  if(x>=1){
    return(0)
  }else{
  return(1)
}
}


bin(0.4)




### API


#install.packages('wbstats')

library(wbstats)


df = wb(indicator = 'BX.KLT.DINV.WD.GD.ZS', startdate = 2000, enddate = 2016)





### Bovespa


library(quantmod)


ibov = getSymbols('^BVSP', src = 'yahoo',
                  from = '1999-01-01',
                  to = '2020-05-01',
                  periodicity= 'monthly',
                  auto.assign = F)[,4]


colnames(ibov) = 'ibov'

summary(ibov)


plot(ibov)




bb = getSymbols('BBAS3.SA', src = 'yahoo',
                  from = '1999-01-01',
                  to = '2020-05-01',
                  periodicity= 'monthly',
                  auto.assign = F)[,4]







### banco central 


library(GetBCBData)

cb = gbcbd_get_series(11768, first.date = '2000-01-01',
                      last.date = '2020-05-01', 
                      format.data = 'long', 
                      be.quiet = F)[,1:2]


plot(cb, type='l')



### IPEA


library(ipeadatar)

embi = ipeadata(c('JPM366_EMBI366'))[,2:3]

plot(embi, type='l')





















