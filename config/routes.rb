Rails.application.routes.draw do
  resources :services
  resources :phones
  resources :adresses
  resources :drivers
  resources :clients
  resources :vehicles
  root 'welcome#index'
end
