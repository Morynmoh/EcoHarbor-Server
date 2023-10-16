Rails.application.routes.draw do
  get 'pages/signin'
  devise_for :employees

  resources :employees

  resources :departments

  resources :assets

  resources :repairs

  resources :requests

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



end
