Rails.application.routes.draw do
  devise_for :users
  
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'community', to: 'pages#community'

  resources :games
  
end
