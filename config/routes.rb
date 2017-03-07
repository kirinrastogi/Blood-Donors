Rails.application.routes.draw do
  resources :donors, only: [:show, :index, :create]
end
