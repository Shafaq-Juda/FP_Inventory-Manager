Rails.application.routes.draw do
  resources :vendors
  resources :products
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  unauthenticated do
     root "users#index"
  end

  #root "users#index"
  authenticated :user do
    root "productss#index"
  end


end
