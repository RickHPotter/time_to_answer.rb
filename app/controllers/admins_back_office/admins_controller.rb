# frozen_string_literal: true

module AdminsBackOffice
  # Controller for Admins in Admins BackOffice
  class AdminsController < AdminsBackOfficeController
    before_action :set_admins, only: %i[index]
    before_action :set_admin, only: %i[show edit update destroy]

    def index
      respond_to(&:html)
    end

    private

    def set_admins
      @admins = Admin.all
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end
  end
end
