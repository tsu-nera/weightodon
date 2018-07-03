Rails.application.routes.draw do
  root to: 'toppages#index'
  get '/toppages', :to => 'toppages#show'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :weights, except: [:index]
  post '/remotes', :to => 'remotes#create'

  resources :profiles, only: [:show, :new, :create, :edit, :update]
  resources :weightodons, only: [:show, :new, :create, :destroy]
end
