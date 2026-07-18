-- comandos_select.sql
-- Script SELECT para consultas de exemplo no modelo relacional

-- C1. SELECT * de uma tabela
SELECT * FROM POKEMON;

-- C2. SELECT de alguns campos com condição simples
SELECT nome, nivel, natureza FROM POKEMON
WHERE genero = 'F';

-- C3. SELECT de alguns campos com condição composta
SELECT nome, vida, ataque, defesa FROM POKEMON
WHERE nivel >= 60 AND shiny = TRUE;

-- C4. SELECT com GROUP BY e agregação
SELECT id_tipo, COUNT(*) AS total_pokemons
FROM POKEMON
WHERE nivel >= 30
GROUP BY id_tipo
HAVING COUNT(*) >= 1;

-- C5. SELECT com subquery no WHERE
SELECT nome, nivel
FROM POKEMON
WHERE id_tipo = (
    SELECT id_tipo FROM TIPO WHERE tipo = 'Fogo'
);
