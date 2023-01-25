Rails.application.routes.draw do
  root 'pets#index'
  get 'pets/index', to: 'pets#index'
  get 'pets/:id', to: 'pets#show', as: 'pets_show'
  get 'pets/search', to: 'pets#search', as: 'pets_search' 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
