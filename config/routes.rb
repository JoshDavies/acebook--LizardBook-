Rails.application.routes.draw do



  get 'messages/new'

  get 'conversations/new'

  get 'home/index'
  root 'home#index'

  resources :users
  resources :posts
  resources :sessions
  resources :comments

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

end
