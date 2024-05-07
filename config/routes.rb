Rails.application.routes.draw do
  resources :sales
  resources :vendors
  # Can remove duplicate `resource :products`. You are defnining this resource again on line 21
  resources :products
  devise_for :users, :controllers => { registrations: "users/registrations", sessions: "users/sessions" }
  # Below, line 7 is automatically generated and should be removed.
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  unauthenticated do
    root "users#index"
  end

  authenticated :user do
    root "inventory#index", as: "authenticated_root"
  end
  # Duplicate sales resource should be removed. You have already defined this on line 2
  resources :sales
  resources :inventory

  resources :products do
    get "quantity", on: :member
  end

  post "/products/quantity/:id", to: "products#quantity"
end
