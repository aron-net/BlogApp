# frozen_string_literal: true

Rails.application.routes.draw do 
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #rails g controller users index show
  root 'users#index'
  get 'users/show'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end  
  end
end
