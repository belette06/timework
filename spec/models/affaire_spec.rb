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
require 'rails_helper'

RSpec.describe Affaire, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
