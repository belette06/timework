class AddDepannageToWorktimes < ActiveRecord::Migration[7.0]
  def change
    add_reference :worktimes, :depannage, foreign_key: true
  end
end
