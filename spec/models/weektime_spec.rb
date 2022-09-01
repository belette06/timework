# frozen_string_literal: true

# == Schema Information
#
# Table name: weektimes
#
#  id           :bigint           not null, primary key
#  accord       :boolean          default(FALSE)
#  dateweek     :date
#  numsemaine   :integer
#  workweek     :integer          default(0)
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
require 'rails_helper'

RSpec.describe Weektime, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
