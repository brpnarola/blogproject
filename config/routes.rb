# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  resources :dashboard, only: %i[index show]
  resources :categories

  resources :users do
    collection do
      patch :set_role_admin
      get :destroy_multiple
      get :soft_deleted_data
    end
    member do
      patch :user_status_active
      patch :soft_delete
      patch :restore
    end
  end

  resources :posts do
    resources :comments
    member do
      patch :approve
      patch :soft_delete
      patch :restore
    end
    collection do
      patch :approve_all
      get   :soft_delete_post_data
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
end
