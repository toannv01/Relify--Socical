# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'passwod_resets/new'
  # get 'session/auth'
  root "sessions#new"
  # root "newsfeeds#index"

  get "/registration", to: "users#new"
  post "/registration", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  #ket ban
  get "/friends", to: "users#my_friends"
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
  resources :friendships
  get 'my_friends', to: 'users#my_friends'
  get "/timeline/:id", to: "users#timeline"
  get 'my_friend', to: 'users#list_friends'


# edit user profile
  get "/passwords", to: "users#passwords"
  put "/passwords", to: "user#passwords"
  get "/searchs", to: "users#search"
  get "/find_friends", to: "users#find_friends"
  delete "/friends", to: "users#friends"
  get "/users/list", to: "users#list"
  post "/add_friends", to: "users#add_friends"
  post "/likes", to: "users#likes"
  delete "/likes", to: "users#likes"

  get "/registration", to: "users#new"
  post "/registration", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"



  get "auth/verify",to: "account_activations#verify"
  get "/sucessVerify",to: "account_activations#sucessVerify"
  get "/unVerify",to: "account_activations#unVerify"
  # get "/active", to: "users#active"

  get "/newsfeeds", to: "newsfeeds#index"
  get "/uploadimages", to: "images#new"
  get "/list_image", to: "newsfeeds#list_image"
  get "list_video", to: "newsfeeds#list_video"
  resources :images
  resources :newsfeed_demos


  resources :users do
    resources :posts, only: [:create, :edit, :show, :about, :destroy]
    resources :images
  end
  resources :posts do
    resources :images, only: :create
  end

  resources :auths, only: [:edit]

  resources :comments
  resources :chats
  resources :activities, only: [:create, :show]
  resources :notifications, only: [:show]
  resources :languages, only: [:create, :update, :destroy]
  resources :videos
  resources :abouts
  resources :users
  resources :password_resets


  # resources :users do
  #   resources :posts
  #   resources :add_friends
  #   resources :cities
  #   resources :countries
  #   resources :comments
  #   resources :chats
  #   resources :activities
  #   resources :notifications
  #   resources :newsfeeds
  #   resources :images
  # end

  # resources :posts do
  #   resources :images
  # end

  concern :commentable do
    resources :comments
  end
  resources :posts, concerns: :commentable

  # concern :likable do
  #   resources :likes
  # end
  # resources :posts, concerns: :likable

  # concern :trackable do
  #   resources :activities
  # end
  # resources :comments, concerns: :trackable
  # resources :add_friends, concerns: :trackable
  # resources :likes, concerns: :trackable
  # resources :notifications, concerns: :trackable
  # resources :posts, concerns: :trackable

  # concern :notifiable do
  #   resources :notifications
  # end
  # resources :comments, concerns: :notifiable
  # resources :add_friends, concerns: :notifiable
  # resources :likes, concerns: :notifiable
end
