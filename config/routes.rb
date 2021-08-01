Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#create'

  resources :users

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  match '/logout', to: 'sessions#destroy', via: [:get, :post]
end
