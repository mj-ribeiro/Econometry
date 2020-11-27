
setwd("D:/pnad2015/Dados")  # definir diretório de trabalho


# baixe a pnad do ano que quiser  no link abaixo

#https://www.ibge.gov.br/estatisticas/sociais/populacao/9127-pesquisa-nacional-por-amostra-de-domicilios.html?=&t=downloads


# aqui utilizo a de 2015


### ASSIM FUNCIONA

# o dicionario e o arquivo de dados de pessoas tem que estar no diretorio definido

dir()


# o dicionario em R esta na pasta leitura em R. Copie esse arquivo para seu diretorio
load('dicPNAD2015.Rdata')


#vou modificar uma vaiavel do dicionario
dicpes2015[dicpes2015$cod2=='V0102', 'tamanho2' ] = 6 # tenho que fazer isso pois duas variaveis comecam na mesma posicao


# o widths vai ser o tamanho da variavel no comando read.fwf
# isso demora rodar 

pes2015 <- read.fwf(file = "PES2015.txt", widths = dicpes2015$tamanho2 )


# o nome das variaveis que estao no dicionario
colnames(pes2015) = dicpes2015$cod2


# Salvar o arquivo em rds 
saveRDS(pes2015, file='pnad.rds')









