Rails.application.routes.draw do
  root to: 'toppages#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :weights

  resources :profiles, only: [:show, :new, :create, :edit, :update]
end
