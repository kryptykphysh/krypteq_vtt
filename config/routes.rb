Rails.application.routes.draw do
  # Endpoint for ActionCable websockets
  mount ActionCable.server => "/cable"

  resources :scenes

  devise_for :users

  get 'static_pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "static_pages#home"
end
