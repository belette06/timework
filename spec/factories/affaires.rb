# frozen_string_literal: true

# == Schema Information
#
# Table name: affaires
#
#  id          :bigint           not null, primary key
#  client      :string
#  number      :string
#  title       :string
#  workaffaire :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  adresse_id  :bigint
#  worktime_id :bigint
#
# Indexes
#
#  index_affaires_on_adresse_id   (adresse_id)
#  index_affaires_on_id           (id) UNIQUE
#  index_affaires_on_worktime_id  (worktime_id)
#
# Foreign Keys
#
#  fk_rails_...  (adresse_id => adresses.id)
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
