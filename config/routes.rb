Rails.application.routes.draw do

  # devise_for :users

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, except: [:new, :create]

  resources :users do
    member do
      get 'archive_profile'
    end
  end
  
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'community', to: 'pages#community'

  resources :games do
    member do
      get 'toggle_availability'
    end
  end

  
end
