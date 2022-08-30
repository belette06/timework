# frozen_string_literal: true

class CreateWeektimes < ActiveRecord::Migration[7.0]
  def change
    create_table :weektimes do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.date :dateweek
      t.integer :numsemaine
      t.float :workweek, default: 0
      t.boolean :accord, default: false

      t.timestamps
    end
    add_index :weektimes, :id,                unique: true
  end
end
