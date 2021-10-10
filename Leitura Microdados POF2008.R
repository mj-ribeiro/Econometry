
###########################################################################
# Leitura Microdados POF 2008 ---------------------------------------------


## The data archives downloaded from IBGE's site are with extension .7z:
    ## https://www.ibge.gov.br/estatisticas/sociais/educacao/24786-pesquisa-de-orcamentos-familiares-2.html?edicao=25578&t=microdados
## Unzip every archive to obtain an extension .txt. 
## After that, save in the working directory, and run the code. 
## It will save datasets in an .rds extension.


## NOTE: The columns names were adapted (such as possible), to the code names used in POF 2018 survey


# Working Directory -------------------------------------------------------

setwd("C:/Users/udiza/OneDrive/Área de Trabalho/Disciplinas 2020.01/Thesis Research/POF 2017-2018/POF2008") 





# Registro Morador --------------------------------------------------------

MORADOR <- 
    read.fwf("T_MORADOR_S.txt",
             widths = c(2, 2, 3, 1, 2, 1, 2, 2, 14, 14,
                        2, 2, 2, 2, 2, 2, 4, 3, 6, 7,
                        2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 
                        2, 2, 2, 2, 2, 2, 2, 2, 16, 16, 
                        16, 2, 5, 5, 5, 5, 5, 5, 5, 16,
                        8, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                        2, 2, 2, 2),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM", 
                           "NUM_UC", "COD_INFORMANTE", "ESTRATO_POF", 
                           "PESO", "PESO_FINAL", "V0306",
                           "NUM_FAMILIA", "COD_COND_FAMILIA", "V0401", 
                           "V04021", "V04022", "V04023", "V0403", 
                           "IDADE_MES", "IDADE_DIA", "V0404", "V0414", 
                           "COD_FREQ_ESCOLA", "COD_CURSO_FREQ", "COD_DUR_PRIMEIRO_GRAU_EH", 
                           "COD_SERIE_FREQ", "COD_NIVEL_INSTR", "COD_DUR_PRIMEIRO_GRAU_ERA", 
                           "COD_SERIE_COM_APROVACAO", "COD_CONCLUIU_CURSO", "ANOS_ESTUDO", 
                           "V0405", "COD_SIT_RECEITA", "COD_SIT_DESPESA", "COD_TEM_CARTAO", 
                           "COD_EHTITULAR_CARTAO", "COD_TEM_CHEQUE", "COD_EHTITULAR_CONTA", 
                           "RENDA_BRUTA_MONETARIA", "RENDA_BRUTA_NAO_MONETARIA", "RENDA_TOTAL", 
                           "COD_GRAVIDA", "NUM_COMPRIMENTO", "NUM_ALTURA", "NUM_PESO", 
                           "NUM_PESO_CRIANCA", "COMPRIMENTO_IMPUTADO", "ALTURA_IMPUTADO", 
                           "PESO_IMPUTADO", "RENDA_PERCAPITA", "COD_RELIGIAO", "COD_TEM_PLANO", 
                           "COD_EHTITULAR", "COD_NUM_DEPENDENTE", "COD_UNID_CONSUMO", 
                           "TEVE_NECESSIDADE_MEDICAMENTO", "PRECISOU_ALGUM_SERVICO", 
                           "TEMPO_GESTACAO", "COD_AMAMENTANDO", "COD_LEITE_MATERNO", 
                           "COD_OUTRO_ALIMENTO", "MESES_LEITE_MATERNO",
                           "COD_FREQ_ALIMENTAR", "COD_ALIMENTO_CONSUMIDO"),
             dec = "." )

# Armazena no HD local arquivo serializado para leituras futuras
saveRDS(MORADOR,"MORADOR.rds")
rm(MORADOR) # Libera a tabela da memória




# Aluguel Estimador -------------------------------------------------------

ALUGUEL_ESTIMADO <- 
    read.fwf("T_ALUGUEL_ESTIMADO_S.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 14, 14,
                        2, 5, 2, 11, 2, 2, 2, 5, 11, 
                        16, 2, 16, 16, 16), 
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM", 
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "QUADRO", "V9001", "V9002", "V8000", "V9010", 
                           "V9011", "FATOR_ANUALIZACAO", "DEFLATOR", "V8000_DEFLA", 
                           "VALOR_ANUAL_EXPANDIDO2", "COD_IMPUT_VALOR", "RENDA_BRUTA_MONETARIA", 
                           "RENDA_BRUTA_NAO_MONETARIA", "RENDA_TOTAL"), 
             dec = "," )

