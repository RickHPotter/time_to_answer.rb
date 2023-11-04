# frozen_string_literal: true

module UsersBackOffice
  # Controller for Users in Users BackOffice
  class UsersController < UsersBackOfficeController
    before_action :set_user, only: %i[show edit update destroy]

    def index; end

    private

    def set_admin
      @user = User.find(params[:id])
    end
  end
end
