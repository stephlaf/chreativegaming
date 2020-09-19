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
  resources :users, only: [:show, :edit, :update, :create]

  # resources :users do
  #   member do
  #     get 'archive_profile'
  #   end
  # end
  
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'community', to: 'pages#community'

  # Blog stuff
  resources :blog_posts
  # resources :blog_posts, except: [:new, :create]

  # resources :users, only: [] do
  #   resources :blog_posts, only: [:new, :create]
  # end



  # Forum stuff
  mount Thredded::Engine => '/forum'
  get '/forum', to: 'thredded/messageboards#index'
  
  post ':post_id/likes', to: 'likes#create_destroy', as: :likes
  # post ':messageboard_id/:post_id/likes', to: 'likes#create', as: :likes

  # resources :post do
  #   resources :likes, only: [:create]
  # end




  # resources :games do
  #   member do
  #     get 'toggle_availability'
  #   end
  # end

  resources :games, except: [:new, :create, :edit, :update]


  match 'games/*any', to: 'pages#not_found', via: :all
  match 'users', to: 'pages#not_found', via: :all
end
