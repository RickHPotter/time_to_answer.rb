# frozen_string_literal: true

module AdminsBackOffice
  # Controller for Admins in Admins BackOffice
  class AdminsController < AdminsBackOfficeController
    def index
      @admins = Admin.all
    end
  end
end
