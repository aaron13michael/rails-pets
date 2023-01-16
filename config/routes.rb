Rails.application.routes.draw do
  root 'pets#index'
  get 'pets/index', to: 'pets#index'
  get 'pets/create', to: 'pets#index'
  get 'pets/show/:id', to: 'pets#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
