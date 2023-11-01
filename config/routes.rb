# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end

  namespace :users_back_office, path: 'users_backoffice' do
    get 'welcome/index'
  end

  namespace :admins_back_office, path: 'admins_backoffice' do
    get 'admins/index'
    get 'welcome/index'
  end

  devise_for :users
  devise_for :admins

  root to: 'site/welcome#index'
end
