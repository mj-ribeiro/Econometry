# Monitoria de econometria - 1
# aula 13

setwd('D:/Git projects/Econometry')   # definir o diretorio



# UF	Unidade da Federacao
# V2007	Sexo
# V2009	Idade do morador na data de refer?ncia
# V2010	Cor ou raca
# V3007	Ja concluiu algum outro curso de gradua??o?
# VD3001	Nivel de instru??o mais elevado alcan?ado (pessoas de 5 anos ou mais de idade)
# VD4001	Condicao em rela??o ? for?a de trabalho na semana de refer?ncia para pessoas de 14 anos ou mais de idade
# VD4002	Condicao de ocupacao na semana de refer?ncia para pessoas de 14 anos ou mais de idade
# VD4020	Rendimento mensal efetivo de todos os trabalhos para pessoas de 14 anos ou mais de idade (apenas para pessoas que receberam em dinheiro, produtos ou mercadorias em qualquer trabalho)
# VD4035	Horas efetivamente trabalhadas na semana de refer?ncia em todos os trabalhos para pessoas de 14 anos ou mais de idade




library(PNADcIBGE)



vars = c('UF', 'V2007', 'V2009', 'V2010', 'V3007',
         'VD3001', 'VD4001', 'VD4002', 'VD4020',
         'VD4035', 'V3003A')






dados_pnad = get_pnadc(year = 2020,
                       quarter = 1,
                       vars = vars)

dados = dados_pnad[['variables']]



## Renda media por estado ----

head(dados)


fat = factor(dados$UF)

r_uf = by(dados$VD4020, fat, mean, na.rm=T)


r_uf[order(r_uf, decreasing = T)]



by(dados$VD4020, fat, summary)


# Renda e  Escolaridade ----

table(dados$V3003A)

prop.table(table(dados$V3003A))


fat2 = factor(dados$V3003A)


r_esc = by(dados$VD4020, fat2, mean, na.rm=T)

r_esc[order(r_esc, decreasing = T)]



by(dados$VD4020, fat2, summary)



# Numero de horas trabalhadas ---- 


hist(dados$VD4035, main = 'Numero de horas trabalhadas',
     xlab = 'Número de horas trabalhadas', 
     col='lightgreen', 
     breaks = 55)


summary(dados$VD4035)


plot(dados$VD4035, dados$VD4020)




## regressao ----

table(dados$V2010)


reg = lm(VD4020 ~ V2010 + V2009 - 1, data = dados)
summary(reg)



# Gini ---- 


# install.packages('survey')

library(survey)
library(convey)


dados_pnad = convey_prep(dados_pnad)


gini_bra = svygini(~VD4020, dados_pnad, na.rm=TRUE)





# Gini por estado ---- 


gini_uf = svyby(~VD4020, by=~UF,  dados_pnad, svygini,  na.rm=TRUE)


pos2 = order(gini_uf[,2], decreasing = T)

gini_uf[pos2, ]


# Curva de Lorenz

lorenz = svylorenz(~VD4020, dados_pnad, quantiles= seq(0, 1, 0.05), na.rm=T)
















