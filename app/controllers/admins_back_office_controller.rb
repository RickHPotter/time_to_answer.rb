# frozen_string_literal: true

# Base Controller Config for all AdminsBackOffice Controllers
class AdminsBackOfficeController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins_back_office'
end
