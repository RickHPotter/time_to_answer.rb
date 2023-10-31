# frozen_string_literal: true

# Base Controller Config for all AdminsBackoffice Controllers
class AdminsBackofficeController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins_backoffice'
end
