# frozen_string_literal: true

# Datatable Module
module Datatable
  # Datatable Schema for User
  class DatatableAdmin < DatatableBase
    def initialize(only: nil, except: nil, query: nil)
      super(only, except, query)
    end

    def keys
      @keys ||= {
        id: { source: 'Admin.id' },
        email: { source: 'Admin.email' },
        created_at: { source: 'Admin.created_at' },
        updated_at: { source: 'Admin.updated_at' },
        actions: {}
      }
    end

    def values
      @values ||= records.map do |record|
        {
          id: record.id,
          email: record.email,
          created_at: record.created_at,
          updated_at: record.updated_at,
          actions: content_tag(:div, link_to(I18n.t('actions.edit'), edit_user_admin_path(record.id)))
        }
      end
    end

    def records
      Admin.all
    end
  end
end
