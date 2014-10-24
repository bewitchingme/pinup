Rails.application.routes.draw do
  root to: 'events#index'

  namespace :admin do
    resources :ads
  end

  devise_for :users
  resources :users, except: [ :new, :create, :destroy ]

  resources :artists
  resources :venues
  resources :events, path: '/'
end
