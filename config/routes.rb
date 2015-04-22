Rails.application.routes.draw do

  resources :sources do
    collection do
      post :import
    end
  end

  root to: 'root#home'

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :artists, except: [ :edit, :update, :destroy ]
  resources :venues,  except: [ :edit, :update, :destroy ]
  resources :events,  except: [ :destroy ] do
    collection do
      post :import
    end
  end

  namespace :admin do
    get 'dashboard', to: 'dashboard#home'
    get 'load_google_calendars', to: 'dashboard#load_google_calendars'
    
    # get 'authorize_all', to: 'dashboard#authorize_all'
    # get 'delete_all_ads', to: 'dashboard#delete_all_ads'
    # get 'delete_all_banners', to: 'dashboard#delete_all_banners'

    resources :users
    
    resources :ads do
      collection do
        delete :destroy_all
      end
    end

    resources :banners do
      collection do
        delete :destroy_all
      end
    end

    resources :csv_calendars

    resources :artists
    
    resources :venues

    resources :lists
    
    resources :events do
      member do
        patch :authorize
        patch :unauthorize
      end
      
      collection do
        patch :authorize_all
      end
    end
  end
    get '/blog', to: 'static_pages#blog', as: 'blog'
end