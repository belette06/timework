# frozen_string_literal: true

# == Schema Information
#
# Table name: worktimes
#
#  id          :bigint           not null, primary key
#  accord      :boolean          default(FALSE)
#  daytime     :integer
#  endtime     :time
#  gotime      :time
#  workday     :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  affaire_id  :bigint
#  weektime_id :bigint           not null
#
# Indexes
#
#  index_worktimes_on_affaire_id   (affaire_id)
#  index_worktimes_on_id           (id) UNIQUE
#  index_worktimes_on_weektime_id  (weektime_id)
#
# Foreign Keys
#
#  fk_rails_...  (affaire_id => affaires.id)
#  fk_rails_...  (weektime_id => weektimes.id)
#
FactoryBot.define do
  factory :worktime do
    weektime { nil }
    gotime { '2022-08-16 18:31:14' }
    endtime { '2022-08-16 18:31:14' }
    daytime { '2022-08-16 18:31:14' }
    workday { '2022-08-16 18:31:14' }
    accord { false }
  end
end
