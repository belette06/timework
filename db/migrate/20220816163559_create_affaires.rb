# frozen_string_literal: true

class CreateAffaires < ActiveRecord::Migration[7.0]
  def change
    create_table :affaires do |t|
      t.integer :number
      t.string :client
      t.string :address
      t.string :title
      t.references :worktime, null: false, foreign_key: true

      t.timestamps
    end
  end
end
