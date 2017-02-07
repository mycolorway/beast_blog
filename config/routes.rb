Rails.application.routes.draw do
  root to: "posts#index"

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: "sessions#new", as: :login
  match '/logout', to: "sessions#destroy", via: [:get, :delete], as: :logout

  match "/auth/:provider/callback", :to => 'sessions#create', via: :all

  resources :posts do
    resources :comments, only: [:index, :create]
  end
  resource :archive, only: [:show]

  resources :albums do
    resources :photos, only: [:create]
  end

  # feed
  get 'feed', to: 'posts#index', constraints: lambda { |req| req.format = :atom }
  get '/tag/:tag', to: 'posts#index', as: :tag
end
