-- Inscrições com modalidade, atleta e equipe técnica
SELECT i.id, a.nome AS atleta, m.nome AS modalidade,
       t.nome AS treinador, p.nome AS preparador,
       i.data_evento, i.local_evento, i.valor
FROM inscricao AS i
JOIN atleta AS a ON a.id = i.atleta_id
JOIN modalidade AS m ON m.id = i.modalidade_id
JOIN treinador AS t ON t.id = m.treinador_id
JOIN preparador AS p ON p.id = m.preparador_id
ORDER BY i.data_evento, a.nome;

-- Valor acumulado e total de inscrições por modalidade
SELECT m.nome AS modalidade, COUNT(i.id) AS inscricoes,
       COALESCE(SUM(i.valor), 0) AS valor_total
FROM modalidade AS m
LEFT JOIN inscricao AS i ON i.modalidade_id = m.id
GROUP BY m.id, m.nome
ORDER BY valor_total DESC;
