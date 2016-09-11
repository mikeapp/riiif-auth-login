Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get '/login', to: 'home#index'
  get '/token', to: "token#supply_token"
  get '/clear', to: "home#clear"
end
