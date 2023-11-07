# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  scope module: :admins_back_office do
    scope module: :admins, path: 'admins' do
      get 'index', as: :admin_root
    end

    namespace :admins do
      post 'datatable'
      delete 'destroy'
    end
  end

  scope module: :users_back_office do
    scope module: :users, path: 'users' do
      get 'index', as: :user_root
    end

    namespace :users do
      post 'datatable'
      delete 'destroy'
    end
  end

  root to: 'users#sign_in'
end
