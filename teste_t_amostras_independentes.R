
# Teste t para amostras independentes ------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 21/05/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: livro Análises Ecológicas com R ----------------------------------------------------------------------------------------------

# Introdução -------------------------------------------------------------------------------------------------------------------------------

### Estatísticas frequentistas como as que serão abordadas neste capítulo são baseadas em
### testes estatísticos (e.g., F, t, 𝛘2, etc.), que são resultados númericos do teste e 
### possuem um valor de probabilidade (valor de P) associado com este teste (Gotelli and 
### Ellison 2012). O valor de P mede a probabilidade que os valores observados ou mais 
### extremos seriam encontrados caso a hipótese nula seja verdadeira.

### Uma das perguntas mais comuns em estatística é saber se há diferença entre as médias 
### de dois grupos ou tratamentos. Para responder a esta pergunta, William Sealy Gosset, 
### químico da cervejaria Guinness, desenvolveu em 1908 o Teste T que é uma estatística 
### que segue uma distribuição t de Student para rejeitar ou não uma hipótese nula de 
### médias iguais entre dois grupos.

# Premissas do teste t ---------------------------------------------------------------------------------------------------------------------

### As amostras devem ser independentes
### As unidades amostrais são selecionadas aleatoriamente
### Distribuição normal (gaussiana) dos resíduos
### Homogeneidade da variância
