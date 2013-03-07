Mathra::Application.routes.draw do
  resources :rowempls

  resources :warehouses
  resources :hardwaretypes
  resources :employees

  #get "employees/index"

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users
  resources :users

end