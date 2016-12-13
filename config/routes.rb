Rails.application.routes.draw do
  root to: "posts#index"

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: "sessions#new", as: :login
  match '/logout', to: "sessions#destroy", via: [:get, :delete], as: :logout

  match "/auth/:provider/callback", :to => 'sessions#create', via: :all

  resources :posts do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
