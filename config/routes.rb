Rails.application.routes.draw do
  resources :phones
  resources :services
  resources :addresses
  resources :drivers
  resources :clients
  resources :vehicles
  root 'welcome#index'
end
