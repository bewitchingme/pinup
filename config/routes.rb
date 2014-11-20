Rails.application.routes.draw do
  root to: 'events#index'

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :artists
  resources :venues
  resources :events, path: '/', except: [ :edit, :destroy ]

  scope '/admin' do
    get 'dashboard', to: 'dashboard#home'

    resources :users
    resources :ads, module: :admin
    resources :events
  end
end