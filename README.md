# README
🚀 Desafio: Criar uma API de gerenciamento de seguros
Objetivo: Desenvolver uma API REST em Ruby on Rails para:
1️⃣ Gerenciar dados de clientes e seguros

CRUD para clientes (/clients)
CRUD para apólices de seguro (/policies)
2️⃣ Integrar com uma API externa

Consultar uma API externa para verificar o histórico de sinistros de um cliente usando o CPF.
3️⃣ Regras adicionais:

Retornar respostas JSON bem estruturadas.
Aplicar autenticação usando JWT.
Log de requisições e tratamento de erros.

## rails new insurance_api --api -d postgresql
## cd insurance_api
## rails db:create
## sudo apt-get install libpq-dev
## bundle install

## rails generate model Client name:string cpf:string email:string
## rails generate model Policy policy_number:string client:references coverage_type:string
## rails generate controller Clients
## rails generate controller Policies



* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
