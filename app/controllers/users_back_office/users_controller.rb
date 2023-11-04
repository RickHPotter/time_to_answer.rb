# frozen_string_literal: true

module UsersBackOffice
  # Controller for Users in Users BackOffice
  class UsersController < UsersBackOfficeController
    before_action :set_user, only: %i[show edit update destroy]

    def index
      respond_to do |format|
        format.html
        # TODO: Make this a POST route so that this can be used
        format.json { render json: Datatable::DatatableUser.new(params) }
      end
    end

    def edit; end

    private

    def set_admin
      @user = User.find(params[:id])
    end
  end
end
