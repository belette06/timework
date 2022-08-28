# frozen_string_literal: true

# == Schema Information
#
# Table name: weektimes
#
#  id           :bigint           not null, primary key
#  accord       :boolean          default(FALSE)
#  dateweek     :date
#  numsemaine   :integer
#  workweek     :float            default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#  worktimes_id :bigint
#
# Indexes
#
#  index_weektimes_on_id            (id) UNIQUE
#  index_weektimes_on_user_id       (user_id)
#  index_weektimes_on_worktimes_id  (worktimes_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (worktimes_id => worktimes.id)
#
FactoryBot.define do
  factory :weektime do
    user { nil }
    dateweek { '2022-08-16' }
    workweek { '2022-08-16 18:28:41' }
    accord { false }
  end
end
