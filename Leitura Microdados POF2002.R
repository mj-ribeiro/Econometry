
###########################################################################
# Leitura Microdados POF 2002 ---------------------------------------------


## Download the data archives from IBGE's site (extension .txt available):
    ## https://www.ibge.gov.br/estatisticas/sociais/educacao/24786-pesquisa-de-orcamentos-familiares-2.html?edicao=25578&t=microdados
## After that, save in the working directory, and run the code. 
## It will save datasets in an .rds extension.


## NOTE: The columns names were adapted (such as possible), to the code names used in POF 2018 survey





# Working Directory -------------------------------------------------------

setwd("C:/Users/udiza/OneDrive/Área de Trabalho/Disciplinas 2020.01/Thesis Research/POF 2017-2018/POF2002") 



# Registro Morador --------------------------------------------------------

MORADOR <- 
    read.fwf("T_MORADOR.txt",
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 1, 1, 1, 2, 2, 4, 3, 7, 6, 
                        1, 2, 2, 2, 1, 3, 10, 10, 1, 1, 1, 1, 1, 2, 12, 1, 5, 5, 3),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM", 
                           "NUM_UC", "ESTRATO", "PESO", "PESO_FINAL", 
                           "COD_INFORMANTE", "V0306", "V0401", "V0404", 
                           "V04021", "V04022", "V04023", "V0403", 
                           "IDADE_DIA", "IDADE_MES", 
                           "COD_FREQ_ESCOLA", "COD_NIVEL_INSTR", "SERIO_FREQUENTA",  
                           "ANOS_ESTUDO", "V0405", "COD_RELIGIAO", "PESO_ORIGINAL", 
                           "ALTURA_REGIONAL", "ORCAMENTO_DESPESA", "ORCAMENTO_RENDIMENTO",
                           "COD_TEM_CARTAO", "COD_TEM_CHEQUE", "COD_EHTITULAR_PLANO", 
                           "PLANO_BENEFICARIOS", "RENDA_TOTAL", "COD_IMPUT_VALOR", 
                           "PESO_IMPUTADO", "ALTURA_IMPUTADO", "RESTRICAO_USO"), 
             dec = "." )

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(MORADOR,"MORADOR.rds")
rm(MORADOR) # Libera a tabela da memória



# Inventário de Bens Duráveis ---------------------------------------------

INVENTARIO <- 
    read.fwf("T_INVENTARIO.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11,
                        2, 5, 4, 2, 1, 2, 12, 1), 
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM", 
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "QUADRO", "V9001", "V9005", "V1404", "V9012", 
                           "V9002", "RENDA_BRUTA_MONETARIA", "COD_IMPUT_VALOR"),
             dec = "," )

saveRDS(INVENTARIO, "INVENTARIO.rds")


# Despesas de 90 Dias -----------------------------------------------------

DESPESAS_90_DIAS <- 
    read.fwf("T_DESPESA_90DIAS.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 5, 5, 11,
                        1, 2, 16, 12, 1, 5, 5, 1, 5),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM", 
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "QUADRO", "V9001", "COD_LOCAL_COMPRA", "V8000",
                           "V9002", "FATOR_ANUALIZACAO", "V8000_DEFLA",
                           "RENDA_TOTAL", "COD_IMPUT_VALOR", "DEFLATOR",
                           "QUANTIDADE", "COD_IMPUT_QUATD", "QUATD_IMPUT"), 
             dec = "," )

saveRDS(DESPESAS_90_DIAS, "DESPESA_90_DIAS.rds")



# Despesas de 12 Meses ----------------------------------------------------

DESPESA_12_MESES <- 
    read.fwf("T_DESPESA_12MESES.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 5, 5, 11, 2, 
                        1, 2, 16, 12, 1, 5),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL",
                           "QUADRO", "V9001", "COD_LOCAL_COMPRA",  "V8000", "V9011", 
                           "V9002", "FATOR_ANUALIZACAO", "V8000_DEFLA",
                           "RENDA_TOTAL", "COD_IMPUT_VALOR", "DEFLATOR"),
             dec = "," )

