# frozen_string_literal: true

# == Schema Information
#
# Table name: affaires
#
#  id          :bigint           not null, primary key
#  address     :string
#  client      :string
#  number      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  worktime_id :bigint           not null
#
# Indexes
#
#  index_affaires_on_worktime_id  (worktime_id)
#
# Foreign Keys
#
#  fk_rails_...  (worktime_id => worktimes.id)
#
FactoryBot.define do
  factory :affaire do
    number { 1 }
    client { 'MyString' }
    address { 'MyString' }
    title { 'MyString' }
    worktime { nil }
  end
end
