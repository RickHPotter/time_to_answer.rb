# frozen_string_literal: true

# Datatable Module
module Datatable
  # Datatable Schema for Question
  class DatatableQuestion < DatatableBase
    # EXTENDS
    extend Forwardable

    def_delegators :@view, :content_tag, :concat, :link_to_show, :link_to_edit, :link_to_destroy,
                   :question_path, :edit_question_path

    # INSTANCE METHODS
    def initialize(params = {}, view_context: nil)
      raise ArgumentError, 'View Context is missing, my dear friendo.' if view_context.blank?

      @view = view_context
      only = params[:only] if params[:only].present?
      except = params[:except] if params[:except].present?
      query = params[:query] if params[:query].present?
      super(only, except, query)
    end

    def columns
      @columns ||= {
        id: { source: 'Question.id' },
        description: { source: 'Question' },
        subject_description: { source: 'Subject' },
        actions: { label: 'Actions' }
      }
    end

    def datum
      @datum ||= records.map do |record|
        {
          id: record.id,
          description: record.description.truncate(88),
          subject_description: record.subject_description,
          actions: actions(record.id)
        }
      end
    end

    def actions(id)
      content_tag(:div, class: 'row text-center') do
        concat(link_to_edit(edit_question_path(id:), class: 'col-6'))
        concat(link_to_destroy(question_path(id:), class: 'col-6'))
      end
    end

    def records
      Question.joins(:subject).select('questions.*, subjects.description as subject_description')
    end
  end
end
