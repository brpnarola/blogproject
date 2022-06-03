# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  resources :dashboard, only: %i[index show]
  resources :categories, :comments

  resources :users do
    member do
      patch :set_role_admin
    end
  end

  resources :posts do
    member do
      patch :approve
      put :approve_all
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
end
