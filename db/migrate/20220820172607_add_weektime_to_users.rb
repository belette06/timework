class AddWeektimeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :weektime, foreign_key: true, index: true
  end
end
