Rails.application.routes.draw do
  resources :sellers
  resources :materials
  root 'sellers#index'
end
