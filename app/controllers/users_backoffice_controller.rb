# frozen_string_literal: true

# Base Controller Config for all UsersBackoffice Controllers
class UsersBackofficeController < ApplicationController
  before_action :authenticate_user!
  layout 'users_backoffice'
end
