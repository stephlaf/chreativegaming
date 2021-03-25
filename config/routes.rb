Rails.application.routes.draw do

  namespace :admin do
    resources :games
    resources :reviews
    resources :downloads
    resources :users

    root to: "games#index"
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations' }

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
  get '/blog_posts/:blog_post_id/blog_likes', to: 'blog_likes#create_destroy', as: :blog_like

  # Forum stuff
  mount Thredded::Engine => '/forum'
  get '/forum', to: 'thredded/messageboards#index'
  post ':post_id/likes', to: 'likes#create_destroy', as: :likes

  # Commented out games routes for MVP
  # resources :games, except: [:new, :create, :edit, :update]

  match 'games', to: 'pages#not_found', via: :all
  match 'games/*any', to: 'pages#not_found', via: :all
  match 'users', to: 'pages#not_found', via: :all
end
