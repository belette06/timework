# frozen_string_literal: true

# == Schema Information
#
# Table name: worktimes
#
#  id          :bigint           not null, primary key
#  accord      :boolean
#  daytime     :integer
#  endtime     :time
#  gotime      :time
#  workday     :integer          default(0)
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
require 'rails_helper'

RSpec.describe Worktime, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
