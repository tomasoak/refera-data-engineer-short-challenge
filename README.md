<h1 align="center"> Desafio de engenharia de dados da Refera! </h1>

<br>

## Ojetivo
O objetivo desse desafio é ser algo rápido para exemplificar alguns desafios do dia a dia de quem trabalha com dados. Queremos com esse desafio avaliar o seu conhecimento básico em programação, banco de dados e entender mais quais as boas práticas você segue para construção de código.

<br>

![Infra dos banco de dados](fluxo.png)


<br>

## Solução
Com o intuito de não criar um ambiente complexo, e ainda sim, executar todo o procedimento dentro do ambiente Docker, três passos foram executados:

1. Criação do arquivo `extract_and_load_inside_docker.sh` que:
    <br>
    A. Executa o comando `pg_dump` do PostgreSQL e salvar todas as tabelas do banco de dados `transactional` em um arquivo `.sql` dentro de um ambiente que será compartilhado entre containers
    <br>
    B. Espera 5 segundos para o banco de dados `analytics` iniciar:
    <br>
    C. Executa o comando `pg_restore` do PostgreSQL para fazer o ingestion de todas as tabelas no banco de dados `analytics`
2. Criação do Dockerfile.extract_load contendo um shell script com os comandos `pg_dump` e `pg_restore`, mencionados no passo 1.
3. Adaptação do docker-compose.yml para incluir o container `extract_load` que executará os commandos em bash para extrair e fazer o load das tabelas de um banco de dados para outro. 

Assim, todas as tabelas e as views são transferidas do banco de dados `transactional` para o `analytics`

<br>

## Test yourself

Clone o repositório:
```bash
git clone https://github.com/tomasoak/refera-data-engineer-short-challenge.git
```

Execute:
```bash
cd refera-data-engineer-short-challenge
docker-compose up
```