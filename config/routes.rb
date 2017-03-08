Rails.application.routes.draw do
  resources :donors, only: [:show, :index, :create]
  resources :transactions, only: [:show, :index, :create]
  resources :recipients, only: [:show, :index, :create]
end
