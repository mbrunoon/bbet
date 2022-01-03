Rails.application.routes.draw do

  root "main#index"

  resources :groups
  resources :techniques

end
