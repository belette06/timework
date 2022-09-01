class CreateDepannages < ActiveRecord::Migration[7.0]
  def change
    create_table :depannages do |t|
      t.string :client
      t.string :title
      t.string :number
      t.string :body
      t.integer :workdepannage, default: 0
      t.boolean :closed, default: false
      t.references :worktime, foreign_key: true
      t.belongs_to :adresse, foreign_key: true

      t.timestamps
    end
  end
end
