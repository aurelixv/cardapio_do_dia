Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  authenticated :user do
    root 'users#profile', as: :authenticated_root
  end
  resources :employees
  resources :managers
  resources :items
  resources :restaurants
  resources :users
  root to: 'home#index'
  get "/profile", to: "users#profile"
  get "/home", to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