saveRDS(DESPESA_12_MESES, "DESPESA_12_MESES.rds")



# Outras Despesas ---------------------------------------------------------

OUTRAS_DESPESAS <- 
    read.fwf( "T_OUTRAS_DESPESAS.txt", 
              widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 5, 5, 1, 11,
                         1, 2, 16, 12, 1, 5),
              na.strings = c(" "), 
              col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                            "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL",
                            "QUADRO", "V9001", "COD_LOCAL_COMPRA", "V9012", "V8000", 
                            "V9002", "FATOR_ANUALIZACAO", "V8000_DEFLA",
                            "RENDA_TOTAL", "COD_IMPUT_VALOR", "DEFLATOR"), 
              dec = "," )

saveRDS(OUTRAS_DESPESAS, "OUTRAS_DESPESAS.rds")




# Domicílio ---------------------------------------------------------------

DOMICILIO <- 
    read.fwf("T_domicilio.txt", 
             widths = c(2, 2, 3, 1, 2, 2, 11, 11, 2, 2, 2, 1, 2, 2, 2,
                        1, 1, 1, 1, 1, 1, 1, 1, 1, 12), 
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "ESTRATO_POF", "PESO", "PESO_FINAL",
                           "PERIODO_TEORICO", "PERIODO_REAL", "QUANTD_MORADORES", 
                           "TIPO_DOMICILIO", "QUANTD_COMODOS", "DORMITORIOS", "BANHEIROS", 
                           "ABAST_AGUA", "ESC_SANITARIO", "OCUPACAO_DOM", "ORIGEM_ELETRIC", 
                           "PISO", "PAV_RUA", "TEMPO_MORADIA", "QUANTD_UC", "CONTRATO", 
                           "RENDA_TOTAL"), 
             dec = ",")

saveRDS(DOMICILIO, "DOMICILIO.rds")


# Despesas com Serviços Domésticos ----------------------------------------

DESPESAS_SERVICOS_DOMESTICOS <- 
    read.fwf("T_SERVICO_DOMS.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 5, 11, 11, 1, 2, 
                        1, 2, 16, 16, 12, 1, 1, 5),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "QUADRO", "V9001", "V8000", "V1904", 
                           "COD_ESPECIE", "V9011", "V9002", 
                           "FATOR_ANUALIZACAO", "V8000_DEFLA_ANUAL", 
                           "V1904_DEFLA_ANUAL", "RENDA_TOTAL",
                           "COD_IMPUT_VALOR", "COD_IMPUT_INSS", "DEFLATOR"), 
             dec = "," )

saveRDS(DESPESAS_SERVICOS_DOMESTICOS, "DESPESAS_SERVICOS_DOMESTICOS.rds")


# Caderneta Coletiva ------------------------------------------------------

CADERNETA_COLETIVA <- 
    read.fwf("T_CADERNETA_DESPESA.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 2, 5, 5, 
                        16, 5, 5, 11, 1, 2, 8, 16, 12, 1, 5),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM", 
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "QUADRO", "NUM_GRUPO", "V9001", 
                           "COD_LOCAL_COMPRA", "QUANTIDADE", "UNIDADE_MEDIDA", 
                           "PESO_VOLUME", "V8000", "V9002", 
                           "FATOR_ANUALIZACAO", "QUANTD_KG", "V8000_DEFLA_ANUAL", 
                           "RENDA_TOTAL", "COD_IMPUT_VALOR", "DEFLATOR" ), 
             dec = "," )

saveRDS(CADERNETA_COLETIVA, "CADERNETA_COLETIVA.rds")


# Despesas Individuais ----------------------------------------------------

