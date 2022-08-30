class AddProfilToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :profil, foreign_key: true
  end
end
