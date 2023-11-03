# frozen_string_literal: true

# General Helpers
module ApplicationHelper
  def default_head_title
    "#{action_name.capitalize} #{controller_name.capitalize.singularize}"
  end
end
