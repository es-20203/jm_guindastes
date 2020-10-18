Rails.application.routes.draw do
  get 'home/index'
  resources :phones
  resources :services
  resources :addresses
  resources :drivers
  resources :vehicles
  resources :clients

  devise_for :users
  root 'welcome#index' 
  get '/:id', to: "welcome#index"

end
