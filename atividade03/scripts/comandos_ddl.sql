-- comandos_ddl.sql
-- Script DDL para criar as tabelas do modelo relacional do Pokémon Showdown

CREATE TABLE IF NOT EXISTS USUARIO (
    nome_usu VARCHAR(50) NOT NULL PRIMARY KEY,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS TIPO (
    id_tipo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS HABILIDADE (
    id_habilidade INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descricao TEXT NOT NULL,
    oculta BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS ITEM (
    id_item INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descricao TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS TIME (
    id_time INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nome_usu VARCHAR(50) NOT NULL,
    CONSTRAINT fk_time_usuario FOREIGN KEY (nome_usu) REFERENCES USUARIO (nome_usu)
);

CREATE TABLE IF NOT EXISTS POKEMON (
    id_pokemon INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nivel INTEGER NOT NULL CHECK (nivel BETWEEN 1 AND 100),
    genero VARCHAR(10),
    shiny BOOLEAN NOT NULL DEFAULT FALSE,
    vida INTEGER NOT NULL,
    ataque INTEGER NOT NULL,
    defesa INTEGER NOT NULL,
    ataque_especial INTEGER NOT NULL,
    defesa_especial INTEGER NOT NULL,
    velocidade INTEGER NOT NULL,
    natureza VARCHAR(20) NOT NULL,
    status VARCHAR(30),
    id_habilidade INTEGER,
    id_item INTEGER,
    id_tipo INTEGER NOT NULL,
    CONSTRAINT fk_pokemon_habilidade FOREIGN KEY (id_habilidade) REFERENCES HABILIDADE (id_habilidade),
    CONSTRAINT fk_pokemon_item FOREIGN KEY (id_item) REFERENCES ITEM (id_item),
    CONSTRAINT fk_pokemon_tipo FOREIGN KEY (id_tipo) REFERENCES TIPO (id_tipo)
);

CREATE TABLE IF NOT EXISTS MOVIMENTO (
    id_movimento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dano INTEGER NOT NULL,
    precisao INTEGER NOT NULL CHECK (precisao BETWEEN 1 AND 100),
    descricao TEXT NOT NULL,
    id_tipo INTEGER NOT NULL,
    CONSTRAINT fk_movimento_tipo FOREIGN KEY (id_tipo) REFERENCES TIPO (id_tipo)
);

CREATE TABLE IF NOT EXISTS TIPO_EFICACIA (
    id_tipo INTEGER NOT NULL,
    eficacia VARCHAR(20) NOT NULL,
    CONSTRAINT pk_tipo_eficacia PRIMARY KEY (id_tipo, eficacia),
    CONSTRAINT fk_tipo_eficacia_tipo FOREIGN KEY (id_tipo) REFERENCES TIPO (id_tipo)
);

CREATE TABLE IF NOT EXISTS TIPO_INEFICACIA (
    id_tipo INTEGER NOT NULL,
    ineficacia VARCHAR(20) NOT NULL,
    CONSTRAINT pk_tipo_ineficacia PRIMARY KEY (id_tipo, ineficacia),
    CONSTRAINT fk_tipo_ineficacia_tipo FOREIGN KEY (id_tipo) REFERENCES TIPO (id_tipo)
);

CREATE TABLE IF NOT EXISTS MOVIMENTO_POKEMON (
    id_movimento INTEGER NOT NULL,
    id_pokemon INTEGER NOT NULL,
    CONSTRAINT pk_movimento_pokemon PRIMARY KEY (id_movimento, id_pokemon),
    CONSTRAINT fk_movimento_pokemon_movimento FOREIGN KEY (id_movimento) REFERENCES MOVIMENTO (id_movimento),
    CONSTRAINT fk_movimento_pokemon_pokemon FOREIGN KEY (id_pokemon) REFERENCES POKEMON (id_pokemon)
);

CREATE TABLE IF NOT EXISTS POKEMON_TIME (
    id_pokemon INTEGER NOT NULL,
    id_time INTEGER NOT NULL,
    CONSTRAINT pk_pokemon_time PRIMARY KEY (id_pokemon, id_time),
    CONSTRAINT fk_pokemon_time_pokemon FOREIGN KEY (id_pokemon) REFERENCES POKEMON (id_pokemon),
    CONSTRAINT fk_pokemon_time_time FOREIGN KEY (id_time) REFERENCES TIME (id_time)
);
