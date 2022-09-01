# == Schema Information
#
# Table name: adresses
#
#  id         :bigint           not null, primary key
#  body       :text
#  city       :string
#  contry     :string
#  number     :string
#  street     :string
#  street2    :string
#  zip        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Adresse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
