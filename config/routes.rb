Rails.application.routes.draw do

  namespace :admin do
      resources :games
      resources :reviews
      resources :downloads
      resources :users

      root to: "games#index"
    end
  
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # resources :users, except: [:new, :create]
  resources :users, only: [:show, :edit, :create]

  # resources :users do
  #   member do
  #     get 'archive_profile'
  #   end
  # end
  
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'community', to: 'pages#community'



  # Forum stuff
  mount Thredded::Engine => '/forum'
  get '/forum', to: 'thredded/messageboards#index'

  # resources :games do
  #   member do
  #     get 'toggle_availability'
  #   end
  # end

  resources :games, except: [:new, :create, :edit, :update]

  match 'games/*any', to: 'pages#not_found', via: :all
  match 'users', to: 'pages#not_found', via: :all
end
