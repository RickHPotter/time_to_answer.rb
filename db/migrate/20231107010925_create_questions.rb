# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :description, null: false
      t.text :support
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
