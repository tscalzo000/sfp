Rails.application.routes.draw do
  devise_for :users

  root 'homepage#index'

  resources :games do
    resources :signups, only: [:create, :destroy]
    resources :requests, only: [:create, :destroy]
    resources :comments, only: [:create]

  end

  resources :users, only: [:show] do
    resources :notes, except: [:index]
  end
end
