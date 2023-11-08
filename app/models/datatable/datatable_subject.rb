# frozen_string_literal: true

# Datatable Module
module Datatable
  # Datatable Schema for Subject
  class DatatableSubject < DatatableBase
    extend Forwardable

    def_delegators :@view, :content_tag, :concat, :link_to_show, :link_to_edit, :link_to_destroy,
                   :subject_path, :edit_subject_path

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
        id: { source: 'Subject.id' },
        description: { source: 'Subject.description' },
        actions: { label: 'Actions' }
      }
    end

    def datum
      @datum ||= records.map do |record|
        {
          id: record.id,
          description: record.description,
          actions: actions(record.id)
        }
      end
    end

    def actions(id)
      content_tag(:div, class: 'row text-center') do
        concat(link_to_edit(edit_subject_path(id:), class: 'col-6'))
        concat(link_to_destroy(subject_path(id:), class: 'col-6'))
      end
    end

    def records
      Subject.all.order(description: :asc)
    end
  end
end