saveRDS(ALUGUEL_ESTIMADO, "ALUGUEL_ESTIMADO.rds")





# Caderneta Coletiva ------------------------------------------------------

CADERNETA_COLETIVA <- 
    read.fwf("T_CADERNETA_DESPESA_S.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 14, 14, 2, 2, 5, 2, 
                        11, 2, 5, 11, 16, 2, 16, 16, 16, 2, 8, 5, 
                        10, 5, 5),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM", 
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "QUADRO", "PROD_NUM_QUADR0_GRUPO_PRO", "V9001", 
                           "V9002", "V8000", "FATOR_ANUALIZACAO", "DEFLATOR", 
                           "V8000_DEFLA", "VALOR_ANUAL_EXPANDIDO2", "COD_IMPUT_VALOR", 
                           "RENDA_BRUTA_MONETARIA", "RENDA_BRUTA_NAO_MONETARIA", "RENDA_TOTAL", 
                           "METODO_QUANTKG", "QUANT_KG", "COD_LOCAL_COMPRA", "QTD_ITEM", 
                           "COD_UNIDADE_MEDIDA", "COD_PESO_VOLUME"), 
             dec = "," )

saveRDS(CADERNETA_COLETIVA, "CADERNETA_COLETIVA.rds")




# Inventário de Bens Duráveis ---------------------------------------------

INVENTARIO <- 
    read.fwf("T_INVENTARIO_S.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 14, 14,
                        2, 5, 2, 4, 1, 2, 2, 16, 16, 16), 
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM", 
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "QUADRO", "V9001", "V9005", "V1404", "V9012", 
                           "V9002", "COD_IMPUT_VALOR", "RENDA_BRUTA_MONETARIA", 
                           "RENDA_BRUTA_NAO_MONETARIA", "RENDA_TOTAL"),
             dec = "," )

saveRDS(INVENTARIO, "INVENTARIO.rds")



# Despesas de 90 Dias -----------------------------------------------------

DESPESAS_90_DIAS <- 
    read.fwf("T_DESPESA_90DIAS_S.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 14, 14, 2, 5, 2, 11,
                        2, 5, 11, 16, 2, 16, 16, 16, 4, 5, 5, 14, 2, 5),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM", 
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "QUADRO", "V9001", "V9002", "V8000",
                           "FATOR_ANUALIZACAO", "DEFLATOR", "V8000_DEFLA", 
                           "VALOR_ANUAL_EXPANDIDO2", "COD_IMPUT_VALOR", 
                           "RENDA_BRUTA_MONETARIA", "RENDA_BRUTA_NAO_MONETARIA", 
                           "RENDA_TOTAL", "QTD_ITEM", "COD_UNIDADE_MEDIDA", 
                           "COD_PESO_VOLUME", "QUANTIDADE_FINAL", "COD_IMPUT_QUANT", 
                           "COD_LOCAL_COMPRA"), 
             dec = "," )

saveRDS(DESPESAS_90_DIAS, "DESPESA_90_DIAS.rds")



# Despesas de 12 Meses ----------------------------------------------------

DESPESA_12_MESES <- 
    read.fwf("T_DESPESA_12MESES_S.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 14, 14, 2, 5, 2, 11, 2, 
                        2, 2, 5, 11, 16, 2, 16, 16, 16, 5),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL",
                           "QUADRO", "V9001", "V9002", "V8000", "V9010", 
                           "V9011", "FATOR_ANUALIZACAO", "DEFLATOR", "V8000_DEFLA",
                           "VALOR_ANUAL_EXPANDIDO2", "COD_IMPUT_VALOR", 
                            "RENDA_BRUTA_MONETARIA", "RENDA_BRUTA_NAO_MONETARIA", 
                            "RENDA_TOTAL", "COD_LOCAL_COMPRA"),
             dec = "," )

saveRDS(DESPESA_12_MESES, "DESPESA_12_MESES.rds")




# Outras Despesas ---------------------------------------------------------

