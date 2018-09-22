Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users,
             path: "", # Remove "/users/.." from URL
             path_names: {sign_in: "login", sign_out: "logout", edit: "profile"}, # Change path names in URL, i.e. "/login" instead of "/sign_in"
             controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "registrations"}

  resources :users, only: [:show]

  resources :services do
    resources :orders, only: [:create]
    resources :reviews, only: [:create, :destroy]
  end

  resources :orders, only: [:show]
  resources :charges

  get "/user_orders", to: "orders#user_orders"
  get "/user_sales", to: "orders#user_sales"

  get "/search", to: "search#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
