class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :number
      t.string :street,null: false
      t.string :street2
      t.string :zip,null: false
      t.string :city,null: false
      t.string :contry,null: false
      t.text :body

      t.timestamps
    end
  end
end
