# frozen_string_literal: true

# == Schema Information
#
# Table name: weektimes
#
#  id          :bigint           not null, primary key
#  accord      :boolean          default(FALSE)
#  dateweek    :date
#  workweek    :float            default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#  worktime_id :bigint
#
# Indexes
#
#  index_weektimes_on_user_id      (user_id)
#  index_weektimes_on_worktime_id  (worktime_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (worktime_id => worktimes.id)
#
class Weektime < ApplicationRecord
  belongs_to :user

  has_many :worktimes, dependent: :destroy
  accepts_nested_attributes_for :worktimes

  validates_presence_of :dateweek

  before_validation :update_weekhour  
  before_validation :convert_weekhour

  def update_weekhour
    update_columns(workweek: workweek) unless !!0
  end

  def convert_weekhour
    self.workweek = self.workweek / 3600
  end


end
