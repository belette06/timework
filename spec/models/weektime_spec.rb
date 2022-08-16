# frozen_string_literal: true

# == Schema Information
#
# Table name: weektimes
#
#  id          :bigint           not null, primary key
#  accord      :boolean
#  dateweek    :date
#  workweek    :time
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
require 'rails_helper'

RSpec.describe Weektime, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
