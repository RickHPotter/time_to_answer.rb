# frozen_string_literal: true

# Components for making one's life easier
module ComponentsHelper
  # The so-loved datatable
  def ajax_datatable(model, keys, values, options = {}, &block)
    options[:title] ||= controller_name.capitalize
    render 'layouts/sb_admin_2/datatable/datatable', model:, keys:, values:, options:, &block
  end
end
