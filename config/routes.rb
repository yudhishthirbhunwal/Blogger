Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root 'pages#home'
  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/help', to: 'pages#help'
  resources :users, only: [:index, :show]
  resources :microposts do
    resources :comments, except: [:index, :new, :show]
  end
  resources :likes, only: [:create, :destroy]
  get 'tags/:tag', to: 'microposts#index', as: :tag
end
