# frozen_string_literal: true

# Base Controller Config for all UsersBackOffice Controllers
class UsersBackOfficeController < ApplicationController
  before_action :authenticate_user!
  layout 'users_back_office'
end
