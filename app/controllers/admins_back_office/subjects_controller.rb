# frozen_string_literal: true

module AdminsBackOffice
  # Controller for Subjects in Admins BackOffice
  class SubjectsController < AdminsBackOfficeController
    before_action :set_count, only: %i[index]
    before_action :set_subject, only: %i[show edit update destroy]
    before_action :new_subject, only: %i[new create]

    def index; end

    def new; end

    def create
      if @subject.update(subject_params)
        redirect_to subjects_path, notice: 'Subject was successfully created.'
      else
        redirect_to new_subject_path, alert: @subject.errors.full_messages.first
        # FIXME: Code below doesnt make validations show up, fucking hell
        # render :new
      end
    end

    def edit; end

    def update
      if @subject.update(subject_params)
        redirect_to subjects_path, notice: 'Subject was successfully updated.'
      else
        redirect_to edit_subject_path(@subject), alert: @subject.errors.full_messages.first
        # FIXME: Code below doesnt make validations show up, fucking hell
        # render :edit
      end
    end

    def destroy; end

    private

    def set_count
      @count = Subject.count
    end

    def new_subject
      @subject = Subject.new
    end

    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:description)
    end
  end
end
