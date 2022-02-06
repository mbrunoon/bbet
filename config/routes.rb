Rails.application.routes.draw do

  root "main#index"

  resources :groups
  resources :techniques
  resources :users, param: :_username
  post "/auth/login", to: "authentication#login"
  get "/*a", to: "application#not_found"

end
