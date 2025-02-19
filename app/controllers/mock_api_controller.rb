class MockApiController < ApplicationController
  def client_claims
    cpf = params[:cpf]

    # Simulando histórico de sinistros
    claims = [
      { id: SecureRandom.uuid, date: "2020-12-12", description: "Roubo total", amount: 2914 },
      { id: SecureRandom.uuid, date: "2023-07-12", description: "Dano por enchente", amount: 6282 },
      { id: SecureRandom.uuid, date: "2023-07-29", description: "Roubo total", amount: 4050 }
    ]

    render json: { cpf: cpf, claims: claims }
  end
end
