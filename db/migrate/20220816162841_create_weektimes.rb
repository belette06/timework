# frozen_string_literal: true

class CreateWeektimes < ActiveRecord::Migration[7.0]
  def change
    create_table :weektimes do |t|
      t.references :user, null: false, foreign_key: true
      t.date :dateweek
      t.time :workweek
      t.boolean :accord

      t.timestamps
    end
  end
end
