
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

### As amostras devem ser independentes;
### As unidades amostrais são selecionadas aleatoriamente;
### Distribuição normal (gaussiana) dos resíduos;
### Homogeneidade da variância.

# Avaliaçao das premissas ------------------------------------------------------------------------------------------------------------------

### Inspeção gráfica da distribuição dos resíduos:

###  premissa de homogeneidade da variância pode ser avaliada através do gráfico de 
### dispersão dos resíduos (eixo X) pelos valores preditos da variável resposta (eixo Y) 
### (Figura 7.1A). A distribuição dos resíduos será homogênea se não observarmos nenhum 
### padrão na distribuição dos pontos (i.e. forma em V, U ou funil).

### A premissa de normalidade dos resíduos pode ser avaliada através do gráfico de 
### quantis-quantis (QQ-plots). A distribuição dos resíduos será normal se os pontos 
### estiverem próximos à reta (Figura 7.1B).

# Exemplo prático 1 - Teste T para duas amostras com variâncias iguais ---------------------------------------------------------------------

### Explicação dos dados

### Neste exemplo, avaliaremos o comprimento rostro-cloacal (CRC em milímetros) de machos 
### de Physalaemus nattereri (Anura:Leptodactylidae) amostrados em diferentes estações 
### do ano com armadilhas de interceptação e queda na Região Noroeste do Estado de São 
### Paulo (da Silva and Rossa-Feres 2010).

### Pacotes necessários

library(ecodados)
library(car)
library(ggpubr)
library(ggforce)
library(lsmeans) 
library(lmtest)
library(sjPlot)
library(nlme)
library(ape)
library(fields) 
library(tidyverse)
library(vegan)
library(rdist)
