# frozen_string_literal: true

class AddAffaireToWorktimes < ActiveRecord::Migration[7.0]
  def change
    add_reference :worktimes, :affaire, foreign_key: true
  end
end
