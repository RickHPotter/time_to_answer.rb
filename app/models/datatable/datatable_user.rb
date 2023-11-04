# frozen_string_literal: true

# Datatable Module
module Datatable
  # Datatable Schema for User
  class DatatableUser < DatatableBase
    extend Forwardable

    def_delegators :@view, :content_tag, :concat, :link_to, :edit_user_registration_path

    def initialize(only: nil, except: nil, query: nil, view_context: nil)
      @view = view_context
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
          actions: content_tag(:div, class: 'row text-center') do
            concat(link_to(edit_user_registration_path, class: 'col-6') { content_tag(:i, '', class: 'fa fa-edit') })
            concat(link_to(edit_user_registration_path, class: 'col-6') { content_tag(:i, '', class: 'fa fa-minus') })
          end

        }
      end
    end

    def records
      User.all
    end
  end
end
