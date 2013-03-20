Mathra::Application.routes.draw do
  #scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
  resources :rowempls
  resources :warehouses
  resources :hardwaretypes
  resources :employees

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users
  scope "/admin" do
    resources :users
  end
  resources :users
  #end

  #match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  #match '', to: redirect("/#{I18n.default_locale}")
end