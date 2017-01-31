Rails.application.routes.draw do
  devise_for :users

  root 'homepage#index'

  resources :games do
    resources :signups, only: [:new, :create, :delete]
    resources :requests, only: [:new, :create, :delete]
    resources :comments, only: [:index]
  end

  resources :users, only: [:show] do
    resources :signups, only: [:index]
    resources :requests, only: [:index]
  end

end
