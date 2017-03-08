Rails.application.routes.draw do
  resources :donors, only: [:show, :index, :create]
  resources :transactions, only: [:show, :index, :create]
  post '/transactions/donor' => 'transactions#donor'
  resources :recipients, only: [:show, :index, :create]
end
