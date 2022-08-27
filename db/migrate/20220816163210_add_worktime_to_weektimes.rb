# frozen_string_literal: true

class AddWorktimeToWeektimes < ActiveRecord::Migration[7.0]
  def change
    add_reference :weektimes, :worktimes, foreign_key: true
  end
end