OUTRAS_DESPESAS <- 
    read.fwf( "T_OUTRAS_DESPESAS_S.txt", 
              widths = c(2, 2, 3, 1, 2, 1, 2, 14, 14, 2, 5, 2, 11, 1,
                         2, 5, 11, 16, 2, 16, 16, 16, 5),
              na.strings = c(" "), 
              col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                            "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL",
                            "QUADRO", "V9001", "V9002", "V8000", "V9012",
                            "FATOR_ANUALIZACAO", "DEFLATOR", "V8000_DEFLA",
                            "VALOR_ANUAL_EXPANDIDO2", "COD_IMPUT_VALOR", 
                            "RENDA_BRUTA_MONETARIA", "RENDA_BRUTA_NAO_MONETARIA", 
                            "RENDA_TOTAL", "COD_LOCAL_COMPRA" ), 
              dec = "," )

saveRDS(OUTRAS_DESPESAS, "OUTRAS_DESPESAS.rds")




# Despesas Individuais ----------------------------------------------------

DESPESAS_INDIVIDUAIS <- 
    read.fwf("T_DESPESA_INDIVIDUAL_S.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 2, 14, 14, 2, 5, 2, 11, 2,
                        5, 11, 16, 2, 16, 16, 16, 2, 5, 2, 2),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "COD_INFORMANTE", "ESTRATO_POF", 
                           "PESO", "PESO_FINAL", "QUADRO", "V9001", 
                           "V9002", "V8000", "FATOR_ANUALIZACAO", 
                           "DEFLATOR", "V8000_DEFLA", "VALOR_ANUAL_EXPANDIDO2", 
                           "COD_IMPUT_VALOR", "RENDA_BRUTA_MONETARIA", 
                           "RENDA_BRUTA_NAO_MONETARIA", "RENDA_TOTAL", 
                           "COD_CARACTERISTICA", "COD_LOCAL_COMPRA", "COD_MOTIVO", 
                           "UF_DESPESA"), 
             dec = "," )

saveRDS(DESPESAS_INDIVIDUAIS, "DESPESAS_INDIVIDUAIS.rds")




# Despesas com Veículos ---------------------------------------------------

DESPESAS_VEICULOS <- 
    read.fwf("T_DESPESA_VEICULO_S.txt",
             widths = c(2, 2, 3, 1, 2, 1, 2, 2, 14, 14, 2, 5, 2, 11, 
                        1, 2, 5, 11, 16, 2, 16, 16, 16, 5),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "COD_INFORMANTE", "ESTRATO_POF", 
                           "PESO", "PESO_FINAL", "QUADRO", "V9001", 
                           "V9002", "V8000", "V9012", "FATOR_ANUALIZACAO", 
                           "DEFLATOR", "V8000_DEFLA", "VALOR_ANUAL_EXPANDIDO2", 
                           "COD_IMPUT_VALOR", "RENDA_BRUTA_MONETARIA", 
                           "RENDA_BRUTA_NAO_MONETARIA", "RENDA_TOTAL", 
                           "COD_LOCAL_COMPRA"), 
             dec = "," )

saveRDS(DESPESAS_VEICULOS, "DESPESAS_VEICULOS.rds")



# Despesas com Serviços Domésticos ----------------------------------------

DESPESAS_SERVICOS_DOMESTICOS <- 
    read.fwf("T_SERVICO_DOMS_S.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 14, 14, 2, 5, 2, 11, 5, 11, 
                        1, 2, 2, 2, 5, 11, 11, 16, 16, 2, 2, 16, 16, 16),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "ESTRATO_POF", "PESO", "PESO_FINAL", 
                           "QUADRO", "V9001", "V9002", "V8000", "COD_INSS", 
                           "VAL_INSS", "COD_ESPECIE", "V9010", "V9011", 
                           "FATOR_ANUALIZACAO", "DEFLATOR", "V8000_DEFLA", 
                           "V1904_DEFLA", "VALOR_ANUAL_EXPANDIDO2",
                           "VALOR_INSS_ANUAL_EXPANDIDO2", "COD_IMPUT_VALOR",
                           "COD_IMPUT_INSS", "RENDA_BRUTA_MONETARIA", 
                           "RENDA_BRUTA_NAO_MONETARIA", "RENDA_TOTAL"), 
             dec = "," )

saveRDS(DESPESAS_SERVICOS_DOMESTICOS, "DESPESAS_SERVICOS_DOMESTICOS.rds")




# Pessoas Imputação -------------------------------------------------------

