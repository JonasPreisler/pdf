Rails.application.routes.draw do
  resources :bot_users
  resources :pdfs
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :sellers
  resources :materials
  root 'products#index'
  resources :products
  get "products/:seller/:id", to: 'products#show', as: 'show_product'
  namespace 'api' do
    namespace 'v1' do
      resources :bot_users
  	end
  end
  get 'callback/index'
  post '/' => 'callback#received_data'
  get 'callback/received_data'

end
