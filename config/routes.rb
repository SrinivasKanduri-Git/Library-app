Rails.application.routes.draw do
  root 'companies#index'
  resources :regions
  resources :locations
  resources :libraries
  resources :books
  resources :authors
  resources :companies

end
