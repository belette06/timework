# frozen_string_literal: true

# == Schema Information
#
# Table name: worktimes
#
#  id          :bigint           not null, primary key
#  accord      :boolean
#  daytime     :time
#  endtime     :time
#  gotime      :time
#  workday     :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  weektime_id :bigint           not null
#
# Indexes
#
#  index_worktimes_on_weektime_id  (weektime_id)
#
# Foreign Keys
#
#  fk_rails_...  (weektime_id => weektimes.id)
#
class Worktime < ApplicationRecord
  belongs_to :weektime

  validates_presence_of :gotime, :endtime
end
