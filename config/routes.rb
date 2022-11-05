# frozen_string_literal: true

Rails.application.routes.draw do 

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #rails g controller users index show
  root 'users#index'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end  
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
