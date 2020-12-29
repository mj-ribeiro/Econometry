# Monitoria de econometria - 1
# aula 12

setwd('D:/Git projects/Econometry')   # definir o diret?rio



# UF	Unidade da Federacao
# V2007	Sexo
# V2009	Idade do morador na data de referencia
# V2010	Cor ou raca
# V3007	Ja concluiu algum outro curso de gradua??o?
# VD3001	Nivel de instrucao mais elevado alcancado (pessoas de 5 anos ou mais de idade)
# VD4001	Condicao em relacao a forca de trabalho na semana de referencia para pessoas de 14 anos ou mais de idade
# VD4002	Condicao de ocupacao na semana de referencia para pessoas de 14 anos ou mais de idade
# VD4020	Rendimento mensal efetivo de todos os trabalhos para pessoas de 14 anos ou mais de idade (apenas para pessoas que receberam em dinheiro, produtos ou mercadorias em qualquer trabalho)
# VD4035	Horas efetivamente trabalhadas na semana de referencia em todos os trabalhos para pessoas de 14 anos ou mais de idade




library(PNADcIBGE)



vars = c('UF', 'V2007', 'V2009', 'V2010', 'V3007',
         'VD3001', 'VD4001', 'VD4002', 'VD4020',
         'VD4035', 'V3003A')



dados_pnad = get_pnadc(year=2020, quarter = 1,  vars = vars)

dados = dados_pnad[['variables']]




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


## raca

table(dados$V2010)
prop.table(table(dados$V2010))*100



## raca e genero


table(dados$V2007,dados$V2010 )
prop.table(table(dados$V2007,dados$V2010 ))*100



## diferenca salarial por genero


mean(dados[dados$V2007=='Mulher', 'VD4020'], na.rm = T)

mean(dados[dados$V2007=='Homem', 'VD4020'], na.rm = T)


## diferenca salarial por raca

mean(dados[dados$V2010=='Branca', 'VD4020'], na.rm = T)

mean(dados[dados$V2010=='Parda', 'VD4020'], na.rm = T)

mean(dados[dados$V2010=='Ind?gena', 'VD4020'], na.rm = T)

mean(dados[dados$V2010=='Preta', 'VD4020'], na.rm = T)


## diferenca salarial por genero e  raca


mean(dados[dados$V2010=='Branca' & dados$V2007=='Mulher', 'VD4020'], na.rm = T)

mean(dados[dados$V2010=='Branca' & dados$V2007=='Homem', 'VD4020'], na.rm = T)

mean(dados[dados$V2010=='Parda' & dados$V2007=='Homem', 'VD4020'], na.rm = T)



## tx de desocupacao

des = ifelse(dados$VD4002=='Pessoas desocupadas', 1, 0)

ocup = ifelse(dados$VD4001=='Pessoas na força de trabalho', 1, 0)


tx_des = sum(des, na.rm = T)/sum(ocup, na.rm = T)



## renda por estado

fat = factor(dados$UF)

r_uf = by(dados$VD4020, fat, mean, na.rm=T)


by(dados$VD4020, fat, summary)



r_uf[order(r_uf, decreasing = T) ]





## escolaridade

table(dados$V3003A)

prop.table(table(dados$V3003A))


fat2 = factor(dados$V3003A)


r_esc = by(dados$VD4020, fat2, mean, na.rm=T)

r_esc[order(r_uf, decreasing = T) ]



by(dados$VD4020, fat2, summary)




# plots 

hist(dados$VD4035, main = "Histograma",
        xlab = "Numero de Horas Trabalhadas")



## regressão:  renda idade raca


reg = lm(VD4020 ~  V2010 + V2009, data = dados)
summary(reg)



# Gini 


library(survey)
library('convey')


dados_pnad = convey_prep(dados_pnad)


giniHab =  svygini(~VD4020, dados_pnad, na.rm  =  TRUE)
giniHab



# gini por estado


giniUF = svyby(~VD4020, by = ~UF, dados_pnad, svygini, na.rm  =  TRUE)

pos2= order(giniUF[,2], decreasing = T)

giniUF[pos2, ]



# curva de Lorenz

lorenz =  svylorenz(~VD4020, dados_pnad, quantiles = seq(0, 1, .05), na.rm  =  TRUE)



























































