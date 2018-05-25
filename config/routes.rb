Rails.application.routes.draw do
  resources :sellers
  resources :materials
  root 'products#index'
  resources :products
  get "products/:seller/:id", to: 'products#show', as: 'show_product'
  
end
