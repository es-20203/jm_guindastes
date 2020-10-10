Rails.application.routes.draw do
  resources :phones
  resources :services
  resources :addresses
  resources :drivers
  resources :vehicles
  resources :clients

  devise_for :users
  root 'welcome#index'
end
