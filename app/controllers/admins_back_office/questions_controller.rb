# frozen_string_literal: true

module AdminsBackOffice
  # Controller for Questions in Admins BackOffice
  class QuestionsController < AdminsBackOfficeController
    before_action :set_count, only: %i[index]
    before_action :set_question, only: %i[show edit update destroy]
    before_action :new_question, only: %i[new create]
    before_action :_subjects, only: %i[new create edit update]

    def index; end

    def new; end

    def create
      if @question.update(question_params)
        redirect_to questions_path, notice: 'Question was successfully created.'
      else
        redirect_to new_question_path, alert: @question.errors.full_messages.first
        # FIXME: Code below doesnt make validations show up, fucking hell
        # render :new
      end
    end

    def edit; end

    def update
      if @question.update(question_params)
        redirect_to questions_path, notice: 'Question was successfully updated.'
      else
        redirect_to edit_question_path(@question), alert: @question.errors.full_messages.first
        p @question.errors
        # FIXME: Code below doesnt make validations show up, fucking hell
        # render :edit
      end
    end

    def destroy; end

    private

    def set_count
      @count = Question.count
    end

    def new_question
      @question = Question.new
    end

    def set_question
      @question = Question.find(params[:id])
    end

    def _subjects
      @subjects = Subject.all
    end

    def question_params
      params.require(:question).permit(:description, :subject_id, :correct_answer)
    end
  end
end
