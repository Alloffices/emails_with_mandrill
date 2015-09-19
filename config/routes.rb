Rails.application.routes.draw do
  devise_for :users

  root "users#index"

  resources :messages, only: [:create, :new, :index]

  resources :users
end