PESSOAS_IMPUT <- 
    read.fwf("T_MORADOR_IMPUT_S.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 2, 14, 14, 1, 1, 1, 1, 1, 1,
                        1, 1, 1, 1, 1, 1, 1, 16, 16, 16, 1, 1, 1, 1, 1),
             na.strings = c(" "), 
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "COD_INFORMANTE", "ESTRATO_POF", 
                           "PESO", "PESO_FINAL", "V0414", "COD_FREQ_ESCOLA", 
                           "COD_CURSO_FREQ", "COD_DUR_PRIMEIRO_GRAU_EH", 
                           "COD_SERIE_FREQ", "COD_NIVEL_INSTR", "COD_DUR_PRIMEIRO_GRAU_ERA",
                           "COD_SERIE_COM_APROVACAO", "COD_CONCLUIU_CURSO", 
                           "COD_TEM_CARTAO", "COD_EHTITULAR_CARTAO", 
                           "COD_TEM_CHEQUE", "COD_EHTITULAR_CONTA", 
                           "RENDA_BRUTA_MONETARIA", "RENDA_BRUTA_NAO_MONETARIA", "RENDA_TOTAL", 
                           "COD_TEM_PLANO", "COD_EHTITULAR", "COD_NUM_DEPENDENTE", 
                           "COD_LEITE_MATERNO", "MESES_LEITE_MATERNO"), 
             dec = "," )

saveRDS(PESSOAS_IMPUT, "PESSOAS_IMPUT.rds")




# Rendimentos e Deduções --------------------------------------------------

RENDIMENTOS <- 
    read.fwf("T_RENDIMENTOS_S.txt",
             widths = c(2, 2, 3, 1, 2, 1, 2, 2, 14, 14, 2, 1, 2, 1, 5, 11,
                        2, 2, 1, 5, 11, 5, 11, 5, 11, 2, 5, 11, 11, 11, 11, 
                        16, 16, 16, 16, 2, 16, 16, 16, 3, 8, 8, 2),
             na.strings = c(" "),
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "COD_INFORMANTE", "ESTRATO_POF", 
                           "PESO", "PESO_FINAL", "QUADRO", "COD_TIPO_OCUP", 
                           "V5302", "V5307", "V9001", "V8500", "V9010", "V9011", 
                           "COD_DEUCAO_VAL", "COD_ITEM_PREV", "V531112", "COD_ITEM_IR", 
                           "V531122", "COD_ITEM_OUTRA", "V531132", "FATOR_ANUALIZACAO", 
                           "DEFLATOR", "V8500_DEFLA", "V531112_DEFLA", "V531122_DEFLA", 
                           "V531132_DEFLA", "VALOR_ANUAL_EXPANDIDO2", "VALOR_PREV_ANUAL_EXPANDIDO2", 
                           "VALOR_IR_ANUAL_EXPANDIDO2", "VALOR_OUTRAS_ANUAL_EXPANDIDO2", 
                           "COD_IMPUT_VALOR", "RENDA_BRUTA_MONETARIA", "RENDA_BRUTA_NAO_MONETARIA", 
                           "RENDA_TOTAL", "NUM_HORAS_TRABALHADAS", 
                           "V53011", "V53061", "COD_IMPUT_OCUP_ATIV"),
             dec = "," )

saveRDS(RENDIMENTOS, "RENDIMENTOS.rds")



# Outros Rendimentos ------------------------------------------------------

OUTROS_RENDIMENTOS <- 
    read.fwf("T_OUTROS_RECI_S.txt", 
             widths = c(2, 2, 3, 1, 2, 1, 2, 2, 14, 14, 2, 5, 11, 11, 5, 2, 2, 2, 
                        5, 11, 11, 16, 16, 2, 16, 16, 16),
             na.strings = c(" "),
             col.names = c("TIPO", "UF", "NUM_SEQ", "NUM_DV", "NUM_DOM",
                           "NUM_UC", "COD_INFORMANTE", "ESTRATO_POF", 
                           "PESO", "PESO_FINAL", "QUADRO", "COD_ITEM",
                           "V8500", "V8501", "COD_DEDUC","V9010", "V9011",
                           "FATOR_ANUALIZACAO", "DEFLATOR", "V8500_DEFLA", "V8501_DEFLA", 
                           "VALOR_ANUAL_EXPANDIDO2", "VALOR_DEDUC_ANUAL_EXPANDIDO2",
                           "COD_IMPUT_VALOR", "RENDA_BRUTA_MONETARIA", "RENDA_BRUTA_NAO_MONETARIA", 
                           "RENDA_TOTAL"),
             dec = "," )

saveRDS(OUTROS_RENDIMENTOS, "OUTROS_RENDIMENTOS.rds")






































