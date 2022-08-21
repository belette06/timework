# frozen_string_literal: true

# == Schema Information
#
# Table name: affaires
#
#  id          :bigint           not null, primary key
#  address     :string
#  client      :string
#  number      :string
#  title       :string
#  workaffaire :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  worktime_id :bigint
#
# Indexes
#
#  index_affaires_on_worktime_id  (worktime_id)
#
# Foreign Keys
#
#  fk_rails_...  (worktime_id => worktimes.id)
#
class Affaire < ApplicationRecord
  has_many :worktimes
  accepts_nested_attributes_for :worktimes

  attr_accessor :flash_alert_message

  before_validation :update_workaffaire

private  

  def update_workaffaire
    update_columns(workaffaire: workaffaire) unless workaffaire.zero?
  end
end
