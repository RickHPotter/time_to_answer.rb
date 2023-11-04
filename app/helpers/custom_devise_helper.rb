# frozen_string_literal: true

# Helpers for Devise Related Views
module CustomDeviseHelper
  def sibling_resource_name
    devises = %i[admin user]
    devises.delete resource_name
    devises.first
  end

  def link_to_switch_devise
    sibling_sym = sibling_resource_name
    sibling = sibling_sym.to_s.capitalize

    case controller_name
    when 'sessions'
      link_to "Not an #{resource_class}? Log In as #{sibling}", new_session_path(sibling_sym), class: 'small'
    when 'registrations'
      link_to "Not an #{resource_class}? Sign Up as #{sibling}", new_registration_path(sibling_sym), class: 'small'
    end
  end
end
