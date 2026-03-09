
-- PROJETO INTEGRADOR V: JOVENS NEET NO BRASIL
-- Scripts DDL
-- Banco de Dados: PostgreSQL

-- Criação do Schema
CREATE SCHEMA IF NOT EXISTS dw_neet;

-- 1. Criação das Tabelas de Dimensão

-- Localidade 
CREATE TABLE dw_neet.dim_localidade (
    id_localidade SERIAL PRIMARY KEY,
    sigla_uf VARCHAR(2) NOT NULL,
    nome_estado VARCHAR(50) NOT NULL,
    regiao VARCHAR(20) NOT NULL
);

-- Perfil
CREATE TABLE dw_neet.dim_perfil (
    id_perfil SERIAL PRIMARY KEY,
    faixa_etaria VARCHAR(20) NOT NULL,
    sexo VARCHAR(20) NOT NULL
);

-- Tempo
CREATE TABLE dw_neet.dim_tempo (
    id_tempo SERIAL PRIMARY KEY,
    ano INT NOT NULL
);

-- 2. Criação da Tabela Fato
CREATE TABLE dw_neet.fato_indicadores_neet (
    id_fato SERIAL PRIMARY KEY,
    id_localidade INT REFERENCES dw_neet.dim_localidade(id_localidade),
    id_perfil INT REFERENCES dw_neet.dim_perfil(id_perfil),
    id_tempo INT REFERENCES dw_neet.dim_tempo(id_tempo),
    total_jovens_populacao INT,
    total_jovens_neet INT,
    taxa_neet DECIMAL(5,2),
    escolaridade_media DECIMAL(5,2),
    pib_per_capita DECIMAL(15,2)

-- Scripts DML

-- Carga em Lot
-- Utilizando os arquivos CSV gerados após a limpeza e transformação em Python

COPY dw_neet.dim_localidade (sigla_uf, nome_estado, regiao)
FROM '/caminho_do_projeto/dados_transformados/dim_localidade.csv' DELIMITER ',' CSV HEADER;

COPY dw_neet.dim_localidade (sigla_uf, nome_estado, regiao)
FROM '/caminho_do_repositorio/dados_limpos/dim_localidade.csv' DELIMITER ',' CSV HEADER;

COPY dw_neet.dim_perfil (faixa_etaria, sexo)
FROM '/caminho_do_repositorio/dados_limpos/dim_perfil.csv' DELIMITER ',' CSV HEADER;

COPY dw_neet.fato_indicadores_neet (id_localidade, id_perfil, id_tempo, total_jovens_populacao, total_jovens_neet, taxa_neet, escolaridade_media, pib_per_capita)
FROM '/caminho_do_repositorio/dados_limpos/fato_neet.csv' DELIMITER ',' CSV HEADER;
);
