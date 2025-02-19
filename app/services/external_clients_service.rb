require "net/http"
require "json"
require "cpf_cnpj"

class ExternalClientsService
  API_URL = "https://jsonplaceholder.typicode.com/users"

  def self.fetch_and_store_clients
    response = Net::HTTP.get(URI(API_URL))
    clients = JSON.parse(response)

    clients.each do |client_data|
      Client.find_or_create_by(email: client_data["email"]) do |client|
        client.name = client_data["name"]
        client.cpf = CPF.generate(true) # Gera um CPF formatado
      end
    end
  end
end
