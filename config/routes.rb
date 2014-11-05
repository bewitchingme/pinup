Rails.application.routes.draw do
  root to: 'events#index'

  scope '/admin' do
    resources :events
    resources :ads, module: :admin
  end

  devise_for :users
  resources :users, except: [ :new, :create, :destroy ]

  resources :artists
  resources :venues
  resources :events, path: '/', except: [ :edit, :destroy ]
end
