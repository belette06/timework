class CreateDepannages < ActiveRecord::Migration[7.0]
  def change
    create_table :depannages do |t|
      t.string :client
      t.string :title
      t.string :number
      t.string :body
      t.boolean :closed
      t.references :worktimes, null: false, foreign_key: true
      t.belongs_to :adresse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
