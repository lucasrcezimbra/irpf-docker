# Programas da Receita Federal para apuração e declaração de imposto de renda

Container Docker dos programas que os brasileiros mais gostam de instalar todo ano.

- Use `docker compose up irpf-<ano>` para iniciar o IRPF do ano (disponíveis: 2026, 2024, 2023, 2022, 2021, 2020, 2019 e 2018)
- No IRPF 2026, quando o servidor local de autenticação gov.br iniciar, a URL `http://127.0.0.1:<porta>/irpf/login` será impressa nos logs do container. Abra essa URL no navegador do host. Para listar portas HTTP abertas pelo IRPF, use `docker compose exec irpf-2026 irpf-listen-ports`.
- Use `docker compose up gcap-2019` para iniciar o GCAP 2019
- Use `docker compose up leao-2019` para iniciar o Carnê-Leão 2019
