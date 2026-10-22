# Campeonato — modelagem SQL e consultas em Python

Exercício independente de modelagem relacional inspirado em um projeto público de campeonato. A estrutura original foi estudada, mas o esquema, os exemplos e a implementação Python aqui disponibilizados foram reescritos e ampliados.

**Referência e crédito:** [brunosilveira6/projetoscyber](https://github.com/brunosilveira6/projetoscyber), arquivo `campeonato2408bruno-68dc1fcfad469.sql`. Não foi identificada licença na listagem do repositório consultada; este material não reproduz o arquivo original integralmente.

## Melhorias
- Identificadores padronizados, integridade referencial e índices.
- Restrições para valores inválidos e prevenção de inscrição em modalidade diferente da do atleta.
- Datas ISO e massa de dados sintética.
- Consultas analíticas e programa Python com parâmetros em vez de concatenação SQL.
- Tratamento de configuração por variáveis de ambiente e de erros de conexão.

## Execução
Requer PostgreSQL 14+ e Python 3.10+.

```bash
psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f schema.sql
psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f seed.sql
python -m pip install -r requirements.txt
python consultar.py --modalidade Vôlei
```

Use a variável de ambiente `DATABASE_URL` com sua conexão PostgreSQL. Os scripts de criação devem ser executados em banco vazio. **Não use dados reais sem autorização.**
