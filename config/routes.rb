Rails.application.routes.draw do
  root to: 'toppages#index'
  devise_for :users
end
