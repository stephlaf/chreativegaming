Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]
  
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'community', to: 'pages#community'

  resources :games do
    member do
      get 'toggle_availability'
    end
  end

  
end
