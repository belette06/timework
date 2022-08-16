# frozen_string_literal: true

# == Schema Information
#
# Table name: weektimes
#
#  id          :bigint           not null, primary key
#  accord      :boolean          default(FALSE)
#  dateweek    :date
#  workweek    :integer          default(0)
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
FactoryBot.define do
  factory :weektime do
    user { nil }
    dateweek { '2022-08-16' }
    workweek { '2022-08-16 18:28:41' }
    accord { false }
  end
end
