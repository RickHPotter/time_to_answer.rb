# frozen_string_literal: true

module UsersBackOffice
  # Controller for Users in Users BackOffice
  class UsersController < UsersBackOfficeController
    before_action :set_users, only: %i[index]
    before_action :set_user, only: %i[show edit update destroy]
    # skip_before_action :authenticate_user!, only:

    def index
      respond_to(&:html)
    end

    def edit; end

    private

    def set_users
      @users = User.all
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
