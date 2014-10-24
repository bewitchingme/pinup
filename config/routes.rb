Rails.application.routes.draw do
  resources :venues

  root to: 'events#index'

  namespace :admin do
    resources :ads
  end

  devise_for :users
  resources :users, except: [ :new, :create, :destroy ]

  resources :events, path: '/'
end
