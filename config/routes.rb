# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  resources :dashboard, only: %i[index show]
  resources :categories, :posts, :comments
  resources :members
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
end
