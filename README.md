# Sistema de Campeonatos — Python + PostgreSQL

Projeto acadêmico desenvolvido no início do curso para praticar modelagem de banco de dados, SQL e integração com Python.

## Funcionalidades

- Cadastro e relacionamento de treinadores, preparadores, modalidades e atletas.
- Registro de inscrições em eventos.
- Consultas com `JOIN`, agrupamentos e cálculo de valores totais.
- Consulta de inscrições por modalidade usando Python.
- Validação de dados com chaves estrangeiras e restrições no PostgreSQL.

## Tecnologias

- Python 3
- PostgreSQL
- SQL
- Psycopg 3

## Estrutura do projeto

| Arquivo | Descrição |
|---|---|
| `schema.sql` | Criação das tabelas e relacionamentos |
| `seed.sql` | Dados fictícios para testes |
| `consultas.sql` | Consultas e relatórios SQL |
| `consultar.py` | Consulta de inscrições via Python |
| `requirements.txt` | Dependências Python |

## Como executar

É necessário ter PostgreSQL e Python 3.10+ instalados. Configure a variável de ambiente `DATABASE_URL` com a string de conexão do seu banco.

```bash
psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f schema.sql
psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f seed.sql
python -m pip install -r requirements.txt
python consultar.py --modalidade Vôlei
```

O banco deve estar vazio antes da primeira execução dos scripts. Os dados de exemplo são fictícios.

## Objetivo

Aplicar conceitos de banco de dados relacionais, integridade referencial, consultas SQL e acesso seguro ao banco utilizando Python.
