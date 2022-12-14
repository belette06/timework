# frozen_string_literal: true

class CreateWorktimes < ActiveRecord::Migration[7.0]
  def change
    create_table :worktimes do |t|
      t.references :weektime, null: false, foreign_key: true, index: true
      t.time :gotime
      t.time :endtime
      t.integer :daytime
      t.integer :workday, default: 0
      t.boolean :accord, default: false

      t.timestamps
    end
    add_index :worktimes, :id,                unique: true
  end
end
