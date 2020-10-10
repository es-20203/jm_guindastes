Rails.application.routes.draw do
  resources :phones
  resources :services
  resources :addresses
  resources :drivers
  resources :vehicles
  resources :clients

  root 'welcome#index'
end
