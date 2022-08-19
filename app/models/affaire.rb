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

end
