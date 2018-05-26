Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :sellers
  resources :materials
  root 'products#index'
  resources :products
  get "products/:seller/:id", to: 'products#show', as: 'show_product'
  
end
