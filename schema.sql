-- Projeto educacional independente inspirado na modelagem de campeonato.
-- Fonte de referência: https://github.com/brunosilveira6/projetoscyber
-- PostgreSQL 14+
BEGIN;
CREATE TABLE treinador (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL CHECK (length(trim(nome)) > 0)
);
CREATE TABLE preparador (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL CHECK (length(trim(nome)) > 0)
);
CREATE TABLE modalidade (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE,
    treinador_id BIGINT NOT NULL REFERENCES treinador(id),
    preparador_id BIGINT NOT NULL REFERENCES preparador(id)
);
CREATE TABLE atleta (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    peso_kg NUMERIC(5,2) CHECK (peso_kg > 0),
    altura_m NUMERIC(3,2) CHECK (altura_m > 0),
    pais_origem VARCHAR(80) NOT NULL,
    modalidade_id BIGINT NOT NULL REFERENCES modalidade(id),
    CONSTRAINT uq_atleta_modalidade UNIQUE(id, modalidade_id)
);
CREATE TABLE inscricao (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    data_evento DATE NOT NULL,
    local_evento VARCHAR(100) NOT NULL,
    valor NUMERIC(10,2) NOT NULL CHECK (valor >= 0),
    modalidade_id BIGINT NOT NULL REFERENCES modalidade(id),
    atleta_id BIGINT NOT NULL,
    FOREIGN KEY (atleta_id, modalidade_id)
        REFERENCES atleta(id, modalidade_id),
    UNIQUE (atleta_id, data_evento, local_evento)
);
CREATE INDEX idx_atleta_modalidade ON atleta(modalidade_id);
CREATE INDEX idx_inscricao_data ON inscricao(data_evento);
COMMIT;
