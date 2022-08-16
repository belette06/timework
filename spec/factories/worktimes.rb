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
