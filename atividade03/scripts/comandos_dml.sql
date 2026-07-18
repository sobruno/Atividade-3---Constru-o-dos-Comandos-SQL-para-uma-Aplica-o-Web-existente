-- comandos_dml.sql
-- Script DML para popular as tabelas e executar exemplos de UPDATE/DELETE

-- B1. Inserir 5 registros em cada tabela
INSERT INTO USUARIO (nome_usu, senha) VALUES
('ash_ketchum', 'pikachu2026'),
('misty_water', 'starmie123'),
('brock_rock', 'onixforte'),
('lance_dragao', 'dragonmaster'),
('may_petal', 'flor22');

INSERT INTO TIPO (tipo) VALUES
('Fogo'),
('Água'),
('Planta'),
('Elétrico'),
('Pedra');

INSERT INTO HABILIDADE (descricao, oculta) VALUES
('Aumenta o ataque quando o HP está baixo', FALSE),
('Recupera pontos de vida em batalhas à noite', TRUE),
('Reduz dano de ataques do tipo Água', FALSE),
('Aumenta a velocidade em campo adversário', TRUE),
('Fortalece defesas contra status negativos', FALSE);

INSERT INTO ITEM (descricao) VALUES
('Potion cura 20 pontos de vida'),
('Revivar traz de volta um Pokémon apagado'),
('X Defende aumenta a defesa em batalha'),
('Antídoto cura envenenamento'),
('Berries recuperam energia lentamente');

INSERT INTO TIME (nome, nome_usu) VALUES
('Equipe Flame', 'ash_ketchum'),
('Onda Azul', 'misty_water'),
('Rocha Sólida', 'brock_rock'),
('Fúria Dracônica', 'lance_dragao'),
('Jardim Vivo', 'may_petal');

INSERT INTO POKEMON (nome, nivel, genero, shiny, vida, ataque, defesa, ataque_especial, defesa_especial, velocidade, natureza, status, id_habilidade, id_item, id_tipo) VALUES
('Charizard', 78, 'M', TRUE, 266, 84, 78, 109, 85, 100, 'Brave', 'Queimado', 1, 1, 1),
('Starmie', 65, 'F', FALSE, 214, 75, 85, 100, 85, 115, 'Timid', NULL, 2, 2, 2),
('Onix', 55, 'M', FALSE, 200, 45, 160, 30, 45, 70, 'Impish', NULL, 3, 3, 5),
('Gyarados', 70, 'M', TRUE, 268, 125, 79, 60, 100, 81, 'Adamant', 'Fury', 4, 4, 2),
('Meganium', 60, 'F', FALSE, 244, 82, 100, 83, 100, 80, 'Calm', 'Sleep', 5, NULL, 3);

INSERT INTO MOVIMENTO (dano, precisao, descricao, id_tipo) VALUES
(90, 100, 'Chama intensa que pode queimar o alvo', 1),
(85, 95, 'Golpe de água em forma de estrela', 2),
(75, 90, 'Causa dano e pode reduzir velocidade', 3),
(110, 85, 'Ataque elétrico de alta energia', 4),
(60, 100, 'Lança pedras afiadas no adversário', 5);

INSERT INTO TIPO_EFICACIA (id_tipo, eficacia) VALUES
(1, 'Planta'),
(1, 'Gelo'),
(2, 'Fogo'),
(3, 'Pedra'),
(4, 'Água');

INSERT INTO TIPO_INEFICACIA (id_tipo, ineficacia) VALUES
(1, 'Água'),
(2, 'Elétrico'),
(3, 'Fogo'),
(4, 'Planta'),
(5, 'Aço');

INSERT INTO MOVIMENTO_POKEMON (id_movimento, id_pokemon) VALUES
(1, 1),
(2, 2),
(3, 5),
(4, 4),
(5, 3);

INSERT INTO POKEMON_TIME (id_pokemon, id_time) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- B2. Atualizar um campo em todos os registros de uma tabela
UPDATE USUARIO
SET senha = 'pokemonMaster2026';

-- B3. Atualizar um campo com condição simples
UPDATE MOVIMENTO
SET dano = dano + 5
WHERE precisao = 100;

-- B4. Atualizar um campo com condição composta
UPDATE POKEMON
SET ataque = ataque + 10
WHERE nivel > 60 AND genero = 'M';

-- B5. Atualizar dois campos ao mesmo tempo com condição
UPDATE POKEMON
SET defesa = defesa + 5,
    defesa_especial = defesa_especial + 5
WHERE id_pokemon = 3;

-- B6. Atualizar um campo usando o valor antigo do próprio campo
UPDATE POKEMON
SET vida = vida + 20
WHERE id_pokemon = 1;

-- B7. Atualizar um campo usando função do PostgreSQL
UPDATE TIME
SET nome = INITCAP(nome)
WHERE id_time <= 5;

-- B8. Deletar todos os registros de uma tabela sem dependentes diretos
-- Essa tabela é uma tabela associativa sem tabelas que dependem dela.
DELETE FROM MOVIMENTO_POKEMON;

-- B9. Deletar com condição simples
-- O item 5 foi mantido sem referência de Pokémon, assim o DELETE não quebra integridade referencial.
DELETE FROM ITEM
WHERE id_item = 5;

-- B10. Deletar com condição composta
DELETE FROM TIPO_EFICACIA
WHERE id_tipo = 1 AND eficacia = 'Planta';

-- B11. Deletar usando função no WHERE
DELETE FROM POKEMON_TIME
WHERE id_time IN (
    SELECT id_time FROM TIME WHERE LENGTH(nome) > 8
);
