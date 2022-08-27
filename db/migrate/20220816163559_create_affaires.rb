# frozen_string_literal: true

class CreateAffaires < ActiveRecord::Migration[7.0]
  def change
    create_table :affaires do |t|
      t.string :number
      t.string :client
      t.string :address
      t.string :title
      t.integer :workaffaire, default: 0
      t.references :worktime, foreign_key: true, index: true

      t.timestamps
    end
  end
end
