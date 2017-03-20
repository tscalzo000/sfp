Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations/registrations'
  }

  root 'homepage#index'

  resources :games do
    resources :signups, only: [:create, :destroy]
    resources :requests, only: [:create, :destroy]
    resources :comments, only: [:create]

  end

  resources :users, only: [:show] do
    resources :notes, except: [:index]
    resources :charactersheets, except: [:index]
    namespace :api do
      namespace :v1 do
        resources :charactersheets, only: [:show]
      end
    end
  end

  resources :map, only: [:index]

  resources :search, only: [:index] do
    get :advanced, on: :collection
  end

  resources :charviews, only: [:new, :create, :destroy]

  resources :conversations do
    resources :messages
  end

  resources :usage, only: [:index]
end
