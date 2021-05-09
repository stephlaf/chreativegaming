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

  # Temporary redirects until forum feature is released
  match '/forum', to: 'pages#not_found', via: :all
  match 'forum/*any', to: 'pages#not_found', via: :all

  # Forum stuff
  mount Thredded::Engine => '/forum'
  get '/forum', to: 'thredded/messageboards#index'
  post ':post_id/likes', to: 'likes#create_destroy', as: :likes

  get '/priorities/blog_post/:blog_post_id', to: 'priorities#remove_blog_post_priority', as: :blog_priority
  get '/priorities/forum_post/:forum_post_id', to: 'priorities#remove_forum_post_priority', as: :forum_priority

  
  # Commented out games routes for MVP
  # resources :games, except: [:new, :create, :edit, :update]

  # Temporary redirects until games feature is released
  match 'games', to: 'pages#not_found', via: :all
  match 'games/*any', to: 'pages#not_found', via: :all
  match 'users', to: 'pages#not_found', via: :all
end
