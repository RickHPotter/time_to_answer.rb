# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  description :text             not null
#  support     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  subject_id  :integer          not null
#
# Indexes
#
#  index_questions_on_subject_id  (subject_id)
#
# Foreign Keys
#
#  subject_id  (subject_id => subjects.id)
#
class Question < ApplicationRecord
  belongs_to :subject
  has_many :answers

  validates :description, presence: true

  def self.datatable(params = {}, view_context: nil)
    Datatable::DatatableQuestion.new(params, view_context:).datatable
  end
end
