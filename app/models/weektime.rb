# frozen_string_literal: true

# == Schema Information
#
# Table name: weektimes
#
#  id          :bigint           not null, primary key
#  accord      :boolean          default(FALSE)
#  dateweek    :date
#  numsemaine  :integer
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
  has_many :worktimes, dependent: :delete_all
  accepts_nested_attributes_for :worktimes

  attr_accessor :flash_alert_message

  validates_presence_of :dateweek
  validates_uniqueness_of :numsemaine, scope: :user_id,
                                       message: "Feuille d'heure exist"

  before_validation :update_weekhour
  before_validation :convert_weekhour

  before_validation :add_num_date, on: %i[create update]

  private

  def update_accord_status
    update_attribute(:accord, true) if accord.valid?
  end

  def add_num_date
    update_attribute(:numsemaine, dateweek.cweek) if dateweek.present?
  end

  def update_weekhour
    update_columns(workweek: workweek) unless workweek.zero?
  end

  def convert_weekhour
    self.workweek = workweek / 3600
  end
end
