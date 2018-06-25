Rails.application.routes.draw do
  root to: 'toppages#index'

  devise_for :users
  resources :weights

  resources :profiles, only: [:show, :new, :create, :edit, :update]
end
