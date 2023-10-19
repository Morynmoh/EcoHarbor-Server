Rails.application.routes.draw do
  get 'pages/signin'
  devise_for :employees, path: '', path_names: { sign_in: 'signin', sign_out: 'signout', registration: 'signup'}, controllers: {
    sessions: 'employees/sessions', registrations: 'employees/registrations' }

  resources :employees

  resources :departments

  resources :assetz

  resources :repairs

  resources :requests

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



end
