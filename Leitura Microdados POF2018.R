
# see https://agenciadenoticias.ibge.gov.br/agencia-sala-de-imprensa/2013-agencia-de-noticias/releases/25598-pof-2017-2018-familias-com-ate-r-1-9-mil-destinam-61-2-de-seus-gastos-a-alimentacao-e-habitacao


# LEITURA E GRAVA??O DOS DADOS DA POF 2017-2018 - R

  
# "....." indica a pasta/diret?rio de trabalho no HD local separados por "/"
# onde se encontram os arquivos .txt descompactados do arquivo Dados_20200403.zip
# Exemplo: setwd("c:/POF2018/Dados_20200403")


setwd("D:/DOUTORADO/Diversos/POF/2018")



# REGISTRO - MORADOR

MORADOR <- 
  read.fwf("MORADOR.txt" 
           , widths = c(2,4,1,9,2,1,2,2,1,2,2,4,3,1,1,
                        1,1,1,2,1,2,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,2,1,1,2,1,1,2,1,1,1,
                        2,1,2,14,14,10)
           , na.strings=c(" ")
           , col.names = c("UF", "ESTRATO_POF", "TIPO_SITUACAO_REG",
                           "COD_UPA", "NUM_DOM", "NUM_UC",
                           "COD_INFORMANTE", "V0306", "V0401",
                           "V04021", "V04022", "V04023", "V0403",
                           "V0404", "V0405", "V0406", "V0407",
                           "V0408", "V0409", "V0410", "V0411",
                           "V0412", "V0413", "V0414", "V0415",
                           "V0416", "V041711", "V041712", "V041721",
                           "V041722", "V041731", "V041732","V041741",
                           "V041742", "V0418", "V0419", "V0420",
                           "V0421", "V0422", "V0423", "V0424",
                           "V0425", "V0426", "V0427", "V0428",
                           "V0429", "V0430", "ANOS_ESTUDO","PESO", 
                           "PESO_FINAL", "RENDA_TOTAL")
           , dec="."
  )   

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(MORADOR,"MORADOR.rds")
rm(MORADOR) # Libera a tabela da mem?ria


# REGISTRO - DESPESA COLETIVA

DESPESA_COLETIVA <- 
  read.fwf("DESPESA_COLETIVA.txt"
           , widths = c(2,4,1,9,2,1,2,2,7,2,4,10,2,2,1
                        ,10,1,12,10,10,1,1,2,14,14,10)
           , na.strings=c(" ")
           , col.names = c("UF", "ESTRATO_POF", "TIPO_SITUACAO_REG",
                           "COD_UPA", "NUM_DOM", "NUM_UC", "QUADRO",
                           "SEQ", "V9001", "V9002", "V9005", "V8000",
                           "V9010", "V9011", "V9012", "V1904",
                           "V1905", "DEFLATOR", "V8000_DEFLA",
                           "V1904_DEFLA", "COD_IMPUT_VALOR",
                           "COD_IMPUT_QUANTIDADE", "FATOR_ANUALIZACAO",
                           "PESO", "PESO_FINAL", "RENDA_TOTAL"
           )
           , dec="."
  )

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(DESPESA_COLETIVA,"DESPESA_COLETIVA.rds")
rm(DESPESA_COLETIVA) # Libera a tabela da mem?ria


# REGISTRO - CADERNETA COLETIVA

CADERNETA_COLETIVA <- 
  read.fwf("CADERNETA_COLETIVA.txt" 
           , widths = c(2,4,1,9,2,1,2,3,7,2,10,12,10,1,2,14,14,10,
                        9,4,5,9
           )
           , na.strings=c(" ")
           , col.names = c("UF", "ESTRATO_POF", "TIPO_SITUACAO_REG",
                           "COD_UPA", "NUM_DOM", "NUM_UC", "QUADRO",
                           "SEQ", "V9001", "V9002", "V8000", "DEFLATOR",
                           "V8000_DEFLA", "COD_IMPUT_VALOR",
                           "FATOR_ANUALIZACAO", "PESO", "PESO_FINAL",
                           "RENDA_TOTAL",
                           "V9005", "V9007", "V9009", "QTD_FINAL"
           )
           , dec="."
  )   

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(CADERNETA_COLETIVA,"CADERNETA_COLETIVA.rds")
rm(CADERNETA_COLETIVA)  # Libera a tabela da mem?ria


# REGISTRO - DESPESA INDIVIDUAL

DESPESA_INDIVIDUAL <- 
  read.fwf("DESPESA_INDIVIDUAL.txt" 
           , widths = c(2,4,1,9,2,1,2,2,2,7,2,10,2
                        ,2,1,1,1,12,10,1,2,14,14,10)
           , na.strings=c(" ")
           , col.names = c("UF", "ESTRATO_POF", "TIPO_SITUACAO_REG",
                           "COD_UPA", "NUM_DOM", "NUM_UC",
                           "COD_INFORMANTE", "QUADRO", "SEQ", "V9001",
                           "V9002", "V8000", "V9010", "V9011", "V9012",
                           "V4104", "V4105", "DEFLATOR", "V8000_DEFLA",
                           "COD_IMPUT_VALOR", "FATOR_ANUALIZACAO",
                           "PESO", "PESO_FINAL", "RENDA_TOTAL"
           )
           , dec="."
  )   

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(DESPESA_INDIVIDUAL,"DESPESA_INDIVIDUAL.rds")
rm(DESPESA_INDIVIDUAL)  # Libera a tabela da mem?ria


di =  DESPESA_INDIVIDUAL

di[substr(di$V9001, 1, 2)=='49',
                   "V9001"]


di['my_var'] = as.numeric(substr(di$V9001, 1, 2) )


