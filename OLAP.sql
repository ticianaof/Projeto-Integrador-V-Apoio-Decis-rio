
-- PROJETO INTEGRADOR V: JOVENS NEET NO BRASIL
-- Evidências de Operações OLAP

-- 1. SLICE (Fatiamento)
-- Foca em uma única dimensão. Exemplo: Analisar os dados APENAS do sexo 'Feminino'.
-- Pergunta de negócio: Qual o cenário das jovens mulheres NEET no Brasil?
SELECT 
    l.nome_estado,
    t.ano,
    SUM(f.total_jovens_neet) AS total_mulheres_neet,
    ROUND(AVG(f.taxa_neet), 2) AS taxa_media_neet
FROM dw_neet.fato_indicadores_neet f
JOIN dw_neet.dim_perfil p ON f.id_perfil = p.id_perfil
JOIN dw_neet.dim_localidade l ON f.id_localidade = l.id_localidade
JOIN dw_neet.dim_tempo t ON f.id_tempo = t.id_tempo
WHERE p.sexo = 'Feminino'
GROUP BY l.nome_estado, t.ano
ORDER BY total_mulheres_neet DESC;


-- 2. DICE (Corte/Subcubo)
-- Foca em duas ou mais dimensões específicas. 
-- Pergunta de negócio: Qual a taxa de NEET para jovens de 18-24 anos, do sexo Masculino, na região Nordeste em 2024?
SELECT 
    l.nome_estado,
    p.faixa_etaria,
    p.sexo,
    SUM(f.total_jovens_neet) AS total_neet,
    f.taxa_neet
FROM dw_neet.fato_indicadores_neet f
JOIN dw_neet.dim_perfil p ON f.id_perfil = p.id_perfil
JOIN dw_neet.dim_localidade l ON f.id_localidade = l.id_localidade
JOIN dw_neet.dim_tempo t ON f.id_tempo = t.id_tempo
WHERE p.faixa_etaria = '18-24 anos' 
  AND p.sexo = 'Masculino' 
  AND l.regiao = 'Nordeste'
  AND t.ano = 2024
GROUP BY l.nome_estado, p.faixa_etaria, p.sexo, f.taxa_neet;


-- 3. ROLL-UP (Agrupamento/Sumarização)
-- Sobe o nível de granularidade (ex: de Estado para Região).
-- Pergunta de negócio: Qual a visão macro (por Região) do acesso à internet e da população NEET?
SELECT 
    l.regiao,
    SUM(f.total_jovens_populacao) AS populacao_jovem_total,
    SUM(f.total_jovens_neet) AS populacao_neet_total,
    ROUND(AVG(f.perc_acesso_internet), 2) AS media_acesso_internet_regiao
FROM dw_neet.fato_indicadores_neet f
JOIN dw_neet.dim_localidade l ON f.id_localidade = l.id_localidade
GROUP BY l.regiao
ORDER BY populacao_neet_total DESC;


-- 4. DRILL-DOWN (Detalhamento)
-- Desce o nível de granularidade (ex: Detalhar o ano de 2024 por semestres e faixa etária).
-- Pergunta de negócio: Como a taxa NEET se comportou semestre a semestre em 2024 por faixa etária?
SELECT 
    t.semestre,
    p.faixa_etaria,
    SUM(f.total_jovens_neet) AS total_neet_periodo
FROM dw_neet.fato_indicadores_neet f
JOIN dw_neet.dim_tempo t ON f.id_tempo = t.id_tempo
JOIN dw_neet.dim_perfil p ON f.id_perfil = p.id_perfil
WHERE t.ano = 2024
GROUP BY t.semestre, p.faixa_etaria
ORDER BY t.semestre, p.faixa_etaria;


-- 5. PIVOT (Tabela Dinâmica / Crosstab)
-- Gira as linhas em colunas para facilitar a comparação visual.
-- Pergunta de negócio: Comparativo de jovens NEET por Região (Linhas) e Sexo (Colunas).
SELECT 
    l.regiao,
    SUM(CASE WHEN p.sexo = 'Feminino' THEN f.total_jovens_neet ELSE 0 END) AS neet_feminino,
    SUM(CASE WHEN p.sexo = 'Masculino' THEN f.total_jovens_neet ELSE 0 END) AS neet_masculino,
    SUM(f.total_jovens_neet) AS neet_total
FROM dw_neet.fato_indicadores_neet f
JOIN dw_neet.dim_localidade l ON f.id_localidade = l.id_localidade
JOIN dw_neet.dim_perfil p ON f.id_perfil = p.id_perfil
GROUP BY l.regiao
ORDER BY neet_total DESC;
