# == Schema Information
#
# Table name: adresses
#
#  id          :bigint           not null, primary key
#  body        :text
#  city        :string           not null
#  contry      :string           not null
#  number      :string
#  street      :string           not null
#  street2     :string
#  zip         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  affaires_id :bigint
#  profils_id  :bigint
#
# Indexes
#
#  index_adresses_on_affaires_id  (affaires_id)
#  index_adresses_on_profils_id   (profils_id)
#
# Foreign Keys
#
#  fk_rails_...  (affaires_id => affaires.id)
#  fk_rails_...  (profils_id => profils.id)
#
require 'rails_helper'

RSpec.describe Adresse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
