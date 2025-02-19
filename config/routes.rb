Rails.application.routes.draw do
  resources :clients, only: [:index, :show, :update, :destroy]
  resources :policies

  get "/external_clients", to: "clients#external_clients"

  get "/client_claims/:cpf", to: "clients#client_claims"

end