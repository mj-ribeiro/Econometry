# Monitoria de econometria - 1
# aula 12

setwd('D:/Git projects/Econometry')   # definir o diret�rio



# UF	Unidade da Federa��o
# V2007	Sexo
# V2009	Idade do morador na data de refer�ncia
# V2010	Cor ou ra�a
# V3007	J� concluiu algum outro curso de gradua��o?
# VD3001	N�vel de instru��o mais elevado alcan�ado (pessoas de 5 anos ou mais de idade)
# VD4001	Condi��o em rela��o � for�a de trabalho na semana de refer�ncia para pessoas de 14 anos ou mais de idade
# VD4002	Condi��o de ocupa��o na semana de refer�ncia para pessoas de 14 anos ou mais de idade
# VD4020	Rendimento mensal efetivo de todos os trabalhos para pessoas de 14 anos ou mais de idade (apenas para pessoas que receberam em dinheiro, produtos ou mercadorias em qualquer trabalho)
# VD4035	Horas efetivamente trabalhadas na semana de refer�ncia em todos os trabalhos para pessoas de 14 anos ou mais de idade




library(PNADcIBGE)



vars = c('UF', 'V2007', 'V2009', 'V2010', 'V3007',
         'VD3001', 'VD4001', 'VD4002', 'VD4020',
         'VD4035')


dados = get_pnadc(year=2020, quarter = 1, vars = vars)

dados = dados[['variables']]



## renda total

m_renda = mean(dados$VD4020, na.rm = T)

tot_renda = sum(dados$VD4020, na.rm = T)

summary(dados$VD4020)


quantile(dados$VD4020, probs = c(0.1, 0.25, 0.5, 0.75, 0.9,
                                 0.99, 0.9999), na.rm=T)


hist(dados$VD4020, breaks = 100, col='lightblue')



## quantidade de homens e mulheres

table(dados$V2007)

prop.table(table(dados$V2007))


## ra�a

table(dados$V2010)
prop.table(table(dados$V2010))*100



## ra�a e g�nero


table(dados$V2007,dados$V2010 )
prop.table(table(dados$V2007,dados$V2010 ))*100



## diferen�a salarial por g�nero


mean(dados[dados$V2007=='Mulher', 'VD4020'], na.rm = T)

mean(dados[dados$V2007=='Homem', 'VD4020'], na.rm = T)


## diferen�a salarial por ra�a

mean(dados[dados$V2010=='Branca', 'VD4020'], na.rm = T)

mean(dados[dados$V2010=='Parda', 'VD4020'], na.rm = T)

mean(dados[dados$V2010=='Ind�gena', 'VD4020'], na.rm = T)

mean(dados[dados$V2010=='Preta', 'VD4020'], na.rm = T)


## diferen�a salarial por g�nero e  ra�a


mean(dados[dados$V2010=='Branca' & dados$V2007=='Mulher', 'VD4020'], na.rm = T)

mean(dados[dados$V2010=='Branca' & dados$V2007=='Homem', 'VD4020'], na.rm = T)

mean(dados[dados$V2010=='Parda' & dados$V2007=='Homem', 'VD4020'], na.rm = T)



## tx de desocupa��o

des = ifelse(dados$VD4002=='Pessoas desocupadas', 1, 0)

ocup = ifelse(dados$VD4001=='Pessoas na for�a de trabalho', 1, 0)


tx_des = sum(des, na.rm = T)/sum(ocup, na.rm = T)






































