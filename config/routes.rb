# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  get '/user/index',  to: 'users_back_office/users#index',   as: :user_root
  get '/admin/index', to: 'admins_back_office/admins#index', as: :admin_root

  root to: 'users#sign_in'
end
