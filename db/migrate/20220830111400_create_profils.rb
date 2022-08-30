class CreateProfils < ActiveRecord::Migration[7.0]
  def change
    create_table :profils do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :phone_supl
      t.string :job
      t.references :adresse, foreign_key: true

      t.timestamps
    end
  end
end
