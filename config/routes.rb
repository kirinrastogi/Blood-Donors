Rails.application.routes.draw do
  resources :donors, only: [:show, :index, :create, :new]
  post '/recipients/affected' => 'recipients#affected'
  resources :donations, only: [:show, :index, :create]
  post '/donations/donor' => 'donations#donor'
  post '/donations/recipient' => 'donations#recipient'
  resources :recipients, only: [:show, :index, :create]
end
