# frozen_string_literal: true

# Components for making one's life easier
module ComponentsHelper
  # The so-loved datatable
  def ajax_datatable(columns, datum, options = {}, &block)
    render 'layouts/sb_admin_2/datatable/datatable', columns:, datum:, options:, &block
  end

  def link_to_new(link, options = {})
    options_class = [options.delete(:class), 'btn btn-success btn-icon-split']
    link_to(link, options.merge(class: options_class)) do
      content_tag(:span, '', class: 'icon text-white-50') do
        content_tag(:i, '', class: 'fas fa-plus')
      end
      content_tag(:span, "New #{controller_name.singularize.capitalize}", class: 'text')
    end
  end

  def link_to_show(link, options = {})
    options_class = [options.delete(:class), '']
    link_to(link, options.merge(class: options_class)) do
      content_tag(:div, '', class: 'btn btn-success btn-circle btn-sm ') do
        content_tag(:i, '', class: 'fas fa-eye')
      end
    end
  end

  def link_to_edit(link, options = {})
    options_class = [options.delete(:class), '']
    link_to(link, options.merge(class: options_class)) do
      content_tag(:div, '', class: 'btn btn-primary btn-circle btn-sm ') do
        content_tag(:i, '', class: 'far fa-edit')
      end
    end
  end

  def link_to_destroy(link, options = {})
    options_class = [options.delete(:class), '']
    link_to(link, options.merge(class: options_class, data: { turbo_method: :delete })) do
      content_tag(:div, '', class: 'btn btn-danger btn-circle btn-sm ') do
        content_tag(:i, '', class: 'fa fa-trash')
      end
    end
  end
end
