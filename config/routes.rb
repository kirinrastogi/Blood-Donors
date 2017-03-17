Rails.application.routes.draw do
  resources :donors, only: [:show, :index, :create, :new]
  get '/recipients/affected/:id' => 'recipients#affected'
  resources :donations, only: [:show, :index, :create, :new]
  get '/donations/donor/:id' => 'donations#donor'
  get '/donations/recipient/:id' => 'donations#recipient'
  resources :recipients, only: [:show, :index, :create, :new]
end
