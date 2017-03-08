Rails.application.routes.draw do
  resources :donors, only: [:show, :index, :create]
  resources :transactions, only: [:show, :index, :create]
  post '/transactions/donor' => 'transactions#donor'
  post '/transactions/recipient' => 'transactions#recipient'
  resources :recipients, only: [:show, :index, :create]
end
