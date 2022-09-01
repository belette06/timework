# == Schema Information
#
# Table name: depannages
#
#  id            :bigint           not null, primary key
#  body          :string
#  client        :string
#  closed        :boolean          default(FALSE)
#  number        :string
#  title         :string
#  workdepannage :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  adresse_id    :bigint
#  worktime_id   :bigint
#
# Indexes
#
#  index_depannages_on_adresse_id   (adresse_id)
#  index_depannages_on_worktime_id  (worktime_id)
#
# Foreign Keys
#
#  fk_rails_...  (adresse_id => adresses.id)
#  fk_rails_...  (worktime_id => worktimes.id)
#
require "test_helper"

class DepannageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
