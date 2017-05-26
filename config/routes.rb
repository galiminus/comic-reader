Rails.application.routes.draw do
  devise_for :users
  root to: "comics#index"

  resources :comics
  resources :pages, only: [:show, :create]

  get '/s3/sign', to: "s3#sign"
end
