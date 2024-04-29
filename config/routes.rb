Rails.application.routes.draw do
  resources :sales
  resources :vendors
  resources :products
  devise_for :users, :controllers => { registrations: "users/registrations", sessions: "users/sessions" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  unauthenticated do
    root "users#index"
  end

  authenticated :user do
    root "inventory#index", as: "authenticated_root"
  end

  resources :sales
  resources :inventory

  resources :products do
    get "quantity", on: :member
  end

  post "/products/quantity/:id", to: "products#quantity"
end
