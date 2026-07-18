-- comandos_juncoes.sql
-- Script de junções para consultar relacionamentos entre tabelas

-- D1. INNER JOIN entre duas tabelas
SELECT p.nome AS pokemon, t.tipo
FROM POKEMON p
INNER JOIN TIPO t ON p.id_tipo = t.id_tipo;

-- D2. INNER JOIN encadeado entre três tabelas
SELECT p.nome AS pokemon, t.tipo AS tipo_elemental, h.oculta AS habilidade_oculta
FROM POKEMON p
INNER JOIN TIPO t ON p.id_tipo = t.id_tipo
INNER JOIN HABILIDADE h ON p.id_habilidade = h.id_habilidade;

-- D3. LEFT JOIN evidenciando registros sem correspondência
SELECT p.nome AS pokemon, i.descricao AS item_equipado
FROM POKEMON p
LEFT JOIN ITEM i ON p.id_item = i.id_item;

-- D4. FULL OUTER JOIN
SELECT i.id_item, i.descricao AS item_descricao, p.nome AS pokemon_equipado
FROM ITEM i
FULL OUTER JOIN POKEMON p ON i.id_item = p.id_item;
