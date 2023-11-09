# frozen_string_literal: true

# Datatable Module
module Datatable
  # Datatable Schema for Admin
  class DatatableAdmin < DatatableBase
    # EXTENDS
    extend Forwardable

    def_delegators :@view, :content_tag, :concat, :link_to, :edit_admin_registration_path

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
        id: { source: 'Admin.id' },
        email: { source: 'Admin.email' },
        created_at: { source: 'Admin.created_at' },
        updated_at: { source: 'Admin.updated_at' }
      }
    end

    def datum
      @datum ||= records.map do |record|
        {
          id: record.id,
          email: record.email,
          created_at: record.created_at,
          updated_at: record.updated_at
        }
      end
    end

    def records
      Admin.all
    end
  end
end
