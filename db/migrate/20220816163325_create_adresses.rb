class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :number
      t.string :street
      t.string :street2
      t.string :zip
      t.string :city
      t.string :contry
      t.text :body

      t.timestamps
    end
  end
end
