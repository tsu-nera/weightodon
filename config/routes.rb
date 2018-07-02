Rails.application.routes.draw do
  root to: 'toppages#index'
  get '/toppages', :to => 'toppages#show'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :weights

  resources :profiles, only: [:show, :new, :create, :edit, :update]
  resources :weightodons, only: [:new, :create, :destroy]
end
