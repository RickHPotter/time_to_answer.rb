# frozen_string_literal: true

class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # TODO: If I feel the need to, I'll mimic ajax-datatable-rails and create a new DatatableModel,
  # Reason is pretty simple, I can get standalone filters and fix data that needs manipulation.
  #
  def self.datatable(fields = [])
    keys = fields.map { |key| I18n.t("activerecord.attributes.admin.#{key}") }
    values = Admin.pluck(*fields)

    [Admin, keys, values]
  end
end
