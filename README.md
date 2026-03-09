# Projeto-Integrador-V-Apoio-Decisorio
Repositório para entrega Trabalho de Projeto Integrador V desenvolvido  como exigência para obtenção de nota parcial para  o 5º semestre do curso de Tecnologia em Banco  de Dados - Centro Universitário SENAC, sob  orientação do professor Gustavo Moreira Calixto.
# Projeto Integrador V: Apoio Decisório aos Negócios
## JOVENS NEET NO BRASIL (NEM ESTUDAM, NEM TRABALHAM)

*Equipe:*
* Stuart Santos Idalgo
* Ticiana Onara Ferreira
* Vinnicius Francisco de Almeida

---

## 📌 Visão Geral
Este projeto tem como foco a análise da população jovem brasileira classificada como NEET (Not in Education, Employment or Training), ou seja, jovens que não estudam, não trabalham e não estão em processo de qualificação profissional. 

O estudo busca compreender o perfil sociodemográfico desses jovens, identificar padrões regionais e propor estratégias de apoio à formulação de políticas públicas. O projeto visa contribuir para a redução da taxa de jovens NEET no Brasil, promovendo a inclusão produtiva e educacional.

---

## 🛠️ Definição das Tecnologias e Detalhamento Técnico

Para garantir a qualidade, integridade e usabilidade dos dados que embasarão as análises, foi definido um processo completo de ETL (Extração, Transformação e Carga). Abaixo estão detalhadas as tecnologias e técnicas aplicadas em cada etapa da solução:

### 1. Extração de Dados (Extract)
A coleta de dados foca em fontes públicas confiáveis sobre juventude, educação, trabalho e informações socioeconômicas.
* *Linguagens e Bibliotecas:* Scripts em Python utilizando pandas, requests e beautifulsoup4.
* *Técnicas e Formatos:* Coleta e leitura de arquivos em formatos estruturados e semiestruturados (CSV, JSON e HTML) e utilização de APIs públicas para automação da extração.

### 2. Transformação e Limpeza (Transform)
Os dados brutos passam por um processo de limpeza, padronização e enriquecimento.
* *Linguagens e Bibliotecas:* Python com as bibliotecas pandas, numpy e scikit-learn para transformação e análise exploratória.
* *Ambiente de Documentação:* Jupyter Notebooks para garantir a reprodutibilidade dos processos.
* *Técnicas aplicadas:*
  * Tratamento de valores nulos e inconsistentes.
  * Conversão de formatos de data, moeda e categorias.
  * Criação de variáveis derivadas, como taxa NEET segmentada por estado, sexo e faixa etária.
  * Integração de dados socioeconômicos complementares, como PIB per capita, escolaridade média e acesso à internet.

### 3. Carga e Armazenamento (Load)
Após a transformação, os dados são carregados em um ambiente seguro para armazenamento.
* *Banco de Dados:* PostgreSQL (Banco de dados relacional).
* *Técnicas aplicadas:* Utilização de scripts SQL (DDL e DML) para estruturar as tabelas que receberão os dados limpos.

### 4. Apoio Decisório e Visualização (Operações OLAP)
Para consumo das informações e apoio à tomada de decisão de gestores e organizações.
* *Ferramentas de BI:* Power BI, Tableau ou ferramenta de Business Intelligence equivalente.
* *Técnicas aplicadas:* Criação de dashboards interativos e relatórios visuais contendo operações OLAP, permitindo análises multidimensionais para orientar a alocação de recursos e programas de capacitação.

---

## 📂 Fonte de Dados da Extração

Os dados extraídos para a composição deste projeto são provenientes das seguintes fontes públicas:

* *OCDE - Education at a Glance (2024):* Indicadores internacionais sobre juventude e educação.  
  Origem: https://www.oecd.org/education/education-at-a-glance/
* *IBGE - PNAD Contínua (2025):* Dados nacionais sobre trabalho, escolaridade e faixa etária.  
  Origem: https://www.ibge.gov.br/estatisticas/sociais/trabalho/17270-pnad-continua.html
* *IPEA - Atlas da Juventude (2025):* Informações socioeconômicas e demográficas.  
  Origem: https://www.ipea.gov.br/atlasjuventude/
* *Atlas das Juventudes - FGV Social (2025):* Projeções populacionais e percepções da juventude brasileira.  
  Origem: https://atlasdasjuventudes.com.br/jovens-populacao-e-percepcoes/projecao-populacional/
