# frozen_string_literal: true

class AddWortimetoWeektimes < ActiveRecord::Migration[7.0]
  def change
    add_reference :weektimes, :worktime, foreign_key: true
  end
end
