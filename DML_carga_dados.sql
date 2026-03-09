
-- PROJETO INTEGRADOR V:JOVENS NEET NO BRASIL
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
