Rails.application.routes.draw do

  namespace :admin do
    resources :games
    resources :reviews
    resources :downloads
    resources :users
    resources :orders, only: [:index, :show]

    root to: "games#index"
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

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

  # Temporary redirects until forum feature is released >> RELEASED 2202/01/29
  # match '/forum', to: 'pages#not_found', via: :all
  # match 'forum/*any', to: 'pages#not_found', via: :all

  # Forum stuff
  mount Thredded::Engine => '/forum'
  get '/forum', to: 'thredded/messageboards#index'
  post ':post_id/likes', to: 'likes#create_destroy', as: :likes

  get '/priorities/blog_post/:blog_post_id', to: 'priorities#remove_blog_post_priority', as: :blog_priority
  get '/priorities/forum_post/:forum_post_id', to: 'priorities#remove_forum_post_priority', as: :forum_priority

  # SeoTemplate for autonomy purposes
  get '/seo/edit_picture', to: 'seo#edit_picture', as: :edit_picture
  patch '/seo', to: 'seo#update_picture', as: :update_picture

  # Commented out games routes for MVP
  # resources :games, except: [:new, :create, :edit, :update]
  resources :games, only: [:index, :show]
  get '/my-games', to: 'games#my_games'

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
    get '/validate_transaction', to: 'payments#validate'
  end
  get '/rollback_canceled_order', to: 'orders#rollback_canceled_order'
  get '/rollback_aborted_transaction', to: 'orders#rollback_aborted_transaction'

  mount StripeEvent::Engine, at: '/webhooks'

  # Temporary redirects until games feature is released
  # match 'games', to: 'pages#not_found', via: :all
  match 'games/*any', to: 'pages#not_found', via: :all
  match 'users', to: 'pages#not_found', via: :all
end
