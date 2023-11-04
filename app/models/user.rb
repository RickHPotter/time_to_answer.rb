# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # TODO: If I feel the need to, I'll mimic ajax-datatable-rails and create a new DatatableModel,
  # Reason is pretty simple, I can get standalone filters and fix data that needs manipulation.
  #
  def self.datatable(fields = [])
    keys = fields.map { |key| I18n.t("activerecord.attributes.admin.#{key}") }
    values = User.pluck(*fields)

    [User, keys, values]
  end
end
