Rails.application.routes.draw do
  resources :bots do
    collection { post :how }
  end
  resources :bot_users
  resources :pdfs
  resources :pages
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :sellers
  resources :materials
  root 'pages#about'
  resources :products
  get "products/:seller/:id", to: 'products#show', as: 'show_product'
  namespace 'api' do
    namespace 'v1' do
      resources :bot_users
  	end
  end

  get 'pages/about', to: 'pages#about'
  get 'pages/how_to', to: 'pages#how_to'

  get 'callback/index'
  post '/' => 'callback#received_data'
  get 'callback/received_data'
end
