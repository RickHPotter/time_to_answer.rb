# frozen_string_literal: true

# == Schema Information
#
# Table name: subjects
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Subject < ApplicationRecord
  has_many :questions

  validates :description, presence: true
  validates :description, length: { minimum: 3, maximum: 50 }

  def self.datatable(params = {}, view_context: nil)
    Datatable::DatatableSubject.new(params, view_context:).datatable
  end
end
