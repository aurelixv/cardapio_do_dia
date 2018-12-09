Rails.application.routes.draw do
  resources :restaurant_menus
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
  get "/restaurant", to: "restaurants#profile"
  get "/home", to: "home#index"
  get "/about", to: "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
