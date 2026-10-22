-- Dados fictícios para demonstração, sem reproduzir dados pessoais da fonte.
INSERT INTO treinador(nome) VALUES ('Ana Costa'), ('Paulo Lima');
INSERT INTO preparador(nome) VALUES ('Carla Souza'), ('Rafael Dias');
INSERT INTO modalidade(nome, treinador_id, preparador_id)
VALUES ('Vôlei', 1, 1), ('Corrida', 2, 2);
INSERT INTO atleta(nome, data_nascimento, peso_kg, altura_m, pais_origem, modalidade_id)
VALUES ('Atleta Exemplo A', DATE '2000-04-10', 70.50, 1.75, 'Brasil', 1),
       ('Atleta Exemplo B', DATE '1999-09-20', 63.20, 1.68, 'Brasil', 2);
INSERT INTO inscricao(data_evento, local_evento, valor, modalidade_id, atleta_id)
VALUES (DATE '2026-11-15', 'Florianópolis', 90.00, 1, 1),
       (DATE '2026-12-05', 'Criciúma', 75.00, 2, 2);
