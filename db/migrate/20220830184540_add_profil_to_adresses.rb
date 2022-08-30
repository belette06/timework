class AddProfilToAdresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :adresses, :profils, foreign_key: true
  end
end
