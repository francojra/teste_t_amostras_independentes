
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

### A premissa de homogeneidade da variância pode ser avaliada através do gráfico de 
### dispersão dos resíduos (eixo X) pelos valores preditos da variável resposta (eixo Y) 
### (Figura 7.1A). A distribuição dos resíduos será homogênea se não observarmos nenhum 
### padrão na distribuição dos pontos (i.e. forma em V, U ou funil).

### A premissa de normalidade dos resíduos pode ser avaliada através do gráfico de 
### quantis-quantis (QQ-plots). A distribuição dos resíduos será normal se os pontos 
### estiverem próximos à reta (Figura 7.1B).

# Exemplo prático 1 - Teste T para duas amostras com variâncias iguais ---------------------------------------------------------------------

### Explicação dos dados

## Neste exemplo, avaliaremos o comprimento rostro-cloacal (CRC em milímetros) de machos 
## de Physalaemus nattereri (Anura:Leptodactylidae) amostrados em diferentes estações 
## do ano com armadilhas de interceptação e queda na Região Noroeste do Estado de São 
## Paulo (da Silva and Rossa-Feres 2010).

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

### Dados

CRC_PN_macho <- ecodados::teste_t_var_igual
CRC_LP_femea <- ecodados::teste_t_var_diferente
Pareado <- ecodados::teste_t_pareado
correlacao_arbustos <- ecodados::correlacao
dados_regressao <- ecodados::regressoes
dados_regressao_mul <- ecodados::regressoes
dados_anova_simples <- ecodados::anova_simples
dados_dois_fatores <- ecodados::anova_dois_fatores
dados_dois_fatores_interacao <- ecodados::anova_dois_fatores
dados_dois_fatores_interacao2 <- ecodados::anova_dois_fatores_interacao2
dados_bloco <- ecodados::anova_bloco
dados_ancova <- ecodados::ancova
data("mite")
data("mite.xy")
coords <- mite.xy
colnames(coords) <- c("long", "lat")
data("mite.env")

### Pergunta

## O CRC dos machos de P. nattereri é maior na estação chuvosa do que na estação seca?

### Predições

## O CRC dos machos será maior na estação chuvosa porque há uma vantagem seletiva para 
## os indivíduos maiores durante a atividade reprodutiva.

### Variáveis

## Data frame com os indivíduos (unidade amostral) nas linhas e CRC (mm - variável 
## resposta contínua) e estação (variável preditora categórica) como colunas.

### Checklist

## Verificar se o seu data frame está com as unidades amostrais nas linhas e variáveis 
## preditoras e respostas nas colunas.


# Análises ---------------------------------------------------------------------------------------------------------------------------------

### Verificando os dados

CRC_PN_macho 
head(CRC_PN_macho)

### Verificar a normalidade dos resíduos usando o QQ-plot 

## Teste de normalidade

residuos <- lm(CRC ~ Estacao, data = CRC_PN_macho)
qqPlot(residuos)

## Os pontos estão próximos à reta, indicando que a distribuição dos resíduos é normal.

## Outra possibilidade é usar os testes de Shapiro-Wilk e Levene para verificar a 
## normalidade e a homogeneidade da variância, respectivamente.

## Teste de Shapiro-Wilk para normalidade dos resíduos

## Teste de Shapiro-Wilk 

## Valor de p deve ser > que 0.05 para indicar distribuição normal

residuos_modelo <- residuals(residuos)
shapiro.test(residuos_modelo)

## Teste de homogeneidade de variância

## Valor de p deve ser > que 0.05 para indicar homogeneidade de variâncias

leveneTest(CRC ~ as.factor(Estacao), data = CRC_PN_macho)

### Percebam que a distribuição dos resíduos foi normal e homogênea na inspeção gráfica,
### assim como nos testes de Shapiro e Levene, respectivamente. Agora podemos realizar 
### a análise sabendo que os dados seguem as premissas requeridas pelo Teste T.

### Teste t para amostras independentes

t.test(CRC ~ Estacao, data = CRC_PN_macho, var.equal = TRUE)
