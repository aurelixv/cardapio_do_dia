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
  get "/item", to: "items#profile"
  get "/employee", to: "employees#profile"
  get "/home", to: "home#index"
  get "/about", to: "home#about"
  get "/search", to: "home#search"
  get "/prato/:id", to: "home#prato"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
