"""Consulta segura de inscrições em um campeonato (PostgreSQL)."""

from __future__ import annotations

import argparse
import os
import sys
from contextlib import closing

import psycopg

SQL = """
SELECT a.nome, m.nome, i.data_evento, i.local_evento, i.valor
FROM inscricao AS i
JOIN atleta AS a ON a.id = i.atleta_id
JOIN modalidade AS m ON m.id = i.modalidade_id
WHERE (%s IS NULL OR m.nome = %s)
ORDER BY i.data_evento, a.nome
"""


def consultar_inscricoes(dsn: str, modalidade: str | None = None) -> list[tuple]:
    """Retorna inscrições; parâmetros nunca são interpolados no SQL."""
    with closing(psycopg.connect(dsn, connect_timeout=5)) as conexao:
        with conexao.cursor() as cursor:
            cursor.execute(SQL, (modalidade, modalidade))
            return cursor.fetchall()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--modalidade", help="Filtra pelo nome exato da modalidade")
    args = parser.parse_args()
    dsn = os.getenv("DATABASE_URL")
    if not dsn:
        print("Configure DATABASE_URL antes de executar.", file=sys.stderr)
        return 2
    try:
        linhas = consultar_inscricoes(dsn, args.modalidade)
    except psycopg.Error as erro:
        print(f"Falha ao consultar banco: {erro.__class__.__name__}", file=sys.stderr)
        return 1
    for atleta, modalidade, data, local, valor in linhas:
        print(f"{data.isoformat()} | {modalidade} | {atleta} | {local} | R$ {valor:.2f}")
    if not linhas:
        print("Nenhuma inscrição encontrada.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
