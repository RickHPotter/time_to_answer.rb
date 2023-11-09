# frozen_string_literal: true

# Datatable Module
module Datatable
  # Datatable Schema for User
  class DatatableUser < DatatableBase
    # EXTENDS
    extend Forwardable

    def_delegators :@view, :content_tag, :concat, :link_to_show, :link_to_edit, :link_to_destroy,
                   :edit_user_registration_path, :users_destroy_path

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
        id: { source: 'User.id' },
        email: { source: 'User.email' },
        created_at: { source: 'User.created_at' },
        updated_at: { source: 'User.updated_at' },
        actions: { label: 'Actions' }
      }
    end

    def datum
      @datum ||= records.map do |record|
        {
          id: record.id,
          email: record.email,
          created_at: record.created_at,
          updated_at: record.updated_at,
          actions: actions(record.id)
        }
      end
    end

    def actions(id)
      content_tag(:div, class: 'row text-center') do
        concat(link_to_edit(edit_user_registration_path, class: 'col-6'))
        concat(link_to_destroy(users_destroy_path(id:), class: 'col-6'))
      end
    end

    def records
      User.all
    end
  end
end
