Rails.application.routes.draw do
  root to: 'events#index'

  devise_for :users
  resources :users, except: [ :new, :create ]

  resources :events, path: '/'
end
