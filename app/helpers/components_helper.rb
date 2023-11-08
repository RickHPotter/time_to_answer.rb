# frozen_string_literal: true

# Components for making one's life easier
module ComponentsHelper
  # The so-loved datatable
  def ajax_datatable(columns, datum, options = {}, &block)
    options[:title] ||= controller_name.capitalize
    render 'layouts/sb_admin_2/datatable/datatable', columns:, datum:, options:, &block
  end

  def link_to_show(link, options = {})
    # options.merge(class: 'col-6')
    link_to(link, options) do
      content_tag(:div, '', class: 'btn btn-success btn-circle btn-sm ') do
        content_tag(:i, '', class: 'fas fa-eye')
      end
    end
  end

  def link_to_edit(link, options = {})
    # options.merge(class: 'col-6')
    link_to(link, options) do
      content_tag(:div, '', class: 'btn btn-primary btn-circle btn-sm ') do
        content_tag(:i, '', class: 'far fa-edit')
      end
    end
  end

  def link_to_destroy(link, options = {})
    # options.merge(class: 'col-6')
    link_to(link, options.merge(data: { turbo_method: :delete })) do
      content_tag(:div, '', class: 'btn btn-danger btn-circle btn-sm ') do
        content_tag(:i, '', class: 'fa fa-trash')
      end
    end
  end
end
