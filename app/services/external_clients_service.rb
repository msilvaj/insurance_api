require "net/http"
require "json"
require "cpf_cnpj"

class ExternalClientsService
  API_URL = "https://jsonplaceholder.typicode.com/users"

  def self.fetch_clients
    response = Net::HTTP.get(URI(API_URL))
    clients = JSON.parse(response)

    clients.map do |client|
      {
        id: client["id"],
        name: client["name"],
        email: client["email"],
        cpf: CPF.generate(true) # Gera um CPF formatado
      }
    end
  end
end