table(di$my_var)

library(tidyverse)


di = tibble(di)


s = di %>%
  dplyr::filter( V8000!= 9999999.99) %>%
  group_by(my_var) %>%
  summarise(soma =  sum(V8000))

s = s %>%
  mutate(p = soma/
           sum(s$soma))

pie(s$p)





# REGISTRO - ALUGUEL ESTIMADO

ALUGUEL_ESTIMADO <- 
  read.fwf("ALUGUEL_ESTIMADO.txt" 
           , widths = c(2,4,1,9,2,1,2,7,2,10,2,2,12,10,1,2,14,14,10)
           , na.strings=c(" ")
           , col.names = c("UF", "ESTRATO_POF", "TIPO_SITUACAO_REG",
                           "COD_UPA", "NUM_DOM", "NUM_UC", "QUADRO",
                           "V9001", "V9002", "V8000", "V9010", "V9011",
                           "DEFLATOR", "V8000_DEFLA", "COD_IMPUT_VALOR",
                           "FATOR_ANUALIZACAO", "PESO", "PESO_FINAL",
                           "RENDA_TOTAL"
           )
           , dec="."
  )   

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(ALUGUEL_ESTIMADO,"ALUGUEL_ESTIMADO.rds")
rm(ALUGUEL_ESTIMADO)  # Libera a tabela da mem?ria


# REGISTRO - RENDIMENTO DO TRABALHO

RENDIMENTO_TRABALHO <- 
  read.fwf("RENDIMENTO_TRABALHO.txt" 
           , widths = c(2,4,1,9,2,1,2,2,1,1,7,1,1,1,1,1,1,7,7,7
                        ,7,2,2,3,1,12,10,10,10,10,1,1,14,14,10)
           , na.strings=c(" ")
           , col.names = c("UF", "ESTRATO_POF", "TIPO_SITUACAO_REG",
                           "COD_UPA", "NUM_DOM", "NUM_UC",
                           "COD_INFORMANTE", "QUADRO", "SUB_QUADRO",
                           "SEQ", "V9001", "V5302", "V53021", "V5303",
                           "V5304", "V5305", "V5307", "V8500", "V531112",
                           "V531122", "V531132", "V9010", "V9011",
                           "V5314", "V5315", "DEFLATOR", "V8500_DEFLA",
                           "V531112_DEFLA", "V531122_DEFLA",
                           "V531132_DEFLA", "COD_IMPUT_VALOR",
                           "FATOR_ANUALIZACAO", "PESO", "PESO_FINAL",
                           "RENDA_TOTAL"
           )
           , dec="."
  )

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(RENDIMENTO_TRABALHO,"RENDIMENTO_TRABALHO.rds")
rm(RENDIMENTO_TRABALHO)  # Libera a tabela da mem?ria


# REGISTRO - OUTROS RENDIMENTOS

OUTROS_RENDIMENTOS <- 
  read.fwf("OUTROS_RENDIMENTOS.txt" 
           , widths = c(2,4,1,9,2,1,2,2,2,7,10,10,2
                        ,2,12,10,10,1,1,14,14,10
           )
           , na.strings=c(" ")
           , col.names = c("UF", "ESTRATO_POF", "TIPO_SITUACAO_REG",
                           "COD_UPA", "NUM_DOM", "NUM_UC",
                           "COD_INFORMANTE", "QUADRO", "SEQ", "V9001",
                           "V8500", "V8501", "V9010", "V9011",
                           "DEFLATOR", "V8500_DEFLA", "V8501_DEFLA",
                           "COD_IMPUT_VALOR", "FATOR_ANUALIZACAO",
                           "PESO", "PESO_FINAL", "RENDA_TOTAL")
           , dec="."
  )   

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(OUTROS_RENDIMENTOS,"OUTROS_RENDIMENTOS.rds")
rm(OUTROS_RENDIMENTOS)  # Libera a tabela da mem?ria


# REGISTRO - DOMICILIO

DOMICILIO <- 
  read.fwf("DOMICILIO.txt" 
           , widths = c(2,4,1,9,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,2,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,14,14
           )
           , na.strings=c(" ")
           , col.names = c("UF", "ESTRATO_POF", "TIPO_SITUACAO_REG",
                           "COD_UPA", "NUM_DOM", "V0201", "V0202", 
                           "V0203", "V0204", "V0205", "V0206", "V0207",
                           "V0208", "V0209", "V02101", "V02102",
                           "V02103", "V02104", "V02105", "V02111",
                           "V02112", "V02113", "V0212", "V0213",
                           "V02141", "V02142", "V0215", "V02161", 
                           "V02162", "V02163", "V02164", "V0217", 
                           "V0219", "V0220", "V0221", "PESO",
                           "PESO_FINAL"
           )
           , dec="."
  )   

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(DOMICILIO,"DOMICILIO.rds")
rm(DOMICILIO)  # Libera a tabela da mem?ria





# REGISTRO - INVENTÁRIO BENS DURÁVEIS

INVENTARIO <- 
  read.fwf("INVENTARIO.txt" 
           , widths = c(2,4,1,9,2,1,2,2,7,2,2,4,1,14,14,10
           )
           , na.strings=c(" ")
           , col.names = c("UF", "ESTRATO_POF", "TIPO_SITUACAO_REG",
                           "COD_UPA", "NUM_DOM", "NUM_UC", "QUADRO", 
                           "SEQ", "V9001", "V9005", "V9002", "V1004",
                           "V9012", "PESO", "PESO_FINAL", "RENDA_TOTAL"
           )
           , dec="."
  )   

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(INVENTARIO,"INVENTARIO.rds")
rm(INVENTARIO)  # Libera a tabela da mem?ria

