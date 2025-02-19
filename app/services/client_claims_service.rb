class ClientClaimsService
  def self.fetch_claims(cpf)
    # Gerar um número aleatório de sinistros (0 a 3)
    num_claims = rand(0..3)

    # Criar um histórico de sinistros fictício
    claims = Array.new(num_claims) do
      {
        id: SecureRandom.uuid,
        date: Faker::Date.between(from: '2020-01-01', to: Date.today),
        description: ["Colisão traseira", "Dano por enchente", "Roubo total"].sample,
        amount: rand(1_000..10_000)
      }
    end

    { cpf: cpf, claims: claims }
  end
end
