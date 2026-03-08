# Projeto-Integrador-V-Apoio-Decisorio
Repositório para entrega Trabalho de Projeto Integrador V desenvolvido  como exigência para obtenção de nota parcial para  o 5º semestre do curso de Tecnologia em Banco  de Dados - Centro Universitário SENAC, sob  orientação do professor Gustavo Moreira Calixto.
# Projeto Integrador V – Apoio Decisório aos Negócios
## Jovens NEET no Brasil (Nem estudam, nem trabalham)

### 1. Definição das Tecnologias
- **Banco de Dados:** PostgreSQL (armazenamento relacional e suporte a OLAP).
- **ETL:** Python (bibliotecas `pandas`, `numpy`, `requests`, `beautifulsoup4`).
- **Ambiente de Documentação:** Jupyter Notebook (reprodutibilidade e transparência).
- **Business Intelligence:** Power BI ou Tableau (dashboards interativos).
- **OLAP:** Extensões do PostgreSQL (`cube`, `tablefunc`) para operações multidimensionais.

### 2. Detalhamento Técnico
- **Extração:** Dados coletados de fontes públicas:
  - OCDE – *Education at a Glance*
  - IBGE – *PNAD Contínua*
  - IPEA – *Atlas da Juventude*
  - FGV – *Atlas das Juventudes*
- **Transformação:**
  - Limpeza de valores nulos e inconsistentes.
  - Padronização de formatos (datas, moedas, categorias).
  - Criação de variáveis derivadas (taxa NEET por estado, sexo, faixa etária).
  - Integração com dados socioeconômicos (PIB per capita, escolaridade média, acesso à internet).
- **Carga:**
  - Scripts DDL para criação das tabelas no PostgreSQL.
  - Scripts DML para inserção dos dados tratados.
- **OLAP:**
  - Criação de cubos de dados para análise multidimensional.
  - Operações de *slice*, *dice*, *roll-up* e *drill-down* sobre dimensões como região, sexo e faixa etária.
  - Geração de relatórios e dashboards interativos.

### 3. Fonte de Dados
- OCDE: https://www.oecd.org/education/education-at-a-glance/
- IBGE: https://www.ibge.gov.br/estatisticas/sociais/trabalho/17270-pnad-continua.html
- IPEA: https://www.ipea.gov.br/atlasjuventude/
- FGV: https://atlasdasjuventudes.com.br/

### 4. Evidências
- Scripts de carga (DDL/DML) disponíveis em `/scripts`.
- Notebooks de ETL em `/etl`.
- Dashboards OLAP em `/dashboards`.
