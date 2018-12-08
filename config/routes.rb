Rails.application.routes.draw do
  devise_for :users
  resources :employees
  resources :managers
  resources :items
  resources :menus
  resources :restaurants
  resources :users
  root to: 'home#index'
  get '/login', to: 'home#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