DESPESAS_INDIVIDUAIS <- 
    read.fwf("T_DESPESA.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 2, 5, 5, 11, 1,
                        2, 16, 12, 1, 5, 5, 5, 5, 1, 1),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "COD_INFORMANTE", "QUADRO", "V9001", 
                           "COD_LOCAL_COMPRA", "V8000", "V9002", "FATOR_ANUALIZACAO", 
                           "V8000_DEFLA", "RENDA_TOTAL", "COD_IMPUT_VALOR", "DEFLATOR",
                           "QUANTIDADE", "UNIDADE_MEDIDA", "PESO_VOLUME", "ORIGEM", 
                           "CARACTERISTICA"), 
             dec = "," )

saveRDS(DESPESAS_INDIVIDUAIS, "DESPESAS_INDIVIDUAIS.rds")


# Despesas com Veículos ---------------------------------------------------

DESPESAS_VEICULOS <- 
    read.fwf("T_DESPESA_VEICULO.txt",
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 2, 5, 5, 1, 
                        11, 1, 2, 16, 12, 1, 5),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "COD_INFORMANTE", "QUADRO", "V9001", 
                           "COD_LOCAL_COMPRA", "V9012", "V8000", "V9002", 
                           "FATOR_ANUALIZACAO", "V8000_DEFLA_ANUAL", 
                           "RENDA_TOTAL", "COD_IMPUT_VALOR", "DEFLATOR"),
             dec = "," )

saveRDS(DESPESAS_VEICULOS, "DESPESAS_VEICULOS.rds")



# Rendimentos e Deduções --------------------------------------------------

RENDIMENTOS <- 
    read.fwf("T_RENDIMENTOS.txt",
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 2, 2, 1, 11, 1, 11,
                        11, 11, 2, 2, 16, 16, 16, 16, 12, 1, 5, 8, 8, 1),
             na.strings = c(" "),
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "COD_INFORMANTE", "QUADRO", "V5302", 
                           "COD_RENDIMENTO", "V8500", "COD_DEDUCAO", 
                           "V531112", "V531122", "V531132", "V9011", 
                           "FATOR_ANUALIZACAO", "V8500_DEFLA_ANUAL", 
                           "V531112_DEFLA", "V531122_DEFLA", "V531132_DEFLA", 
                           "RENDA_TOTAL", "COD_IMPUT_VALOR", "DEFLATOR", 
                           "OCUPACAO", "ATIVIDADE", "TIPO_TRABALHO"),
             dec = "," )

saveRDS(RENDIMENTOS, "RENDIMENTOS.rds")




# Outros Rendimentos ------------------------------------------------------

OUTROS_RENDIMENTOS <- 
    read.fwf("T_OUTROS_RECI.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 2, 5, 11, 11, 2, 2,
                        16, 16, 12, 1, 5),
             na.strings = c(" "),
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "COD_INFORMANTE", "QUADRO", "V9001", "V8500", 
                           "V8501", "V9011", "FATOR_ANUALIZACAO", 
                           "V8500_DEFLA_ANUAL", "V8501_DEFLA_ANUAL",
                           "RENDA_TOTAL", "COD_IMPUT_VALOR", "DEFLATOR"),
             dec = "," )

saveRDS(OUTROS_RENDIMENTOS, "OUTROS_RENDIMENTOS.rds")




# Despesas Individuais ----------------------------------------------------

DESPESAS_INDIVIDUAIS_ESP <- 
    read.fwf("T_DESPESA_ESP.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 11, 11, 2, 2, 5, 5, 11, 1,
                        2, 16, 12, 1, 5, 5, 5, 5, 1, 1),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "COD_INFORMANTE", "QUADRO", "V9001", 
                           "COD_LOCAL_COMPRA", "V8000", "V9002", "FATOR_ANUALIZACAO", 
                           "V8000_DEFLA", "RENDA_TOTAL", "COD_IMPUT_VALOR", "DEFLATOR",
                           "QUANTIDADE", "UNIDADE_MEDIDA", "PESO_VOLUME", "ORIGEM", 
                           "CARACTERISTICA"), 
             dec = "," )

saveRDS(DESPESAS_INDIVIDUAIS, "DESPESAS_INDIVIDUAIS.rds")








































