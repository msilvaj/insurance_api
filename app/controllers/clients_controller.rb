require "net/http"
require "cpf_cnpj"

class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  # Listar todos os clientes
  def index
    @clients = Client.all
    render json: @clients
  end

  # Buscar um cliente específico
  def show
    render json: @client
  end

  # Criar um novo cliente
  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # Atualizar um cliente
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # Deletar um cliente
  def destroy
    @client.destroy
    head :no_content
  end

  # Buscar usuários da API externa (JSONPlaceholder)
  def external_clients
    url = URI("https://jsonplaceholder.typicode.com/users")
    response = Net::HTTP.get(url)
    clients = JSON.parse(response)

    formatted_clients = clients.map do |client|
      {
        id: client["id"],
        name: client["name"],
        #cpf: client["phone"],
        email: client["email"]
      }
    end

    # Adicionar CPF a cada cliente
    clients_with_cpf = formatted_clients.map do |client|
      client.merge("cpf" => CPF.generate(true)) # true para formatado (###.###.###-##)
    end

    render json: clients_with_cpf

  end


  private

  def set_client
    @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Client not found" }, status: :not_found
  end

  def client_params
    params.require(:client).permit(:name, :cpf, :email)
  end
end
