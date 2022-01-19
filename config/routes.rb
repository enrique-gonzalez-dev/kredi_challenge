Rails.application.routes.draw do
  resources :links do
    resources :views, only: [:index]
  end
  resources :users

  root to: "views#index"
  get ':short', to: "views#catch_link"

  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end